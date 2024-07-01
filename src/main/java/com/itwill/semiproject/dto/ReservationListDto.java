package com.itwill.semiproject.dto;

import java.time.LocalDateTime;

import com.itwill.semiproject.repository.ReservationMaster;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class ReservationListDto {
	private Integer resId;
	private Integer areaId;
	private LocalDateTime resCheckIn;
	private Integer resState;
	
	public ReservationListDto fromEntity(ReservationMaster reservationMaster) {
		return ReservationListDto.builder()
				.resId(reservationMaster.getResId())
				.areaId(reservationMaster.getAreaId())
				.resCheckIn(reservationMaster.getResCheckIn())
				.resState(reservationMaster.getResState())
				.build();
	}
}
