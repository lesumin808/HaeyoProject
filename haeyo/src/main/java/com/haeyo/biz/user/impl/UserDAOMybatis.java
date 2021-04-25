package com.haeyo.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haeyo.biz.reservation.alramVO;
import com.haeyo.biz.user.UserVO;

@Repository
public class UserDAOMybatis {
	private static final Logger logger = LoggerFactory.getLogger(UserDAOMybatis.class);
	
	//장현아
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertUser(UserVO vo) {
		System.out.println("Mybatis로 insertUser() 기능처리");
		mybatis.insert("UserDAO.insertUser", vo);
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("Mybatis로 getUser() 기능처리");
		return (UserVO)mybatis.selectOne("UserDAO.getUser", vo);
	}
	
	public int idChk(String uEmail) {
		return mybatis.selectOne("UserDAO.idChk", uEmail);
	}
	
	//알림 리스트 불러오기
	public List<alramVO> selectAlram(String uEmail) {
		logger.info("selectArlam DAO : uEmail " + uEmail);
		return mybatis.selectList("alramResultDAO.selectAlarm", uEmail);
	}
	
	//알림 삭제
	public void deleteAlarm(int alNo) {
		logger.info("selectArlam DAO : al_no " + alNo);
		mybatis.delete("alramResultDAO.deleteAlarm", alNo);
	}
	
}
