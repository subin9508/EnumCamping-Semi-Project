package com.itwill.semiproject.repository;

import com.itwill.semiproject.dto.PaymentCancelDto;
import com.itwill.semiproject.dto.PaymentDto;

public interface PaymentDao {
	
	// 결제 아이디로 결제 정보를 조회
		Payments selectByPayId(Integer payId);
		
		// 예약 아이디로 결제 정보를 조회
		Payments selectByResId(Integer resId);
		
		// 새로운 결제 정보를 삽입, 삽입된 레코드 개수 반환
		int insertPayment(PaymentDto dto);
		
		// 결제 정보(dto)를 기반으로 결제 아이디를 조회
		int selectPayId(PaymentDto dto);
		
		// 결제 정보 업데이트
		int updatePayment(Payments payment);
		
		int updateReservationState(Integer resId, Integer resState);
}
