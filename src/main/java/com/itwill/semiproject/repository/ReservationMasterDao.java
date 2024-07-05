package com.itwill.semiproject.repository;

import com.itwill.semiproject.dto.ReservationMasterDto;

public interface ReservationMasterDao {
	
	ReservationMaster selectByResKey(Integer resKey);

}
