package com.itwill.semiproject.repository;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReservationAreaDao {
	List<Integer> selectReservedArea(@Param("resCheckIn") String resCheckIn);
}
