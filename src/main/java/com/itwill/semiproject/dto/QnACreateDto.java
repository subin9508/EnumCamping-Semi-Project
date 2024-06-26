package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.QnA;

import lombok.Data;

@Data
public class QnACreateDto {
	private String q_title;
	private String q_content;
	private String q_user_id;
	
	public QnA toEntity() {
		return QnA.builder().q_title(q_title).q_content(q_content).q_user_id(q_user_id).build();
	}
}
