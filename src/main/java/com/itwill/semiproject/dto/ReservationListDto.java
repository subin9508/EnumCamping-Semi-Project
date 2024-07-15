package com.itwill.semiproject.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.itwill.semiproject.repository.ReservationDetail;
import com.itwill.semiproject.repository.ReservationMaster;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class ReservationListDto {
	private String userId;
	private Integer resId;
	private LocalDate resCheckIn;
	private Integer resState;
	private String resCreatedTime;	
	private Integer itemId;
	
	
	public ReservationListDto fromEntity(ReservationMaster reservationMaster, ReservationDetail detail) {
		return ReservationListDto.builder()
				.userId(reservationMaster.getUserId())
				.resId(reservationMaster.getResId())
				.resCheckIn(reservationMaster.getResCheckIn())
				.resState(reservationMaster.getResState())
				.resCreatedTime(reservationMaster.getResCreatedTime())
				.itemId(detail.getItemId())
				.build();
	}
}