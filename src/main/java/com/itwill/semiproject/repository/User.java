package com.itwill.semiproject.repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class User {
	private Integer userKey; // PK
	private String userId; // 로그인 아이디
	private String userPassword; // 로그인 비밀번호
	private String userName; // 회원 이름
	private String email; //이메일
	private String phone; // 휴대폰 번호
	private String userRole; // 관리자 or 회원

}