package com.itwill.semiproject.repository;

import java.util.List;

import com.itwill.semiproject.dto.QnASearchDto;

public interface QnADao {
	
	List<QnA> selectOrderByQnAPostIdDesc();
	
	QnA selectByQnAPostId(Integer id);
	
	int insertQnA(QnA qna);
	
	int updateQnA(QnA qna);
	
	int deleteQnA(Integer id);
	
	List<QnA> search(QnASearchDto dto);
}
