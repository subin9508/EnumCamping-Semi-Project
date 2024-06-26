package com.itwill.semiproject.dto;

import java.sql.Date;

import com.itwill.semiproject.repository.QnA;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class QnAListDto {
	private Integer q_post_id;
	private String q_title;
	private String q_user_id;
	private Date q_modified_time;
	
	public static QnAListDto fromEntity(QnA qna) {
		return QnAListDto.builder()
				.q_post_id(qna.getQ_post_id())
				.q_title(qna.getQ_title())
				.q_user_id(qna.getQ_user_id())
				.q_modified_time(qna.getQ_modified_time())
				.build();
	}
}
