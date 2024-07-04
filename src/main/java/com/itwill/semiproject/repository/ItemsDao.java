package com.itwill.semiproject.repository;

import java.util.List;

public interface ItemsDao {

	Items selectOrderByItemsId(Items itemId);
	
	 List<Items> selectAllItems();
	 }
