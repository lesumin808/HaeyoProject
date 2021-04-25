package com.haeyo.biz.professionMypage.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haeyo.biz.reservation.ReservationCalVO;
import com.haeyo.biz.reservation.ReservationVO;

@Repository
public class ProfessionReservationDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<ReservationCalVO> getReservationList(int pNo) {
       System.out.println("mybatis에서 getReservationList() 기능 진행");
		return mybatis.selectList("ReservationCalDAO.getProRsvList", pNo);
	}
	
	public List<ReservationVO> getProCompleteList(Map<String, Object> params){
		System.out.println("mybatis에서 getProCompleteList() 기능 진행");
		return mybatis.selectList("ReservationResultDAO.getProComplete", params);
	}
	
	public CompleteCountVO getCompleteCount(int pNo){
		System.out.println("mybatis에서 getProCompleteCount() 기능 진행");
		return mybatis.selectOne("ReservationResultDAO.getGraphComplete", pNo);
	}

}
