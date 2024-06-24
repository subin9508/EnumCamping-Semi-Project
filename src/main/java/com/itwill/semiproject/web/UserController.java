package com.itwill.semiproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signin")
	public String around() {
		log.debug("signin()");
		
		return "/user/signin"; // 뷰 이름.
	}
	
}
