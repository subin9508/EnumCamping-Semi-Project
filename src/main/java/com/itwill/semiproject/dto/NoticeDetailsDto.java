package com.itwill.semiproject.dto;

import java.time.LocalDateTime;

import com.itwill.semiproject.repository.Notice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data  @Builder @AllArgsConstructor
public class NoticeDetailsDto {

	private Integer id;
	private String title;
	private String content;
	private LocalDateTime createdTime;
	private LocalDateTime modifiedTime;
	
	//Notice에서 필요한 내용 뽑아오기
	public static NoticeDetailsDto fromEntity(Notice notice) {
		return NoticeDetailsDto.builder().id(notice.getNPostId())
				.modifiedTime(notice.getNModifiedTime())
				.createdTime(notice.getNCreatedTime())
				.content(notice.getNContent())
				.title(notice.getNTitle()).build();
	}
	
	
	
}
