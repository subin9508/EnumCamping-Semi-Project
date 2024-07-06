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
public class ReservationDetailListDto {

	private Integer detailId;
	private Integer itemId;
	private Integer itemQuantity;
	private Integer itemAmount;
	
	public ReservationDetail fromEntity() {
		return ReservationDetail.builder()
				.detailId(detailId)
				.itemId(itemId)
				.itemQuantity(itemQuantity)
				.itemAmount(itemAmount)
				.build();
	}
}
