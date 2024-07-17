package com.itwill.semiproject.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.semiproject.dto.NoticeCreateDto;
import com.itwill.semiproject.dto.NoticeDetailsDto;
import com.itwill.semiproject.dto.NoticeListDto;
import com.itwill.semiproject.dto.NoticeSearchDto;
import com.itwill.semiproject.dto.NoticeUpdateDto;
import com.itwill.semiproject.repository.Notice;
import com.itwill.semiproject.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/community/notice")
@RequiredArgsConstructor //의존성주입.
public class NoticeController {
	private final NoticeService noticeService; 
	@GetMapping("/list")
	public void noticeList(Model model) {
		log.debug("GET : list");
		List<NoticeListDto> list = noticeService.selectAllNotice();
		log.debug("service 끝");
		model.addAttribute("notices", list);
		log.debug("model={}",model);
	}
	
	@GetMapping({"/details","/modify"})
	public void noticeDetails(Model model, @RequestParam(name = "id") int id) {
		log.debug("GET : details");
		Notice notice = noticeService.selectNoticeById(id);
		
		NoticeDetailsDto dto = NoticeDetailsDto.fromEntity(notice);
		model.addAttribute("notice", dto); 
		log.debug("model에 추가 {}",dto);
		//return "community/notice/details";
	}
	
	@GetMapping("/create")
	public void noticeCreate(Notice notice) {
		log.debug("GET: create");
	}
	
	
	@PostMapping("/create")
	public String insertNotice(NoticeCreateDto dto) {
		log.debug("POST: create(dto={})", dto);
		noticeService.insertNotice(dto);
		
		return "redirect:/community/notice/list";
	}
	
	
	
	@GetMapping("/delete")
	public String noticedelete(@RequestParam(name = "notPostId") int notPostId) {
		log.debug("GET: delete");
		noticeService.deleteNotice(notPostId);
		return "redirect:list";
	}
	
	@GetMapping("/update")
	public void noticeUpdate() {
		log.debug("GET: update");
	}
	
	@PostMapping("/update")
	public String noticeUpdate(NoticeUpdateDto dto){
		log.debug("POST: update");
		log.debug("{}",dto);
		noticeService.updateNotice(dto);
	
		return "redirect:list";
	}
	
    @GetMapping("/search")
    public String search(NoticeSearchDto dto, Model model) {
    	log.debug("search(dto = {})",dto);
    	
    	List<NoticeListDto> list = noticeService.search(dto);
    	model.addAttribute("notices",list);
    	
    	return "/community/notice/list";
    }
	
	

}    