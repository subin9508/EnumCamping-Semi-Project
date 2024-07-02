package com.itwill.semiproject.repository;

import java.time.LocalDate;
import java.util.List;

public interface ReservationAreaDao {
	List<Integer> selectReservedArea(LocalDate checkIn);
}
