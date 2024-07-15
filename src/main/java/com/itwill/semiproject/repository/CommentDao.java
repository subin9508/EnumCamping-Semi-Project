package com.itwill.semiproject.repository;

import java.util.List;

// mapper xml 파일과 연결.
public interface CommentDao {
	
	// 포스트에 달려 있는 모든 댓글을 검색하는 기능
	// 리턴타입: List (댓글이 여러개 라서)
	// postId를 넘겨서 id에 해당하는 모든 post 보기
	List<Comment> selectByPostId(Integer qcPostId);
	
	// 포스트에 새로운 댓글 추가
	// 세개의 객체를 가지고있는 comment
	int insertQnAComment(Comment comment);
	
	// 댓글 내용, 수정 시간을 업데이트 
	int updateQnAComment(Comment comment);
	
	// 댓글 아이디로 삭제
	int deleteById(Integer qcComId);
	
	// 특정 포스트에 달려있는 모든 댓글 삭제.
	int deleteByPostId(Integer qcPostId);
	
	// 포스트에 달려 있는 댓글 개수를 검색.
	int selectCommentCount(Integer qcPostId);
	
	// 댓글 아이디(PK)로 검색
	Comment selectById(Integer qcComId);
	
}