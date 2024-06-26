package com.itwill.semiproject.repository;

import java.util.List;

import com.itwill.semiproject.dto.QnASearchDto;

public interface QnADao {
	
	List<QnA> selectOrderByQnAPostIdDesc();
	
	QnA selectByQnAPostId(Integer q_post_id);
	
	int insertQnA(QnA QnA);
	
	int updateQnA(QnA QnA);
	
	int deleteQnA(Integer q_post_id);
	
	List<QnA> search(QnASearchDto dto);
}
