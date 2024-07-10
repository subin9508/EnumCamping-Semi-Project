package com.itwill.semiproject.repository;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor @NoArgsConstructor @Builder
public class PaymentCancel {
    private Integer canId;
    private Integer canPrice;
    private LocalDate canAppDate;
    private LocalDate canWitDate;
    private String canRole;
    private String canCsStatus;
}