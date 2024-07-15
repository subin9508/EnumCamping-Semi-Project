package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.User;

import lombok.Data;

@Data
public class UserUpdateDto {
	
	private String userId;
	private String userPassword;
	private String userPhone;
	
	
	
	public User toEntity() {
		return User.builder().userId(userId).userPassword(userPassword).userPhone(userPhone).build();
	}

}
