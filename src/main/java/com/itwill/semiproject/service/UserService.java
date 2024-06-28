package com.itwill.semiproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.UserSignInDto;
import com.itwill.semiproject.dto.UserUpdateDto;
import com.itwill.semiproject.repository.User;
import com.itwill.semiproject.repository.UserDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {
	
	
	private final UserDao userDao;
	
	
	public void update(UserUpdateDto dto) {
		log.debug("update({})", dto);
		
		int result = userDao.updateUser(dto.toEntity());
		log.debug("update 결과 = {}", result);
		
		if(result == 0) {
			throw new RuntimeException("Update failed");
		}
		
	}
	
	public User read(String userId) {
		log.debug("read(id={})", userId);
		
		return userDao.selectByUserId(userId);
	}
	
	
	public User read(UserSignInDto dto) {
        log.debug("read(dto={})", dto);
        
        // 리포지토리 메서드를 호출해서, 아이디와 비밀번호가 일치하는 사용자가 있는 지 검색
        User user = userDao.selectByUseridAndPassword(dto.toEntity());
        log.debug("로그인 사용자 = {}", user);
        
        return user;
    }

}
