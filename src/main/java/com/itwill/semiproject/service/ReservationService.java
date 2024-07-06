package com.itwill.semiproject.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.semiproject.dto.ItemsDto;
import com.itwill.semiproject.dto.ReservationDetailCreateDto;
import com.itwill.semiproject.dto.ReservationDetailListDto;
import com.itwill.semiproject.repository.Items;
import com.itwill.semiproject.repository.ItemsDao;
import com.itwill.semiproject.repository.ReservationDetail;
import com.itwill.semiproject.repository.ReservationDetailDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ReservationService{

    private final ItemsDao itemsDao;
    private final ReservationDetailDao reservationDetailDao;

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
    
    public int create(ReservationDetailCreateDto dto) {
        log.debug("create({})", dto);
        
       int result = reservationDetailDao.insert(dto.toEntity());
  
        
        return result;
    }
    
    @Transactional
    public void createBatch(List<ReservationDetailCreateDto> dtos) {
        for (ReservationDetailCreateDto dto : dtos) {
            reservationDetailDao.insert(dto.toEntity());
        }
    }
    
    
  
    
}
