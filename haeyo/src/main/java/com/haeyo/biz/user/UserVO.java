package com.haeyo.biz.user;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private int uNo;
	private String uName;
	private String uEmail;
	private String uPwd;
	private String uPhone;
	private String uAddress;
	private float uLat;
	private float uLon;
	private int uAgreecheck;
	private String uPic;
	private String uNick;
	
	//이수민 알람추가 210407
	private String alram;
	
	public String getAlram() {
		return alram;
	}

	public void setAlram(String alram) {
		this.alram = alram;
	}

	private MultipartFile uploadFile;
	
	//손예인
	private String filePath;

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuPwd() {
		return uPwd;
	}

	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuAddress() {
		return uAddress;
	}

	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}

	public float getuLat() {
		return uLat;
	}

	public void setuLat(float uLat) {
		this.uLat = uLat;
	}

	public float getuLon() {
		return uLon;
	}

	public void setuLon(float uLon) {
		this.uLon = uLon;
	}

	public int getuAgreecheck() {
		return uAgreecheck;
	}

	public void setuAgreecheck(int uAgreecheck) {
		this.uAgreecheck = uAgreecheck;
	}

	public String getuPic() {
		return uPic;
	}

	public void setuPic(String uPic) {
		this.uPic = uPic;
	}

	public String getuNick() {
		return uNick;
	}

	public void setuNick(String uNick) {
		this.uNick = uNick;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "UserVO [uNo=" + uNo + ", uName=" + uName + ", uEmail=" + uEmail + ", uPwd=" + uPwd + ", uPhone="
				+ uPhone + ", uAddress=" + uAddress + ", uLat=" + uLat + ", uLon=" + uLon + ", uAgreecheck="
				+ uAgreecheck + ", uPic=" + uPic + ", uNick=" + uNick + ", alram=" + alram + ", uploadFile="
				+ uploadFile + ", filePath=" + filePath + "]";
	}
	
	public UserVO find_by_Email(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
