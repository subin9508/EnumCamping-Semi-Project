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
    private Integer qnaPostId; // QnA 게시물 ID
    private String qnaTitle; // QnA 제목
    private String qnaUserId; // QnA 작성자 ID
    private String qnaModifiedTime; // QnA 수정 시간
    private Integer qnaViewCnt; // QnA 조회 수
    private Integer qnaState; // QnA 상태
    private Integer qnaLock; // QnA 잠금 상태

    // QnA 엔티티를 QnAListDto로 변환하는 메소드
    public static QnAListDto fromEntity(QnA qna) {
        // 빌더 패턴을 사용하여 QnAListDto 객체 생성
		return QnAListDto.builder()
				.qnaPostId(qna.getQnaPostId())
				.qnaTitle(qna.getQnaTitle())
				.qnaUserId(qna.getQnaUserId())
				.qnaModifiedTime(qna.getQnaModifiedTime())
				.qnaViewCnt(qna.getQnaViewCnt())
				.qnaState(qna.getQnaState())
				.qnaLock(qna.getQnaLock())
				.build();
	}
}
