package com.itwill.semiproject.web;

import java.io.IOException;
import java.util.List;
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

import com.itwill.semiproject.dto.ReservationDetailListDto;
import com.itwill.semiproject.exception.ControllerException;
import com.itwill.semiproject.exception.ServiceException;
import com.itwill.semiproject.repository.APIResponse;
import com.itwill.semiproject.repository.ReservationMaster;
import com.itwill.semiproject.service.PaymentService;
import com.itwill.semiproject.service.UserService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/") // 해당 클래스의 기본 URL 매핑을 설정
public class PaymentController {

	
	// 아임포트 API와 상호작용하기 위한 클라이언트 객체를 정의
	private IamportClient api;

	// 스프링의 @Autowired를 사용하여 의존성을 주입받을 필드를 정의
	// 스프링에 의해 PaymentService 타입의 빈을 주입
	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;
	
	 // 스프링에 의해 UserService 타입의 빈을 주입
    @Setter(onMethod_ = @Autowired)
    private UserService userService; 

	// 기본 생성자. 가맹점 식별키와 비밀키를 전달하여 API 인증을 수행
	public PaymentController() { 
		this.api = new IamportClient("3360178750462177",
				"xzEAGVLFM1F39ck4e1ntRa5506p0RUqQceCLHIkHhLV2Ej4LehiDyotZjjLqfhd117dRVOEux5fsNMgT");
	}

	// 예약 키 값을 받을 페이지를 매 (현재 주석 처리된 상태)
	/*
	@GetMapping("/payment")
	public String payment() {
		log.debug("payment()");
		return "/reservation/payment"; // 클라이언트에게 보여줄 뷰 페이지의 경로를 반환
	}
	
	@GetMapping("/paymentCancel")
	public String paymentCancel() {
		log.debug("paymentCancel()");
		return "/reservation/paymentCancel"; // 클라이언트에게 보여줄 뷰 페이지의 경로를 반환
	}
	*/

	// resId 파라미터를 받아 결제 서비스를 통해 해당 결제 정보를 조회하고 JSON 형식으로 반환
	@GetMapping("/reservation/paymentInfo")

	@ResponseBody
	public ResponseEntity<Map<String, Object>> getPaymentInfo(@RequestParam("resId") Integer resId) { // resId를 매개로 결제 정보를 불러옴.
		try {
			Map<String, Object> paymentInfo = paymentService.getPaymentInfoByResId(resId); // 결제 정보를 조회
			return ResponseEntity.ok(paymentInfo); // 조회된 결제 정보를 반환
		} catch (ServiceException e) {
			// 예외 발생 시 에러 로그를 출력
			log.error("Error fetching payment info for resId: {}", resId, e);
			// 서버 내부 오류가 발생한 경우, HTTP 상태 코드 500과 함께 null 값을 반환
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	// 결제 검증을 수행하는 메서드
	@ResponseBody

	@PostMapping("/reservation/verifyIamport/{imp_uid}")
	public ResponseEntity<?> paymentByImpUid(
	        @PathVariable(value = "imp_uid") String imp_uid, //url 경로에서 'imp_uid'를 변수로 추출
	        @RequestParam("resId") Integer resId //요청 파라미터에서 'resId'를 추출
	) throws IamportResponseException, IOException, ContextLoadException, ControllerException {
	    log.trace("paymentByImpUid({}, {}) invoked.", imp_uid, resId);

	    try {
	        Payment payment = this.api.paymentByImpUid(imp_uid).getResponse(); // 아임포트 API를 통해 결제 정보를 조회
	        
	        if ("paid".equals(payment.getStatus())) { // 결제가 성공적으로 완료된 경우
	            String result = this.paymentService.savePayment(payment, resId); // 결제 정보를 데이터베이스에 저장
	            log.info("Payment saved successfully: {}", result);
	            // 결제 정보를 JSON 형식으로 반환
	            return ResponseEntity.ok(Map.of(
	                    "status", payment.getStatus(),
	                    "merchant_uid", payment.getMerchantUid(),
	                    "payment", payment
	                ));
	        } else if ("failed".equals(payment.getStatus())) { // 결제가 실패한 경우
	            return ResponseEntity.badRequest().body("결제 실패: " + payment.getFailReason());
	        } else { // 알 수 없는 결제 상태인 경우
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("알 수 없는 결제 상태");
	        }
	    } catch (IamportResponseException | IOException e) { // 예외 처리
	        log.error("결제 검증 중 오류 발생", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("결제 검증 실패: " + e.getMessage());
	    } catch (ServiceException e) {
	    	log.error("결제 정보 저장 중 오류 발생", e);
	        throw new ControllerException(e); // 예외를 다시 던져서 처리
	    }
	}
	
	// 결제 성공 페이지를 매핑하는 메서드
	@GetMapping("/reservation/succeeded/{resId}")
	public String paymentSucceeded(@PathVariable("resId") Integer resId, Model model, HttpSession session) {
	    ReservationMaster resMaster = userService.readReservationMasterDetails(resId);
	    List<ReservationDetailListDto> resDetail = userService.readReservationDetails(resId);

	    Integer userId = (Integer) session.getAttribute("userId"); // 세션에서 userId 가져오기
	    model.addAttribute("res_id", resId); // 모델에 resId 추가
	    model.addAttribute("resMaster", resMaster);
	    model.addAttribute("resDetail", resDetail);
	    model.addAttribute("userId", userId); // 모델에 userId 추가

	    return "reservation/succeeded"; // succeeded.jsp 파일을 가리킴
	}
	
	
	// 예약 ID를 통해 결제 ID를 조회하는 메서드
	@GetMapping("/user/reservation_details/getPayId/{resId}")
	public ResponseEntity<?> getPayId(@PathVariable("resId") Integer resId) {
	    try {
	        Integer payId = paymentService.getPayIdByResId(resId); // 결제 ID를 조회
	        return ResponseEntity.ok(payId); // 조회된 결제 ID를 반환
	    } catch (Exception e) {
	        return ResponseEntity.status(500).body(e.getMessage()); // 예외 발생 시 에러 메시지를 반환
	    }
	}
	
	// 결제 취소 요청을 처리하는 메서드
	@ResponseBody
	@PostMapping("/user/reservation_details/cancel/{payId}")
	public ResponseEntity<String> cancelPayment(@PathVariable Integer payId) {
	    try {
	        String result = paymentService.cancelPayment(payId); // 결제 취소를 처리
	        log.debug("!@#!@#!@#post result: {}", result);
	        if (result.equals("Payment cancellation successful")) { // 결제 취소가 성공한 경우
	            return ResponseEntity.ok(result);
	        } else {
	            // 결과 메시지에 따라 적절한 HTTP 상태 코드를 반환
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result);
	        }
	    } catch (ServiceException e) { // 예외 처리
	        log.error("Error during payment cancellation for payId: {}", payId, e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Cancellation failed: " + e.getMessage());
	    }
	}
}
