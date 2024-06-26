package com.itwill.semiproject.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.semiproject.dto.QnACreateDto;
import com.itwill.semiproject.dto.QnAListDto;
import com.itwill.semiproject.dto.QnASearchDto;
import com.itwill.semiproject.dto.QnAUpdateDto;
import com.itwill.semiproject.repository.QnA;
import com.itwill.semiproject.service.QnAService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/community")
public class QnAController {
	
	private final QnAService qnaService;

	@GetMapping("/qnaList")
	public void list(Model model) {
		log.debug("list()");
		
		List<QnAListDto> list = qnaService.read();
		model.addAttribute("QnA",list);
	}
	
	@GetMapping({"/qnaDetails", "/qnaModify"})
	public void details(@RequestParam(name = "q_post_id") int q_post_id, Model model) {
		log.debug("details(q_post_id={})", q_post_id);
		
		QnA qna = qnaService.read(q_post_id);
		
		model.addAttribute("QnA", qna);
	}
	
	@GetMapping("/qnaCreate")
	public void create() {
		log.debug("GET: create()");
	}
	
	@PostMapping("/qnaCreate")
	public String create(QnACreateDto dto) {
		log.debug("POST: create(dto={}), dto");
		
		qnaService.create(dto);
		
		return "redirect:/community/qnaList";
	}
	
	@GetMapping("/qnaDelete")
	public String delete(@RequestParam(name="q_post_id") int q_post_id) {
		log.debug("delete(id={})", q_post_id);
		
		qnaService.delete(q_post_id);
		
		return "redirect:/community/qnaList";
	}
	
	@PostMapping("/qnaUpdate")
	public String update(QnAUpdateDto dto) {
		log.debug("update(dto={})", dto);
		
		qnaService.update(dto);
		
		return "redirect:/community/qnaDetails?q_post_id=" + dto.getQ_post_id();
	}
	
	@GetMapping("/qnaSearch")
	public void search(QnASearchDto dto, Model model) {
		log.debug("search(dto={}", dto);
		
		List<QnAListDto> list = qnaService.search(dto);
		model.addAttribute("QnA", list);
	}
}
