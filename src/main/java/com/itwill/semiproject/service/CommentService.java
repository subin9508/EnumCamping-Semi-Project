package com.itwill.semiproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.CommentCreateDto;
import com.itwill.semiproject.dto.CommentItemDto;
import com.itwill.semiproject.dto.CommentUpdateDto;
import com.itwill.semiproject.repository.Comment;
import com.itwill.semiproject.repository.CommentDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class CommentService {
	
	private final CommentDao commentDao; // 생성자에 의한 의존성 주입
	
	// 댓글 id로 댓글 1개 조회 
	public CommentItemDto readById(Integer qcComId) {
		log.debug("readById(qcComId={})", qcComId);
		
		//리포지토리 컴포넌트의 메소드를 호출해서 해당 아이디의 댓글 1개를 검색
		Comment comment = commentDao.selectById(qcComId);
		
		// comment타입을  CommentItemDto 타입으로 변환해서 리턴.
		return CommentItemDto.fromEntity(comment); 
	}
	
	// 포스트 id로 댓글 목록 조회
	public List<CommentItemDto> readByPostId(Integer qcPostId) {
		log.debug("readByPostId(qcPostId={}", qcPostId);

		// 리포지토리(영속성) 계층의 메소드를 호출해서 comments 테이블의 데이터를 검색.
		// 엘리먼트가 comment인 리스트 찾기 
		List<Comment> list = commentDao.selectByPostId(qcPostId);
		
		// List<Comment>를 List<CommentItemDto>로 변환해서 리턴.
//		List<CommentItemDto> result = new ArrayList<>();
//		for (Comment c : list) {
//			CommentItemDto dto = CommentItemDto.fromEntity(c);
//			result.add(dto);
//		}
//		return result;
//		
		// stream이 list에서 comment를 꺼낸다.
		// 리스트의 comment를 commentitemdto로 mapping. 매핑한 결과를 리스트에 추가 
		return list.stream().map(CommentItemDto::fromEntity).toList();
	}
	
	// 댓글 생성
	public int create(CommentCreateDto dto) {
		log.debug("create({})", dto);
		
		// 리포지토리 계층의 메서드를 호출해서 comments 테이블에 insert.
		int result = commentDao.insertQnAComment(dto.toEntity()); // Comment 타입을 dto로 줌
		
		return result; 
	}
	
	// 댓글 업데이트
	public int update(CommentUpdateDto dto) {
		log.debug("upate({})", dto);
		
		// 리포지토리 컴포넌트의 메서드를 호출해서 comments 테이블을 업데이트.
		int result = commentDao.updateQnAComment(dto.toEntity());
		
		return result; 
	}
	
	// 댓글 id로 댓글 삭제
	public int deleteById(Integer qcComId) {
		log.debug("deleteById(qcComId={})" ,qcComId);

		//리포지토리 컴포넌트의 메소드를 호출해서 comments 테이블에서 댓글 1개 삭제.
		int result = commentDao.deleteById(qcComId);
		
		return result; // 컨트롤러에게 리턴.
	}
	
	// 포스트 id로 댓글 삭제
	public int deleteByPostId(Integer qcPostId) {
		log.debug("deleteByPostId(qcPostId={})", qcPostId);
		
		int result = commentDao.deleteByPostId(qcPostId);
		
		return result;
	}
}