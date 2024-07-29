package com.itwill.semiproject.repository;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QnAAnswer {
    private Integer id; // 번호
    private Integer qnaPostId; // QnA게시글 번호
    private String content; // 내용
    private String userId; // 작성자
    private Timestamp createdTime; // 생성시간
    private Timestamp modifiedTime; // 수정시간
    
}
