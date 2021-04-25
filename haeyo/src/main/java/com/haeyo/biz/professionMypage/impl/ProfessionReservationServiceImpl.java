package com.haeyo.biz.professionMypage.impl;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haeyo.biz.reservation.ReservationCalVO;
import com.haeyo.biz.reservation.ReservationVO;



@Service("ProfessionReservationService")
public class ProfessionReservationServiceImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfessionReservationServiceImpl.class);
	
	@Autowired
	private ProfessionReservationDAO proReservationDAO;
	
	@Autowired
	HttpSession httpSession;
	
	
	public List<ReservationCalVO> getReservationList(int pNo) {
		System.out.println("ProfessionReservationService에서 getReservationList() 기능 처리");
		return proReservationDAO.getReservationList(pNo);
	}
	
	public List<ReservationVO> getProCompleteList(Map<String, Object> params){
		System.out.println("ProfessionReservationService에서 getProCompleteList() 기능 처리");
		return proReservationDAO.getProCompleteList(params);
	}

	
	public CompleteCountVO getCompleteCount(int pNo){
		System.out.println("ProfessionReservationService에서 getProCompleteCount() 기능 처리");
		return proReservationDAO.getCompleteCount(pNo);
	}
	
		
}
