package com.itwill.semiproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.UserUpdateDto;
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
	
	
	public int update(UserUpdateDto dto) {
		log.debug("update({})", dto);
		
		int result = userDao.updateUser(dto.toEntity());
		log.debug("update 결과 = {}", result);
		
		return result;
	}
	
	public User read(String userid) {
		log.debug("read(id={})", userid);
		
		return userDao.selectByUserId(userid);
	}

}
