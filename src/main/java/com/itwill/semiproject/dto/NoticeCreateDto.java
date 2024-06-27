package com.itwill.semiproject.dto;

import java.time.LocalDateTime;

import com.itwill.semiproject.repository.Notice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @Builder @AllArgsConstructor
public class NoticeCreateDto {
	private String title;
	private String content;
	
	//Notice에서 필요한 내용 뽑아오기
	public static NoticeCreateDto fromEntity(Notice notice) {
		return NoticeCreateDto.builder()
				.content(notice.getNTitle())
				.title(notice.getNTitle()).build();
	}
}
