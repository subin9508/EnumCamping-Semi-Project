package com.itwill.semiproject.web;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.semiproject.dto.UserSignInDto;
import com.itwill.semiproject.repository.User;
import com.itwill.semiproject.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/user")
public class UserController {
	
	private final UserService userService;
	
	@GetMapping("/signin")
	public void signin() {
		log.debug("signin()");
	}
	
	@PostMapping("/signin")
    public String signin(@ModelAttribute UserSignInDto dto, 
            HttpSession session,
            @RequestParam(name = "target", defaultValue = "") String target) 
                    throws UnsupportedEncodingException {
        log.debug("POST - signin(dto={}, session={}, target={})", dto, session, target);
        
        // 서비스 메서드를 호출해서 아이디와 비밀번호가 일치하는 사용자가 있는 지 확인
        User user = userService.read(dto);
        if (user != null) { // 아이디와 비밀번호 모두 일치하는 사용자가 있는 경우 -> 로그인 성공
            // 세션에 로그인 사용자 정보를 저장
            session.setAttribute("signedInUser", user.getUserId());
            log.debug("signin user=({})",session.getAttribute("signedInUser"));
            // 타겟 페이지로 이동
            return (target.equals("")) ? "redirect:/" : "redirect:" + target;
            
        } else { // 아이디와 비밀번호가 일치하는 사용자가 없는 경우 -> 로그인 실패
            // 로그인 페이지로 이동
        	log.debug("target({})", target);
            return "redirect:/user/signin?result=f&target=" 
                + URLEncoder.encode(target, "UTF-8");
        }
    }
	
	@GetMapping("/signout")
    public String signout(HttpSession session) {
        log.debug("signout(session={})", session);
        
        // 세션에 저장된 "signedInUser" 정보를 삭제.
        session.removeAttribute("signedInUser");
        
        // 세션을 만료시킴.
        session.invalidate();
        
        // 로그아웃 이후 로그인 페이지로 이동
        return "redirect:/";
    }
	
}
