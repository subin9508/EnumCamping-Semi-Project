package com.itwill.semiproject.repository;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// DB 테이블의 comments의 모델(Model)
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Comment {
	private Integer qcComId; // Primary Key
	private Integer qcPostId; //Foreign key: posts 테이블의 id 컬럼을 참조.
	private String qcUserId; //댓글 작성자 아이디
	private String qcContent; // 댓글 내용
	private LocalDateTime qcCreatedTime; // 댓글 최초 작성 시간
	private LocalDateTime qcModifiedTime; // 댓글 최종 수정 시간
}