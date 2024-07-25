package com.itwill.semiproject.repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReservationDetail {

	private Integer resId; // 예약 아이디
	private Integer itemId; // 아이템 아이디
	private Integer itemQuantity; // 아이템 수량
	private Integer itemAmount; // 아이템 가격(단가 * 수량)
	private String itemName; // 아이템 이름
	private String itemImg; // 아이템 사진
}
