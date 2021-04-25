package com.haeyo.biz.reservation;

public class ReservationCleaningVO {
	private int rsvNo;
	private int rsvToilet;
	private int rsvRoom;
	private int rsvRefrigerator;
	private int rsvArrangement;
	private int rsvHomein;
	
	public int getRsvNo() {
		return rsvNo;
	}
	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
	}
	public int getRsvToilet() {
		return rsvToilet;
	}
	public void setRsvToilet(int rsvToilet) {
		this.rsvToilet = rsvToilet;
	}
	public int getRsvRoom() {
		return rsvRoom;
	}
	public void setRoom(int rsvLiving) {
		this.rsvRoom = rsvLiving;
	}
	public int getRsvRefrigerator() {
		return rsvRefrigerator;
	}
	public void setRsvRefrigerator(int rsvRefrigerator) {
		this.rsvRefrigerator = rsvRefrigerator;
	}
	public int getRsvArrangement() {
		return rsvArrangement;
	}
	public void setRsvArrangement(int rsvArrangement) {
		this.rsvArrangement = rsvArrangement;
	}
	public int getRsvHomein() {
		return rsvHomein;
	}
	public void setRsvHomein(int rsvHomein) {
		this.rsvHomein = rsvHomein;
	}
	
	@Override
	public String toString() {
		return "reservationCleaningVO [rsvNo=" + rsvNo + ", rsvToilet=" + rsvToilet + ", rsvRoom=" + rsvRoom
				+ ", rsvRefrigerator=" + rsvRefrigerator + ", rsvArrangement=" + rsvArrangement + ", rsvHomein="
				+ rsvHomein + "]";
	}
	
}
