package com.haeyo.biz.reservation;

public class ReservationCategoryVO {
	private int pNo;
	private String pCategory;
	private String pName;
	private String pEmail;
	
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
	//청소
	private String txtToilet;
	private String txtRoom;
	private String txtRefrigerator;
	private String txtArrangement;
	private String txtHomein;
	
	//이사
	private String txtTransportation;
	private String txtOneroom;
	private String txtKeep;
	
	//수리
	private String txtWaterpipe;
	private String txtElectric;
	private String txtDoor;
	private String txtLiving;
	private String txtTrash;
	
	
	public ReservationCategoryVO() {
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public String getTxtToilet() {
		return txtToilet;
	}
	public void setTxtToilet(String txtToilet) {
		this.txtToilet = txtToilet;
	}
	public String getTxtRoom() {
		return txtRoom;
	}
	public void setTxtRoom(String txtRoom) {
		this.txtRoom = txtRoom;
	}
	public String getTxtRefrigerator() {
		return txtRefrigerator;
	}
	public void setTxtRefrigerator(String txtRefrigerator) {
		this.txtRefrigerator = txtRefrigerator;
	}
	public String getTxtArrangement() {
		return txtArrangement;
	}
	public void setTxtArrangement(String txtArrangement) {
		this.txtArrangement = txtArrangement;
	}
	public String getTxtHomein() {
		return txtHomein;
	}
	public void setTxtHomein(String txtHomein) {
		this.txtHomein = txtHomein;
	}
	public String getTxtTransportation() {
		return txtTransportation;
	}
	public void setTxtTransportation(String txtTransportation) {
		this.txtTransportation = txtTransportation;
	}
	public String getTxtOneroom() {
		return txtOneroom;
	}
	public void setTxtOneroom(String txtOneroom) {
		this.txtOneroom = txtOneroom;
	}
	public String getTxtKeep() {
		return txtKeep;
	}
	public void setTxtKeep(String txtkeep) {
		this.txtKeep = txtkeep;
	}
	public String getTxtWaterpipe() {
		return txtWaterpipe;
	}
	public void setTxtWaterpipe(String txtWaterpipe) {
		this.txtWaterpipe = txtWaterpipe;
	}
	public String getTxtElectric() {
		return txtElectric;
	}
	public void setTxtElectric(String txtElectric) {
		this.txtElectric = txtElectric;
	}
	public String getTxtDoor() {
		return txtDoor;
	}
	public void setTxtDoor(String txtDoor) {
		this.txtDoor = txtDoor;
	}
	public String getTxtLiving() {
		return txtLiving;
	}
	public void setTxtLiving(String txtLiving) {
		this.txtLiving = txtLiving;
	}
	public String getTxtTrash() {
		return txtTrash;
	}
	public void setTxtTrash(String txtTrash) {
		this.txtTrash = txtTrash;
	}
	@Override
	public String toString() {
		return "ReservationCategoryVO [pNo=" + pNo + ", pCategory=" + pCategory + ", txtToilet=" + txtToilet
				+ ", txtRoom=" + txtRoom + ", txtRefrigerator=" + txtRefrigerator + ", txtArrangement=" + txtArrangement
				+ ", txtHomein=" + txtHomein + ", txtTransportation=" + txtTransportation + ", txtOneroom=" + txtOneroom
				+ ", txtKeep=" + txtKeep + ", txtWaterpipe=" + txtWaterpipe + ", txtElectric=" + txtElectric
				+ ", txtDoor=" + txtDoor + ", txtLiving=" + txtLiving + ", txtTrash=" + txtTrash + "]";
	}
	
}
