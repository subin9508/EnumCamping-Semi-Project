package com.itwill.semiproject.dto;

import java.time.LocalDateTime;

import com.itwill.semiproject.repository.Notice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @Builder
@NoArgsConstructor //이거추가함
public class NoticeUpdateDto {
	private int notPostId;
	private String notTitle;
	private String notContent;
	private LocalDateTime notModifiedTime;
	
	//Notice에 dto 내용 넣기
	 public Notice toEntity() {
		 return Notice.builder().notTitle(notTitle).notContent(notContent)
				 .notModifiedTime(notModifiedTime).notPostId(notPostId).build();
	 }
	
}
