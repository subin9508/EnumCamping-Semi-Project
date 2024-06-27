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
	private Integer qPostId;
	private String qTitle;
	private String qContent;
	private String qUserId;
	private LocalDateTime qCreatedTime;
	private LocalDateTime qModifiedTime;
	private Integer qState;
	private Integer qLock;
	private String qcText;
	private LocalDateTime qcCreatedTime;
	private LocalDateTime qcModifiedTime;
	
	
}
