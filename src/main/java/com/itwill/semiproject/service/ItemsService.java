package com.itwill.semiproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.ItemsDto;
import com.itwill.semiproject.dto.OrderDto;
import com.itwill.semiproject.repository.Items;
import com.itwill.semiproject.repository.ItemsDao;
import com.itwill.semiproject.repository.OrderDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ItemsService {

    private final ItemsDao itemsDao;
    private final OrderDao orderDao;

   // items 테이블
    public Items read(ItemsDto dto) {
        log.debug("read(dto={})", dto);
        
        Items items = itemsDao.selectOrderByItemsId(dto.toEntity());
        log.debug("상품 가격 ={}", items);
        
        return items;
    }
    
    public List<Items> getAllItems() {
        return itemsDao.selectAllItems();
    }
    
}
