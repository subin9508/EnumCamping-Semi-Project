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
	
	public QnA read(Integer id) {
		log.debug("read(id{}", id);
		
		return qnaDao.selectByQnAPostId(id);
	}
	
	
	public int create(QnACreateDto dto) {
		log.debug("create({})", dto);
		
		int result = qnaDao.insertQnA(dto.toEntity());
		log.debug("insert 결과 = {}", result);
		
		return result;
	}
	
	public int delete(int id) {
		log.debug("delete(q_post_id={})", id);

		int result = qnaDao.deleteQnA(id);
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
		log.debug("search()");
		
		List<QnA> list = qnaDao.search(dto);
		
		return list.stream().map(QnAListDto::fromEntity).toList();
	}
	
	
}
