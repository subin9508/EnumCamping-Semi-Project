package com.itwill.semiproject.repository;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor @NoArgsConstructor @Builder
public class PaymentCancel {
	private Integer payId;
	private String impUid;
    private Integer canId;
    private Integer canPrice;
    private LocalDateTime canDate;
    private String canRole;
}