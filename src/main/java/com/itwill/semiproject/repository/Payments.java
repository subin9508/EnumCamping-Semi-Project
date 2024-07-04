package com.itwill.semiproject.repository;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@Builder
public class Payments { //데이터베이스 테이블 payment 테이블의 모델 객체  
	
	private Integer payId;
	private String impUid;
	private Integer resId;
	private Integer payPrice;
	private LocalDate payDate;
	private Integer payMethod;
	private Integer payStatus;
	
	

}
