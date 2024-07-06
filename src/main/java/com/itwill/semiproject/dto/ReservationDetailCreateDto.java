package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.ReservationDetail;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class ReservationDetailCreateDto {
	
	private Integer itemId;
	private Integer itemQuantity;
	private Integer itemAmount;
	
	// reservationDetailCreateDto 타입을 reservationDetail 타입으로 변환해서 리턴
	public ReservationDetail toEntity() {
		return ReservationDetail.builder()
				.itemId(itemId)
				.itemQuantity(itemQuantity)
				.itemAmount(itemAmount)
				.build();
	}
}
