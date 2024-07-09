package com.itwill.semiproject.repository;

import com.itwill.semiproject.dto.PaymentCancelDto;

public interface PaymentCancelDao {

	// 취소 테이블 삽입
	int insertPaymentCancel(PaymentCancelDto cancelDto);
	
}