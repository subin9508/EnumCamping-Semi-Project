package com.itwill.semiproject.repository;

public interface PaymentDao {

	Payments selectByPayid(Integer payId);
	
	int insertPayment(Payments payment);
	
}
