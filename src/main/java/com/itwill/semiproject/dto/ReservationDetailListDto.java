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
	private String itemName;  
    private String itemImg;
	
	public ReservationDetail fromEntity(ReservationDetail reservationDetail) {
		return ReservationDetail.builder()
				.resId(reservationDetail.getResId())
				.itemId(reservationDetail.getItemId())
				.itemQuantity(reservationDetail.getItemQuantity())
				.itemAmount(reservationDetail.getItemAmount())
				.itemName(reservationDetail.getItemName()) 
                .itemImg(reservationDetail.getItemImg()) 
				.build();
	}
}
