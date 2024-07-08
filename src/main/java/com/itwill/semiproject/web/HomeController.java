package com.itwill.semiproject.web;

import java.io.IOException;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class HomeController {

	@GetMapping("/")
	public String home() {
		log.debug("home()");
		return "home";
	}
	
	
	/*
	private IamportClient api;
	
	public HomeController() {
		this.api = new IamportClient("3375010277812188",
			"mgaKoMpLV17tc8oVjs15v3HoGesdCCXCvYe4CvDcol6M7FKU3MXB2cyncxvsSrrb8YuqRZXWmDhfRLUY");
	}
	
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
				Model model
				, Locale locale
				, HttpSession session
				, @PathVariable(value= "imp_uid") String imp_uid) 
	throws IamportResponseException, IOException
	{return api.paymentByImpUid(imp_uid);}
*/			
		
}

