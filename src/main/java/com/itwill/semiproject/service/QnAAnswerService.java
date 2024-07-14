package com.itwill.semiproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.QnAAnswerDto;
import com.itwill.semiproject.repository.QnAAnswerDao;
import com.itwill.semiproject.repository.QnADao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnAAnswerService {
	
	private final QnAAnswerDao qnaanswerDao;
	private final QnADao qnaDao;
	
	public List<QnAAnswerDto> getAnswersByQnaPostId(int qnaPostId) {
        return qnaanswerDao.selectAnswersByQnaPostId(qnaPostId);
    }

    public int updateAnswer(QnAAnswerDto answer) {
        return qnaanswerDao.updateAnswer(answer);
    }

    public int deleteAnswer(int id) {
        int result = qnaanswerDao.deleteAnswer(id);
        if (result == 1) {
            QnAAnswerDto answer = qnaanswerDao.selectAnswerById(id);
            if (qnaanswerDao.selectAnswersByQnaPostId(answer.getQnaPostId()).isEmpty()) {
                qnaDao.updateQnaState(answer.getQnaPostId(), 0); // 답변 삭제 시 qna_state를 0으로 변경
            }
        }
        return result;
    }
    
    public int createAnswer(QnAAnswerDto answer) {
        int result = qnaanswerDao.insertAnswer(answer);
        if (result == 1) {
            qnaDao.updateQnaState(answer.getQnaPostId(), 1); // 답변 등록 시 qna_state를 1로 변경
        }
        return result;
    }

}
