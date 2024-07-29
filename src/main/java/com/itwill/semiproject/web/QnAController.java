package com.itwill.semiproject.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.semiproject.dto.QnAAnswerDto;
import com.itwill.semiproject.dto.QnACreateDto;
import com.itwill.semiproject.dto.QnAListDto;
import com.itwill.semiproject.dto.QnASearchDto;
import com.itwill.semiproject.dto.QnAUpdateDto;
import com.itwill.semiproject.repository.Pager;
import com.itwill.semiproject.repository.QnA;
import com.itwill.semiproject.repository.QnADao;
import com.itwill.semiproject.service.QnAAnswerService;
import com.itwill.semiproject.service.QnAService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/community/qna")
public class QnAController {
	
	private final QnAService qnaService;
	
	private final QnADao qnaDao;
	
	private final QnAAnswerService qnaanswerService;
	
	
	// QnA 목록 조회
    @GetMapping("/list")
    public String list(@RequestParam(defaultValue = "1") Long page, Model model, HttpSession session) {
        log.debug("list(page={})", page);
        
        Pager pager = new Pager();
        pager.setPage(page);
        
        // 페이징 처리된 QnA 목록 조회
        List<QnAListDto> qnas = qnaService.selectPagedQnAList(pager);
        long totalCount = qnaService.getTotalCount(new QnASearchDto());
        
        model.addAttribute("qnas", qnas);
        model.addAttribute("pager", pager);
        model.addAttribute("totalCount", totalCount);
        
        // 세션에서 메시지를 가져와 모델에 추가하고 세션에서 제거
        String message = (String) session.getAttribute("message");
        if (message != null) {
            model.addAttribute("message", message);
            session.removeAttribute("message");
        }
        
        return "/community/qna/list";
    }
	    
    // QnA 게시글 수정 폼 조회
    @GetMapping("/modify")
    public String modifyForm(@RequestParam(name = "qnaPostId") int qnaPostId, Model model, HttpSession session) {
        log.debug("modifyForm(qnaPostId={})", qnaPostId);
        
        // QnA 게시글 조회
        QnA qna = qnaService.read(qnaPostId);
        String signedInUser = (String) session.getAttribute("signedInUser");
        String userRoleStr = (String) session.getAttribute("userRole");
        int userRole = userRoleStr != null ? Integer.parseInt(userRoleStr) : -1;

        log.debug("signedInUser: {}", signedInUser);
        log.debug("userRole: {}", userRole);
        log.debug("qnaUserId: {}", qna.getQnaUserId());

        // 비밀글 여부 확인
        if (qna.getQnaLock() == 1 && !qna.getQnaUserId().equals(signedInUser) && userRole != 0) {
            session.setAttribute("message", "비밀글은 작성자와 관리자만 볼 수 있습니다.");
            return "redirect:/community/qna/list"; // 접근 거부 시 리스트 페이지로 리다이렉트
        }

        model.addAttribute("qna", qna);
        model.addAttribute("signedInUser", signedInUser); // 로그인 사용자 정보 추가
        model.addAttribute("userRole", userRole); // 사용자 역할 추가

        return "/community/qna/modify"; // 수정 페이지로 이동
    }
    
    // QnA 게시글 상세 조회
    @GetMapping("/details")
    public String details(@RequestParam(name = "qnaPostId") int qnaPostId, Model model, HttpSession session) {
        log.debug("details(qnaPostId={})", qnaPostId);
        
        // QnA 게시글 조회
        QnA qna = qnaService.read(qnaPostId);
        String signedInUser = (String) session.getAttribute("signedInUser");
        String userRoleStr = (String) session.getAttribute("userRole");
        int userRole = userRoleStr != null ? Integer.parseInt(userRoleStr) : -1;


        log.debug("signedInUser: {}", signedInUser);
        log.debug("userRole: {}", userRole);
        log.debug("qnaUserId: {}", qna.getQnaUserId());

        // 비밀글 여부 확인
        if (qna.getQnaLock() == 1 && !qna.getQnaUserId().equals(signedInUser) && userRole != 0) {
            session.setAttribute("message", "비밀글은 작성자와 관리자만 볼 수 있습니다.");
            return "redirect:/community/qna/list"; // 접근 거부 시 리스트 페이지로 리다이렉트
        }
        
        // 조회수 증가
        qnaDao.updateViewCount(qnaPostId); // 조회수 증가 메서드 호출
        model.addAttribute("qna", qna);
        model.addAttribute("signedInUser", signedInUser); // 로그인 사용자 정보 추가
        model.addAttribute("userRole", userRole); // 사용자 역할 추가
        
        // 답변 목록 추가
        List<QnAAnswerDto> answers = qnaanswerService.getAnswersByQnaPostId(qnaPostId);
        log.debug("답변 목록 추가:{}", answers);
        model.addAttribute("answers", answers);
        
        return "/community/qna/details";
    }
	
