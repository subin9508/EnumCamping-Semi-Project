package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.QnA;

import lombok.Data;

@Data
public class QnAUpdateDto {
	private int qnaPostId;
	private String qnaTitle;
	private String qnaContent;
	private Integer qnaLock = 0;
	
	public QnA toEntity() {
		return QnA.builder().qnaPostId(qnaPostId).qnaTitle(qnaTitle).qnaContent(qnaContent).qnaLock(qnaLock).build();
	}
}
