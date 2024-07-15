package com.itwill.semiproject.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.semiproject.dto.ReservationDetailListDto;
import com.itwill.semiproject.dto.ReservationListDto;
import com.itwill.semiproject.dto.UserCreateDto;
import com.itwill.semiproject.dto.UserSignInDto;
import com.itwill.semiproject.dto.UserUpdateDto;
import com.itwill.semiproject.repository.ReservationDetail;
import com.itwill.semiproject.repository.ReservationDetailDao;
import com.itwill.semiproject.repository.ReservationMaster;
import com.itwill.semiproject.repository.ReservationMasterDao;
import com.itwill.semiproject.repository.User;
import com.itwill.semiproject.repository.UserDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {

    private final UserDao userDao;
    private final ReservationMasterDao reservationMasterDao;
    private final ReservationDetailDao reservationDetailDao;


	// 아이디 중복 체크: true - 중복되지 않은 아이디(사용 가능한 아이디), false - 중복된 아이디.
	public boolean checkUserid(String userId) {
		log.debug("checkUserid(user_id={})", userId);

		User user = userDao.selectByUserid(userId);
		if (user == null) { // userid가 일치하는 레코드가 없을 때(중복된 아이디가 없는 경우)
			return true;
		} else { // userid가 일치하는 레코드가 있을 때(아이디가 중복된 경우)
			return false;
		}
	}

	// 회원 가입 서비스
	public int create(UserCreateDto dto) {
		log.debug("create({})", dto);

		int result = userDao.insert(dto.toEntity());

		return result;
	}

	// 로그인 서비스
	public User read(UserSignInDto dto) {
		log.debug("read(dto={})", dto);

		// 리포지토리 메서드를 호출해서, 아이디와 비밀번호가 일치하는 사용자가 있는 지 검색
		User user = userDao.selectByUseridAndPassword(dto.toEntity());
		log.debug("로그인 사용자 = {}", user);

		return user;
	}

	// 이메일 중복 체크: true - 중복되지 않은 이메일(사용 가능한 이메일), false - 중복된 이메일.
	public boolean checkEmail(String userEmail) {
		log.debug("checkUserEmail(email={})", userEmail);

		User user = userDao.selectByUserEmail(userEmail);
		if (user == null) { // userEmail가 일치하는 레코드가 없을 때(중복된 이메일이 없는 경우)
			return true;
		} else { // userEmail가 일치하는 레코드가 있을 때(이메일가 중복된 경우)
			return false;
		}
	}

	public void update(UserUpdateDto dto) {
		log.debug("update({})", dto);

		int result = userDao.updateUser(dto.toEntity());
		log.debug("update 결과 = {}", result);

		if (result == 0) {
			throw new RuntimeException("Update failed");
		}

	}

	public User read(String userId) {
		log.debug("read(id={})", userId);

		return userDao.selectByUserid(userId);
	}

	public int updateProfile(MultipartFile profileImage, String webPath, String filePath, User signedInUser) throws IllegalStateException, IOException {
	    String originalProfileImage = signedInUser.getProfileImage();
	    String renamedFilename = null;

	    if (profileImage != null && !profileImage.isEmpty()) {
	        renamedFilename = fileRename(profileImage.getOriginalFilename());
	        signedInUser.setProfileImage(webPath + renamedFilename);
	    } else {
	        signedInUser.setProfileImage(null);
	    }

	    int result = userDao.updateProfileImage(signedInUser);

	    if (result > 0) {
	        if (renamedFilename != null) {
	            // 실제 파일 저장
	            File targetFile = new File(filePath, renamedFilename);
	            profileImage.transferTo(targetFile);

	            // 이전 프로필 이미지가 있고, 기본 이미지가 아니라면 삭제
	            if (originalProfileImage != null && !originalProfileImage.endsWith("user.png")) {
	                new File(filePath, new File(originalProfileImage).getName()).delete();
	            }
	        } else if (signedInUser.getProfileImage() == null) {
	            // 프로필 이미지를 삭제한 경우, 이전 이미지 파일 삭제 
	            if (originalProfileImage != null && !originalProfileImage.endsWith("user.png")) {
	                new File(filePath, new File(originalProfileImage).getName()).delete();
	            }
	        } else {
	            // 변경 사항이 없는 경우, 원래 이미지로 복원
	            signedInUser.setProfileImage(originalProfileImage);
	        }
	    } else {
	        // 업데이트 실패 시 원래 이미지로 복원
	        signedInUser.setProfileImage(originalProfileImage);
	    }

	    return result;
	}

	public static String fileRename(String originalFileName) {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	    String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

	    int ranNum = (int) (Math.random() * 100000);

	    String str = "_" + String.format("%05d", ranNum);

	    String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

	    return date + str + ext;
	}

    
	// 예약내역 read 메서드 추가
    public List<ReservationListDto> readReservationList(String userId) {
		List<ReservationListDto> list = reservationMasterDao.selectByUserId(userId);
		log.debug("Reservation list({})", list);
	
		return list;
	}

    // 예약 상세 내역 read 메서드 추가
    public ReservationMaster readReservationMasterDetails(int resId) {
    	log.debug("readReservationMasterDetails({})", resId);
    	
    	ReservationMaster resMaster = reservationMasterDao.selectByResId(resId);
    	log.debug("ReservationMaster = {}", resMaster);
    	
    	return resMaster;
    }
    
    //예약 detail 읽는 메서드
    public List<ReservationDetailListDto> readReservationDetails(int resId) {
    	log.debug("readReservationDetails({})", resId);
    	
    	List<ReservationDetailListDto> resDetails= reservationDetailDao.selectItemsByResId(resId);
    	log.debug("ReservationDetails = {}", resDetails);
    	
    	return resDetails;
    }

	public User searchPassword(User user) {
		log.debug("searchPassword");
		return user;

	}

	public User updatePassword(User user) {
		log.debug("updatePassword");
		return user;
	}

	public String findPasswordByNameAndEmailAndId(String name, String email, String id) {
		log.debug("findPasswordByNameAndEmailAndId({}{}{})", name, email, id);
		String user = userDao.findPasswordByNameAndEmailAndId(name, email, id);
		if (user != null) {
			return user;
		}
		return null;
	}

	public String findIdByNameAndEmail(String name, String email) {
		log.debug("findIdByNameAndEmail({} {})", name, email);
		String user = userDao.findIdByNameAndEmail(name, email);
		if (user != null) {
			return user;
		}
		return null;
	}

	
	// 회원탈퇴 관련
	@Transactional
    public boolean deactivateAccount(Integer userKey, String userPassword) {
		log.debug("Checking password for userKey: {}", userKey);
        // 비밀번호 확인
    	Integer count = userDao.checkPassword(userKey, userPassword);
        if (count == 0) {
        	log.debug("Password does not match for userKey: {}", userKey);
            return false; // 비밀번호가 일치하지 않으면 false 반환
        }
        
        // 회원 비활성화
        userDao.deactivateUser(userKey);
        
        // 탈퇴 회원 정보 저장
        userDao.insertDeletedUser(userKey);
        
        return true; // 비활성화 성공 시 true 반환
    }
    
    public boolean checkUserIsActive(String userId) {
        return userDao.checkUserIsActive(userId) == 1; // 1이면 활성(로그인가능), 0이면 비활성(탈퇴 & 계정 정지)
    }
    
    public boolean checkDeactivationPeriod(String userId) {
        return userDao.checkDeactivationPeriod(userId) == 0; // 1이면 비활성화 기간 종료(로그인가능), 0이면 기간 중(아직 비활성화)
    }
    
    public User getUserById(Integer userKey) {
        return userDao.selectUserById(userKey);
    }

	
}
