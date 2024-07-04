package com.itwill.semiproject.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.semiproject.repository.ReservationMasterDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ReservationService {
	
	private final ReservationMasterDao reservationMasterDao;
	
	public List<Integer> readReservedAreas(LocalDate date) {
//		List<Integer> reservedArea = reservationAreaDao.selectReservedArea(date);
		 String dateString = date.format(DateTimeFormatter.ISO_DATE);
	     return reservationMasterDao.selectByResCheckIn(dateString);
		
//		return reservedArea;
	}

}
