package com.itwill.semiproject.repository;

import com.itwill.semiproject.dto.PaymentDto;

public interface PaymentDao {

	Payments selectByPayid(Integer payId);
	
	int insertPayment(PaymentDto dto);
	
}
