package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.User;

import lombok.Data;

@Data
public class UserSignInDto {

	private String userId; // 사용자 아이디
	private String userPassword; // 사용자 비밀번호
	
	public User toEntity() {
		return User.builder()
				.userId(userId)
				.userPassword(userPassword)
				.build();
	}
}