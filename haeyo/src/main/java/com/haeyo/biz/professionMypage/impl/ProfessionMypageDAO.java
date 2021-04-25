package com.haeyo.biz.professionMypage.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haeyo.biz.profession.ProfessionSubVO;
import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.user.UserVO;

@Repository
public class ProfessionMypageDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void updateProfile(ProfessionVO vo) {
		System.out.println("mybatis로 updateProfile() / insertSubcate 기능 처리");
		mybatis.update("professionMypageDAO.updateProfile", vo);
	}
	
	public void deleteProfile(int pNo) {
		System.out.println("mybatis로 deleteProfile() 기능 처리");
		mybatis.delete("professionMypageDAO.deleteProfile", pNo);
	}
	
	public ProfessionVO getProfile(UserVO user) {
		System.out.println("mybatis로 getProfile() 기능 처리");
		System.out.println("userVO : " + user + "확인");
		System.out.println((ProfessionVO) mybatis.selectOne("professionMypageDAO.getProfile", user));
		return (ProfessionVO) mybatis.selectOne("professionMypageDAO.getProfile", user);
		
	}

	public void deleteSubCate(ProfessionVO proVO) {
		System.out.println("mybatis로 deleteSubCate 기능 처리");
		mybatis.delete("professionMypageDAO.deleteSubCate", proVO);
	}

	public void insertCleaning(ProfessionSubVO subvo) {
		System.out.println("mybatis로 subcate_insertCleaning 기능 처리");
		mybatis.insert("professionMypageDAO.insertCleaning", subvo);
	}

	public void insertMoving(ProfessionSubVO subvo) {
		System.out.println("mybatis로 subcate_insertMoving 기능 처리");
		mybatis.insert("professionMypageDAO.insertMoving", subvo);
		
	}

	public void insertRepair(ProfessionSubVO subvo) {
		System.out.println("mybatis로 subcate_insertRepair 기능 처리");
		mybatis.insert("professionMypageDAO.insertRepair", subvo);	
	}
	
	

	public ProfessionSubVO getCleaning(int pNo) {
		System.out.println("mybatis로 서브카테_getCleaning 기능 처리");
		return (ProfessionSubVO) mybatis.selectOne("ProSubResultDAO.CleaningCate", pNo);
	}

	public ProfessionSubVO getMoving(int pNo) {
		System.out.println("mybatis로 서브카테_getMovinging 기능 처리");
		return (ProfessionSubVO) mybatis.selectOne("ProSubResultDAO.MovingCate", pNo);
	}

	public ProfessionSubVO getRepair(int pNo) {
		System.out.println("mybatis로 서브카테_getRepair 기능 처리");
		return (ProfessionSubVO) mybatis.selectOne("ProSubResultDAO.RepairCate", pNo);
	}



	

}
