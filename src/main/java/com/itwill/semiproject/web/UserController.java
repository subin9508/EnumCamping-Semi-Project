package com.itwill.semiproject.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.semiproject.dto.QnAUpdateDto;
import com.itwill.semiproject.dto.ReservationDetailListDto;
import com.itwill.semiproject.dto.ReservationListDto;
import com.itwill.semiproject.dto.UserCreateDto;
import com.itwill.semiproject.dto.UserDeactivateDto;
import com.itwill.semiproject.dto.UserSignInDto;
import com.itwill.semiproject.dto.UserUpdateDto;
import com.itwill.semiproject.repository.QnA;
import com.itwill.semiproject.repository.QnADao;
import com.itwill.semiproject.repository.ReservationDetail;
import com.itwill.semiproject.repository.ReservationMaster;
import com.itwill.semiproject.repository.User;
import com.itwill.semiproject.service.QnAService;
import com.itwill.semiproject.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
	private final QnAService qnaService;
	private final QnADao qnaDao;

	@GetMapping("/signin")
	public void signin(HttpSession session) {
		session.invalidate(); // 세션 초기화
		log.debug("signin()");
	}

	@PostMapping("/signin")
    public String signIn(UserSignInDto dto, 
            @RequestParam(name = "target", defaultValue = "") String target,
            HttpSession session) throws IOException {
        log.debug("POST signIn({})", dto);
        
        // 사용자가 존재하는지 확인 (아이디와 비밀번호를 검증)
        User user = userService.read(dto);
        
        // 로그인 실패한 경우
        if (user == null) {
            // 아이디와 비밀번호가 일치하는 사용자 없는 경우
            return "redirect:/user/signin?result=f&target="
                    + URLEncoder.encode(target, "UTF-8");
        }

//        // 비활성화된 사용자 확인
//        log.debug("Checking if user is active...");
//        if (!userService.checkUserIsActive(dto.getUserId())) {
//            // 사용자가 비활성 상태인 경우
//        	 log.debug("User is inactive");
//            return "redirect:/user/signin?result=inactive";
//        }

        // 비활성화된 사용자 확인
        log.debug("Checking if user is active...");
        boolean isActive = userService.checkUserIsActive(dto.getUserId());
        log.debug("User active status: {}", isActive);
        if (!isActive) {
            // 사용자가 비활성 상태인 경우
            log.debug("User is inactive");
            return "redirect:/user/signin?result=inactive";
        }
        
        
        // 비활성화 기간 확인
        if (!userService.checkDeactivationPeriod(dto.getUserId())) {
            // 비활성화 기간이 남아있는 경우
        	 log.debug("User is still in deactivation period");
            return "redirect:/user/signin?result=deactivated";
        }
        
        // 로그인 성공 시 세션에 로그인 사용자 아이디를 저장
        session.setAttribute("signedInUser", user.getUserId());
        // 세션에 유저 role을 저장
        session.setAttribute("userRole", user.getUserRole());

        session.setAttribute("loginUserId", user.getUserKey());
        log.debug("로그인 성공 - 세션에 loginUserId 저장: {}, 세션에 signedInUser 저장: {}", user.getUserKey(), user.getUserId());
        
        // 로그인 성공 후 이동할 타겟 페이지
        String targetPage = (target.equals("")) ? "/" : target;
        return "redirect:" + targetPage;
    
	
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
		if (!target.isEmpty() && !target.contains("/reservation_details") && !target.contains("/community/qna/details")) {
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
		log.debug("세션에 저장된 사용자 정보: {}", session.getAttribute("user"));

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
	
	
	@GetMapping("/images/{filename:.+}")
	@ResponseBody
	public ResponseEntity<Resource> serveFile(@PathVariable String filename, HttpServletRequest request) {
	    try {
	        String filePath = request.getServletContext().getRealPath("/static/images/user/");
	        Path file = Paths.get(filePath).resolve(filename);
	        Resource resource = new UrlResource(file.toUri());
	        if (resource.exists() || resource.isReadable()) {
	            return ResponseEntity.ok().body(resource);
	        } else {
	            return ResponseEntity.notFound().build();
	        }
	    } catch (IOException e) {
	        return ResponseEntity.internalServerError().build();
	    }
	}

	@PostMapping("/user_update")
	@ResponseBody
	public ResponseEntity<?> user_update(@ModelAttribute UserUpdateDto dto,
	                                     @RequestParam(value = "profileImage", required = false) MultipartFile file,
	                                     HttpSession session,
	                                     HttpServletRequest request) throws IllegalStateException, IOException {
	    log.debug("user_update(dto={})", dto);

	    Map<String, Object> response = new HashMap<>();

	    User user = (User) session.getAttribute("user");

	    // 비밀번호 길이 검사
	    if(dto.getUserPassword() != null && !dto.getUserPassword().isEmpty()) {
	        if(dto.getUserPassword().length() < 8) {
	            response.put("success", false);
	            response.put("message", "비밀번호는 8자리 이상이어야 합니다.");
	            return ResponseEntity.badRequest().contentType(MediaType.APPLICATION_JSON).body(response);
	        }
	    }

	    try {
	        // 사용자 정보 업데이트
	        userService.update(dto);

	        // 프로필 이미지 업데이트
	        if(file != null && !file.isEmpty()) {
	            // 웹 접근 경로
	            String webPath = "/static/images/user/";

	            // 실제로 이미지 파일이 저장되어야 하는 서버 컴퓨터 경로
	            String filePath = request.getServletContext().getRealPath("/") + "static/images/user/";

	            int result = userService.updateProfile(file, webPath, filePath, user);
	            if (result <= 0) {
	                response.put("success", false);
	                response.put("message", "프로필 이미지 업데이트에 실패했습니다.");
	                return ResponseEntity.badRequest().contentType(MediaType.APPLICATION_JSON).body(response);
	            }
	        }

	        // 업데이트된 사용자 정보를 세션에 다시 저장
	        User updatedUser = userService.read(dto.getUserId());
	        log.info("updatedUser: {}", updatedUser);
	        session.setAttribute("user", updatedUser);

	        response.put("success", true);
	        response.put("message", "사용자 정보가 성공적으로 업데이트 되었습니다.");
	        response.put("redirectUrl", "/user/myPage?userId=" + dto.getUserId());
	        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(response);

	    } catch (Exception e) {
	        log.error("사용자 정보 업데이트 중 오류 발생", e);
	        response.put("success", false);
	        response.put("message", "사용자 정보 업데이트에 실패했습니다.");
	        return ResponseEntity.badRequest().contentType(MediaType.APPLICATION_JSON).body(response);
	    }
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
    public void reservationDetails(@RequestParam(name="resId") int resId, Model model) {
    	log.debug("reservation_details()");
    	
    	ReservationMaster resMaster = userService.readReservationMasterDetails(resId);
    	
    	List<ReservationDetailListDto> resDetail = userService.readReservationDetails(resId);
    	
    	model.addAttribute("resMaster", resMaster);
    	model.addAttribute("resDetail", resDetail);
    	
    }
    
    @GetMapping("/qna_list")
	public void qnaList(@RequestParam(name="userId") String userId, Model model, HttpSession session) {
		log.debug("qna_list(userId={})", userId);

		User user = userService.read(userId);
		session.setAttribute("user", user); // 사용자 정보를 세션에 저장

		 List<QnA> list = qnaService.selectByUserId(userId);
		 log.debug("list=({})", list);
	     model.addAttribute("qnalist", list);
	     model.addAttribute("user", user); // 모델에 사용자 정보 추가
	}
    
    @GetMapping({"/qna_details", "/qna_modify"})
	public void details(@RequestParam(name = "qnaPostId") int qnaPostId, @RequestParam(name="userId") String userId, Model model, HttpSession session) {
		log.debug("details(qnaPostId={})", qnaPostId);
		
		User user = userService.read(userId);
		session.setAttribute("user", user); // 사용자 정보를 세션에 저장

		
		qnaDao.updateViewCount(qnaPostId); // 조회수 증가 메서드 호출
		QnA qna = qnaService.read(qnaPostId);

		model.addAttribute("qnaDetails", qna); 
		model.addAttribute("user", user); // 모델에 사용자 정보 추가
	}
    
    @GetMapping("/qna_delete")
    public String delete(@RequestParam(name="qnaPostId") int id, @RequestParam(name="userId") String userId, Model model, HttpSession session) {
        log.debug("delete(qnaPostId={})", id);
        if (session.getAttribute("signedInUser") == null) {
            return "redirect:/user/signin";
        }
        
        User user = userService.read(userId);
        session.setAttribute("user", user); // 사용자 정보를 세션에 저장
        
        qnaService.delete(id);
        
        model.addAttribute("user", user); // 모델에 사용자 정보 추가
        
        return "redirect:/user/qna_list?userId=" + userId;
    }
    
    @PostMapping("/qna_update")
	public String update(@RequestParam(name="userId") String userId, Model model, QnAUpdateDto dto, HttpSession session) {
		log.debug("update(dto={})", dto);
        if (session.getAttribute("signedInUser") == null) {
            return "redirect:/user/signin";
        }
        User user = userService.read(userId);
        session.setAttribute("user", user); // 사용자 정보를 세션에 저장
        
		qnaService.update(dto);
		
		model.addAttribute("user", user); // 모델에 사용자 정보 추가
		
		log.debug("postid",dto.getQnaPostId());
		return "redirect:/user/qna_details?qnaPostId=" + dto.getQnaPostId() + "&userId=" + userId;
	}
	

    // 회원 탈퇴 
    @GetMapping("/deactivateUser")
    public String deactivateAccount(Model model, HttpSession session) {
        // 세션에서 사용자 ID 가져오기
         Integer userKey = (Integer) session.getAttribute("loginUserId");
         log.debug("세션에서 가져온 userKey: {}", userKey);
        if (userKey == null) {
            return "redirect:/user/signin"; // 로그인 페이지로 리다이렉트
        }
        
        // 사용자 정보 가져오기
        User user = userService.getUserById(userKey);
        log.debug("가져온 사용자 정보: {}", user);
        model.addAttribute("user", user);
        
        return "user/deactivateUser";
    }
    
    @PostMapping("/deactivateUser")
    @ResponseBody
    public ResponseEntity<?> deactivateAccount(@RequestBody UserDeactivateDto dto, HttpSession session, HttpServletResponse response) {
        log.debug("Received deactivation request for userKey: {}", dto.getUserKey());
        log.debug("Password received: {}", dto.getUserPassword());
    	
    	// 요청 바디에서 id와 password를 추출
        Integer userKey = (Integer) dto.getUserKey(); 
        String userPassword = (String) dto.getUserPassword();
    	
        log.debug("Before calling service - userKey: {}, password: {}", userKey, userPassword);
        
    	boolean result = userService.deactivateAccount(userKey, userPassword);
        
        if (result) {
            // 세션 삭제
            session.invalidate();
            
            // 쿠키 삭제
            Cookie cookie = new Cookie("user", null);
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);
            
            log.debug("Account deactivated successfully.");
            return ResponseEntity.ok().body("/semiproject");
        } else {
        	log.debug("비밀번호가 일치하지 않습니다.");
            return ResponseEntity.badRequest().body("비밀번호가 일치하지 않습니다.");
        }
    }
    
}

