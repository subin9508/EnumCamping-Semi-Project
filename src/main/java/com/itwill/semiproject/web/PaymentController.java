package com.itwill.semiproject.web;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextLoadException;
import org.springframework.ui.Model;
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

// 결제 관련 기능을 동작
@Slf4j
@Controller
@RequestMapping("/reservation")
public class PaymentController {

	// 아임포트 API와 상호작용하기 위한 클라이언트 객체
	private IamportClient api;

	// 스프링의 autoWired 사용해서 의존성 주입을 위한 필드 주입을 수행.
	// 스프링에 의해 paymentService 타입의 빈을 주입 받음.
	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;

	public PaymentController() { // 가맹점 식별키와 비밀키 전달하여 api 인증

		this.api = new IamportClient("3375010277812188",
				"mgaKoMpLV17tc8oVjs15v3HoGesdCCXCvYe4CvDcol6M7FKU3MXB2cyncxvsSrrb8YuqRZXWmDhfRLUY");
	}

	// 예약 키 값을 받을 페이지

	@GetMapping("/payment")
	public String payment() {
		log.debug("payment()");
		return "/reservation/payment"; // 클라이언트에게 보여줄 뷰 페이지의 경로

	}

	// resId 파라미터 받아서 결제 서비스를 통해 해당하는 결제 정보 조회하고 JSON 형식으로 반환. 예외처리 통해 내부 오류 처리하고
	// 응답 반환.
	@GetMapping("/paymentInfo")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getPaymentInfo(@RequestParam("resId") Integer resId) { // resId를 매개로 결제
																										// 정보 불러옴.
		try {

			Map<String, Object> paymentInfo = paymentService.getPaymentInfoByResId(resId); // null 아니면 저장.
			return ResponseEntity.ok(paymentInfo);
		} catch (ServiceException e) {
			// resId에 해당하는 결제 정보를 가져오는 도중 예외 발생한 경우 에러 로그 출력.
			log.error("Error fetching payment info for resId: {}", resId, e);
			// 서버 내부 오류가 발생한 경우, HTTP 상태 코드 500 함께 null 값을 포함하는 응답을 반환.
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}

	}

	// 결제 검증
	@ResponseBody
	@PostMapping("/verifyIamport/{imp_uid}")

	public APIResponse paymentByImpUid( // resId를 필수 파라미터로 전달
			@PathVariable(value = "imp_uid") String imp_uid, @RequestParam(required = false) Integer payId,
			@RequestParam("resId") Integer resId

	) throws IamportResponseException, IOException, ContextLoadException, ControllerException {
		log.trace("paymentByImpUid({}, {}, {}) invoked.", imp_uid, payId, resId);

		// APIResponse 객체 생성 (결제 검증 결과와 추가 정보를 담아서 반환할 목적으로 사용)
		APIResponse irsp = new APIResponse();

		String result = ""; // 검증 결과와 dto를 모두 포함한 정보를 저장할 객체.
		Payment payment = this.api.paymentByImpUid(imp_uid).getResponse(); // 검증처리

		// 리턴받은 payment의 status가 결제완료이면 DB 조작 메서드 실행
		try {

			switch (payment.getStatus()) { // payment 상태에 따라 메서드 실행.

			case "paid":

				result = this.paymentService.savePayment(payment, payId, resId); // service의 dto 정보를
																									// result에 저장.

				break;

			case "failed":
				// 결제가 실패한 경우
				result = "FAIL:04";
			} // switch

			irsp.add("result", result); // result 응답 객체에 저장
			irsp.add("orderNum", payment.getMerchantUid()); // 주문번호 저장

		} catch (ServiceException e) {
			// ServiceException 발생시 controllerException으로 wrapping 하여 throw
			throw new ControllerException(e);
		} // try-catch

		return irsp; // 주문번호, result 정보가 담긴 irsp 리턴.

	} // paymentByImpUid
	
	@GetMapping("/succeeded/{orderNum}")
	public String paymentSucceeded(@PathVariable String orderNum, Model model) {
		model.addAttribute("orderNum", orderNum);
		return "reservation/succeeded";
	}
	
} 
