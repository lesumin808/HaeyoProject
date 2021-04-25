package com.haeyo.biz.profession;

public class ProfessionsMovingVO {
	private int pNo;
	private int pTransportation;
	private int pOneroom;
	private int pKeep;
	
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getpTransportation() {
		return pTransportation;
	}
	public void setpTransportation(int pTransportation) {
		this.pTransportation = pTransportation;
	}
	public int getpOneroom() {
		return pOneroom;
	}
	public void setpOneroom(int pOneroom) {
		this.pOneroom = pOneroom;
	}
	public int getpKeep() {
		return pKeep;
	}
	public void setpKeep(int pKeep) {
		this.pKeep = pKeep;
	}
	
	@Override
	public String toString() {
		return "ProfessionsMovingVO [pNo=" + pNo + ", pTransportation=" + pTransportation + ", pOneroom=" + pOneroom
				+ ", pKeep=" + pKeep + "]";
	}
	
}
