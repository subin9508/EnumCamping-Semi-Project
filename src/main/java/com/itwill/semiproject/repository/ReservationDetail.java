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
	
	private Integer detailId; // primary key
	private Integer itemId;	// foreign key: items 테이블의 id 컬럼을 참조
	private Integer itemQuantity;
	private Integer itemAmount;
}
