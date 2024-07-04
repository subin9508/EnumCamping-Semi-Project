package com.itwill.semiproject.service;


import java.time.LocalDate;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.semiproject.repository.Payments;
import com.itwill.semiproject.repository.PaymentDao;
import com.itwill.semiproject.repository.ReservationMaster;
import com.itwill.semiproject.repository.ReservationMasterDao;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/*
@Slf4j
@RequiredArgsConstructor
@Service

public class PaymentService { // 결제 관련 서비스를 제공해주는 로직
	
	private final PaymentDao paymentDao;
	private final ReservationMasterDao reservationMasterDao;
	
	
	// 은행 이름에 따른 코드들을 반환해줌<br>
	public String code(String bankName) {
		String code="";
		if(bankName.equals("우리은행") || bankName.equals("우리"))
			code="20";
		
		return code;
	}
	
	
	
	// 현재 payId에 해당하는 정보를 갖고와서 반환해줌.
	@Transactional
	public Payments paymentLookupService(Integer payId) {
		Payments payments = paymentDao.selectByPayid(payId);
		
		return payments;
	}
	
	
	// 아임포트 서버쪽 결제내역과 DB에 주문 가격을 비교하는 서비스.
	
	@Transactional
	public void verifyIamportService(IamportResponse<Payment> irsp, int payPrice, int resId)
									throws Exception {
		try {
            // 예약 정보 조회
            ReservationMaster resInfo = reservationMasterDao.selectByResid(resId);
            if (resInfo == null) {
                throw new Exception("유효하지 않은 예약 ID입니다.");
            }

            // 결제 금액 검증
            if (irsp.getResponse().getAmount().intValue() != payPrice) {
                throw new Exception("결제 금액이 일치하지 않습니다.");
            } else if (payPrice != resInfo.getResTotalPrice()) {
                throw new Exception("예약 총 금액과 결제 금액이 일치하지 않습니다.");
            }

            // 결제 정보 삽입
            Payments payment = Payments.builder()
                .impUid(irsp.getResponse().getImpUid())
                .resId(resId)
                .payPrice(payPrice)
                .payDate(LocalDate.now())
                .payMethod(1)  // 예시로 결제 방법을 설정, 필요시 적절히 수정
                .payStatus(1)  // 예시로 결제 상태를 설정, 필요시 적절히 수정
                .build();

            int result = paymentDao.insertPayment(payment);
            if (result <= 0) {
                throw new Exception("결제 정보 삽입에 실패했습니다.");
            }

            // 결제 정보 삽입 성공 시 추가적인 로직을 여기에 작성할 수 있습니다.

        } catch (Exception e) {
            // 데이터베이스 삽입 중 발생한 예외 처리
            throw new Exception("결제 정보 처리 중 오류가 발생했습니다: " + e.getMessage(), e);
        }
    }
		
	}
	*/
	
	


