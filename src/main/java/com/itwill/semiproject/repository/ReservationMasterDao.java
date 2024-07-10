package com.itwill.semiproject.repository;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwill.semiproject.dto.ReservationListDto;

public interface ReservationMasterDao {

	// 예약 id로 예약 정보를 조회
	ReservationMaster selectByResId(Integer resId);
	List<Integer> selectByResCheckIn(@Param("resCheckIn") String resCheckIn);
	List<ReservationMaster> selectByItemIdAndResCheckIn(@Param("itemId") int itemId, @Param("resCheckIn") String resCheckIn);
	void insertReservationMaster(ReservationMaster reservationMaster);
	void insertReservationDetail(ReservationDetail reservationDetail);
	int deleteByUserId(String userId);
	ReservationMaster selectMasterByUserId(String userId);
}
