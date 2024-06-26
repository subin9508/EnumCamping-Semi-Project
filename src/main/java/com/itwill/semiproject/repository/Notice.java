package com.itwill.semiproject.repository;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @Builder @AllArgsConstructor //@NoArgsConstructor
public class Notice {
	Integer postId;
	String title;
	String content;
	LocalDateTime createdTime;
	LocalDateTime modifiedTime;
	Integer certify;
}
