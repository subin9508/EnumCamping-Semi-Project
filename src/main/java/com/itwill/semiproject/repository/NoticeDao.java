package com.itwill.semiproject.repository;

import java.util.List;

import com.itwill.semiproject.dto.NoticeSearchDto;

public interface NoticeDao {
	
	List<Notice> selectAllNotice();
	
	Notice selectNoticeById(int id);
	
	//int insertNotice(String title, String content);
	int insertNotice(Notice notice);
	
	int deleteNotice(int id);
	
	int updateNotice(Notice notice);
	
	
	List<Notice> search(NoticeSearchDto dto);
}
