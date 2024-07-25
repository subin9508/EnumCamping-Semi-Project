package com.itwill.semiproject.repository;

import java.util.List;

public interface ItemsDao {

	// 아이템 Id와 가격으로 아이템을 조회
	Items selectOrderByItemsId(Items itemId);
	
	// 대여 및 판매 물품 아이템만 조회
	 List<Items> selectAllItems();
	 
	 // 특정 아이템의 가격을 조회
	 Integer selectItemPrice(int itemId);
	 }
