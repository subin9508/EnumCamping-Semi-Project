package com.itwill.semiproject.repository;

import java.time.LocalDate;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@Builder
public class Payments { //데이터베이스 테이블 payments 테이블의 모델 객체  
	private Integer payId;
	private String impUid;
	private String pgTid;
	private Integer resId;
	private Integer amount;
	private Date payDate;
	private String payMethod;
	private String payStatus;
	private String buyerEmail;
	
	
	

}
