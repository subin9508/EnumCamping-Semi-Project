package com.itwill.semiproject.service;


import java.time.ZoneId;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.semiproject.dto.ReservationMasterDto;
import com.itwill.semiproject.dto.PaymentDto;
import com.itwill.semiproject.exception.ServiceException;
import com.itwill.semiproject.repository.PaymentDao;
import com.itwill.semiproject.repository.ReservationMasterDao;
import com.itwill.semiproject.repository.User;
import com.itwill.semiproject.repository.UserDao;
import com.siot.IamportRestClient.response.Payment;
import lombok.extern.slf4j.Slf4j;



@Service
@Transactional
@Slf4j

public class PaymentService { // 결제 관련 서비스를 제공해주는 로직
	
	@Autowired
	private PaymentDao paymentDao;

	 @Autowired
	    private ReservationMasterDao reservationMasterDao;
	    
	    @Autowired
	    private UserDao userDao; // 사용자 정보를 가져오기 위한 레포지토리

	    public Map<String, Object> getPaymentInfoByResKey(Integer resKey) throws ServiceException {
	        try {
	            // 예약 테이블에서 정보를 조회합니다.
	        	ReservationMasterDto reservation = ReservationMasterDto.of(reservationMasterDao.selectByResKey(resKey));
	            
	            if (reservation == null) {
	                throw new ServiceException("Reservation not found for resKey: " + resKey);
	            }

	            // 사용자 정보를 조회합니다.
	            User user = userDao.selectByUserid(reservation.getUserId());
	            if (user == null) {
	                throw new ServiceException("User not found for userId: " + reservation.getUserId());
	            }

	            Map<String, Object> paymentInfo = new HashMap<>();
	            paymentInfo.put("name", "예약 번호 " + reservation.getResId()); // 예약 ID를 상품명으로 사용
	            paymentInfo.put("amount", reservation.getResTotalPrice());
	            paymentInfo.put("email", user.getUserEmail()); // 사용자 테이블에서 가져옴
	            paymentInfo.put("buyerName", user.getUserName()); // 사용자 테이블에서 가져옴
	            paymentInfo.put("phoneNumber", user.getUserPhone()); // 사용자 테이블에서 가져옴

	            return paymentInfo;
	        } catch (Exception e) {
	            throw new ServiceException(e);
	        }
	    }
	
	
	
	
	public String savePayment(
			
			Payment payment,
			Integer payKey,
			String payId,
			String resId,
			Integer resKey) throws ServiceException {
		
		log.trace("savePayment({}, {}, {}, {}, {}) invoked.", payment, payKey, payId, resId, resKey);
		
		// dto 세팅
		PaymentDto dto = new PaymentDto();
		dto.setPayKey(payKey); // 파라미터로 받은 payKey 사용
		dto.setPayId(payId != null ? payId : "");
		dto.setImpUid(payment.getImpUid());
		dto.setPgTid(payment.getPgTid());
		dto.setResId(resId != null ? resId : "");
		dto.setResKey(resKey);
		dto.setAmount(payment.getAmount().intValue());
		if (payment.getPaidAt() != null) {
	        dto.setPayDate(payment.getPaidAt().toInstant()
	                .atZone(ZoneId.systemDefault())
	                .toLocalDate());
	    }
		dto.setPayMethod(payment.getPayMethod());
		dto.setPayStatus(payment.getStatus());
		dto.setBuyerEmail(payment.getBuyerEmail());
		
		
		try {
			// 실패한 메서드 종류에 따라 오류 코드 반환
			
			int result = this.paymentDao.insertPayment(dto);
			
			if(result < 1) return "FAIL:01";
			
			return "SUCCESS";
				
		} catch(UncategorizedSQLException e) {
			throw e;
		} 
			
			
		}
		
		
		
	}

			
	
	
	
	


