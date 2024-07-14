package com.itwill.semiproject.repository;

import java.util.List;

import com.itwill.semiproject.dto.QnAAnswerDto;

public interface QnAAnswerDao {
    List<QnAAnswerDto> selectAnswersByQnaPostId(int qnaPostId);
    int insertAnswer(QnAAnswerDto answer);
    int updateAnswer(QnAAnswerDto answer);
    int deleteAnswer(int id);
    
    QnAAnswerDto selectAnswerById(int id);
}
