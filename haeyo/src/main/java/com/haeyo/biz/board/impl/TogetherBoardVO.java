package com.haeyo.biz.board.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.haeyo.biz.board.BoardVO;
import com.haeyo.biz.user.UserVO;

public class TogetherBoardVO implements BoardVO{
	
	private int tNo;
	private int hNo;
	private String tHeader;
	private String tTitle;
	private String tContent;
	private String tPic1;
	private String tPic2;
	private String tAddress;
	private float tLocX;
	private float tLocY;
	private float dLocX;
	private float dLocY;
	private Date tCredate;
	private String tJoinDate;
	private int tJoinMax;
	private int tJoinNow;
	private int tHits;
	
	//파일업로드
	private MultipartFile uploadFile1;
	private MultipartFile uploadFile2;
	//유저정보
	private UserVO userVO;
	//댓글 리스트
	private List<TogetherReplyVO> tReplyList;
	//북마크 정보
	private TogetherBookmarkVO tBookmarkVO;
	//모임정보
	private TogetherMemberVO tMemberVO;
	//목적지 정보
	private TogetherDestinationVO tDestinationVO;
	
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public String gettHeader() {
		return tHeader;
	}
	public void settHeader(String tHeader) {
		this.tHeader = tHeader;
	}
	public String gettTitle() {
		return tTitle;
	}
	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}
	public String gettContent() {
		return tContent;
	}
	public void settContent(String tContent) {
		this.tContent = tContent;
	}
	public String gettPic1() {
		return tPic1;
	}
	public void settPic1(String tPic1) {
		this.tPic1 = tPic1;
	}
	public String gettPic2() {
		return tPic2;
	}
	public void settPic2(String tPic2) {
		this.tPic2 = tPic2;
	}
	public String gettAddress() {
		return tAddress;
	}
	public void settAddress(String tAddress) {
		this.tAddress = tAddress;
	}
	public float gettLocX() {
		return tLocX;
	}
	public void settLocX(float tLocX) {
		this.tLocX = tLocX;
	}
	public float gettLocY() {
		return tLocY;
	}
	public void settLocY(float tLocY) {
		this.tLocY = tLocY;
	}
	public float getdLocX() {
		return dLocX;
	}
	public void setdLocX(float dLocX) {
		this.dLocX = dLocX;
	}
	public float getdLocY() {
		return dLocY;
	}
	public void setdLocY(float dLocY) {
		this.dLocY = dLocY;
	}
	public Date gettCredate() {
		return tCredate;
	}
	public void settCredate(Date tCredate) {
		this.tCredate = tCredate;
	}
	public String gettJoinDate() {
		return tJoinDate;
	}
	public void settJoinDate(String tJoinDate) {
		this.tJoinDate = tJoinDate;
	}
	public int gettJoinMax() {
		return tJoinMax;
	}
	public void settJoinMax(int tJoinMax) {
		this.tJoinMax = tJoinMax;
	}
	public int gettJoinNow() {
		return tJoinNow;
	}
	public void settJoinNow(int tJoinNow) {
		this.tJoinNow = tJoinNow;
	}
	public int gettHits() {
		return tHits;
	}
	public void settHits(int tHits) {
		this.tHits = tHits;
	}
	public MultipartFile getUploadFile1() {
		return uploadFile1;
	}
	public void setUploadFile1(MultipartFile uploadFile1) {
		this.uploadFile1 = uploadFile1;
	}
	public MultipartFile getUploadFile2() {
		return uploadFile2;
	}
	public void setUploadFile2(MultipartFile uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public List<TogetherReplyVO> gettReplyList() {
		return tReplyList;
	}
	public void settReplyList(List<TogetherReplyVO> tReplyList) {
		this.tReplyList = tReplyList;
	}
	public TogetherBookmarkVO gettBookmarkVO() {
		return tBookmarkVO;
	}
	public void settBookmarkVO(TogetherBookmarkVO tBookmarkVO) {
		this.tBookmarkVO = tBookmarkVO;
	}
	public TogetherMemberVO gettMemberVO() {
		return tMemberVO;
	}
	public void settMemberVO(TogetherMemberVO tMemberVO) {
		this.tMemberVO = tMemberVO;
	}
	public TogetherDestinationVO gettDestinationVO() {
		return tDestinationVO;
	}
	public void settDestinationVO(TogetherDestinationVO tDestinationVO) {
		this.tDestinationVO = tDestinationVO;
	}
	
	@Override
	public String toString() {
		return "TogetherBoardVO [tNo=" + tNo + ", hNo=" + hNo + ", tHeader=" + tHeader + ", tTitle=" + tTitle
				+ ", tContent=" + tContent + ", tPic1=" + tPic1 + ", tPic2=" + tPic2 + ", tAddress=" + tAddress
				+ ", tLocX=" + tLocX + ", tLocY=" + tLocY + ", dLocX=" + dLocX + ", dLocY=" + dLocY + ", tCredate="
				+ tCredate + ", tJoinDate=" + tJoinDate + ", tJoinMax=" + tJoinMax + ", tJoinNow=" + tJoinNow
				+ ", tHits=" + tHits + ", uploadFile1=" + uploadFile1 + ", uploadFile2=" + uploadFile2 + ", userVO="
				+ userVO + ", tReplyList=" + tReplyList + ", tBookmarkVO=" + tBookmarkVO + ", tMemberVO=" + tMemberVO
				+ ", tDestinationVO=" + tDestinationVO + "]";
	}

}
