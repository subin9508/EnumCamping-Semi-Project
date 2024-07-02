package com.itwill.semiproject.dto;

import java.time.LocalDateTime;

import com.itwill.semiproject.repository.ItemsPrice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class ItemsPriceDto {

	private Integer itemId;
	private String	itemName;
	private Integer itemPrice;
	private String itemImg;
	private String itemDesc;
	
	public ItemsPrice toEntity() {
		return ItemsPrice.builder()
				.itemId(itemId)
				.itemName(itemName)
				.itemPrice(itemPrice)
				.itemImg(itemImg)
				.itemDesc(itemDesc)
				.build();
	}
	
}
