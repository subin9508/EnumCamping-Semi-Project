package com.itwill.semiproject.repository;

import java.util.List;

public interface ItemsPriceDao {

	ItemsPrice selectByItemsPrice(ItemsPrice itemsPrice);
	
	 List<ItemsPrice> selectAllItems();
}
