package com.haeyo.biz.board.impl;

public class TogetherDestinationVO {

	int tNo; 
	String dAddress;
	float dLocX; 
	float dLocY;
	 
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public String getdAddress() {
		return dAddress;
	}
	public void setdAddress(String dAddress) {
		this.dAddress = dAddress;
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
	
	@Override
	public String toString() {
		return "TogetherDestinationVO [tNo=" + tNo + ", dAddress=" + dAddress + ", dLocX=" + dLocX + ", dLocY=" + dLocY
				+ "]";
	}
	
}
