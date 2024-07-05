package com.itwill.semiproject.dto;

import java.time.LocalDate;
import java.util.Date;

import com.itwill.semiproject.repository.ReservationMaster;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ReservationMasterDto {
	private Integer resKey;
    private String resId;
    private String userId;
    private String requirement;
    private LocalDate resCreatedTime;
    private LocalDate resModifiedTime;
    private LocalDate resCheckIn;
    private LocalDate resCheckOut;
    private Integer areaId;
    private Integer resTotalPrice;
    private Integer resState;
    
    public ReservationMaster toEntity() {
		return ReservationMaster.builder().resKey(resKey).resId(resId).userId(userId).requirement(requirement).resCreatedTime(resCreatedTime)
				.resModifiedTime(resModifiedTime).resCheckIn(resCheckIn).resCheckOut(resCheckOut).areaId(areaId).resTotalPrice(resTotalPrice)
				.resState(resState).build();
}
   
    public static ReservationMasterDto of (ReservationMaster rm) {
        return ReservationMasterDto.builder().resKey(rm.getResKey()).resId(rm.getResId())
        		.userId(rm.getUserId()).requirement(rm.getRequirement())
        		.resCreatedTime(rm.getResCreatedTime()).resModifiedTime(rm.getResModifiedTime())
        		.resCheckIn(rm.getResCheckIn()).resCheckOut(rm.getResCheckOut())
        		.areaId(rm.getAreaId()).resTotalPrice(rm.getResTotalPrice()).resState(rm.getResState()).build();
    
    }
}
