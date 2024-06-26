package com.itwill.semiproject.repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//데이터베이스 테이블 users 테이블의 모델 객체 
@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class User {
	private Integer userkey; // PK
	private String username; //유저 이름
	private String userid; // 로그인 아이디
	private String userpassword; // 로그인 비밀번호 
	private String useremail; //이메일
	private String userphone; //핸드폰
	private String userrole; //일반유저인지 관리자인지 
}
