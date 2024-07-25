package com.itwill.semiproject.repository;

import java.util.List;

import com.itwill.semiproject.dto.ReservationDetailListDto;

public interface ReservationDetailDao {
	
	// 예약 상세 정보 삽입
	int insert(ReservationDetail reservationDetail);

	// ResId에 해당하는 물품 리스트 조회
	List<ReservationDetailListDto> selectItemsByResId(Integer resId);
	
	// userId에 해당하는 예약 상세 정보 조회
	List<ReservationDetail> selectDetailsByUserId(String userId); 
	
	// userId에 해당하는 예약 상태가 0인 예약 상세 정보 삭제
	int deleteByResId(String resId);
}
