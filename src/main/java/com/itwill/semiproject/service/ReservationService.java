package com.itwill.semiproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.ItemsPriceDto;
import com.itwill.semiproject.repository.ItemsPrice;
import com.itwill.semiproject.repository.ItemsPriceDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ReservationService {

    private final ItemsPriceDao itemsPriceDao;

    public ItemsPrice read(ItemsPriceDto dto) {
        log.debug("read(dto={})", dto);
        
        ItemsPrice itemsPrice = itemsPriceDao.selectOrderByItemsId(dto.toEntity());
        log.debug("상품 가격 ={}", itemsPrice);
        
        return itemsPrice;
    }
    
    public List<ItemsPrice> getAllItems() {
        return itemsPriceDao.selectAllItems();
    }
    
}
