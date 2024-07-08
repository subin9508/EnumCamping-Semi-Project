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
@Slf4j
@Transactional // 트랜잭션 관리
public class PaymentService { // 결제 관련 서비스를 제공해주는 로직
	
	// 의존성 주입
	@Autowired
	private PaymentDao paymentDao; // 결제정보를 DB에 저장/조회

	@Autowired
	private ReservationMasterDao reservationMasterDao; // 예약정보를 DB에 저장/조회

	@Autowired
	private UserDao userDao; // 사용자 정보를 가져오기 위한 레포지토리

	/**
	 * 예약 id를 기반으로 결제 정보를 조회하여 반환하는 메서드
	 * 
	 * @param resId 예약 아이디
	 * @return 결제 정보를 담은 Map 객체
	 * @throws ServiceException 예외 발생시 ServiceException으로 wrapping하여 throw
	 */
	public Map<String, Object> getPaymentInfoByResId(Integer resId) throws ServiceException {
		try {
			// 예약 테이블에서 resId에 해당하는 예약 정보를 DB에서 가져옴.
			// 조회한 예약정보(master)를 Dto.of 메서드를 통해 dto 객체로 변환. 
			ReservationMasterDto reservation = ReservationMasterDto.of(reservationMasterDao.selectByResId(resId));		
			// 변환된 reservation 객체가 null인지 확인. (예약 정보 없을 경우)
			if (reservation == null) {
				throw new ServiceException("Reservation not found for resId: " + resId);
			}

			// reservation 객체에서 사용자id 가져옴. 주어진 사용자 id에 해당하는 사용자 정보를 DB에서 조회.
			User user = userDao.selectByUserid(reservation.getUserId());
			// user 정보 없을 경우 예외
			if (user == null) {
				throw new ServiceException("User not found for userId: " + reservation.getUserId());
			}
			
			// hashMap 객체인 paymentInfo를 생성해서 결제 정보를 담음.
			Map<String, Object> paymentInfo = new HashMap<>(); 
			paymentInfo.put("name", "상품명 " + reservation.getRequirement()); // 상품명
			paymentInfo.put("amount", reservation.getResTotalPrice()); // 결제 금액 설정
			paymentInfo.put("email", user.getUserEmail()); // (유저)이메일 정보 설정
			paymentInfo.put("buyerName", user.getUserName()); // (유저)구매자 이름 설정
			paymentInfo.put("phoneNumber", user.getUserPhone()); // (유저)구매자 전화번호 설정

			return paymentInfo; // paymentInfo 객체를 반환하여 결제 정보 담은 Map 객체 완성.
		} catch (Exception e) {
			throw new ServiceException(e);
		}
	}
	
	/**
	 * 결제 정보를 저장하는 메서드
	 * 
	 * @param payment 결제 정보를 담은 payment 객체
	 * @param payId 결제 ID
	 * @param resId 예약 ID
	 * @return 처리 결과를 문자열로 반환 (SUCCESS 또는 실패 코드)
	 * @throws ServiceException 예외 발생 시 ServiceException으로 wrapping 하여 throw
	 */
	public String savePayment(
			Payment payment, 
			Integer payId, 
			Integer resId
			) throws ServiceException {

		log.trace("savePayment({}, {}, {}) invoked.", 
				payment, payId, resId);

		// PaymentDto 객체를 생성하고, 파라미터로 받은 필드 값을 설정
		PaymentDto dto = new PaymentDto(); 
		dto.setPayId(payId); // 파라미터로 받은 payId 설정
		dto.setImpUid(payment.getImpUid()); // 아이엠포트 UID 설정
		dto.setPgTid(payment.getPgTid()); //PG사 TID 설정
		dto.setResId(resId);  // 파라미터로 받은 resId 설정
		dto.setAmount(payment.getAmount().intValue()); // 결제 금액 설정
		
		// 결제 완료 시간이 null이 아닌 경우, 해당 시간을 localDate 형식으로 변환하여 dto의 payDate 필드에 설정.
		// setPayDate 메서드 호출해서 payment 객체의 결제 완료 시간을 localDate 형식으로 반환하여 설정
		if (payment.getPaidAt() != null) {
			dto.setPayDate(payment.getPaidAt().toInstant().atZone(ZoneId.systemDefault()).toLocalDate());
		}
		
		dto.setPayMethod(payment.getPayMethod()); //결제 수단 설정
		dto.setPayStatus(payment.getStatus()); //결제 상태 설정
		dto.setBuyerEmail(payment.getBuyerEmail()); // 구매자 이메일 설정

		try {			
			// paymentDto를 사용해서 결제 정보를 데이터베이스에 저장
			int result = this.paymentDao.insertPayment(dto);
			
			// 삽입된 레코드의 개수가 1보다 작으면 실패로 간주
			if (result < 1)
				return "FAIL:01"; // DB 삽입 실패시

			return "SUCCESS"; // DB 삽입 성공시 

		} catch (UncategorizedSQLException e) {
			throw e; // DB 작업 중 예외 발생시 throw.
		}
	}
}