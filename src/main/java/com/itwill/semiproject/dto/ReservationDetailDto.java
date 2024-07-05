package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.ReservationDetail;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReservationDetailDto {
	
	private Integer itemId;
	private Integer itemQuantity;
	private Integer itemTotalPrice;
	
	public ReservationDetail toEntity() {
		return ReservationDetail.builder()
				.itemId(itemId)
				.itemQuantity(itemQuantity)
				.itemTotalPrice(itemTotalPrice)
				.build();
	}
}
