package com.itwill.semiproject.repository;

import java.sql.Date;

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
	private Integer q_post_id;
	private String q_title;
	private String q_content;
	private String q_user_id;
	private Date q_created_time;
	private Date q_modified_time;
	private Integer q_state;
	private Integer q_lock;
	private String qc_text;
	private Date qc_created_time;
	private Date qc_modified_time;
}
