package com.itwill.semiproject.repository;

import java.time.LocalDate;
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
	private LocalDate resCreatedTime;
	private LocalDate resModifiedTime;
	private LocalDate resCheckIn;
	private LocalDate resCheckOut;
	private Integer areaId;
	private Integer resTotalPrice;
	private Integer resState;

}
