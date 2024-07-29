package com.itwill.semiproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.QnAAnswerDto;
import com.itwill.semiproject.repository.QnAAnswer;
import com.itwill.semiproject.repository.QnAAnswerDao;
import com.itwill.semiproject.repository.QnADao;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
public class QnAAnswerService {
	
	private final QnAAnswerDao qnaanswerDao;
	private final QnADao qnaDao;
	
	// 특정 QnA 게시글 ID에 대한 답변 목록 조회
	public List<QnAAnswerDto> getAnswersByQnaPostId(int qnaPostId) {
        return qnaanswerDao.selectAnswersByQnaPostId(qnaPostId);
    }
	
	// 답변 업데이트	   
    public int updateAnswer(QnAAnswerDto answer) {
        return qnaanswerDao.updateAnswer(answer);
    }
    
    // 답변 삭제
    public int deleteAnswer(int id) {
    	// 삭제할 답변 조회
        QnAAnswerDto answer = qnaanswerDao.selectAnswerById(id);
        // 답변이 존재하지 않으면 예외 발생
        if (answer == null) {
            throw new IllegalArgumentException("Answer with id " + id + " does not exist.");
        }
        // 답변 삭제
        int result = qnaanswerDao.deleteAnswer(id);
        // 삭제 성공적인 경우
        if (result == 1) {
        	// 해당 QnA 게시글의 남아있는 답변 조회
            List<QnAAnswerDto> remainingAnswers = qnaanswerDao.selectAnswersByQnaPostId(answer.getQnaPostId());
            // 남아있는 답변이 없으면
            if (remainingAnswers.isEmpty()) {
            	// QnA 게시글 상태 '답변대기'로 변경
                qnaDao.updateQnaState(answer.getQnaPostId(), 0); // 답변이 모두 삭제되면 qna_state를 0으로 변경
            }
        }
        return result;
    }
    
    // 새로운 답변 생성
    public int createAnswer(QnAAnswerDto answer) {
    	// 답변 삽입
        int result = qnaanswerDao.insertAnswer(answer);
        // 삽입 성공적이면
        if (result == 1) {
        	// 해당 QnA 게시글 상태 '답변완료'로 수정
            qnaDao.updateQnaState(answer.getQnaPostId(), 1); // 답변 등록 시 qna_state를 1로 변경
        }
        return result;
    }

}
