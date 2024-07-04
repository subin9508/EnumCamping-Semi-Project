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
	
	private Integer resId;
	private Integer itemId;
	private Integer itemQuantity;
	private Integer itemPrice;
	
	public ReservationDetail toEntity() {
		return ReservationDetail.builder()
				.resId(resId)
				.itemId(itemId)
				.itemQuantity(itemQuantity)
				.itemPrice(itemPrice)
				.build();
	}
}
