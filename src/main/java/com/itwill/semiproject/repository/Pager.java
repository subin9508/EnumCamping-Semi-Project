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
	private Long block;		// 현재 pagionation 블록
	private Long perBlock;	// pagination당 page갯수
	private Long startNum;	// pagination의 시작 페이지번호
	private Long lastNum;	// pagination의 마지막 페이지번호
	private boolean pre;	// 이전페이지
	private boolean next;	// 다음페이지
	
	// 기본 생성자: 기본값 설정
	public Pager() {
        this.page = 1L; // 기본 페이지 번호 1로 설정
        this.perPage = 10L; // 기본 페이지당 글의 갯수 10으로 설정
        this.perBlock = 10L; // 기본 pagination 블록당 페이지 갯수 10으로 설정
	}
	
	// 페이지에 따른 시작 글번호와 마지막 글번호를 설정하는 메소드
	public void setRow() {
    	//한페이지에 10개씩 출력 기준
		//page	startrow	lastrow
		//1		1			10
		//2		11			20
		//3		21			30
		this.startRow =  (this.getPage()-1)*this.getPerPage(); // 시작 글번호 계산
		this.lastRow = this.getPage()*this.getPerPage() -1; // 마지막 글번호 계산
	}
	
	// 전체 게시글 수를 받아 총 페이지 수 및 페이지 번호를 계산하는 메소드
	public void setNum(Long totalCount) {
		// 전체 페이지 수 계산
		this.totalPage = totalCount % this.getPerPage() == 0 ? totalCount / this.getPerPage() : totalCount / this.getPerPage() + 1;
		calculatePaging(); // 페이징 계산
	}
	
	// 페이지네이션을 계산하는 메서드
	public void calculatePaging() {
		// 전체 블록 수 계산
		Long totalBlock = totalPage % this.getPerBlock() == 0 ? totalPage / this.getPerBlock() : totalPage / this.getPerBlock() + 1;
		// 현재 블록 계산
		Long curBlock = this.getPage() % this.getPerBlock() == 0 ? this.getPage() / this.getPerBlock() : this.getPage() / this.getPerBlock() + 1;
		
		this.startNum = (curBlock - 1) * this.getPerBlock() + 1; // 시작 페이지 번호 계산
		this.lastNum = curBlock * this.getPerBlock(); // 마지막 페이지 번호 계산
		
		if (curBlock == totalBlock) { // 마지막 블록인 경우
			this.lastNum = totalPage; // 마지막 페이지 번호를 전체 페이지 수로 설정
		}
		
		this.pre = this.page > 1; // 이전 페이지 존재 여부
		this.next = curBlock < totalBlock; // 다음 페이지 존재 여부
	}
	
	// 페이지당 글의 갯수를 반환하는 메서드
	public Long getPerPage() { 
		if(this.perPage==null) { // perPage가 null 인경우
			this.perPage=10L; // 기본값 10으로 설정
		}
		return perPage;
	}
	
	// 현재 페이지를 반환하는 메서드
    // 페이지가 null이거나 음수이면 1로 초기화 (사용자가 임의로 페이지에 이상한 값을 입력해서 이동을 방지)
	public Long getPage() {
		if(this.page==null || this.page<=0) { // page가 null이거나 0 이하인 경우
			this.page=1L; // 기본값 1로 설정
		}
		return page;
	}
	
	// 전체 페이지 수를 설정하는 메서드
	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}
	
}