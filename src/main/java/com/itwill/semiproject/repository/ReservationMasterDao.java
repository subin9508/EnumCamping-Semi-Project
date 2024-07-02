package com.itwill.semiproject.repository;

import java.util.List;

import com.itwill.semiproject.dto.ReservationListDto;

public interface ReservationMasterDao {
	List<ReservationListDto> selectByUserId (String userId);
	ReservationMaster selectByResId(Integer resId);
}
