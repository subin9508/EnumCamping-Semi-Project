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

	private IamportClient api;
	
	@Setter(onMethod_= @Autowired)
	private PaymentService paymentService;
	
	
	
	public PaymentController() { // 가맹점 식별키와 비밀키 전달하여 api 인증
		this.api = new IamportClient("3375010277812188",
				"mgaKoMpLV17tc8oVjs15v3HoGesdCCXCvYe4CvDcol6M7FKU3MXB2cyncxvsSrrb8YuqRZXWmDhfRLUY");
	}
	
	
	
	// 예약 키 값을 받을 페이지 
	@GetMapping("/payment")
	public String payment() {
		log.debug("payment()");
		return "/reservation/payment";
		
	}
	
	
	@GetMapping("/paymentInfo")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getPaymentInfo(@RequestParam("resKey") Integer resKey) { // reKey를 매개로 결제 정보 불러옴.
	    try {
	        Map<String, Object> paymentInfo = paymentService.getPaymentInfoByResKey(resKey); // null 아니면 저장.
	        return ResponseEntity.ok(paymentInfo);
	    } catch (ServiceException e) {
	        log.error("Error fetching payment info for resKey: {}", resKey, e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	    }
	}
	
	
	// 결제 검증
	@ResponseBody
	@PostMapping("/verifyIamport/{imp_uid}")
	public APIResponse paymentByImpUid( // resKey를 필수 파라미터로 전달
		@PathVariable(value= "imp_uid") String imp_uid,
		@RequestParam(required = false) Integer payKey,
		@RequestParam(required = false) String payId,
		@RequestParam(required = false) String resId,
		@RequestParam("resKey") Integer resKey
		) throws IamportResponseException, IOException, ContextLoadException, ControllerException {
		log.trace("paymentByImpUid({}, {}, {}, {}, {}) invoked.", imp_uid, payKey, payId, resId, resKey);
		
		APIResponse  irsp = new APIResponse ();
		String result = ""; // 검증 결과와 dto를 모두 포함한 정보를 저장할 객체.
		Payment payment = this.api.paymentByImpUid(imp_uid).getResponse(); // 검증처리
		
		
		// 리턴받은 payment의 status가 결제완료이면 DB 조작 메서드 실행
		try {
			switch(payment.getStatus()) { // payment 상태에 따라 메서드 실행.
			case "paid" :
				result = this.paymentService.savePayment(payment, payKey, payId, resId, resKey); // service의 dto 정보를 result에 저장.
				 break;
				 
			case "failed" :
				result = "FAIL:04";
			} // switch
			
			irsp.add("result", result); // result 응답 객체에 저장
			irsp.add("orderNum", payment.getMerchantUid()); // 주문번호 저장
			
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return irsp; // 주문번호, result 정보가 담긴 irsp 리턴.
 } 
} // paymentByImpUid
