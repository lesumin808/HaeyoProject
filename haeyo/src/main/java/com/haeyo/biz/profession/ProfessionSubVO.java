package com.haeyo.biz.profession;

public class ProfessionSubVO extends ProfessionsCleaningVO {
	private int pNo;
	private int pToilet;
	private int pLiving;
	private int pRefrigerator;
	private int pArrangement;
	private int pHomein;
	private int pWaterpipe;
	private int pElectric;
	private int pDoor;
	private int pTrash;
	private int pTransportation;
	private int pOneroom;
	private int pKeep;
	public int getpTransportation() {
		return pTransportation;
	}
	public void setppTransportation(int pTransportation) {
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
	public int getpWaterpipe() {
		return pWaterpipe;
	}
	public void setpWaterpipe(int pWaterpipe) {
		this.pWaterpipe = pWaterpipe;
	}
	public int getpElectric() {
		return pElectric;
	}
	public void setpElectric(int pElectric) {
		this.pElectric = pElectric;
	}
	public int getpDoor() {
		return pDoor;
	}
	public void setpDoor(int pDoor) {
		this.pDoor = pDoor;
	}
	public int getpTrash() {
		return pTrash;
	}
	public void setpTrash(int pTrash) {
		this.pTrash = pTrash;
	}
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
	public int getpLiving() {
		return pLiving;
	}
	public void setpLiving(int pLiving) {
		this.pLiving = pLiving;
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
		return "ProfessionSubVO [pNo=" + pNo + ", pToilet=" + pToilet + ", pLiving=" + pLiving + ", pRefrigerator="
				+ pRefrigerator + ", pArrangement=" + pArrangement + ", pHomein=" + pHomein + ", pWaterpipe="
				+ pWaterpipe + ", pElectric=" + pElectric + ", pDoor=" + pDoor + ", pTrash=" + pTrash
				+ ", pTransportation=" + pTransportation + ", pOneroom=" + pOneroom + ", pKeep=" + pKeep + "]";
	}
	
}
