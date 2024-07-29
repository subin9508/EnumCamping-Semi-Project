package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.QnA;

import lombok.Data;

@Data
public class QnACreateDto {
    private String qnaTitle; // QnA 제목
    private String qnaContent; // QnA 내용
    private String qnaUserId; // QnA 작성자 ID
    private Integer qnaLock = 0; // QnA 잠금 상태 (기본값은 0, 잠금 해제)

    // QnACreateDto 객체를 QnA 엔티티로 변환하는 메소드
    public QnA toEntity() {
        // 빌더 패턴을 사용하여 QnA 객체 생성
		return QnA.builder().qnaTitle(qnaTitle).qnaContent(qnaContent).qnaUserId(qnaUserId).qnaLock(qnaLock).build();
	}
}
