package com.itwill.semiproject.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.semiproject.dto.ItemsDto;
import com.itwill.semiproject.dto.ReservationDetailCreateDto;
import com.itwill.semiproject.repository.Items;
import com.itwill.semiproject.repository.ItemsDao;
import com.itwill.semiproject.repository.ReservationDetail;
import com.itwill.semiproject.repository.ReservationDetailDao;
import com.itwill.semiproject.repository.ReservationMaster;
import com.itwill.semiproject.repository.ReservationMasterDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.sql.DATE;

@Slf4j
@RequiredArgsConstructor
@Service
public class ReservationService {
	
	private final ReservationMasterDao reservationMasterDao;
	private final ReservationDetailDao reservationDetailDao;
	private final ItemsDao itemsDao;
	private final SqlSessionFactory sqlSessionFactory;
	
	public List<Integer> readReservedAreas(LocalDate date) {
//		List<Integer> reservedArea = reservationAreaDao.selectReservedArea(date);
		 String dateString = date.format(DateTimeFormatter.ISO_DATE);
	     return reservationMasterDao.selectByResCheckIn(dateString);
		
//		return reservedArea;
	}
	
	public List<ReservationMaster> readReservationMaster(LocalDate date, int area) {
		String formattedDate = date.toString();
		return reservationMasterDao.selectByItemIdAndResCheckIn(area, formattedDate);
	}
	
	public Integer readItemPrice(int itemId) {
		return itemsDao.selectItemPrice(itemId);
	}
	
	@Transactional
	public void makeReservation(ReservationMaster reservationMaster, ReservationDetail reservationDetail) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			ReservationMasterDao reservationMasterDao = session.getMapper(ReservationMasterDao.class);
			
			// reservation_master 테이블에 데이터 삽입
			reservationMasterDao.insertReservationMaster(reservationMaster);
			// 자동 생성된 res_id 가져오기
			int resId = reservationMaster.getResId();
			reservationDetail.setResId(resId);
			
			// reservation_detail 테이블에 데이터 삽입
			reservationMasterDao.insertReservationDetail(reservationDetail);
			
			session.commit();
		} catch (Exception e) {
			log.error("Reservation failed", e);
            throw new RuntimeException("Reservation failed", e);
		}
	}
	
	// items 테이블
    public Items readItem(ItemsDto dto) {
        log.debug("readItem(dto={})", dto);
        
        Items items = itemsDao.selectOrderByItemsId(dto.toEntity());
        log.debug("상품 가격 ={}", items);
        
        return items;
    }
    
    public List<Items> getAllItems() {
        return itemsDao.selectAllItems();
    }
    
    public List<ReservationDetail> getReservationDeatil() {
    	return reservationDetailDao.selectOrderByResId();
    }
    
    public int create(ReservationDetailCreateDto dto) {
        log.debug("create({})", dto);
        
       int result = reservationDetailDao.insert(dto.toEntity());
  
        
        return result;
    }

}