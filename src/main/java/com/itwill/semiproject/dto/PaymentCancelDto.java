package com.itwill.semiproject.dto;

import java.time.LocalDate;

import com.itwill.semiproject.repository.PaymentCancel;
import com.itwill.semiproject.repository.Payments;

import lombok.Data;

@Data
public class PaymentCancelDto {
    private Integer canId;
    private Integer canPrice;
    private LocalDate canAppDate;
    private LocalDate canWitDate;
    private String canRole;
    private String canCsStatus;
    
    
    public PaymentCancelDto() {
        this.canAppDate = LocalDate.now();
        this.canWitDate = null; // 초기값으로 null 설정
        this.canRole = "구매자"; // 초기값 설정
        this.canCsStatus = "취소 완료"; // 초기값 설정
    }
    
//	public PaymentCancel toEntity() {
//		return PaymentCancel.builder().canId(canId).canPrice(canPrice).canAppDate(canAppDate).canWitDate(canWitDate).canRole(canRole).canCsStatus(canCsStatus).build();
//	}
    
}