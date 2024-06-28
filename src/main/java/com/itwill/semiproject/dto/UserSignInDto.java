package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.User;

import lombok.Data;

@Data
public class UserSignInDto {
	private String userid;
	private String userpassword;
	
	public User toEntity() {
		return User.builder()
				.userId(userid)
				.userPassword(userpassword)
				.build();
	}
}