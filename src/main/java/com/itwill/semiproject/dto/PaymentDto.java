package com.itwill.semiproject.dto;

import java.time.LocalDate;
import java.util.Date;

import com.itwill.semiproject.repository.Payments;

import lombok.Data;

@Data
public class PaymentDto {
	
	private Integer payKey;
	private String payId;
	private String impUid;
	private String pgTid;
	private String resId;
	private Integer resKey;
	private Integer amount;
	private Date payDate;
	private String payMethod;
	private String payStatus;
	private String buyerEmail;
	
	
	
	public Payments toEntity() {
		return Payments.builder().payKey(payKey).payId(payId).impUid(impUid).pgTid(pgTid).resId(resId).resKey(resKey).amount(amount).payDate(payDate).payMethod(payMethod).payStatus(payStatus).buyerEmail(buyerEmail).build();
		
}
}
