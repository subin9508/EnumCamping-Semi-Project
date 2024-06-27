package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.QnA;

import lombok.Data;

@Data
public class QnAUpdateDto {
	private int id;
	private String title;
	private String content;
	
	public QnA toEntity() {
		return QnA.builder().qPostId(id).qTitle(title).qContent(content).build();
	}
}
