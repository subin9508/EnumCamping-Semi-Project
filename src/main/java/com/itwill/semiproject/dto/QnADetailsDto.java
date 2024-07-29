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

    private Integer qnaPostId; // QnA 게시물 ID
    private String qnaTitle; // QnA 제목
    private String qnaContent; // QnA 내용
    private String qnaUserId; // QnA 작성자 ID
    private String qnaCreatedTime; // QnA 생성 시간
    private String qnaModifiedTime; // QnA 수정 시간

    // QnA 엔티티를 QnADetailsDto로 변환하는 메소드
    public static QnADetailsDto fromEntity(QnA qna) {
        // 빌더 패턴을 사용하여 QnADetailsDto 객체 생성
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
