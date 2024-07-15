package com.itwill.semiproject.repository;

import java.time.LocalDateTime;

import com.itwill.semiproject.dto.NoticeDetailsDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class Notice {
	Integer notPostId;
	String notTitle;
	String notContent;
	String notCreatedTime;
	String notModifiedTime;
	Integer notCertify;
	
	/*
	public static Notice toEntity(NoticeDetailsDto  dto) {
		return Notice.builder()
				.notPostId(dto.getNotPostId())
				.notTitle(dto.getNotTitle())
				.notContent(dto.getNotContent())
				.notCreatedTime(dto.getNotCreatedTime())
				.notModifiedTime(dto.getNotModifiedTime())
				.build();
	}*/
}
