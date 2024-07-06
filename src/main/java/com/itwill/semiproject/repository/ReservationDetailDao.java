package com.itwill.semiproject.repository;

import java.util.List;

public interface ReservationDetailDao {
	
	int insert(ReservationDetail reservationDetail);
	
	ReservationDetail selectByResId(Integer resid);

	List<ReservationDetail> selectOrderByResId();
}
