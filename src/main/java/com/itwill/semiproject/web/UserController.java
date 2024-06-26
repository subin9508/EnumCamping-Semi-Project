package com.itwill.semiproject.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.semiproject.service.UserService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/findid") // GET 방식의 요청 주소가 context path인 요청을 처리하는 메서드
	public String home() {
		log.debug("findid()");

		return "/user/findid"; // 뷰(JSP 파일)의 이름.
	}

	@PostMapping("/findid")
	public String findid(@RequestParam("user_name") String name, @RequestParam("user_email") String email, Model model) {
		log.debug("findid()");
		String userId = userService.findIdByNameAndEmail(name, email);
		model.addAttribute("userid", userId);
		if (userId != null) {
			model.addAttribute("userId", userId);
			return "/user/displayId"; // 아이디를 표시할 뷰로 이동
		} else {
			model.addAttribute("message", "등록되지 않은 이름 또는 이메일입니다.");
			return "/user/findid"; // 다시 아이디 찾기 폼으로 이동
		}
	}
	
	@GetMapping("/withdraw")
	public String showWithdraw() {
		log.debug("withdraw()");
		return "/user/withdraw";
	}
	
	
//	@DeleteMapping("/api/member/withdrawUser/{userId}")
//	public ResponseEntity<ApiResponse<Map<String, Object>>> withdrawUser(@PathVariable String userId){
//	    try {
//	        UserService.deleteUser(userId);
//	        return ResponseEntity.ok().body(new ApiResponse<>(1, "회원탈퇴 성공", null));
//	    } catch (RuntimeException ex){
//	        return ResponseEntity.ok().body(new ApiResponse<>(0, "회원탈퇴 실패", null));
//	    }
//	}

}

