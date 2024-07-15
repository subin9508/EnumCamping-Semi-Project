package com.itwill.semiproject.dto;

import com.itwill.semiproject.repository.Comment;

import lombok.Data;

//댓글을 등록할 때 요청 파라미터로 전달되는 값들을 저장하기 위한 DTO.
@Data
public class CommentCreateDto {
	private Integer qcPostId;
	private String qcContent;
	private String qcUserId;
	
	// CommentCreateDto 타입을 Comment 타입으로 변환해서 리턴.
	public Comment toEntity() {
		return Comment.builder().qcPostId(qcPostId).qcContent(qcContent).qcUserId(qcUserId).build();
	}
}