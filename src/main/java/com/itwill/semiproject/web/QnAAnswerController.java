package com.itwill.semiproject.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.itwill.semiproject.dto.QnAAnswerDto;
import com.itwill.semiproject.service.QnAAnswerService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/answers")
public class QnAAnswerController {
    private final QnAAnswerService qnaanswerService;
    
    // 답변 등록 (관리자만 가능)
    @PostMapping
    public ResponseEntity<Integer> registerAnswer(@RequestBody QnAAnswerDto dto, HttpSession session) {
        String userRole = (String) session.getAttribute("userRole");

        // 사용자 역할 검증
        if (userRole == null || !userRole.equals("0")) {
            return ResponseEntity.status(403).build(); // 403 Forbidden
        }

        log.debug("registerAnswer({})", dto);

        int result = qnaanswerService.createAnswer(dto);
        return ResponseEntity.ok(result);
    }
    
    //    @PostMapping("/register")
//    public ResponseEntity<Integer> registerAnswer(@RequestBody QnAAnswerDto dto, HttpSession session) {
//        String userRole = (String) session.getAttribute("userRole");
//
//        // 사용자 역할 검증
//        if (userRole == null || !userRole.equals(0)) {
//            return ResponseEntity.status(403).build(); // 403 Forbidden
//        }
//
//        log.debug("registerAnswer({})", dto);
//
//        int result = qnaanswerService.createAnswer(dto);
//        return ResponseEntity.ok(result);
//    }
    
    // 특정 QnA 게시물의 답변 목록 조회
    @GetMapping("/qna/{qnaPostId}")
    public ResponseEntity<List<QnAAnswerDto>> getAnswersByQnaPostId(@PathVariable int qnaPostId) {
        List<QnAAnswerDto> answers = qnaanswerService.getAnswersByQnaPostId(qnaPostId);
        return ResponseEntity.ok(answers);
    }
    
    // 답변 생성 (중복)
//    @PostMapping
//    public ResponseEntity<Integer> createAnswer(@RequestBody QnAAnswerDto answer) {
//        int result = qnaanswerService.createAnswer(answer);
//        return ResponseEntity.ok(result);
//    }
    
    // 답변 업데이트
    @PutMapping("/{id}")
    public ResponseEntity<Integer> updateAnswer(@PathVariable int id, @RequestBody QnAAnswerDto answer) {
        answer.setId(id);
        int result = qnaanswerService.updateAnswer(answer);
        return ResponseEntity.ok(result);
    }
    
//    // 답변 삭제
//    @DeleteMapping("/{id}")
//    public ResponseEntity<Integer> deleteAnswer(@PathVariable int id) {
//        int result = qnaanswerService.deleteAnswer(id);
//        return ResponseEntity.ok(result);
//    }
    
    @PostMapping("/answer/delete")
    public String deleteAnswer(@RequestParam("answerId") int answerId, HttpSession session) {
        log.debug("deleteAnswer(answerId={})", answerId);

        // 세션에서 사용자 역할을 확인합니다.
        String userRoleStr = (String) session.getAttribute("userRole");
        int userRole = userRoleStr != null ? Integer.parseInt(userRoleStr) : -1;

        if (userRole != 0) {
            session.setAttribute("message", "답변을 삭제할 권한이 없습니다.");
            return "redirect:/community/qna/list";
        }

        try {
            qnaanswerService.deleteAnswer(answerId);
        } catch (IllegalArgumentException e) {
            session.setAttribute("message", e.getMessage());
            return "redirect:/community/qna/list";
        }

        return "redirect:/community/qna/list";
    }
}