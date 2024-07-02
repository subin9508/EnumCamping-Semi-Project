package com.itwill.semiproject.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.semiproject.repository.ReservationAreaDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ReservationService {
	
	private final ReservationAreaDao reservationAreaDao;
	
	public List<Integer> readReservedAreas(LocalDate checkIn) {
		List<Integer> reservedArea = reservationAreaDao.selectReservedArea(checkIn);
		log.debug("reservedArea({})", reservedArea);
		
		return reservedArea;
	}

}
