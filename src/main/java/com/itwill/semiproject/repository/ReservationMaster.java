package com.itwill.semiproject.repository;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class ReservationMaster {
	private Integer resId;
	private Integer userKey;
	private String requirement;
	private Integer resState;
	private LocalDateTime resCreatedTime;
	private LocalDateTime resModifiedTime;
	private LocalDateTime resCheckIn;
	private Integer resNight;
	private Integer areaId;
	private Integer resTotalPrice;
}
