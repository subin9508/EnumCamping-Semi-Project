package com.itwill.semiproject.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.semiproject.dto.NoticeListDto;
import com.itwill.semiproject.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/community")
@RequiredArgsConstructor //의존성주입.
public class CommunityController {
	private final NoticeService noticeService; 
	@GetMapping("/notice/list")
	public void noticeList(Model model) {
		log.debug("GET : list");
		List<NoticeListDto> list = noticeService.selectAll();
		model.addAttribute("notices", list);
		log.debug("model={}",model);
	}
	
	@GetMapping("/notice/details")
	public void noticeDetails() {
		log.debug("GET : details");

	}
	
}
