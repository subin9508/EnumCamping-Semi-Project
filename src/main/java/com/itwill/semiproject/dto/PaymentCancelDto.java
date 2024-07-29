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
    private Integer payId; // 결제 ID
    private String impUid; // 결제 고유 식별자
    private Integer canId; // 취소 ID
    private Integer canAmount; // 취소 금액
    private LocalDateTime canDate; // 취소 날짜 및 시간
    private String canRole; // 취소 역할 (구매자, 관리자 등)
    
    
    public PaymentCancelDto() {
        this.canDate = LocalDateTime.now(); // 취소 날짜 및 시간을 현재 시간으로 설정
        this.canRole = "구매자"; // 초기값 설정
    }
    
    
//	public PaymentCancel toEntity() {
//		return PaymentCancel.builder().canId(canId).canPrice(canPrice).canAppDate(canAppDate).canWitDate(canWitDate).canRole(canRole).canCsStatus(canCsStatus).build();
//	}
    
}