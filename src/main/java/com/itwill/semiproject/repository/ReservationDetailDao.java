package com.itwill.semiproject.repository;

import java.util.List;

import com.itwill.semiproject.dto.ReservationDetailListDto;

public interface ReservationDetailDao {
	
	int insert(ReservationDetail reservationDetail);

	List<ReservationDetailListDto> selectItemsByResId(Integer resId);
	
	List<ReservationDetail> selectDetailsByUserId(String userId); //이게 왜 필요한지 모르겠음
	
	int deleteByResId(String resId);
}
