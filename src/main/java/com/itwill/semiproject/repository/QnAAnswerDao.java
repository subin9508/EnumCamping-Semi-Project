package com.itwill.semiproject.repository;

import java.util.List;

import com.itwill.semiproject.dto.QnAAnswerDto;

public interface QnAAnswerDao {
	
	// 특정 QnA 게시글 ID에 해당하는 답변 목록을 조회
    List<QnAAnswerDto> selectAnswersByQnaPostId(int qnaPostId);
    
    // 특정 ID에 해당하는 답변을 조회
    QnAAnswerDto selectAnswerById(int id);
    
    // 답변 삽입
    int insertAnswer(QnAAnswerDto answer);
    
    // 답변 업데이트
    int updateAnswer(QnAAnswerDto answer);
    
    // 특정ID에 해당하는 답변 삭제
    int deleteAnswer(int id);
    
    
}
