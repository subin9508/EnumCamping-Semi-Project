package com.itwill.semiproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.semiproject.dto.NoticeListDto;
import com.itwill.semiproject.repository.Notice;
import com.itwill.semiproject.repository.NoticeDao;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Service
@AllArgsConstructor
@Slf4j
public class NoticeService {
	
	private NoticeDao dao;
	
	public List<NoticeListDto> selectAll(){
		List<Notice> list = dao.selectAll();
		log.debug("list={}",list);
		return list.stream().map(NoticeListDto::fromEntity).toList();
	}

}
