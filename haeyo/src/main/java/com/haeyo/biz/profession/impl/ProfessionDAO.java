package com.haeyo.biz.profession.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haeyo.biz.profession.ProfessionBookmarksVO;
import com.haeyo.biz.profession.ProfessionListVO;
import com.haeyo.biz.profession.ProfessionSubVO;
import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.reservation.ReservationVO;

@Repository
public class ProfessionDAO {
	private static final Logger logger = LoggerFactory.getLogger(ProfessionDAO.class);
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProfessionListVO> getProList(ProfessionListVO vo) throws Exception {
		System.out.println("DAO로 경로 이동");
		return mybatis.selectList("ProListResultDAO.getProList", vo);
	};
	
	public List<ProfessionListVO> getAllList(ProfessionListVO vo) throws Exception {
		System.out.println("DAO로 경로 이동");
		return mybatis.selectList("ProListResultDAO.getAllList", vo);
	};
	
	public ProfessionListVO getDetail(ProfessionListVO vo) throws Exception {
		System.out.println("디테일 DAO이동");
		return (ProfessionListVO)mybatis.selectOne("ProListResultDAO.proDetail", vo);
	}
	
	public List<ProfessionListVO> getReview(ProfessionListVO vo) throws Exception {
		System.out.println("getReview DAO이동");
		return mybatis.selectList("ProListResultDAO.proReview", vo);
	}
	
	//서브 카테고리
	public ProfessionSubVO RepairCate(ProfessionListVO vo) {
		System.out.println("수리서브카테고리");
		return (ProfessionSubVO)mybatis.selectOne("ProSubResultDAO.RepairCate", vo);
	}
	public ProfessionSubVO MovingCate(ProfessionListVO vo) {
		System.out.println("이사서브카테고리");
		return (ProfessionSubVO)mybatis.selectOne("ProSubResultDAO.MovingCate", vo);
	}
	public ProfessionSubVO CleaningCate(ProfessionListVO vo) {
		System.out.println("청소서브카테고리");
		return (ProfessionSubVO)mybatis.selectOne("ProSubResultDAO.CleaningCate", vo);
	}
	
	//전문가 select 리스트 테스트
	public List<ProfessionListVO> getLList(ProfessionListVO vo) {
		System.out.println("전문가 select리스트");
		return mybatis.selectList("ProListResultDAO.getList", vo);
	}
	
	//북마크 인서트
	public int insertBook(ProfessionBookmarksVO vo){
		logger.info("ProfessionBookmarksVO : " + vo);
		return mybatis.insert("professionDAO.insertBook", vo);
	}
		
	//북마크 삭제
	public int deleteBook(ProfessionBookmarksVO vo) {
		logger.info("ProfessionBookmarksVO : " + vo);
		return mybatis.delete("professionDAO.deleteBook", vo);
	}
	
	//북마크 카운트
	public ProfessionBookmarksVO selectBook(ProfessionBookmarksVO vo) {
		logger.info("ProfessionBookmarksVO : " + vo);
		return mybatis.selectOne("professionDAO.selectBook", vo);
	}
	
	public List<ReservationVO> selectProReservation(ProfessionVO vo){
		return mybatis.selectList("ReservationResultDAO.selectReservation", vo);
	}
	
	//210407 장현아 전문가 회원가입
	public int insertPro(ProfessionVO vo) {
		System.out.println("Mybatis로 insertPro() 기능처리");
		mybatis.insert("professionDAO.insertPro", vo);
		int uNo = vo.getuNo();
		System.out.println("uNo = " + uNo);
		return uNo;
	}
	
	// 210408 장현아 전문가 세부내용 저장
		public int insertProCate01(ProfessionVO vo) {
			System.out.println("Mybatis로 insertProCate01() 기능처리");
			mybatis.insert("professionDAO.insertProCate01", vo);
			int pNo = vo.getpNo();
			System.out.println("pNo = " + pNo);
			return pNo;
		}
		
		public int insertProCate02(ProfessionVO vo) {
			System.out.println("Mybatis로 insertProCate02() 기능처리");
			mybatis.insert("professionDAO.insertProCate02", vo);
			int pNo = vo.getpNo();
			System.out.println("pNo = " + pNo);
			return pNo;
		}
		
		public int insertProCate03(ProfessionVO vo) {
			System.out.println("Mybatis로 insertProCate03() 기능처리");
			mybatis.insert("professionDAO.insertProCate03", vo);
			int pNo = vo.getpNo();
			System.out.println("pNo = " + pNo);
			return pNo;
		}
}
