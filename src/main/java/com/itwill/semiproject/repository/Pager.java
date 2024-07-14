package com.itwill.semiproject.repository;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class Pager {
	private Long page;	// 현재 게시판 페이지
	private Long perPage;	// 페이지당 글의 갯수
	private Long totalPage;	// 전체 페이지의 갯수
	private Long startRow;	// 현재 페이지의 시작 글번호
	private Long lastRow;	// 현재 페이지의 마지막 글번호
	private Long block;		// 현재 pagionation
	private Long perBlock;	// pagination당 page갯수
	private Long startNum;	// pagination의 시작 페이지번호
	private Long lastNum;	// pagination의 마지막 페이지번호
	private boolean pre;	// 이전페이지
	private boolean next;	// 다음페이지
	
	public Pager() {
		this.page=1L;
		this.perPage=10L;
		this.perBlock=10L;
	}
	
	public void setRow() {
    	//한페이지에 10개씩 출력 기준
		//page	startrow	lastrow
		//1		1			10
		//2		11			20
		//3		21			30
		this.startRow =  (this.getPage()-1)*this.getPerPage();
		this.lastRow = this.getPage()*this.getPerPage() -1;
	}
	
	public void setNum(Long totalCount) {
		this.totalPage = totalCount % this.getPerPage() == 0 ? totalCount / this.getPerPage() : totalCount / this.getPerPage() + 1;
		calculatePaging();
	}

	public void calculatePaging() {
		Long totalBlock = totalPage % this.getPerBlock() == 0 ? totalPage / this.getPerBlock() : totalPage / this.getPerBlock() + 1;
		Long curBlock = this.getPage() % this.getPerBlock() == 0 ? this.getPage() / this.getPerBlock() : this.getPage() / this.getPerBlock() + 1;
		
		this.startNum = (curBlock - 1) * this.getPerBlock() + 1;
		this.lastNum = curBlock * this.getPerBlock();
		
		if (curBlock == totalBlock) {
			this.lastNum = totalPage;
		}
		
		this.pre = this.page > 1;
		this.next = curBlock < totalBlock;
	}

	public Long getPerPage() {
		if(this.perPage==null) {
			this.perPage=10L;
		}
		return perPage;
	}
	
    // 페이지가 null이거나 음수이면 1로 초기화 (사용자가 임의로 페이지에 이상한 값을 입력해서 이동을 방지)
	public Long getPage() {
		if(this.page==null || this.page<=0) {
			this.page=1L;
		}
		return page;
	}
	
	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}
	
}