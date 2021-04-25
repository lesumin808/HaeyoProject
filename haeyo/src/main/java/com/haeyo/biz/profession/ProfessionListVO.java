package com.haeyo.biz.profession;

import java.sql.Date;
import java.sql.Timestamp;

public class ProfessionListVO extends ProfessionVO {

	private String uName;// 이름
	private Timestamp rsvDate;// 등록된 예약일정
	private int reviewNo;// 리뷰번호
	private Date reviewDate;// 리뷰 작성일
	private float score;// 점수
	private Date startDate;// 사용자가 체크리스트 시작일
	private Date endDate;// 사용자 체크리스트 마감일
	private int order;
	private String reviewContent;
	private String uPic;
	private String uNick;
	private String serchloc;
	private String uEmail;
	
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	//위치 경도 받은 값 추가
	private float pickLocX;
	private float pickLocY;
	
	public float getPickLocX() {
		return pickLocX;
	}
	public void setPickLocX(float pickLocX) {
		this.pickLocX = pickLocX;
	}
	
	public float getPickLocY() {
		return pickLocY;
	}
	public void setPickLocY(float pickLocY) {
		this.pickLocY = pickLocY;
	}
	public String getSerchloc() {
		return serchloc;
	}
	public void setSerchloc(String serchloc) {
		this.serchloc = serchloc;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public String getuPic() {
		return uPic;
	}
	public void setuPic(String uPic) {
		this.uPic = uPic;
	}
	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	private int count;

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public Timestamp getRsvDate() {
		return rsvDate;
	}

	public void setRsvDate(Timestamp rsvDate) {
		this.rsvDate = rsvDate;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "ProfessionListVO [uName=" + uName + ", rsvDate=" + rsvDate + ", reviewNo=" + reviewNo + ", reviewDate="
				+ reviewDate + ", score=" + score + ", startDate=" + startDate + ", endDate=" + endDate + ", order="
				+ order + ", reviewContent=" + reviewContent + ", uPic=" + uPic + ", uNick=" + uNick + ", serchloc="
				+ serchloc + ", uEmail=" + uEmail + ", pickLocX=" + pickLocX + ", pickLocY=" + pickLocY + ", count="
				+ count + ", toString()=" + super.toString() + "]";
	}
	
	/*
	 * @Override public String toString() { return "ProfessionListVO [uName=" +
	 * uName + ", rsvDate=" + rsvDate + ", reviewNo=" + reviewNo + ", reviewDate=" +
	 * reviewDate + ", score=" + score + ", startDate=" + startDate + ", endDate=" +
	 * endDate + ", order=" + order + ", reviewContent=" + reviewContent + ", uPic="
	 * + uPic + ", uNick=" + uNick + ", serchloc=" + serchloc + ", pickLocX=" +
	 * pickLocX + ", pickLocY=" + pickLocY + ", count=" + count + ", toString()=" +
	 * super.toString() + "]"; }
	 */
	

}
