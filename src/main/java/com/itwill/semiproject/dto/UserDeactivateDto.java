package com.itwill.semiproject.dto;

import lombok.Data;

@Data
public class UserDeactivateDto {
	private Integer userKey;
	private String userPassword;

}