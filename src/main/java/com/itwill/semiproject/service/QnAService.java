package com.itwill.semiproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.QnACreateDto;
import com.itwill.semiproject.dto.QnAListDto;
import com.itwill.semiproject.dto.QnASearchDto;
import com.itwill.semiproject.dto.QnAUpdateDto;
import com.itwill.semiproject.repository.QnA;
import com.itwill.semiproject.repository.QnADao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class QnAService {

	private final QnADao qnaDao;
	
	public List<QnAListDto> read() {
		log.debug("read()");
		
		List<QnA> list = qnaDao.selectOrderByQnAPostIdDesc();
			
		return list.stream().map(QnAListDto::fromEntity).toList(); 
	}
	
	public QnA read(Integer qnaPostId) {
		log.debug("read(qnaPostId{}", qnaPostId);
		
		return qnaDao.selectByQnAPostId(qnaPostId);
	}
	
	
	public int create(QnACreateDto dto) {
		log.debug("create({})", dto);
		
		int result = qnaDao.insertQnA(dto.toEntity());
		log.debug("insert 결과 = {}", result);
		
		return result;
	}
	
	public int delete(int qnaPostId) {
		log.debug("delete(qnaPostId={})", qnaPostId);

		int result = qnaDao.deleteQnA(qnaPostId);
		log.debug("delete 결과={}", result);
		
		return result;
	}
	
	public int update(QnAUpdateDto dto) {
		log.debug("update()", dto);
		
		int result = qnaDao.updateQnA(dto.toEntity());
		log.debug("update 결과 = {}", result);
		
		return result;
	}
	
	public List<QnAListDto> search(QnASearchDto dto) {
		log.debug("search({})",dto);
		
		List<QnA> list = qnaDao.searchQnA(dto);
		
		return list.stream().map(QnAListDto::fromEntity).toList();
	}
	
	
}
