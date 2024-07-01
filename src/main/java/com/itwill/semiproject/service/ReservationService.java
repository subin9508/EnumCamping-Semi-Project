package com.itwill.semiproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.ItemsDto;
import com.itwill.semiproject.repository.Items;
import com.itwill.semiproject.repository.ItemsDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ReservationService {

    private final ItemsDao itemsDao;

    public ItemsDto selectItemById(Integer itemId) {
        Items item = itemsDao.selectByItemId(itemId);
        if (item != null) {
            return ItemsDto.builder()
                           .itemId(item.getItemId())
                           .itemName(item.getItemName())
                           .itemPrice(item.getItemPrice())
                           .build();
        }
        return null;
    }
}
