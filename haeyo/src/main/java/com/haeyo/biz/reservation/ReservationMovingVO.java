package com.haeyo.biz.reservation;

public class ReservationMovingVO {
	private int rsvNo;
	private int rsvTransportation;
	private int rsvOneroom;
	private int rsvkeep;
	public int getRsvNo() {
		return rsvNo;
	}
	public void setRsvNo(int rsvNo) {
		this.rsvNo = rsvNo;
	}
	public int getRsvTransportation() {
		return rsvTransportation;
	}
	public void setRsvTransportation(int rsvTransportation) {
		this.rsvTransportation = rsvTransportation;
	}
	public int getRsvOneroom() {
		return rsvOneroom;
	}
	public void setRsvOneroom(int rsvOneroom) {
		this.rsvOneroom = rsvOneroom;
	}
	public int getRsvkeep() {
		return rsvkeep;
	}
	public void setRsvkeep(int rsvkeep) {
		this.rsvkeep = rsvkeep;
	}
	
	@Override
	public String toString() {
		return "reservationMovingVO [rsvNo=" + rsvNo + ", rsvTransportation=" + rsvTransportation + ", rsvOneroom="
				+ rsvOneroom + ", rsvkeep=" + rsvkeep + "]";
	}
	
}
