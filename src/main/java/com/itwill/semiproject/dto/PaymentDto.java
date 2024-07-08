package com.itwill.semiproject.dto;

import java.time.LocalDate;
import com.itwill.semiproject.repository.Payments;

import lombok.Data;

@Data
public class PaymentDto {
	
	private Integer payKey; // 결제 키
	private String payId; // 결제 아이디
	private String impUid; // 아임포트 UID
	private String pgTid; // PG사 거래 ID
	private String resId; // 예약 ID
	private Integer resKey; // 예약 키
	private Integer amount; // 결제 금액
	private LocalDate payDate; // 결제 날짜
	private String payMethod; // 결제 방법
	private String payStatus; // 결제 상태
	private String buyerEmail; // 구매자 이메일
	
	
	// DTO를 엔티티로 변환. payments 엔티티를 빌더 패턴을 사용해서 생성하고 각 필드 설정.
	public Payments toEntity() {
		return Payments.builder().payKey(payKey).payId(payId).impUid(impUid).pgTid(pgTid).resId(resId).resKey(resKey).amount(amount).payDate(payDate).payMethod(payMethod).payStatus(payStatus).buyerEmail(buyerEmail).build();
		
}
}
