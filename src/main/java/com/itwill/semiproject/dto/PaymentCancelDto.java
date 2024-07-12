package com.itwill.semiproject.dto;

import java.time.LocalDateTime;

import com.itwill.semiproject.repository.PaymentCancel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
public class PaymentCancelDto {
	private Integer payId;
	private String impUid;
    private Integer canId;
    private Integer canAmount;
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