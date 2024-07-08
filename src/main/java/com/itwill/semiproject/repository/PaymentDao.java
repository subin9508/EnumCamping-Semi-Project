package com.itwill.semiproject.repository;

import com.itwill.semiproject.dto.PaymentDto;

public interface PaymentDao {
	
	// 결제 아이디로 결제 정보를 조회
	Payments selectByPayId(Integer payId);
	

	int insertPayment(PaymentDto dto);
	
	// 결제 정보(dto)를 기반으로 결제 아이디를 조회
	int selectPayId(PaymentDto dto);
	
}
