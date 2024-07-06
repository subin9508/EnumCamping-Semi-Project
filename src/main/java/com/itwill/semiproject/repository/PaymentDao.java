package com.itwill.semiproject.repository;

import org.apache.ibatis.annotations.Options;

import com.itwill.semiproject.dto.PaymentDto;

public interface PaymentDao {

	Payments selectByPayKey(Integer payKey);
	
	
	
	@Options(useGeneratedKeys = true, keyProperty = "payKey")
	int insertPayment(PaymentDto dto);
	
}
