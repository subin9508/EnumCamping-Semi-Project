package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.User;

import lombok.Data;

// 회원 가입 요청에서 요청 파라미터들을 저장하기 위한 DTO
@Data
public class UserCreateDto {
	private String userId;
	private String userPassword;
	private String userName;
	private String phone;
	private String email;

	public User toEntity() {
		return User.builder()
				.userId(userId)
				.userPassword(userPassword)
				.userName(userName)
				.phone(phone)
				.email(email)
				.build();
	}
}