package com.itwill.semiproject.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.itwill.semiproject.repository.PaymentCancel;
import com.itwill.semiproject.repository.Payments;

import lombok.Data;

@Data
public class PaymentCancelDto {
	private Integer payId;
	private String impUid;
    private Integer canId;
    private Integer canPrice;
    private LocalDateTime canDate;
    private String canRole;
    
    
    public PaymentCancelDto() {
        this.canDate = LocalDateTime.now();
        this.canRole = "구매자"; // 초기값 설정
    }
    
//	public PaymentCancel toEntity() {
//		return PaymentCancel.builder().canId(canId).canPrice(canPrice).canAppDate(canAppDate).canWitDate(canWitDate).canRole(canRole).canCsStatus(canCsStatus).build();
//	}
    
}