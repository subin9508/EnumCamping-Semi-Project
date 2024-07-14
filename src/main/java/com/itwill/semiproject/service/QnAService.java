package com.itwill.semiproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.QnACreateDto;
import com.itwill.semiproject.dto.QnAListDto;
import com.itwill.semiproject.dto.QnASearchDto;
import com.itwill.semiproject.dto.QnAUpdateDto;
import com.itwill.semiproject.repository.Pager;
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
	
//	public List<QnAListDto> search(QnASearchDto dto) {
//		log.debug("search({})",dto);
//		
//		List<QnA> list = qnaDao.searchQnA(dto);
//		
//		return list.stream().map(QnAListDto::fromEntity).toList();
//	}
//	
//	public List<QnAListDto> selectPagedQnAList(Pager pager) {
//        log.debug("selectPagedQnAList({})", pager);
//
//        // 전체 글의 갯수를 가져와 Pager 객체 설정
//        long totalCount = qnaDao.selectTotalCount();
//        pager.setNum(totalCount);
//        pager.setRow();
//
//        // 페이징 처리된 글 목록을 가져옴
//        List<QnA> list = qnaDao.selectPagedQnAList(pager);
//
//        return list.stream().map(QnAListDto::fromEntity).toList();
//    }
	
	
	public List<QnAListDto> search(QnASearchDto dto, Pager pager) {
	    log.debug("search({}, {})", dto, pager);
	    
	    pager.setRow();
	    long totalCount = qnaDao.selectTotalCount(dto);
	    pager.setNum(totalCount);
	    
	    Map<String, Object> params = new HashMap<>();
	    params.put("dto", dto != null ? dto : new QnASearchDto());
	    params.put("pager", pager);
	    
	    List<QnA> list = qnaDao.searchQnA(params);
	    
	    return list.stream().map(QnAListDto::fromEntity).toList();
	}
    
    
    public List<QnAListDto> selectPagedQnAList(Pager pager) {
        log.debug("selectPagedQnAList({})", pager);

        long totalCount = qnaDao.selectTotalCountAll();
        pager.setNum(totalCount);
        pager.setRow();

        List<QnA> list = qnaDao.selectPagedQnAList(pager);

        return list.stream().map(QnAListDto::fromEntity).toList();
    }
    
    public long getTotalCount(QnASearchDto dto) {
        return qnaDao.selectTotalCount(dto);
    }
	
}
