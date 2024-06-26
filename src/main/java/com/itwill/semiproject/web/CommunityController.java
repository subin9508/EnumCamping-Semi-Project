package com.itwill.semiproject.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@GetMapping("/notice/list")
	public String noticeList() {
		log.debug("list");
		return "/community/notice/list";
	}
	
}
