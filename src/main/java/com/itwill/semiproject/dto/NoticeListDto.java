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
	private String modifiedTime;
	
	//전체 목록 & 검색한 목록 표시할 때 사용
	
	//Notice에서 필요한 내용 뽑아오기
	public static NoticeListDto fromEntity(Notice notice) {
		return NoticeListDto.builder().id(notice.getNotPostId())
				.modifiedTime(notice.getNotModifiedTime())
				.title(notice.getNotTitle()).build();
	}
	
	
	
}
