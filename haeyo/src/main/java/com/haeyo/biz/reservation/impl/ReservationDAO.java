package com.haeyo.biz.reservation.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.profession.ReviewsVO;
import com.haeyo.biz.reservation.ReservationVO;
import com.haeyo.biz.reservation.alramVO;

@Repository
public class ReservationDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//예약하기
	public void insertReservation(ReservationVO vo) {
		mybatis.insert("ReservationResultDAO.insertReservaiton",vo);
	};
	
	//예약번호 불러오기
	public int selectReservation(ReservationVO vo) {
		return mybatis.selectOne("ReservationResultDAO.selectReservation",vo);
	}
	
	//수리 예약
	public void insertRepair(ReservationVO vo) {
		mybatis.insert("ReservationResultDAO.insertRepair",vo);
	};
	
	//이사 예약
	public void insertMoving(ReservationVO vo) {
		mybatis.insert("ReservationResultDAO.insertMoving",vo);
	};
	//청소 예약
	public void insertCleaning(ReservationVO vo) {
		mybatis.insert("ReservationResultDAO.insertCleaning",vo);
	};
	
	//예약 일정 불러오기
	public List<String> selectProReservation(ProfessionVO vo) {
		System.out.println("DAO selectProReservation");
		return mybatis.selectList("ReservationResultDAO.selectReservation", vo);
	}
	
	//결제 알림 인서트
	public void insertAlram(alramVO vo) {
		mybatis.insert("alramResultDAO.insertAlram", vo);
	}
	
	//전문가 리뷰 불러오기
	public ReviewsVO getReview(ReviewsVO vo) {
		return mybatis.selectOne("ProListResultDAO.getReview", vo);
	}
	
	//전문가 리뷰 업데이트
	public void updateReview(ReviewsVO vo) {
		mybatis.update("ProListResultDAO.updateReview", vo);
	}
	
	//전문가 삭제
	public void deleteReview(ReviewsVO vo) {
		mybatis.delete("ProListResultDAO.deleteReview");
	}
	
	
}
