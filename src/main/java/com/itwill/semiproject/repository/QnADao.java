package com.itwill.semiproject.repository;

import java.util.List;
import java.util.Map;

import com.itwill.semiproject.dto.QnASearchDto;

public interface QnADao {
	
	List<QnA> selectOrderByQnAPostIdDesc();
	
	QnA selectByQnAPostId(Integer qnaPostId);
	
	int insertQnA(QnA qna);
	
	int updateQnA(QnA qna);
	
	int deleteQnA(Integer qnaPostId);
		
    // 페이징 처리를 위한 메서드들 추가
    List<QnA> selectPagedQnAList(Pager pager);
        
    // 조회수
    int updateViewCount(Integer qnaPostId);
    
    long selectTotalCountAll(); // 전체 글 조회 
    
    List<QnA> searchQnA(Map<String, Object> params);
    
    long selectTotalCount(QnASearchDto dto);  // 검색 조건에 맞는 전체 글의 갯수 조회
    
}
