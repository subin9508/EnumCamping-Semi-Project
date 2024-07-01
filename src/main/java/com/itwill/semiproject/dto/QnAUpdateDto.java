package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.QnA;

import lombok.Data;

@Data
public class QnAUpdateDto {
	private int qnaPostId;
	private String qnaTitle;
	private String qnaContent;
	
	public QnA toEntity() {
		return QnA.builder().qnaPostId(qnaPostId).qnaTitle(qnaTitle).qnaContent(qnaContent).build();
	}
}
