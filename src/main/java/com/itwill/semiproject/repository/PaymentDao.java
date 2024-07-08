package com.itwill.semiproject.repository;

import com.itwill.semiproject.dto.PaymentDto;

public interface PaymentDao {
	
	// 결제 키로 결제 정보를 조회
	Payments selectByPayKey(Integer payKey);
	

	int insertPayment(PaymentDto dto);
	
	// 결제 정보(dto)를 기반으로 결제 키를 조회
	int selectPayKey(PaymentDto dto);
	
}
