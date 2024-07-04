package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.Order;

import lombok.Data;

@Data
public class OrderDto {
	
	private Integer resId;
	private Integer itemId;
	private Integer itemQuantity;
	private Integer itemPrice;
	
	public Order toEntity() {
		return Order.builder()
				.resId(resId)
				.itemId(itemId)
				.itemQuantity(itemQuantity)
				.itemPrice(itemPrice)
				.build();
	}
}
