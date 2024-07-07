package com.itwill.semiproject.web;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextLoadException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.itwill.semiproject.exception.ControllerException;
import com.itwill.semiproject.exception.ServiceException;
import com.itwill.semiproject.repository.APIResponse;
import com.itwill.semiproject.service.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.Payment;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


// 결제 관련 기능을 동작하게 하는 컨트롤러
@Slf4j
@Controller
@RequestMapping("/reservation")
public class PaymentController {

	// 아임포트 API와 상호작용하기 위한 클라이언트 객체
	private IamportClient api;
	
	// 스프링의 autoWired 사용해서 의존성 주입을 위한 필드 주입을 수행.
	// 스프링에 의해 paymentService 타입의 빈을 주입 받음.
	@Setter(onMethod_= @Autowired)
	private PaymentService paymentService;
	
	// 가맹점 식별키와 비밀키 전달해서 api 사용을 위한 인증 정보로 사용됨.
	public PaymentController() {
		this.api = new IamportClient("3375010277812188",
				"mgaKoMpLV17tc8oVjs15v3HoGesdCCXCvYe4CvDcol6M7FKU3MXB2cyncxvsSrrb8YuqRZXWmDhfRLUY");
	}
	
	// 단순히 뷰 페이지의 경로를 반환해서 클라이언트에게 보여줌
	@GetMapping("/payment")
	public String payment() {
		log.debug("payment()");
		return "/reservation/payment"; // 클라이언트에게 보여줄 뷰 페이지의 경로
		
	}
	
	// resKey 파라미터 받아서 결제 서비스를 통해 해당하는 결제 정보 조회하고 JSON 형식으로 반환. 예외처리 통해 내부 오류 처리하고 응답 반환.
	@GetMapping("/paymentInfo")
	@ResponseBody // 메서드가 직접 HTTP 응답 몸통을 작성할 수 있음을 나타냄. 메서드가 반환하는 객체는 몸통에 직렬화되어 전송됨.
	// resKey 받아드리고 클라이언트가 HTTP GEt 요청을 보낼 때, ?resKey=<값> 형식으로 전달된 파라미터.
	public ResponseEntity<Map<String, Object>> getPaymentInfo(@RequestParam("resKey") Integer resKey) {
	    try {
	    	// resKey에 해당하는 결제 정보 가져옴. Map 형태로 반환.
	        Map<String, Object> paymentInfo = paymentService.getPaymentInfoByResKey(resKey);
	        // 상태코드 200 ok 와 함께 결제 정보가 포함된 응답 전송.
	        return ResponseEntity.ok(paymentInfo);
	    } catch (ServiceException e) {
	    	// resKey에 해당하는 결제 정보를 가져오는 도중 예외 발생한 경우 에러 로그 출력.
	        log.error("Error fetching payment info for resKey: {}", resKey, e);
	        // 서버 내부 오류가 발생한 경우, HTTP 상태 코드 500 함께 null 값을 포함하는 응답을 반환.
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	    }
	}
	
	
	// 결제 검증
	@ResponseBody
	@PostMapping("/verifyIamport/{imp_uid}")
	public APIResponse paymentByImpUid(
		@PathVariable(value= "imp_uid") String imp_uid, // 경로 변수로 전달된 imp_uid String 타입으로 받음.
		@RequestParam(required = false) Integer payKey, // 선택적으로 전달된 payKey
		@RequestParam(required = false) String payId, // 선택전달 payId
		@RequestParam(required = false) String resId, // 선택전달 resId
		@RequestParam("resKey") Integer resKey // 필수적으로 전달되어야하는 ResKey 
		) throws IamportResponseException, IOException, ContextLoadException, ControllerException {
		log.trace("paymentByImpUid({}, {}, {}, {}, {}) invoked.", imp_uid, payKey, payId, resId, resKey);
		
		// APIResponse 객체 생성 (결제 검증 결과와 추가 정보를 담아서 반환할 목적으로 사용)
		APIResponse  irsp = new APIResponse ();
		String result = "";
		
		// IAMPORT API를 사용하여 imp_uid에 대한 결제 정보를 검증하고, 검증된 결제 정보를 가져옴.
		Payment payment = this.api.paymentByImpUid(imp_uid).getResponse(); // 검증처리
		
		// 리턴받은 payment의 status가 결제완료이면 DB 조작 메서드 실행
		try {
			//결제 상태에 따라 분기 처리를 수행.
			switch(payment.getStatus()) {
			case "paid" :
				// 결제가 완료된 경우, PaymentService의 savaPayment 메서드 사용하여 결제 정보를 DB에 저장
				result = this.paymentService.savePayment(payment, payKey, payId, resId, resKey);
				 break;
				 
			case "failed" :
				// 결제가 실패한 경우
				result = "FAIL:04";
			} // switch
			
			// APIResponse에 검증 결과와 주문 번호 추가
			irsp.add("result", result);
			irsp.add("orderNum", payment.getMerchantUid());
			
		} catch (ServiceException e) {
			// ServiceException 발생시 controllerException으로 wrapping 하여 throw
			throw new ControllerException(e);
		} // try-catch
		
		return irsp; // 처리된 결과를 담은 APIResponse 객체 반환
 } 
} // paymentByImpUid
