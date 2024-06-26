package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.User;

import lombok.Data;

@Data
public class UserUpdateDto {
	
	private String userid;
	private String userpassword;
	private String userphone;
	
	public User toEntity() {
		return User.builder().userid(userid).userpassword(userpassword).userphone(userphone).build();
	}

}
