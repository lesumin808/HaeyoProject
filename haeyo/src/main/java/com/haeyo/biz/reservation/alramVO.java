package com.haeyo.biz.reservation;

public class alramVO {
	private int alNo;
	private int pNo;
	private int uNo;
	private String uEmail;
	private String pName;
	private String pEmail;
	private String uNick;
	private String msg;
	private String type;
	private String sessionId;
	
	private String subTime;
	
	
	//테스트 추후 수정
	public String getSubTime() {
		return subTime;
	}
	public void setSubTime(String subTime) {
		this.subTime = subTime;
	}

	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private String alCredate;
	
	public int getAlNo() {
		return alNo;
	}
	public void setAlNo(int alNo) {
		this.alNo = alNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpEmail() {
		return pEmail;
	}
	public void setpEmail(String pEmail) {
		this.pEmail = pEmail;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getAlCredate() {
		return alCredate;
	}
	public void setAlCredate(String alCredate) {
		this.alCredate = alCredate;
	}
	
	@Override
	public String toString() {
		return "alramVO [alNo=" + alNo + ", pNo=" + pNo + ", uNo=" + uNo + ", uEmail=" + uEmail + ", pName=" + pName
				+ ", pEmail=" + pEmail + ", uNick=" + uNick + ", msg=" + msg + ", type=" + type + ", sessionId="
				+ sessionId + ", subTime=" + subTime + ", alCredate=" + alCredate + "]";
	}
	
	/*
	 * @Override public String toString() { return "alramVO [alNo=" + alNo +
	 * ", pNo=" + pNo + ", uNo=" + uNo + ", uEmail=" + uEmail + ", pName=" + pName +
	 * ", pEmail=" + pEmail + ", uNick=" + uNick + ", msg=" + msg + ", type=" + type
	 * + ", sessionId=" + sessionId + ", alCredate=" + alCredate + "]"; }
	 */
}
