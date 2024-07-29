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
	
	// QnA 게시글 목록을 최신순으로 조회
	public List<QnAListDto> read() {
		log.debug("read()");
		
		List<QnA> list = qnaDao.selectOrderByQnAPostIdDesc();
		
		// QnA 엔터티 리스트를 QnAListDto 리스트로 변환하여 리턴
		return list.stream().map(QnAListDto::fromEntity).toList(); 
	}
	
	// 특정 QnA 게시글 ID로 QnA 게시글 조회
	public QnA read(Integer qnaPostId) {
		log.debug("read(qnaPostId{}", qnaPostId);
		
		return qnaDao.selectByQnAPostId(qnaPostId);
	}
	
	// 새로운 QnA 게시글 생성
	public int create(QnACreateDto dto) {
		log.debug("create({})", dto);
		
		int result = qnaDao.insertQnA(dto.toEntity());
		log.debug("insert 결과 = {}", result);
		
		return result;
	}
	
	// 특정 QnA 게시글 ID로 QnA 게시글 삭제
	public int delete(int qnaPostId) {
		log.debug("delete(qnaPostId={})", qnaPostId);

		int result = qnaDao.deleteQnA(qnaPostId);
		log.debug("delete 결과={}", result);
		
		return result;
	}
	
	// QnA 게시글 업데이트
	public void update(QnAUpdateDto dto) {
	    if (dto.getQnaLock() == null) {
	        dto.setQnaLock(0); // 기본값 설정
	    }
	    qnaDao.updateQnA(dto.toEntity());
	}
	
	// 검색 조건과 페이징 벙보를 사용해서 QnA 게시글 목록 조회
	public List<QnAListDto> search(QnASearchDto dto, Pager pager) {
	    log.debug("search({}, {})", dto, pager);
	    
	    pager.setRow();
	    // 검색 조건에 맞는 전체 글의 개수 가져와서 Pager 객체 생성
	    long totalCount = qnaDao.selectTotalCount(dto);
	    pager.setNum(totalCount);
	    
	    // 검색 조건과 페이징 정보를 Map으로 전달
	    Map<String, Object> params = new HashMap<>();
	    params.put("dto", dto != null ? dto : new QnASearchDto());
	    params.put("pager", pager);
	    
	    // 검색 조건과 페이징에 맞는 QnA 게시글 목록으로 가져옴
	    List<QnA> list = qnaDao.searchQnA(params);
	    
	    // QnA 엔터티 리스트를 QnAListDto 리스트로 변환하여 리턴
	    return list.stream().map(QnAListDto::fromEntity).toList();
	}
    
    // 페이징 처리된 QnA 게시글 목록으로 조회
    public List<QnAListDto> selectPagedQnAList(Pager pager) {
        log.debug("selectPagedQnAList({})", pager);
        
        // 전체 QnA 게시글의 개수를 가져와서 Pager 객체 설정
        long totalCount = qnaDao.selectTotalCountAll();
        pager.setNum(totalCount);
        pager.setRow();
        
        // 페이징 처리된 QnA 게시글 목록 가져옴
        List<QnA> list = qnaDao.selectPagedQnAList(pager);
        
        // QnA 엔터티 리스트를 QnAListDto 리스트로 변환해서 리턴
        return list.stream().map(QnAListDto::fromEntity).toList();
    }
    
    // 특정 사용자 ID로 작성된 QnA 게시글 목록 조회
    public List<QnA> selectByUserId(String userId) {
    	List<QnA> list = qnaDao.selectQnAByUserId(userId);
    	return list;
    }
    
    // 검색 조건에 맞는 전체 QnA 게시글의 개수 조회
    public long getTotalCount(QnASearchDto dto) {
        return qnaDao.selectTotalCount(dto);
    }
	
}
