package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.Items;
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

//	private Integer detailId;
	private Integer itemId;
	private Integer itemQuantity;
	private Integer itemAmount;
	private String itemName;
	
	public ReservationDetailListDto fromEntity(ReservationDetail resDetail, Items items) {
		return ReservationDetailListDto.builder()
				.itemId(resDetail.getItemId())
				.itemQuantity(resDetail.getItemQuantity())
				.itemAmount(resDetail.getItemAmount())
				.itemName(items.getItemName())
				.build();
	}
}
