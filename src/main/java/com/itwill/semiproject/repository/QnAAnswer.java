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
    private Integer id;
    private Integer qnaPostId;
    private String content;
    private String userId;
    private Timestamp createdTime;
    private Timestamp modifiedTime;
    
}
