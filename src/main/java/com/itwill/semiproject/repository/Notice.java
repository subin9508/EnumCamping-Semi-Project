package com.itwill.semiproject.repository;

import java.time.LocalDateTime;

import com.itwill.semiproject.dto.NoticeDetailsDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class Notice {
	Integer nPostId;
	String nTitle;
	String nContent;
	LocalDateTime nCreatedTime;
	LocalDateTime nModifiedTime;
	Integer certify;
	
	public static Notice toEntity(NoticeDetailsDto  dto) {
		return Notice.builder()
				.nPostId(dto.getId())
				.nTitle(dto.getTitle())
				.nContent(dto.getContent())
				.nCreatedTime(dto.getCreatedTime())
				.nModifiedTime(dto.getModifiedTime())
				.build();
	}
}
