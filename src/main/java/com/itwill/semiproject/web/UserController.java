package com.itwill.semiproject.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.semiproject.dto.ReservationListDto;
import com.itwill.semiproject.dto.UserCreateDto;
import com.itwill.semiproject.dto.UserSignInDto;
import com.itwill.semiproject.dto.UserUpdateDto;
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
	private final String uploadDirectory = "path/to/upload/directory"; // 실제 업로드 경로로 수정

	@GetMapping("/signin")
	public void signin() {
		log.debug("signin()");
	}

	@PostMapping("/signin")
	public String signin(@ModelAttribute UserSignInDto dto, HttpSession session,
			@RequestParam(name = "target", defaultValue = "") String target) throws UnsupportedEncodingException {
		log.debug("POST - signin(dto={}, session={}, target={})", dto, session, target);

		// 서비스 메서드를 호출해서 아이디와 비밀번호가 일치하는 사용자가 있는 지 확인
		User user = userService.read(dto);
		if (user != null) { // 아이디와 비밀번호 모두 일치하는 사용자가 있는 경우 -> 로그인 성공
			// 세션에 로그인 사용자 정보를 저장
			session.setAttribute("signedInUser", user.getUserId());
			// 세션에 유저 role을 저장
			session.setAttribute("userRole", user.getUserRole());

			// 타겟 페이지로 이동
			return (target.equals("")) ? "redirect:/" : "redirect:" + target;

		} else { // 아이디와 비밀번호가 일치하는 사용자가 없는 경우 -> 로그인 실패
			// 로그인 페이지로 이동
			log.debug("target({})", target);
			String redirectUrl = "redirect:/user/signin?result=f";
			if (!target.isEmpty()) {
				redirectUrl += "&target=" + URLEncoder.encode(target, "UTF-8");
			}
			return redirectUrl;
		}
	}

	@GetMapping("/signout")
	public String signout(HttpSession session, @RequestParam(name = "target", defaultValue = "") String target) {
		log.debug("signout(session={})", session);

		// 세션에 저장된 "signedInUser" 정보를 삭제.
		session.removeAttribute("signedInUser");

		// 세션을 만료시킴.
		session.invalidate();

		// 로그아웃 이후 타겟 페이지로 이동
		String redirectUrl = "redirect:/";
		if (!target.isEmpty()) {
			redirectUrl = "redirect:" + target;
		}
		return redirectUrl;
	}

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

	// 사용자 아이디 중복체크 REST 컨트롤러
	@GetMapping("/checkemail")
	@ResponseBody // 메서드 리턴 값이 클라이언트로 전달되는 데이터.
	public ResponseEntity<String> email(@RequestParam(name = "userEmail") String userEmail) {
		log.debug("checkEmail(userEmail={})", userEmail);

		boolean result = userService.checkEmail(userEmail);
		if (result) {
			return ResponseEntity.ok("Y");
		} else {
			return ResponseEntity.ok("N");
		}
	}

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
		dto.setUserId(user.getUserId());
		dto.setUserPassword(password);

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

		User user = (User) session.getAttribute("user");

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
			String fileName = user.getUserId() + "_" + file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드
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

	@GetMapping("/findid")
	public String findIdForm() {
		return "user/findid"; // 아이디 찾기 입력 폼으로 이동
	}

	@PostMapping("/findid")
	public String findId(@RequestParam("user_name") String name, @RequestParam("user_email") String email,
			Model model) {
		String userId = userService.findIdByNameAndEmail(name, email);
		if (userId != null) {

			model.addAttribute("userId", userId);
			return "user/displayid"; // 아이디 찾기 성공 화면으로 이동
		} else {

			model.addAttribute("message", "등록되지 않은 이름 또는 이메일입니다.");
			return "user/findid"; // 아이디 찾기 입력 폼으로 다시 이동
		}
	}

	@GetMapping("/findpassword")
	public String findPasswordForm(Model model) {
		return "user/findpassword"; // 패스워드 찾기 입력 폼으로 이동
	}

	@PostMapping("/findpassword")
	public String findPassword(@RequestParam("user_name") String name, @RequestParam("user_email") String email,
			@RequestParam("user_id") String id, Model model) {
		String userPassword = userService.findPasswordByNameAndEmailAndId(name, email, id);
		if (userPassword != null) {
			model.addAttribute("userPassword", userPassword);
			return "user/displaypassword"; // 비밀번호 찾기 성공 화면으로 이동
		} else {
			model.addAttribute("message", "등록되지 않은 이름 또는 이메일 또는 아이디 입니다.");
			return "user/findpassword"; // 비밀번호 찾기 입력 폼으로 다시 이동
		}
	}
	
	@GetMapping("/reservation_list")
	public String reservationList(@RequestParam(name="userId") String userId, Model model, HttpSession session) {
		log.debug("reservation_list(userId={})", userId);

		User user = userService.read(userId);
		session.setAttribute("user", user); // 사용자 정보를 세션에 저장

		 List<ReservationListDto> list = userService.readReservationList(user.getUserId());
		 log.debug("list=({})", list);
	     model.addAttribute("reservations", list);
	     model.addAttribute("user", user); // 모델에 사용자 정보 추가
		
	     return "/user/reservation_list"; // 반환할 뷰의 이름
	}
    
    @GetMapping("/reservation_details")
    public void reservationDetails() {
    	log.debug("reservation_details()");
    }
}

