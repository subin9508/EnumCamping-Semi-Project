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

	private Integer itemId; // 물품 아이디
	private String itemName; // 물품 이름
	private Integer itemPrice; // 물품 가격
	private String itemImg; // 물품 사진 경로
	private String itemDesc; // 물품 설명

}
