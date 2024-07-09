package com.itwill.semiproject.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.semiproject.dto.ReservationListDto;

public interface ReservationMasterDao {

	// 예약 id로 예약 정보를 조회
	ReservationMaster selectByResId(Integer resId);

	List<ReservationListDto> selectByUserId(String userId);


	List<Integer> selectByResCheckIn(@Param("resCheckIn") String resCheckIn);

	List<ReservationMaster> selectByItemIdAndResCheckIn(@Param("itemId") int itemId,
			@Param("resCheckIn") String resCheckIn);

}
