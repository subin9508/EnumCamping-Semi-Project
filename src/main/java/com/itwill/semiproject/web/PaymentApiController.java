package com.itwill.semiproject.web;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


// 결제 관련 기능을 동작하게 하는 컨트롤러


@Slf4j
@RestController
@RequestMapping("/")

public class PaymentApiController {
	
	private IamportClient client = new IamportClient("3375010277812188", "mgaKoMpLV17tc8oVjs15v3HoGesdCCXCvYe4CvDcol6M7FKU3MXB2cyncxvsSrrb8YuqRZXWmDhfRLUY");
	
	@PostMapping("/verifyIamport/{impUid}")
	public ResponseEntity<?> verifyIamport(@PathVariable(value= "impUid") String impUid) throws IamportResponseException, IOException {
		
		IamportResponse<Payment> response = client.paymentByImpUid(impUid);
		
		if(response != null && response.getResponse() != null) {
			return ResponseEntity.ok(response);
			
		}else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("결제 검증 실패");
			
		}
	}
}
