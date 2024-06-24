package com.itwill.semiproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/intro")

public class introController {
	
	@GetMapping("/introduce")
	public String intro() {
		log.debug("intro()");
		
		return "/intro/introduce";
	}
	
	@GetMapping("/facilityLayout")
	public String facilityLayout() {
		log.debug("facilityLayout()");
		
		return "/intro/facilityLayout";
	}
	
}
