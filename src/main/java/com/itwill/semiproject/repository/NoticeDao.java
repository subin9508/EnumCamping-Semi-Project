package com.itwill.semiproject.repository;

import java.util.List;

public interface NoticeDao {
	
	List<Notice> selectAll();
	
	Notice selectById(int id);
	
	//int insertNotice(String title, String content);
	int insertNotice(Notice notice);
	
	int deleteNotice(Notice notice);

}
