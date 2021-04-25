package com.haeyo.biz.board.impl;

public class TogetherBookmarkVO {
	int uNo;
	int tNo;
	
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	@Override
	public String toString() {
		return "TogetherBookmarkVO [uNo=" + uNo + ", tNo=" + tNo + "]";
	}

	
}
