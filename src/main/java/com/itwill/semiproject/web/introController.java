package com.itwill.semiproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class introController {
	
	@GetMapping("/")
	public String intro() {
		log.debug("intro()");
		
		return "intro/intro";
	}
	
}
