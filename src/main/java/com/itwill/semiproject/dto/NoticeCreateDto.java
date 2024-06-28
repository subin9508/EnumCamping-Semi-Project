package com.itwill.semiproject.dto;


import com.itwill.semiproject.repository.Notice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class NoticeCreateDto {
	private String notTitle;
	private String notContent;
	
	//Notice에 DTO 내용 넣기
	public Notice toEntity() {
		return Notice.builder()
				.notContent(notContent)
				.notTitle(notTitle).build();
	}
}
