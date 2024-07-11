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
	private Integer qnaPostId;
	private String qnaTitle;
	private String qnaContent;
	private String qnaUserId;
	private LocalDateTime qnaCreatedTime;
	private LocalDateTime qnaModifiedTime;
	private Integer qnaViewCnt;
	private Integer qnaState;
	private boolean qnaLock;
	private String qcText;
	private LocalDateTime qcCreatedTime;
	private LocalDateTime qcModifiedTime;
	
	
}
