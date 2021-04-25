package com.haeyo.biz.board.impl;

public class PagingVO {
	// 현재페이지, 게시글 총 갯수 => 입력 받는 값
	private int nowPage, total; 
	// (현재 페이징바 안에서의) 시작페이지, 끝 페이지, 마지막페이지, (현재 페이지 안에서의) 시작글번호, 마지막 글번호=>계산으로 얻어는 값들
	private int startPage, endPage, lastPage, startNo, endNo;
	private int cntPage = 5; //(페이징바 안에서) 한번에 보여줄  페이지수
	private int cntPerPage = 6; //페이지당 글 갯수
	
	public PagingVO() {
		
	}
	public PagingVO(int nowPage, int total) {
		this.nowPage = nowPage;
		this.total = total;
		
		calcLastPage();
		calcStartEndPage();
		calcStartEnd();
	}
	
	// 전체의 마지막 페이지 계산
	public void calcLastPage() {
		lastPage = (int) Math.ceil((double)total / (double)cntPerPage);
	}
	
	// (현재 페이징바 안에서의) 시작,끝 페이지 계산
	public void calcStartEndPage() {
		endPage = ((int)Math.ceil((double) nowPage / (double) cntPage)) * cntPage;
		
		if (lastPage < endPage) { // 현재 페이징바안의 끝 페이지가 전체 마지막페이지보다 작으면
			endPage = lastPage; //전체의 마지막 페이지를 현재 페이징바안의 끝 페이지로 설정한다.
		}
		startPage = endPage - cntPage + 1; //시작페이지는 끝 페이지에서 보여줄 페이지수를 뺀것보다 1이 큰 페이지
		if (startPage < 1) {
			startPage = 1;
		}
	}
	
	// 현재 페이지에서의  시작 글번호, 마지막 글번호 계산
	public void calcStartEnd() {
		endNo = nowPage * cntPerPage;
		startNo = endNo - cntPerPage;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	
	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", startNo=" + startNo + ", endNo=" + endNo
				+ ", cntPage=" + cntPage + "]";
	}
	
	
	
}
