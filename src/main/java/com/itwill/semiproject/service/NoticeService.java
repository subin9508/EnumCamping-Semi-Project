package com.itwill.semiproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.NoticeCreateDto;
import com.itwill.semiproject.dto.NoticeDetailsDto;
import com.itwill.semiproject.dto.NoticeListDto;
import com.itwill.semiproject.dto.NoticeUpdateDto;
import com.itwill.semiproject.repository.Notice;
import com.itwill.semiproject.repository.NoticeDao;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Service
@AllArgsConstructor
@Slf4j
public class NoticeService {
	
	private NoticeDao dao;
	
	public List<NoticeListDto> selectAllNotice(){
		List<Notice> list = dao.selectAllNotice();
		log.debug("list={}",list);
		return list.stream().map(NoticeListDto::fromEntity).toList();
	}
	
	public Notice selectNoticeById(int id){
		log.debug("selectNoticeById");
		Notice notice = dao.selectNoticeById(id);
		log.debug("notice={}",notice);
		return notice;
	}
	
	public int insertNotice(NoticeCreateDto dto) {
		log.debug("insertNotice");
		int result = dao.insertNotice(dto.toEntity());
		
		return result;
	};
	
	public int deleteNotice(int id) {
		log.debug("deleteNotice, id={}",id);
		int result = dao.deleteNotice(id);
		return result;
	}
	
	public int updateNotice(NoticeUpdateDto dto) {
		log.debug("updateNotice, {}",dto);
		int result = dao.updateNotice(dto.toEntity());
		return result;
	}

}
