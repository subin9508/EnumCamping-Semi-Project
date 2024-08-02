package com.itwill.semiproject.dto;

import java.time.LocalDateTime;

import com.itwill.semiproject.repository.Notice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data  @Builder @AllArgsConstructor
public class NoticeDetailsDto {
	
	
	//notice table의 certify 부분 제외
	private Integer notPostId;
	private String notTitle;
	private String notContent;
	private String notCreatedTime;
	private String notModifiedTime;
	
	//Notice에서 필요한 내용 뽑아오기
	public static NoticeDetailsDto fromEntity(Notice notice) {
		return NoticeDetailsDto.builder().notPostId(notice.getNotPostId())
				.notModifiedTime(notice.getNotModifiedTime())
				.notCreatedTime(notice.getNotCreatedTime())
				.notContent(notice.getNotContent())
				.notTitle(notice.getNotTitle()).build();
	}
	
	
	
}
