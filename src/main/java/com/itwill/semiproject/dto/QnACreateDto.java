package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.QnA;

import lombok.Data;

@Data
public class QnACreateDto {
	private String qnaTitle;
	private String qnaContent;
	private String qnaUserId;
	private boolean qnaLock;
	
	public QnA toEntity() {
		return QnA.builder().qnaTitle(qnaTitle).qnaContent(qnaContent).qnaUserId(qnaUserId).qnaLock(qnaLock).build();
	}
}
