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
	public String signout(HttpServletRequest request, HttpServletResponse response) {
	    HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            cookie.setMaxAge(0);
	            response.addCookie(cookie);
	        }
	    }
	    return "redirect:/";
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

	// 마이페이지 요청을 처리하는 메서드
	@GetMapping("/myPage")
	public String myPage(Model model, HttpSession session) {
	    // 세션에서 로그인한 사용자의 ID를 가져옴
	    String userId = (String) session.getAttribute("signedInUser");
	    if (userId != null) {
	        // 사용자 ID로 사용자 정보를 조회
	        User user = userService.read(userId);
	        if (user != null) {
	            // 사용자 정보를 모델에 추가
	            model.addAttribute("user", user);
	            log.debug("마이페이지에 표시될 사용자 정보: {}", user);
	        } else {
	            // 사용자 정보가 없으면 로그인 페이지로 리다이렉트
	            log.warn("세션에 있는 userId에 해당하는 사용자를 찾을 수 없습니다: {}", userId);
	            return "redirect:/signin";
	        }
	    } else {
	        // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
	        log.warn("세션에 로그인된 사용자 정보가 없습니다.");
	        return "redirect:/signin";
	    }

	    // 마이페이지 뷰 반환
	    return "user/myPage";
	}

	// 비밀번호 확인 폼을 보여주는 메서드
	@GetMapping("/password_check")
	public String showPasswordCheckForm() {
	    return "user/password_check";
	}

	// 비밀번호 확인 처리 메서드
	@PostMapping("/password_check")
	public String passwordCheck(@RequestParam("password") String password, HttpSession session, Model model) {
	    // 세션에서 사용자 ID 가져옴
	    String userId = (String) session.getAttribute("signedInUser");
	    if (userId == null) {
	        return "redirect:/user/signin";
	    }

	    // 사용자 정보 조회
	    User user = userService.read(userId);
	    if (user == null) {
	        return "redirect:/user/signin";
	    }

	    // 비밀번호 확인을 위한 DTO 생성
	    UserSignInDto dto = new UserSignInDto();
	    dto.setUserId(user.getUserId());
	    dto.setUserPassword(password);

	    // 비밀번호 확인
	    User verifiedUser = userService.read(dto);
	    if (verifiedUser != null) {
	        // 비밀번호가 일치하면 사용자 정보 수정 페이지로 리다이렉트
	        return "redirect:/user/user_update";
	    } else {
	        // 비밀번호가 일치하지 않으면 에러 메시지와 함께 비밀번호 확인 페이지로 돌아감
	        model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
	        return "user/password_check";
	    }
	}

	// 사용자 정보 수정 폼을 보여주는 메서드
	@GetMapping("/user_update")
	public String user_update(HttpSession session, Model model) {
	    log.debug("user_update");
	    // 세션에서 사용자 ID 가져옴
	    String userId = (String) session.getAttribute("signedInUser");
	    if (userId == null) {
	        return "redirect:/user/signin";
	    }

	    // 사용자 정보 조회
	    User user = userService.read(userId);
	    log.debug("session user: {}", user);

	    if (user == null) {
	        return "redirect:/user/signin";
	    }

	    // 사용자 정보를 모델에 추가
	    model.addAttribute("user", user);

	    return "user/user_update";
	}

	// 사용자 정보 수정 처리 메서드
	@PostMapping("/user_update")
	@ResponseBody
	public ResponseEntity<?> user_update(@ModelAttribute UserUpdateDto dto,
	                                     HttpSession session,
	                                     HttpServletRequest request) throws IllegalStateException, IOException {
	    log.debug("user_update(dto={})", dto);

	    Map<String, Object> response = new HashMap<>();

	    User user = (User) session.getAttribute("user");

	    // 비밀번호 유효성 검사
	    if (dto.getUserPassword() != null && !dto.getUserPassword().isEmpty()) {
	        String password = dto.getUserPassword();
	        if (password.length() < 8) {
	            response.put("success", false);
	            response.put("message", "비밀번호는 8자리 이상이어야 합니다.");
	            return ResponseEntity.badRequest().contentType(MediaType.APPLICATION_JSON).body(response);
	        }

	        // 영문과 숫자 포함 검사
	        String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d).{8,}$";
	        if (!password.matches(passwordPattern)) {
	            response.put("success", false);
	            response.put("message", "비밀번호는 영문과 숫자를 포함해야 합니다.");
	            return ResponseEntity.badRequest().contentType(MediaType.APPLICATION_JSON).body(response);
	        }
	    }

	    // 전화번호 유효성 검사
	    if (dto.getUserPhone() != null && !dto.getUserPhone().isEmpty()) {
	        String phone = dto.getUserPhone();
	        String phonePattern = "^01[0-9]-\\d{3,4}-\\d{4}$";
	        if (!phone.matches(phonePattern) || phone.replace("-", "").length() > 11) {
	            response.put("success", false);
	            response.put("message", "전화번호는 형식에 맞게 입력하세요. 예: 010-1234-5678");
	            return ResponseEntity.badRequest().contentType(MediaType.APPLICATION_JSON).body(response);
	        }
	    }

	    try {
	        // 사용자 정보 업데이트
	        userService.update(dto);

	        // 업데이트된 사용자 정보를 세션에 다시 저장
	        User updatedUser = userService.read(dto.getUserId());
	        log.info("updatedUser: {}", updatedUser);
	        session.setAttribute("user", updatedUser);

	        // 성공 응답 생성
	        String contextPath = request.getContextPath();
	        response.put("success", true);
	        response.put("message", "사용자 정보가 성공적으로 업데이트 되었습니다.");
	        response.put("redirectUrl", contextPath + "/user/myPage?userId=" + dto.getUserId());
	        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(response);

	    } catch (Exception e) {
	        // 오류 처리
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
    
    // 특정 사용자의 QnA 목록 조회
    @GetMapping("/qna_list")
	public void qnaList(@RequestParam(name="userId") String userId, Model model, HttpSession session) {
		log.debug("qna_list(userId={})", userId);
		
		// 사용자 정보를 조회하여 세선에 저장
		User user = userService.read(userId);
		session.setAttribute("user", user);
		
		// 해당 사용자의 QnA 목록 조회
		 List<QnA> list = qnaService.selectByUserId(userId);
		 log.debug("list=({})", list);
	     model.addAttribute("qnalist", list);
	     model.addAttribute("user", user); // 모델에 사용자 정보 추가
	}
    
    // QnA 게시글 상세 및 수정 페이지 조회
    @GetMapping({"/qna_details", "/qna_modify"})
	public void details(@RequestParam(name = "qnaPostId") int qnaPostId, @RequestParam(name="userId") String userId, Model model, HttpSession session) {
		log.debug("details(qnaPostId={})", qnaPostId);
		
		// 사용자 정보 조회해서 세션에 저장
		User user = userService.read(userId);
		session.setAttribute("user", user); 

		// QnA 게시글 조회수 증가
		qnaDao.updateViewCount(qnaPostId); // 조회수 증가 메서드 호출
		QnA qna = qnaService.read(qnaPostId);

		model.addAttribute("qnaDetails", qna); 
		model.addAttribute("user", user); // 모델에 사용자 정보 추가
	}
    
    // QnA 게시글 삭제
    @GetMapping("/qna_delete")
    public String delete(@RequestParam(name="qnaPostId") int id, @RequestParam(name="userId") String userId, Model model, HttpSession session) {
        log.debug("delete(qnaPostId={})", id);
        
        // 로그인된 사용자 확인
        if (session.getAttribute("signedInUser") == null) {
            return "redirect:/user/signin";
        }
        
        // 사용자 정보를 조회하여 세션에 저장
        User user = userService.read(userId);
        session.setAttribute("user", user);
        
        // QnA 게시글 삭제
        qnaService.delete(id);
        
        model.addAttribute("user", user); // 모델에 사용자 정보 추가
        
        return "redirect:/user/qna_list?userId=" + userId;
    }
    
    // QnA 게시글 업데이트
    @PostMapping("/qna_update")
	public String update(@RequestParam(name="userId") String userId, Model model, QnAUpdateDto dto, HttpSession session) {
		log.debug("update(dto={})", dto);
		
		// 로그인된 사용자 확인
        if (session.getAttribute("signedInUser") == null) {
            return "redirect:/user/signin";
        }
        
        // 사용자 정보 조회해서 세션에 저장
        User user = userService.read(userId);
        session.setAttribute("user", user); 
        
        // QnA 게시글 업데이트
		qnaService.update(dto);
		
		model.addAttribute("user", user); // 모델에 사용자 정보 추가
		
		log.debug("postid",dto.getQnaPostId());
		return "redirect:/user/qna_details?qnaPostId=" + dto.getQnaPostId() + "&userId=" + userId;
	}
	
    // 회원 탈퇴 페이지 조회
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
    
    // 회원 탈퇴 처리
    @PostMapping("/deactivateUser")
    @ResponseBody
    public ResponseEntity<?> deactivateAccount(@RequestBody UserDeactivateDto dto, HttpSession session, HttpServletResponse response) {
        log.debug("Received deactivation request for userKey: {}", dto.getUserKey());
        log.debug("Password received: {}", dto.getUserPassword());
    	
    	// 요청 바디에서 id와 password를 추출
        Integer userKey = (Integer) dto.getUserKey(); 
        String userPassword = (String) dto.getUserPassword();
    	
        log.debug("Before calling service - userKey: {}, password: {}", userKey, userPassword);
        
        // 회원 탈퇴 서비스 호출
    	boolean result = userService.deactivateAccount(userKey, userPassword);
        
        if (result) {
            // 성공적으로 탈퇴한 경우, 세션 무효화 및 세션 삭제
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

