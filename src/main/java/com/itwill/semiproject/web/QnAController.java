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
import com.itwill.semiproject.repository.Pager;
import com.itwill.semiproject.repository.QnA;
import com.itwill.semiproject.repository.QnADao;
import com.itwill.semiproject.service.QnAService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/community/qna")
public class QnAController {
	
	private final QnAService qnaService;
	
	private final QnADao qnaDao;

//	@GetMapping("/list")
//	public void list(Model model) {
//		log.debug("list()");
//		
//		List<QnAListDto> list = qnaService.read();
//		log.debug("list()={}",list);
//		model.addAttribute("qnas",list);
//	}
	
//    @GetMapping("/list")
//    public String list(Model model, Pager pager) {
//        log.debug("list(pager={})", pager);
//        
//        Long totalCount = qnaDao.selectTotalCount(); // 총 게시글 수 조회
//        List<QnAListDto> list = qnaService.selectPagedQnAList(pager);
//        log.debug("list()={}", list);
//        
//        model.addAttribute("qnas", list);
//        model.addAttribute("totalCount", totalCount);
//        model.addAttribute("pager", pager);
//        
//        return "/community/qna/list";
//    }
	
    @GetMapping("/list")
    public String list(@RequestParam(defaultValue = "1") Long page, Model model) {
        log.debug("list(page={})", page);
        
        Pager pager = new Pager();
        pager.setPage(page);

        List<QnAListDto> qnas = qnaService.selectPagedQnAList(pager);
        long totalCount = qnaService.getTotalCount(new QnASearchDto());
        
        model.addAttribute("qnas", qnas);
        model.addAttribute("pager", pager);
        model.addAttribute("totalCount", totalCount);
        
        return "/community/qna/list";
    }
	
	@GetMapping({"/details", "/modify"})
	public void details(@RequestParam(name = "qnaPostId") int qnaPostId, Model model) {
		log.debug("details(qnaPostId={})", qnaPostId);

		qnaDao.updateViewCount(qnaPostId); // 조회수 증가 메서드 호출
		QnA qna = qnaService.read(qnaPostId);

		model.addAttribute("qna", qna); 
	}
	
	
	@GetMapping("/create")
	public String createForm(HttpSession session, Model model) {
	    if (session.getAttribute("signedInUser") == null) {
	        return "redirect:/user/signin";
	    }
	    model.addAttribute("qnaCreateDto", new QnACreateDto());
	    return "/community/qna/create";
	}
	
	@PostMapping("/create")
	public String create(QnACreateDto dto, HttpSession session) {
		log.debug("POST: create(dto={}), dto");
        
		if (session.getAttribute("signedInUser") == null) {
            return "redirect:/user/signin";
        }
		qnaService.create(dto);
		
		return "redirect:/community/qna/list";
	}

	
	@GetMapping("/delete")
	public String delete(@RequestParam(name="qnaPostId") int id, HttpSession session) {
		log.debug("delete(qnaPostId={})", id);
        if (session.getAttribute("signedInUser") == null) {
            return "redirect:/user/signin";
        }
		
		qnaService.delete(id);
		
		return "redirect:/community/qna/list";
	}
	
	@PostMapping("/update")
	public String update(QnAUpdateDto dto, HttpSession session) {
		log.debug("update(dto={})", dto);
        if (session.getAttribute("signedInUser") == null) {
            return "redirect:/user/signin";
        }
		
		qnaService.update(dto);
		log.debug("postid",dto.getQnaPostId());
		return "redirect:/community/qna/details?qnaPostId=" + dto.getQnaPostId();
	}
	
//	@GetMapping("/search")
//	public void search(QnASearchDto dto, Model model) {
//		log.debug("search(dto={}", dto);
//		
//		List<QnAListDto> list = qnaService.search(dto);
//		model.addAttribute("qnas", list);
//	}
	
    @GetMapping("/search")
    public String search(QnASearchDto dto, @RequestParam(defaultValue = "1") Long page, Model model) {
        log.debug("search(dto={}, page={})", dto, page);
        
        Pager pager = new Pager();
        pager.setPage(page);

        List<QnAListDto> qnas = qnaService.search(dto, pager);
        long totalCount = qnaService.getTotalCount(dto);
        
        pager.setNum(totalCount); // 전체 글의 개수를 설정
        pager.setRow(); // 페이징 계산을 수행
        
        if (totalCount == 0) {
            // 검색 결과가 없을 때는 1 페이지로 설정
            pager.setTotalPage(1L);
            pager.setStartNum(1L);
            pager.setLastNum(1L);
            pager.setPage(1L); // 현재 페이지를 1로 설정
        } else {
            pager.calculatePaging(); // 페이징 계산을 수행
        }
        
        model.addAttribute("qnas", qnas);
        model.addAttribute("pager", pager);
        model.addAttribute("totalCount", totalCount);
        
        return "/community/qna/list";
    }
		
}
