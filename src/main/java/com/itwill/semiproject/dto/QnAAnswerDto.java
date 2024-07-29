package com.itwill.semiproject.dto;

import java.sql.Timestamp;

import com.itwill.semiproject.repository.QnAAnswer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QnAAnswerDto {
    private Integer id; // 답변 ID
    private Integer qnaPostId; // QnA 게시물 ID
    private String content; // 답변 내용
    private String userId; // 사용자 ID
    private Timestamp createdTime; // 생성 시간
    private Timestamp modifiedTime; // 수정 시간
    
 // QnAAnswer 엔티티를 QnAAnswerDto로 변환하는 메소드
    public static QnAAnswerDto fromEntity(QnAAnswer answer) {
    	// 빌더 패턴을 사용하여 QnAAnswerDto 객체 생성
        return QnAAnswerDto.builder()
                .id(answer.getId())
                .qnaPostId(answer.getQnaPostId())
                .content(answer.getContent())
                .userId(answer.getUserId())
                .createdTime(answer.getCreatedTime())
                .modifiedTime(answer.getModifiedTime())
                .build();
    }
}