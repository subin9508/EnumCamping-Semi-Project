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
	
	//Notice에서 필요한 내용 뽑아오기
	public Notice toEntity() {
		return Notice.builder()
				.notContent(notContent)
				.notTitle(notTitle).build();
	}
}
