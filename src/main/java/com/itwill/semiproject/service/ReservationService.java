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
import com.itwill.semiproject.dto.ReservationDetailListDto;
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
	
	// 특정 날짜에 예약된 지역을 읽기
	public List<Integer> readReservedAreas(LocalDate date) {
//		List<Integer> reservedArea = reservationAreaDao.selectReservedArea(date);
		 String dateString = date.format(DateTimeFormatter.ISO_DATE);
	     return reservationMasterDao.selectByResCheckIn(dateString);
		
//		return reservedArea;
	}
	
	// 특정 날짜와 지역에 해당하는 예약 마스터 정보를 읽어오기
	public List<ReservationMaster> readReservationMaster(LocalDate date, int area) {
		String formattedDate = date.toString();
		return reservationMasterDao.selectByItemIdAndResCheckIn(area, formattedDate);
	}
	
	// 특정 아이템의 가격 조회
	public Integer readItemPrice(int itemId) {
		return itemsDao.selectItemPrice(itemId);
	}
	
	// 예약 생성
	@Transactional
	public void makeReservation(ReservationMaster reservationMaster, List<ReservationDetail> reservationDetails) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			ReservationMasterDao reservationMasterDao = session.getMapper(ReservationMasterDao.class);
			
			// reservation_master 테이블에 데이터 삽입
			reservationMasterDao.insertReservationMaster(reservationMaster);
			// 자동 생성된 res_id 가져오기
			int resId = reservationMaster.getResId();
			log.debug("resId({})", resId);
			
			// reservation_detail 테이블에 여러 데이터 삽입
			for (ReservationDetail detail : reservationDetails) {
				detail.setResId(resId);
				if(detail.getItemQuantity() == null) {
					detail.setItemQuantity(0); // 기본값 설정
				}
				reservationMasterDao.insertReservationDetail(detail);
			}
			
			session.commit();
		} catch (Exception e) {
			log.error("Reservation failed", e);
            throw new RuntimeException("Reservation failed", e);
		}
	}
	
	 // item 정보를 읽어오는 메서드
    public Items readItem(ItemsDto dto) {
        log.debug("readItem(dto={})", dto);
        
     // DAO를 사용하여 데이터베이스에서 아이템 정보를 가져옴
        Items items = itemsDao.selectOrderByItemsId(dto.toEntity());
        log.debug("상품 가격 ={}", items);
        
        return items;
    }
    
    // 아이템 리스트를 가져오는 메서드
    public List<Items> getAllItems() {
        return itemsDao.selectAllItems();
    }
    
    // resId에 해당하는 예약 상세 정보
    public List<ReservationDetailListDto> getReservationDeatil(Integer resId) {
    	return reservationDetailDao.selectItemsByResId(resId);
    }
    
    // 예약 상세 정보 생성
    public int create(ReservationDetailCreateDto dto) {
        log.debug("create({})", dto);
        
       int result = reservationDetailDao.insert(dto.toEntity());
  
        return result;
    }
    
    // userId에 해당하는 예약 상세 정보
    public List<ReservationDetail> getReservationDetailsByUserId(String userId) {
        return reservationDetailDao.selectDetailsByUserId(userId);
    }
    
    // userId에 해당하고 예약 대기상태인 예약 마스터 정보
    public ReservationMaster getReservationMasterByUserId(String userId) {
    	return reservationMasterDao.selectMasterByUserId(userId);
    }
    
    // userId에 해당하는 예약 마스터 정보 삭제
    public int deleteReservationMaster(String userId) {
    	int result = reservationMasterDao.deleteByUserId(userId);
    	
    	return result;
    }
    
    // userId에 해당하는 예약 상세 정보 삭제
    public int deleteReservationDetail(String userId) {
    	int result = reservationDetailDao.deleteByResId(userId);
    	
    	return result;
    }

}