package com.itwill.semiproject.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.semiproject.dto.UserSignInDto;
import com.itwill.semiproject.dto.UserUpdateDto;
import com.itwill.semiproject.repository.User;
import com.itwill.semiproject.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // final 필드들을 초기화하는 생성자
@Controller
@RequestMapping("/user")
public class UserController {
	
	
	private final UserService userService; // 생성자에 의한 의존성 주입
	
	private final String uploadDirectory = "path/to/upload/directory"; // 실제 업로드 경로로 수정
	
	@GetMapping("/myPage") 
	public String myPage(@RequestParam(name = "userId") String userId, Model model, HttpSession session) {
		log.debug("myPage(userId={})", userId);
		
		User user = userService.read(userId);
		
		session.setAttribute("user", user); // 사용자 정보를 세션에 저장
		
		model.addAttribute("user", user);
		
		return "user/myPage";
		
	}
	
	
	@GetMapping("/password_check")
	public String showPasswordCheckForm() {
		return "user/password_check";
	}
	
	@PostMapping("/password_check")
	public String passwordCheck(@RequestParam("password") String password, HttpSession session, Model model) {
	    User user = (User) session.getAttribute("user");
	    if (user == null) {
	        return "redirect:/user/signin";
	    }
	    
	    UserSignInDto dto = new UserSignInDto();
	    dto.setUserid(user.getUserId());
	    dto.setUserpassword(password);
	    
	    User verifiedUser = userService.read(dto);
	    if (verifiedUser != null) {
	        // 비밀번호가 일치하는 경우 user_update 페이지로 리다이렉트
	        return "redirect:/user/user_update";
	    } else {
	        // 비밀번호가 일치하지 않는 경우 에러 메시지와 함께 password_check 페이지로 돌아감
	        model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
	        return "user/password_check";
	    }
	}

	
	
	
	
	
	@GetMapping("/user_update")
	public String user_update(HttpSession session, Model model) {
		log.debug("user_update");
		User user = (User) session.getAttribute("user"); // 세션에서 사용자 정보 가져오기
		log.debug("session user: {}", user);
		
		if (user == null) {
			// 사용자 정보가 세션에 없는 경우 오류 처리
			return "redirect:/user/signin"; // 로그인 페이지로 리다이렉트
		}
		
		model.addAttribute("user", user);
		
		return "user/user_update";
	}

	@PostMapping("/user_update")
	public String user_update(UserUpdateDto dto, HttpSession session) {
		log.debug("user_update(dto={})", dto);
		
		userService.update(dto);
		
		// 업데이트된 사용자 정보를 세션에 다시 저장
		User updatedUser = userService.read(dto.getUserId());
		log.info("updatedUser: {}", updatedUser);
		session.setAttribute("user", updatedUser);
		
		return "redirect:/user/myPage?userId=" + dto.getUserId();
	}
	
	
	 @PostMapping("/uploadProfilePicture")
	    public String uploadProfilePicture(@RequestPart("profilePicture") MultipartFile file, HttpSession session) {
	        User user = (User) session.getAttribute("user");
	        if (user == null || file.isEmpty()) {
	            return "redirect:/user/signin"; // 로그인 페이지로 리다이렉트
	        }

	        try {
	            String fileName = user.getUserId() + "_" + file.getOriginalFilename();
	            Path path = Paths.get(uploadDirectory, fileName);
	            Files.write(path, file.getBytes());

	            // 기존 프로필 사진 삭제 (if needed)
	            if (user.getProfilePictureUrl() != null && !user.getProfilePictureUrl().isEmpty()) {
	                Path oldPath = Paths.get(uploadDirectory, user.getProfilePictureUrl());
	                Files.deleteIfExists(oldPath);
	            }

	            user.setProfilePictureUrl(fileName);
	            userService.updateProfilePicture(user);

	            session.setAttribute("user", user);
	        } catch (IOException e) {
	            log.error("Profile picture upload failed", e);
	        }

	        return "redirect:/user/user_update";
	    }

	    @PostMapping("/deleteProfilePicture")
	    public String deleteProfilePicture(HttpSession session) {
	        User user = (User) session.getAttribute("user");
	        if (user == null) {
	            return "redirect:/user/signin"; // 로그인 페이지로 리다이렉트
	        }

	        try {
	            if (user.getProfilePictureUrl() != null && !user.getProfilePictureUrl().isEmpty()) {
	                Path path = Paths.get(uploadDirectory, user.getProfilePictureUrl());
	                Files.deleteIfExists(path);
	            }

	            user.setProfilePictureUrl(null);
	            userService.updateProfilePicture(user);

	            session.setAttribute("user", user);
	        } catch (IOException e) {
	            log.error("Profile picture delete failed", e);
	        }

	        return "redirect:/user/user_update";
	    }

	
	
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
            log.debug("session Id = {}", user.getUserId());
            // 타겟 페이지로 이동
            log.debug("session={}", session.getAttribute("signedInUser"));
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