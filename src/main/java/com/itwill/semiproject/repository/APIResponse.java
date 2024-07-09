package com.itwill.semiproject.repository;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class APIResponse {
	
	// API 응답의 상태 코드를 나타내는 필드
	@ApiModelProperty(example = "상태코드")
	private int status;
	
	// API 응답의 메세지를 나타내는 필드
	@ApiModelProperty(example = "메시지")
	private String message;
	
	// API 응답의 데이터를 담는 필드
	@ApiModelProperty(example = "응답데이터")
	private Map<String, Object> data;

	// 기본 생성자, 초기화시 응답 데이터를 담는 맵을 생성.
	public APIResponse() {
		this(HttpStatus.OK);
	} // constructor
	
	// 상태코드, 메세지, 응답 데이터를 초기화하는 생성자.
	public APIResponse(HttpStatus httpStatus) {
		// 상태 코드를 httpstatus의 값으로 설정
		this.status = httpStatus.value();
		// 메세지를 httpstatus의 이유 구문으로 설정.
		this.message = httpStatus.getReasonPhrase();
		// 응답 데이터를 담는 맵을 초기화
		this.data = new HashMap<>();
	} // constructor-overloading
	
	// 응답 데이터에 키와 값을 추가하는 메서드.
	public void add(String key, Object value) {
		// 주어진 키와 값을 응답 데이터 맵에 추가
		this.data.put(key, value);
	} // add
} // end class