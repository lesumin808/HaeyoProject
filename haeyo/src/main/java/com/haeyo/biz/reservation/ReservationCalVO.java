package com.haeyo.biz.reservation;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReservationCalVO {
	
	private int rsvNo; //r_no
	private int uNo;
	private int pNo;
	@JsonFormat(pattern = "yyyy-MM-dd", shape=JsonFormat.Shape.STRING)
	private Date start;
//	private Date end;
	private String title; //u_name 
	private String rsvDate; //u_name 
	private String uName; //u_name 
	
	
	
	public String getRsvDate() {
		return rsvDate;
	}
	public void setRsvDate(String rsvDate) {
		this.rsvDate = rsvDate;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public int getRsvNo() {
		return rsvNo;
	}
	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
//	public Date getEnd() {
//		return end;
//	}
//	public void setEnd(Date end) {
//		this.end = end;
//	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "ReservationCalVO [rsvNo=" + rsvNo + ", uNo=" + uNo + ", pNo=" + pNo + ", start=" + start + ", title=" + title + "]";
	}
	
	
	
	
	

}
