package com.itwill.semiproject.repository;

public interface ReservationMasterDao {
	
	// 예약 키로 예약 정보를 조회
	ReservationMaster selectByResKey(Integer resKey);

}
