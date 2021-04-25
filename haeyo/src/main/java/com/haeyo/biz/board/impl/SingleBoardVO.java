package com.haeyo.biz.board.impl;

import java.util.Date;

import com.haeyo.biz.board.BoardVO;

public class SingleBoardVO implements BoardVO {
	int sNo;           
	int uNo;               
	String sHeader;     
	String sTitle;    
	String sContent;   
	String sPic;       
	String sAddress;     
	float sLocX;             
	float  sLocY;           
	int sBookmark;          
	Date sCredate;     
	int sHits;
	   
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getsHeader() {
		return sHeader;
	}
	public void setsHeader(String sHeader) {
		this.sHeader = sHeader;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}
	public String getsPic() {
		return sPic;
	}
	public void setsPic(String sPic) {
		this.sPic = sPic;
	}
	public String getsAddress() {
		return sAddress;
	}
	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}
	public float getsLocX() {
		return sLocX;
	}
	public void setsLocX(float sLocX) {
		this.sLocX = sLocX;
	}
	public float getsLocY() {
		return sLocY;
	}
	public void setsLocY(float sLocY) {
		this.sLocY = sLocY;
	}
	public int getsBookmark() {
		return sBookmark;
	}
	public void setsBookmark(int sBookmark) {
		this.sBookmark = sBookmark;
	}
	public Date getsCredate() {
		return sCredate;
	}
	public void setsCredate(Date sCredate) {
		this.sCredate = sCredate;
	}
	public int getsHits() {
		return sHits;
	}
	public void setsHits(int sHits) {
		this.sHits = sHits;
	}  
	   
}
