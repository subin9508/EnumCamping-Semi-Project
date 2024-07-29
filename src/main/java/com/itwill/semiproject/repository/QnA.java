package com.itwill.semiproject.repository;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor @Builder
public class QnA {
    private Integer qnaPostId; // QnA 게시글 ID
    private String qnaTitle; // QnA 제목
    private String qnaContent; // QnA 내용
    private String qnaUserId; // QnA 작성자 ID
    private String qnaCreatedTime; // QnA 생성 시간
    private String qnaModifiedTime; // QnA 수정 시간
    private Integer qnaViewCnt; // QnA 조회 수
    private Integer qnaState; // QnA 상태 (답변대기, 답변완료)
    private Integer qnaLock; // QnA 잠금 상태

	
}
