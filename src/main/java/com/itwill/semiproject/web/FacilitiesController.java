package com.itwill.semiproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/intro")
public class FacilitiesController {

	@GetMapping("/facilities")
	public String facilities() {
		log.debug("facilities()");
		
		return "/intro/facilities"; // 뷰(JSP 파일) 이름.
	}
}
