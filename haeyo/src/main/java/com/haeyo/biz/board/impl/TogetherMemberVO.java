package com.haeyo.biz.board.impl;

public class TogetherMemberVO {
	int tNo;
	int gNo;
	
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	
	@Override
	public String toString() {
		return "TogetherMemberVO [tNo=" + tNo + ", gNo=" + gNo + "]";
	}
	
	
}
