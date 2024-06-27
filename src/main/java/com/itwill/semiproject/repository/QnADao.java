package com.itwill.semiproject.repository;

import java.util.List;

import com.itwill.semiproject.dto.QnASearchDto;

public interface QnADao {
	
	List<QnA> selectOrderByQnAPostIdDesc();
	
	QnA selectByQnAPostId(Integer qnaPostId);
	
	int insertQnA(QnA qna);
	
	int updateQnA(QnA qna);
	
	int deleteQnA(Integer qnaPostId);
	
	List<QnA> searchQnA(QnASearchDto dto);
}
