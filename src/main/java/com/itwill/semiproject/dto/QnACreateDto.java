package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.QnA;

import lombok.Data;

@Data
public class QnACreateDto {
	private String title;
	private String content;
	private String userId;
	
	public QnA toEntity() {
		return QnA.builder().qTitle(title).qContent(content).qUserId(userId).build();
	}
}
