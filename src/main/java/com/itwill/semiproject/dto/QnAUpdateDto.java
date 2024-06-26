package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.QnA;

import lombok.Data;

@Data
public class QnAUpdateDto {
	private int q_post_id;
	private String q_title;
	private String q_content;
	
	public QnA toEntity() {
		return QnA.builder().q_post_id(q_post_id).q_title(q_title).q_content(q_content).build();
	}
}
