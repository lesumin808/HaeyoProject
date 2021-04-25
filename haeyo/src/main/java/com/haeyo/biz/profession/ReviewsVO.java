package com.haeyo.biz.profession;

public class ReviewsVO {
	private int reviewNo;
	private int rsvNo;
	private String reviewContent;
	private float score;
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getRsvNo() {
		return rsvNo;
	}
	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "ReviewsVO [reviewNo=" + reviewNo + ", rsvNo=" + rsvNo + ", reviewContent=" + reviewContent + ", score="
				+ score + "]";
	}
	
	
}
