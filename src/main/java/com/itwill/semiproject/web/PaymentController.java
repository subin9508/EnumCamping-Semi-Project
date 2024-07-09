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
	
	
	@GetMapping("/paymentCancel")
	public String paymentCancel() {
		log.debug("paymentCancel()");
		return "/reservation/paymentCancel"; // 클라이언트에게 보여줄 뷰 페이지의 경로
		
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
	public ResponseEntity<?> paymentByImpUid(
	        @PathVariable(value = "imp_uid") String imp_uid,
	        
	        @RequestParam("resId") Integer resId
	) throws IamportResponseException, IOException, ContextLoadException, ControllerException {
	    log.trace("paymentByImpUid({}, {}) invoked.", imp_uid, resId);

	    try {
	        Payment payment = this.api.paymentByImpUid(imp_uid).getResponse();
	        
	        if ("paid".equals(payment.getStatus())) {
	            String result = this.paymentService.savePayment(payment, resId);
	            log.info("Payment saved successfully: {}", result);
	            // 결제 정보를 그대로 반환
	            return ResponseEntity.ok(Map.of(
	                    "status", payment.getStatus(),
	                    "merchant_uid", payment.getMerchantUid(),
	                    "payment", payment
	                ));
	        } else if ("failed".equals(payment.getStatus())) {
	            return ResponseEntity.badRequest().body("결제 실패: " + payment.getFailReason());
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("알 수 없는 결제 상태");
	        }
	    } catch (IamportResponseException | IOException e) {
	        log.error("결제 검증 중 오류 발생", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("결제 검증 실패: " + e.getMessage());
	    } catch (ServiceException e) {
	    	log.error("결제 정보 저장 중 오류 발생", e);
	        throw new ControllerException(e);
	    }
	}
	
	
	@GetMapping("/succeeded/{merchant_uid}")
	public String paymentSucceeded(@PathVariable String merchant_uid, Model model) {
	    model.addAttribute("merchant_uid", merchant_uid);
	    return "reservation/succeeded"; // succeeded.jsp 파일을 가리킴
	}
	
	
	  @GetMapping("/payments/getPayId/{resId}")
	    public ResponseEntity<?> getPayId(@PathVariable("resId") Integer resId) {
	        try {
	            Integer payId = paymentService.getPayIdByResId(resId);
	            return ResponseEntity.ok(payId);
	        } catch (Exception e) {
	            return ResponseEntity.status(500).body(e.getMessage());
	        }
	    }
	
	
	/**
	 * 결제 취소 요청을 처리하는 메서드
	 * @param payId 결제 키로 결제를 식별
	 * @return ResponseEntity 객체로 HTTP 응답 상태와 메세지를 반환.
	 */
    @PostMapping("/cancel/{payId}")
    public ResponseEntity<String> cancelPayment(@PathVariable Integer payId) {
        try {
            String result = paymentService.cancelPayment(payId);
            if (result.equals("Payment cancellation successful")) {
                return ResponseEntity.ok(result);
            } else {
                // 결과 메시지에 따라 적절한 HTTP 상태 코드를 반환
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
            }
        } catch (ServiceException e) {  // ServiceException 대신 RuntimeException 처리
            log.error("Error during payment cancellation for payId: {}", payId, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Cancellation failed: " + e.getMessage());
        }
    }
	
	
	
	
	
}