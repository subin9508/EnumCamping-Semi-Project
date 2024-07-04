package com.itwill.semiproject.web;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextLoadException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.semiproject.exception.ControllerException;
import com.itwill.semiproject.exception.ServiceException;
import com.itwill.semiproject.repository.APIResponse;
import com.itwill.semiproject.service.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


// 결제 관련 기능을 동작하게 하는 컨트롤러


@Slf4j
@RestController
@RequestMapping("/reservation")

public class PaymentController {

	private IamportClient api;
	
	@Setter(onMethod_= @Autowired)
	private PaymentService paymentService;
	
	
	public PaymentController() {
		this.api = new IamportClient("3375010277812188",
				"mgaKoMpLV17tc8oVjs15v3HoGesdCCXCvYe4CvDcol6M7FKU3MXB2cyncxvsSrrb8YuqRZXWmDhfRLUY");
	}
	
	// 결제 검증
	@ResponseBody
	@PostMapping("/verifyIamport/{imp_uid}")
	public APIResponse paymentByImpUid(
		@PathVariable(value= "imp_uid") String imp_uid,
		Integer payId,
		Integer resId
		) throws IamportResponseException, IOException, ContextLoadException, ControllerException {
		log.trace("paymentByImpUid({}, {}, {}) invoked.", imp_uid, payId, resId);
		
		APIResponse  irsp = new APIResponse ();
		String result = "";
		Payment payment = this.api.paymentByImpUid(imp_uid).getResponse(); // 검증처리
		
		
		// 리턴받은 payment의 status가 결제완료이면 DB 조작 메서드 실행
		try {
			switch(payment.getStatus()) {
			case "paid" :
				result = this.paymentService.savePayment(payment, payId, resId);
				 break;
				 
			case "failed" :
				result = "FAIL:04";
			} // switch
			
			irsp.add("result", result);
			irsp.add("orderNum", payment.getMerchantUid());
			
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return irsp;
 } 
} // paymentByImpUid
