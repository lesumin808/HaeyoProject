package com.haeyo.biz.profession;

import com.haeyo.biz.user.UserVO;

public class ProfessionVO {
	private int pNo;
	private int uNo;
	private int pGender;
	private String pAddress;
	private float pLocX;
	private float pLocY;
	private String certification;
	private String pPic;
	private int pAgreeCheck;
	private String pIntroduce;
	private String pCategory;

	private float score;
	private int count;
	private UserVO userVO;

	ProfessionsCleaningVO professionsCleaningVO;
	ProfessionsRepairVO professionsRepairVO;
	ProfessionsMovingVO professionsMovingVO;
	ProfessionBookmarksVO professionBookmarksVO;

	private int pToilet;
	private int pRoom;
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

	public int getpGender() {
		return pGender;
	}

	public void setpGender(int pGender) {
		this.pGender = pGender;
	}

	public String getpAddress() {
		return pAddress;
	}

	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}

	public float getpLocX() {
		return pLocX;
	}

	public void setpLocX(float pLocX) {
		this.pLocX = pLocX;
	}

	public float getpLocY() {
		return pLocY;
	}

	public void setpLocY(float pLocY) {
		this.pLocY = pLocY;
	}

	public String getCertification() {
		return certification;
	}

	public void setCertification(String certification) {
		this.certification = certification;
	}

	public String getpPic() {
		return pPic;
	}

	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

	public int getpAgreeCheck() {
		return pAgreeCheck;
	}

	public void setpAgreeCheck(int pAgreeCheck) {
		this.pAgreeCheck = pAgreeCheck;
	}

	public String getpIntroduce() {
		return pIntroduce;
	}

	public void setpIntroduce(String pIntroduce) {
		this.pIntroduce = pIntroduce;
	}

	public String getpCategory() {
		return pCategory;
	}

	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public ProfessionsCleaningVO getProfessionsCleaningVO() {
		return professionsCleaningVO;
	}

	public void setProfessionsCleaningVO(ProfessionsCleaningVO professionsCleaningVO) {
		this.professionsCleaningVO = professionsCleaningVO;
	}

	public ProfessionsRepairVO getProfessionsRepairVO() {
		return professionsRepairVO;
	}

	public void setProfessionsRepairVO(ProfessionsRepairVO professionsRepairVO) {
		this.professionsRepairVO = professionsRepairVO;
	}

	public ProfessionsMovingVO getProfessionsMovingVO() {
		return professionsMovingVO;
	}

	public void setProfessionsMovingVO(ProfessionsMovingVO professionsMovingVO) {
		this.professionsMovingVO = professionsMovingVO;
	}

	public ProfessionBookmarksVO getProfessionBookmarksVO() {
		return professionBookmarksVO;
	}

	public void setProfessionBookmarksVO(ProfessionBookmarksVO professionBookmarksVO) {
		this.professionBookmarksVO = professionBookmarksVO;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	@Override
	public String toString() {
		return "ProfessionVO [pNo=" + pNo + ", uNo=" + uNo + ", pGender=" + pGender + ", pAddress=" + pAddress
				+ ", pLocX=" + pLocX + ", pLocY=" + pLocY + ", certification=" + certification + ", pPic=" + pPic
				+ ", pAgreeCheck=" + pAgreeCheck + ", pIntroduce=" + pIntroduce + ", pCategory=" + pCategory
				+ ", score=" + score + ", count=" + count + ", userVO=" + userVO + ", professionsCleaningVO="
				+ professionsCleaningVO + ", professionsRepairVO=" + professionsRepairVO + ", professionsMovingVO="
				+ professionsMovingVO + ", professionBookmarksVO=" + professionBookmarksVO + ", pToilet=" + pToilet
				+ ", pRoom=" + pRoom + ", pLiving=" + pLiving + ", pRefrigerator=" + pRefrigerator + ", pArrangement="
				+ pArrangement + ", pHomein=" + pHomein + ", pWaterpipe=" + pWaterpipe + ", pElectric=" + pElectric
				+ ", pDoor=" + pDoor + ", pTrash=" + pTrash + ", pTransportation=" + pTransportation + ", pOneroom="
				+ pOneroom + ", pKeep=" + pKeep + "]";
	}

}