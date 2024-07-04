package com.itwill.semiproject.service;


import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.semiproject.repository.Payments;
import com.itwill.semiproject.dto.PaymentDto;
import com.itwill.semiproject.exception.ServiceException;
import com.itwill.semiproject.repository.PaymentDao;
import com.itwill.semiproject.repository.ReservationMaster;
import com.itwill.semiproject.repository.ReservationMasterDao;
import com.itwill.semiproject.repository.UserDao;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;



@Service
@Transactional
@Slf4j

public class PaymentService { // 결제 관련 서비스를 제공해주는 로직
	
	@Autowired
	private PaymentDao paymentDao;
	
	public String savePayment(
			
			Payment payment,
			Integer payId,
			Integer resId) throws ServiceException {
		
		log.trace("savePayment({}, {}, {}) invoked.", payment, payId, resId);
		
		// dto 세팅
		PaymentDto dto = new PaymentDto();
		
		dto.setPayId(payId);
		dto.setImpUid(payment.getImpUid());
		dto.setPgTid(payment.getPgTid());
		dto.setResId(resId);
		dto.setAmount(payment.getAmount().intValue());
		dto.setPayDate(payment.getPaidAt());
		dto.setPayMethod(payment.getPayMethod());
		dto.setPayStatus(payment.getStatus());
		dto.setBuyerEmail(payment.getBuyerEmail());
		
		
		try {
			// 실패한 메서드 종류에 따라 오류 코드 반환
			if(this.paymentDao.insertPayment(dto) != 1) return "FAIL:01";
			
			return "SUCCESS";
				
		} catch(UncategorizedSQLException e) {
			throw e;
		} catch(Exception e) {
			log.info("\t+ Transfer Failure.");
			
			throw new ServiceException(e);
		}
		
		
		
	}
		
}	
			
	
	
	
	


