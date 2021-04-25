package com.haeyo.biz.board.impl;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.haeyo.biz.user.UserVO;

public class TogetherReplyVO {
	int trNo;
	int uNo;
	int tNo;
	String trContent;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-mm-dd hh:mm:ss")
	Timestamp trCredate;
	UserVO userVO;
	
	public int getTrNo() {
		return trNo;
	}
	public void setTrNo(int trNo) {
		this.trNo = trNo;
	}
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
	public String getTrContent() {
		return trContent;
	}
	public void setTrContent(String trContent) {
		this.trContent = trContent;
	}
	public String getTrCredate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String trCredate = sdf.format(this.trCredate);
		return trCredate;
	}
	public void setTrCredate(Timestamp trCredate) {
		this.trCredate = trCredate;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	
	@Override
	public String toString() {
		return "TogetherReplyVO [trNo=" + trNo + ", uNo=" + uNo + ", tNo=" + tNo + ", trContent=" + trContent
				+ ", trCredate=" + trCredate + ", userVO=" + userVO + "]";
	}
	
}
