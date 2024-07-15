package com.itwill.semiproject.dto;


import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.itwill.semiproject.repository.Comment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class CommentItemDto {
		private Integer qcComId; 
		private String qcContent; // 댓글 내용
		private String qcUserId; //댓글 작성자 아이디
		private Timestamp qcModifiedTime; // 댓글 최종 수정 시간
	
	// Comment 타입의 객체를 CommentItemDto 타입 객체로 변환해서 리턴하는 메서드.
	// 서비스의 리턴타입을 Dto 로 사용 
    public static CommentItemDto fromEntity(Comment comment) {
        return CommentItemDto.builder()
                .qcComId(comment.getQcComId())
                .qcContent(comment.getQcContent())
                .qcUserId(comment.getQcUserId())
                .qcModifiedTime(Timestamp.valueOf(comment.getQcModifiedTime()))
                .build();
    }
}