	// QnA 게시글 작성 폼 조회
	@GetMapping("/create")
	public String createForm(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
		// 로그인되지 않은 경우 로그인 페이지로 리다이렉트
	    if (session.getAttribute("signedInUser") == null) {
	    	redirectAttributes.addFlashAttribute("message", "로그인 후 글쓰기가 가능합니다.");
	    	redirectAttributes.addFlashAttribute("target", "/community/qna/create");
	        return "redirect:/user/signin";
	    }
	    model.addAttribute("qnaCreateDto", new QnACreateDto());
	    return "/community/qna/create";
	}
	
	// QnA 게시글 작성
	@PostMapping("/create")
	public String create(QnACreateDto dto, HttpSession session) {
	    log.debug("POST: create(dto={})", dto);
	    
	    // 로그인 안되어 있는 경우 로그인 페이지로 리다이렉트
	    if (session.getAttribute("signedInUser") == null) {
	        return "redirect:/user/signin";
	    }
	    
	    // 비밀글 여부 설정 (기본값 0)
	    if (dto.getQnaLock() == null) {
	        dto.setQnaLock(0);
	    }

	    qnaService.create(dto);

	    return "redirect:/community/qna/list";
	}

	// QnA 게시글 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam(name="qnaPostId") int id, HttpSession session) {
		log.debug("delete(qnaPostId={})", id);
		
		// 로그인 안되어있으면 로그인 페이지로 리다이렉트
        if (session.getAttribute("signedInUser") == null) {
            return "redirect:/user/signin";
        }
		
		qnaService.delete(id);
		
		return "redirect:/community/qna/list";
	}
	
	// QnA 게시글 업데이트
	@PostMapping("/update")
	public String update(QnAUpdateDto dto, HttpSession session) {
		log.debug("update(dto={})", dto);
		
		// 로그인 안되어있으면 로그인 페이지로 리다이렉트
        if (session.getAttribute("signedInUser") == null) {
            return "redirect:/user/signin";
        }
        
        // 비밀글 여부 설정 (기본값 0)
        // 체크박스가 체크되지 않았을 경우, null이 되므로 이를 0으로 설정
        if (dto.getQnaLock() == null) {
            dto.setQnaLock(0); // 기본값 설정
        }
        
		qnaService.update(dto);
		log.debug("postid",dto.getQnaPostId());
		return "redirect:/community/qna/details?qnaPostId=" + dto.getQnaPostId();
	}
	
	// QnA 게시글 검색
    @GetMapping("/search")
    public String search(QnASearchDto dto, @RequestParam(defaultValue = "1") Long page, Model model) {
        log.debug("search(dto={}, page={})", dto, page);
        
        Pager pager = new Pager();
        pager.setPage(page);
        
        // 검색된 QnA 목록 조회
        List<QnAListDto> qnas = qnaService.search(dto, pager);
        long totalCount = qnaService.getTotalCount(dto);
        
        pager.setNum(totalCount); // 전체 글의 개수를 설정
        pager.setRow(); // 페이징 계산을 수행
        
        // 검색 결과가 없는 경우 페이징 처리 설정
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
    
    // 답변 작성 처리
    @PostMapping("/answer/create")
    public String createAnswer(QnAAnswerDto dto, HttpSession session) {
        log.debug("POST: createAnswer(dto={})", dto);
        
        // 관리자 권한 체크
        String userRoleStr = (String) session.getAttribute("userRole");
        int userRole = userRoleStr != null ? Integer.parseInt(userRoleStr) : -1;
        if (userRole != 0) {
            return "redirect:/community/qna/list"; // 관리자 권한이 없는 경우 리스트 페이지로 리디렉션
        }
        
        int result = qnaanswerService.createAnswer(dto);      
        if (result == 1) {
            qnaDao.updateQnaState(dto.getQnaPostId(), 1); // 답변 등록 시 qna_state를 1로 변경
        }
        return "redirect:/community/qna/details?qnaPostId=" + dto.getQnaPostId();
    }
		
}
