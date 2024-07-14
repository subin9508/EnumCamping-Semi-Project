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
    private Integer id;
    private Integer qnaPostId;
    private String content;
    private String userId;
    private Timestamp createdTime;
    private Timestamp modifiedTime;

    public static QnAAnswerDto fromEntity(QnAAnswer answer) {
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