package com.itwill.semiproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.UserCreateDto;
import com.itwill.semiproject.repository.User;
import com.itwill.semiproject.repository.UserDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service 
public class UserService {
	@Autowired
	private final UserDao userDao;
	
	// 아이디 중복 체크: true - 중복되지 않은 아이디(사용 가능한 아이디), false - 중복된 아이디.
	public boolean checkUserid(String userid) {
		log.debug("checkUserid(userid={})",userid);
		
		User user = userDao.selectByUserid(userid);
		if (user == null) { // userid가 일치하는 레코드가 없을때(중복된 아이디가 없는 경우)
			return true;
		}else {
			return false; //userid가 일치하는 레코드가 있을때(중복된 아이디가 있는 경우)
		}
	}
	
	public String findIdByNameAndEmail(String name, String email) {
		log.debug("findIdByNameAndEmail({} {})", name, email);
		User user = userDao.findIdByNameAndEmail(name, email);
		if (user != null) {
			return user.getUserId();
		}
		return null;
	}
	
	//회원가입 서비스
	public int create(UserCreateDto dto) {
		log.debug("create({}) ", dto);
		
		int result = userDao.insert(dto.toEntity());
		return result;
	}
	
//	public void deleteUser(String userid) {
//	    try {
//	        memberRepository.deleteById(id);
//	    }  catch (Exception ex) {
//	        throw new RuntimeException();
//	    }
//	}
	
}