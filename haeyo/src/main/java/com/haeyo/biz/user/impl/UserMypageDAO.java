package com.haeyo.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haeyo.biz.board.impl.TogetherReplyVO;
import com.haeyo.biz.user.UserVO;

@Repository("UserMypageDAO")
public class UserMypageDAO {
	private static final Logger logger = LoggerFactory.getLogger(UserMypageDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//TogetherBoard 댓글에 대한 부분
	//유저 마이페이지 - 내가 쓴 댓글 모아보기 
	public List<TogetherReplyVO> getUserReply(int uNo) {
		System.out.println("UserMypageDAO  uNo" + uNo);
		/* logger.info("uNo:"+uNo); */
		List<TogetherReplyVO> result= sqlSessionTemplate.selectList("UserMypageDAO.selectReply", uNo);
		System.out.println("UserMypageDAO  getUserReply result" + result);

		 return result ;
	}
	
	//TogetherBoard 댓글삭제에 대한 부분
	//유저 마이페이지 - 내가 쓴 댓글 개별삭제하기	
	public int deleteReply(int trNo) {
		System.out.println("UserMypageDAO deleteReply처리");
		sqlSessionTemplate.delete("UserMypageDAO.deleteReply", trNo);

		return sqlSessionTemplate.delete("UserMypageDAO.deleteReply", trNo);
	}
		
	//TogetherBoard 댓글삭제에 대한 부분
	//유저 마이페이지 - 내가 쓴 댓글 전체삭제하기	
	public int deleteReplyALL(int uNo) {
		System.out.println("UserMypageDAO deleteReply처리");
		sqlSessionTemplate.delete("UserMypageDAO.deleteReply_all", uNo);
		
		return sqlSessionTemplate.delete("UserMypageDAO.deleteReply_all", uNo);
	}
	//마이페이지 업데이트하기
	public void updateMypage(UserVO vo) {
		logger.info("UserDAO updateMypage UserVO vo :" + vo);
		System.out.println("UserDAOMybatis updateMypage 넘어왓다 야호 ");
		sqlSessionTemplate.update("UserMypageDAO.updateMypage", vo);
	}
	//마이페이지 유저 정보 다 가져오기 (데이터 열람 화면)
	public UserVO selectOneUser(UserVO vo) {
		System.out.println("Mybatis로 selectUser() 기능 처리! 얏호!");
		return (UserVO)sqlSessionTemplate.selectOne("UserMypageDAO.selectOneUser", vo);
	}
	//업데이트 비밀번호 
	public void updateUserPwd(UserVO vo) {
		System.out.println("UserDAOMybatis 셀렉트 패스워드 유저 기능 처리! 유후 ");
		sqlSessionTemplate.update("UserMypageDAO.updateUserPwd", vo);
	}
	//셀렉트 비밀번호
	public UserVO selectOnePwd(UserVO vo) {
		System.out.println("UserDAO selectOnePwd 비밀번호 ");
		UserVO result = (UserVO)sqlSessionTemplate.selectOne("UserMypageDAO.selectOnePwd", vo);
		System.out.println("UserDAO selectOnePwd result" + result);
		return result;
	}
	
	//계정삭제
	public void deleteoneUser(int uNo) {
		logger.info("UserVO uNo : " + uNo);
		System.out.println("UserDAOMybatis 딜리트 유저 기능처리");
		sqlSessionTemplate.delete("UserMypageDAO.deleteoneUser", uNo);
	}
}
