package com.itwill.semiproject.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.semiproject.dto.UserUpdateDto;
import com.itwill.semiproject.repository.User;
import com.itwill.semiproject.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // final 필드들을 초기화하는 생성자
@Controller
@RequestMapping("/user")
public class UserController {
	
	
	private final UserService userService; // 생성자에 의한 의존성 주입
	
	@GetMapping("/myPage")
	public String myPage(@RequestParam(name = "userid") String userid, Model model) {
		log.debug("myPage(userid={})", userid);
		
		User user = userService.read(userid);
		
		model.addAttribute("user", user);
		
		return "user/myPage";
		
	}

	
	
	@PostMapping("/update")
	public String update(UserUpdateDto dto) {
		log.debug("update(dto={})", dto);
		
		userService.update(dto);
		
		return "redirect:/user/myPage?userid=" + dto.getUserid();
	}
	
	
	
}