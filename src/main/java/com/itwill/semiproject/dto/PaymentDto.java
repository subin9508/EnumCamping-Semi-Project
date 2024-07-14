package com.itwill.semiproject.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.itwill.semiproject.repository.Payments;

import lombok.Data;

@Data
public class PaymentDto {
	
	private Integer payId; // 결제 아이디
	private String impUid; // 아임포트 UID
	private String pgTid; // PG사 거래 ID
	private Integer resId; // 예약 ID

	private Integer resTotalPrice; // 결제 금액

	private LocalDateTime payDate; // 결제 날짜
	private String payMethod; // 결제 방법
	private String payStatus; // 결제 상태
	private String buyerEmail; // 구매자 이메일
	
	
	// DTO를 엔티티로 변환. payments 엔티티를 빌더 패턴을 사용해서 생성하고 각 필드 설정.
	public Payments toEntity() {

		return Payments.builder().payId(payId).impUid(impUid).pgTid(pgTid).resId(resId).resTotalPrice(resTotalPrice).payDate(payDate).payMethod(payMethod).payStatus(payStatus).buyerEmail(buyerEmail).build();

		
}
}
