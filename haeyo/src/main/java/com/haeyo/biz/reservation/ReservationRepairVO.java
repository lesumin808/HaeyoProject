package com.haeyo.biz.reservation;

public class ReservationRepairVO {
	private int rsvNo;
	private int rsvWaterpipe;
	private int rsvElectric;
	private int rsvDoor;
	private int rsvLiving;
	private int rsvTrash;
	
	public int getRsvNo() {
		return rsvNo;
	}
	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
	}
	public int getRsvWaterpipe() {
		return rsvWaterpipe;
	}
	public void setRsvWaterpipe(int rsvWaterpipe) {
		this.rsvWaterpipe = rsvWaterpipe;
	}
	public int getRsvElectric() {
		return rsvElectric;
	}
	public void setRsvElectric(int rsvElectric) {
		this.rsvElectric = rsvElectric;
	}
	public int getRsvDoor() {
		return rsvDoor;
	}
	public void setRsvDoor(int rsvDoor) {
		this.rsvDoor = rsvDoor;
	}
	public int getRsvLiving() {
		return rsvLiving;
	}
	public void setRsvLiving(int rsvLiving) {
		this.rsvLiving = rsvLiving;
	}
	public int getRsvTrash() {
		return rsvTrash;
	}
	public void setRsvTrash(int rsvTrash) {
		this.rsvTrash = rsvTrash;
	}
	
	@Override
	public String toString() {
		return "reservationRepairVO [rsvNo=" + rsvNo + ", rsvWaterpipe=" + rsvWaterpipe + ", rsvElectric=" + rsvElectric
				+ ", rsvDoor=" + rsvDoor + ", rsvLiving=" + rsvLiving + ", rsvTrash=" + rsvTrash + "]";
	}
	
}
