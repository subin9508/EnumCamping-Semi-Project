package com.itwill.semiproject.dto;

import java.time.LocalDate;
import java.util.Date;

import com.itwill.semiproject.repository.ReservationMaster;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ReservationMasterDto {
	private Integer resKey; // 예약키
    private String resId; // 예약 ID
    private String userId; // 사용자 ID
    private String requirement; // 요청 사항
    private LocalDate resCreatedTime; // 예약 최초 시간
    private LocalDate resModifiedTime; // 예약 수정 시간
    private LocalDate resCheckIn; // 체크인 날짜
    private LocalDate resCheckOut; // 체크아웃 날짜 
    private Integer areaId; // 구역 ID
    private Integer resTotalPrice; // 예약 총 가격
    private Integer resState; // 예약 상태
    
    public ReservationMaster toEntity() {
		return ReservationMaster.builder().resKey(resKey).resId(resId).userId(userId).requirement(requirement).resCreatedTime(resCreatedTime)
				.resModifiedTime(resModifiedTime).resCheckIn(resCheckIn).resCheckOut(resCheckOut).areaId(areaId).resTotalPrice(resTotalPrice)
				.resState(resState).build();
}
    // 엔티티를 DTO로 변환하는 정적 메서드.
    // reservationMasterDto 객체 생성하고 Master의 각 필드 값을 Dto 객체의 필드 값으로 설정.
    public static ReservationMasterDto of (ReservationMaster rm) {
        return ReservationMasterDto.builder().resKey(rm.getResKey()).resId(rm.getResId())
        		.userId(rm.getUserId()).requirement(rm.getRequirement())
        		.resCreatedTime(rm.getResCreatedTime()).resModifiedTime(rm.getResModifiedTime())
        		.resCheckIn(rm.getResCheckIn()).resCheckOut(rm.getResCheckOut())
        		.areaId(rm.getAreaId()).resTotalPrice(rm.getResTotalPrice()).resState(rm.getResState()).build();
    
    }
}
