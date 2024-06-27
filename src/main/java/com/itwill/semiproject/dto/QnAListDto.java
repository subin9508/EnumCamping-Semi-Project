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
	private Integer id;
	private String title;
	private String userId;
	private LocalDateTime modifiedTime;
	
	public static QnAListDto fromEntity(QnA qna) {
		return QnAListDto.builder()
				.id(qna.getQPostId())
				.title(qna.getQTitle())
				.userId(qna.getQUserId())
				.modifiedTime(qna.getQcModifiedTime())
				.build();
	}
}
