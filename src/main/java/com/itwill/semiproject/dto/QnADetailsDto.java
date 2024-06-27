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

		private Integer id;
		private String title;
		private String content;
		private String userId;
		private LocalDateTime createdTime;
		private LocalDateTime modifiedTime;
		
		public static QnADetailsDto fromEntity(QnA qna) {
			return QnADetailsDto.builder()
					.id(qna.getQPostId())
					.title(qna.getQTitle())
					.content(qna.getQContent())
					.userId(qna.getQUserId())
					.createdTime(qna.getQcCreatedTime())
					.modifiedTime(qna.getQcModifiedTime())
					.build();
		}
	}
