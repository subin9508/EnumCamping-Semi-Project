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
	
    // 페이징 처리를 위한 메서드들 추가
    List<QnA> selectPagedQnAList(Pager pager);
    
    long selectTotalCount();
    
    // 조회수
    int updateViewCount(Integer qnaPostId);
	
}
