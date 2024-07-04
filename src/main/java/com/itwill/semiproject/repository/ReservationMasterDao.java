package com.itwill.semiproject.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.semiproject.dto.ReservationListDto;

public interface ReservationMasterDao {
	List<ReservationListDto> selectByUserId (String userId);
	ReservationMaster selectByResId(Integer resId);
	List<Integer> selectByResCheckIn(@Param("resCheckIn") String resCheckIn);
}
