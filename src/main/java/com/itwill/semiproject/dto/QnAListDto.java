package com.itwill.semiproject.dto;

import java.time.LocalDateTime;

import com.itwill.semiproject.repository.QnA;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class QnAListDto {
	private Integer qnaPostId;
	private String qnaTitle;
	private String qnaUserId;
	private LocalDateTime qnaModifiedTime;
	
	public static QnAListDto fromEntity(QnA qna) {
		return QnAListDto.builder()
				.qnaPostId(qna.getQnaPostId())
				.qnaTitle(qna.getQnaTitle())
				.qnaUserId(qna.getQnaUserId())
				.qnaModifiedTime(qna.getQnaModifiedTime())
				.build();
	}
}
