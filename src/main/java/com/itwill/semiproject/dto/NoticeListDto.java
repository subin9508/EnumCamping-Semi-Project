package com.itwill.semiproject.dto;

import java.time.LocalDateTime;

import com.itwill.semiproject.repository.Notice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data  @Builder @AllArgsConstructor
//@NoArgsConstructor 없어도 될 것 같은데
public class NoticeListDto {

	private Integer id;
	private String title;
	private LocalDateTime modifiedTime;
	
	//Notice에서 필요한 내용 뽑아오기
	public static NoticeListDto fromEntity(Notice notice) {
		return NoticeListDto.builder().id(notice.getPostId())
				.modifiedTime(notice.getModifiedTime())
				.title(notice.getTitle()).build();
	}
	
	
	
}
