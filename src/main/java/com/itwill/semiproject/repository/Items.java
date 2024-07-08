package com.itwill.semiproject.repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Items {
	Integer itemId;
	String itemName;
	Integer itemPrice;
	String itemImg;
	String itemDesc;
}
