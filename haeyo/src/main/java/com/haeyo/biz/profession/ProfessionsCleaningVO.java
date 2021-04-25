package com.haeyo.biz.profession;

public class ProfessionsCleaningVO {
	private int pNo;
	private int pToilet;
	private int pRoom;
	private int pRefrigerator;
	private int pArrangement;
	private int pHomein;
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getpToilet() {
		return pToilet;
	}
	public void setpToilet(int pToilet) {
		this.pToilet = pToilet;
	}
	public int getpRoom() {
		return pRoom;
	}
	public void setpRoom(int pRoom) {
		this.pRoom = pRoom;
	}
	public int getpRefrigerator() {
		return pRefrigerator;
	}
	public void setpRefrigerator(int pRefrigerator) {
		this.pRefrigerator = pRefrigerator;
	}
	public int getpArrangement() {
		return pArrangement;
	}
	public void setpArrangement(int pArrangement) {
		this.pArrangement = pArrangement;
	}
	public int getpHomein() {
		return pHomein;
	}
	public void setpHomein(int pHomein) {
		this.pHomein = pHomein;
	}
	
	@Override
	public String toString() {
		return "ProfessionsCleaningVO [pNo=" + pNo + ", pToilet=" + pToilet + ", pRoom=" + pRoom + ", pRefrigerator="
				+ pRefrigerator + ", pArrangement=" + pArrangement + ", pHomein=" + pHomein + "]";
	}
	
}
