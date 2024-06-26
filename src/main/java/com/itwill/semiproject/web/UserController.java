package com.itwill.semiproject.web;

import java.io.IOException;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.semiproject.dto.UserCreateDto;
import com.itwill.semiproject.dto.UserSignInDto;
import com.itwill.semiproject.repository.User;
import com.itwill.semiproject.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

	private final UserService userService;

	@GetMapping("/signup") // GET 방식의 /user/signup 요청을 처리하는 컨트롤러 메서드
	public void signUp() {
		log.debug("GET signUp()");
	}

	@PostMapping("/signup") // POST 방식의 /user/signup 요청을 처리하는 컨트롤러 메서드
	public String signUp(UserCreateDto dto) {
		log.debug("POST signUp({})", dto);

		userService.create(dto);

		return "redirect:/user/signin"; // 로그인 페이지로 이동.
	}

	// 사용자 아이디 중복체크 REST 컨트롤러
	@GetMapping("/checkid")
	@ResponseBody // 메서드 리턴 값이 클라이언트로 전달되는 데이터.
	public ResponseEntity<String> checkId(@RequestParam(name = "userId") String userId) {
		log.debug("checkId(user_id={})", userId);

		boolean result = userService.checkUserid(userId);
		if (result) {
			return ResponseEntity.ok("Y");
		} else {
			return ResponseEntity.ok("N");
		}
	}

	@GetMapping("/signin")
	public void signIn() {
		log.debug("GET signIn()");
	}
	
	// 사용자 아이디 중복체크 REST 컨트롤러
		@GetMapping("/checkemail")
		@ResponseBody // 메서드 리턴 값이 클라이언트로 전달되는 데이터.
		public ResponseEntity<String> userEmail(@RequestParam(name = "userEmail") String userEmail) {
			log.debug("checkEmail(checkEmail={})", userEmail);

			boolean result = userService.checkEmail(userEmail);
			if (result) {
				return ResponseEntity.ok("Y");
			} else {
				return ResponseEntity.ok("N");
			}
		}

}
