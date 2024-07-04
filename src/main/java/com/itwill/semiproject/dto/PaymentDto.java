package com.itwill.semiproject.dto;

import java.time.LocalDate;

import com.itwill.semiproject.repository.Payments;

import lombok.Data;

@Data
public class PaymentDto {
	
	
	private Integer payId;
	private String impUid;
	private Integer resId;
	private Integer payPrice;
	private LocalDate payDate;
	private Integer payMethod;
	private Integer payStatus;
	
	
	
	public Payments toEntity() {
		return Payments.builder().payId(payId).impUid(impUid).resId(resId).payDate(payDate).payPrice(payPrice).payMethod(payMethod).payStatus(payStatus).build();
		
}
}
