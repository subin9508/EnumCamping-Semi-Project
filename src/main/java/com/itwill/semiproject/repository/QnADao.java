package com.itwill.semiproject.repository;

import java.util.List;
import java.util.Map;

import com.itwill.semiproject.dto.QnASearchDto;

public interface QnADao {
	
	// QnA 게시글을 최신순으로 조회
	List<QnA> selectOrderByQnAPostIdDesc();
	
	// 특정 QnA 게시글 Id로 QnA 게시글 조회
	QnA selectByQnAPostId(Integer qnaPostId);
	
	// QnA 삽입
	int insertQnA(QnA qna);
	
	// QnA 업데이트
	int updateQnA(QnA qna);
	
	// QnA 삭제
	int deleteQnA(Integer qnaPostId);
		
    // 페이지 번호에 따라 QnA 목록 조회
    List<QnA> selectPagedQnAList(Pager pager);
        
    // 조회수 업데이트
    int updateViewCount(Integer qnaPostId);
    
    // 전체 게시글 개수 조회
    long selectTotalCountAll(); 
    
    // 검색 조건에 따라 QnA 게시글 조회
    List<QnA> searchQnA(Map<String, Object> params);
    
    // 검색 조건에 맞는 전체 글의 개수 조회 
    long selectTotalCount(QnASearchDto dto);  

    // 특정 QnA 게시글 ID로 QnA 게시글의 상태 업데이트
    int updateQnaState(Integer qnaPostId, Integer qnaState);
  
    // 특정 사용자 ID로 QnA 게시글 조회
    List<QnA> selectQnAByUserId(String userId);
}
