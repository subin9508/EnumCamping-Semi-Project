package com.itwill.semiproject.dto;

import java.time.LocalDateTime;

import com.itwill.semiproject.repository.QnA;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class QnADetailsDto {

		private Integer qnaPostId;
		private String qnaTitle;
		private String qnaContent;
		private String qnaUserId;
		private String qnaCreatedTime;
		private String qnaModifiedTime;
		
		public static QnADetailsDto fromEntity(QnA qna) {
			return QnADetailsDto.builder()
					.qnaPostId(qna.getQnaPostId())
					.qnaTitle(qna.getQnaTitle())
					.qnaContent(qna.getQnaContent())
					.qnaUserId(qna.getQnaUserId())
					.qnaCreatedTime(qna.getQnaCreatedTime())
					.qnaModifiedTime(qna.getQnaModifiedTime())
					.build();
		}
	}
