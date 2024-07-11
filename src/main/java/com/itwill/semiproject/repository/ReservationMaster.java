package com.itwill.semiproject.repository;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@Builder
public class ReservationMaster {

	private Integer resId;
	private String userId;
	private String requirement;
	private String resCreatedTime;
	private LocalDateTime resModifiedTime;
	private LocalDate resCheckIn;
	private LocalDate resCheckOut;
	private Integer resTotalPrice;
	private Integer resState;

}
