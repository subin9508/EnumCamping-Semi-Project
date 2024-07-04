package com.itwill.semiproject.repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Order {
	private Integer resId;
	private Integer itemId;
	private Integer itemQuantity;
	private Integer itemPrice;
}
