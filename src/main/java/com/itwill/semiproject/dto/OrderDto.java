package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.Order;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderDto {
	
	private Integer orderId;
	private Integer itemId;
	private Integer quantity;
	private Integer price;
	private Integer checkedPay;
	
	public Order toEntity() {
		return Order.builder()
				.orderId(orderId)
				.itemId(itemId)
				.quantity(quantity)
				.price(price)
				.checkedPay(checkedPay)
				.build();
	}
}
