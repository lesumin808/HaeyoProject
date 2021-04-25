package com.haeyo.biz.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haeyo.biz.board.BoardVO;
import com.haeyo.biz.user.UserVO;

@Repository
public class TogetherBoardDAO {
	private static final Logger logger = LoggerFactory.getLogger(TogetherBoardDAO.class);
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	//게시글에 대한 부분
	public void insertBoard(TogetherBoardVO togetherBoardVO, TogetherDestinationVO togetherDestinationVO) {
		logger.info("파라미터:"+ togetherBoardVO);
		sqlSession.insert("togetherBoardDAO.insertTogetherBoard", togetherBoardVO);
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("tBoardVO", togetherBoardVO);
		params.put("tDestinationVO", togetherDestinationVO);
		sqlSession.insert("togetherBoardDAO.insertTogetherDestination", params);
	}
	
	public TogetherBoardVO getUpdateBoard(int tNo) {
		logger.info("tNo:"+tNo);
		TogetherBoardVO result = sqlSession.selectOne("togetherBoardDAO.selectUpdateBoard", tNo);
		return result;
	}
	
	public void updateBoard(TogetherBoardVO togetherBoardVO, TogetherDestinationVO togetherDestinationVO) {
		logger.info("togetherBoardVO:"+togetherBoardVO);
		sqlSession.update("togetherBoardDAO.updateTogetherBoard", togetherBoardVO);
		logger.info("togetherBoardVO:"+togetherBoardVO);
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("tBoardVO", togetherBoardVO);
		params.put("tDestinationVO", togetherDestinationVO);
		sqlSession.update("togetherBoardDAO.updateTogetherDestination", params);
	}
	
	public void deleteBoard(int tNo) {
		logger.info("tNo:"+tNo);
		sqlSession.delete("togetherBoardDAO.deleteTogetherBoard", tNo);
	}
	
	public UserVO getUaddress(UserVO userVO) {
		logger.info("userVO:"+userVO);
		UserVO result = sqlSession.selectOne("togetherBoardDAO.selectUserInfo", userVO);
		logger.info("result"+result);
		return result;
	}
	
	public TogetherBoardVO getBoard(int tNo, int uNo , String tHeader) {
		logger.info("tNo:"+tNo);
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("tNo", tNo);
		params.put("uNo", uNo);
		params.put("tHeader", tHeader);
		TogetherBoardVO result = sqlSession.selectOne("togetherBoardDAO.selectTogetherBoard", params);
		logger.info("result:"+result);
		return result;
	}
	
	public List<TogetherBoardVO> getBoardMain(UserVO userVO) { 
		logger.info(" userVO: "+userVO);
		List<TogetherBoardVO> result = sqlSession.selectList("togetherBoardDAO.selectTogetherBoardMain", userVO);
		logger.info("result: "+ result);
		return result; 
	}

	public List<TogetherBoardVO> getBoardList(UserVO userVO, String tHeader, TogetherPagingVO pagingVO) {
		logger.info(" userVO: "+userVO+" tHeader:"+tHeader);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userVO", userVO);
		params.put("tHeader", tHeader);
		params.put("pagingVO", pagingVO);
		List<TogetherBoardVO> result = sqlSession.selectList("togetherBoardDAO.selectTogetherBoardList", params);
		logger.info("result: "+ result);
		return result; // ListVO를 이용하는 것 같음
//		리턴totalcount=>count(t_no)
	}
	
	public UserVO getUserLocation(UserVO userVO) {
		UserVO result = sqlSession.selectOne("togetherBoardDAO.selectUserLocation", userVO);
		logger.info("result: "+ result);
		return result;
	}
	
	public UserVO getUserInfo(UserVO userVO) {
		UserVO result = sqlSession.selectOne("togetherBoardDAO.selectUserInfo", userVO);
		logger.info("result: "+ result);
		return result;
	}
	
	public int countTotalBoard(String tHeader) {
		logger.info("tHeader: "+tHeader);
		return sqlSession.selectOne("togetherBoardDAO.countTotalBoard", tHeader);
	}
	
	//댓글에 대한 부분
	public List<TogetherReplyVO> getReply(int tNo) {
		logger.info("tNo:"+tNo);
		return sqlSession.selectList("togetherBoardDAO.selectReply", tNo);
	}
	
	public TogetherReplyVO getReplyOne(int trNo) {
		logger.info("trNo:"+trNo);
		TogetherReplyVO result = sqlSession.selectOne("togetherBoardDAO.selectReplyOne", trNo);
		logger.info("result: "+result);
		return result;
	}
	
	public int insertReply(TogetherReplyVO togetherReplyVO) {
		System.out.println("TogetherBoardDAO insertSelectReply처리");
		sqlSession.insert("togetherBoardDAO.insertReply", togetherReplyVO);
		int trNo = togetherReplyVO.getTrNo();
		System.out.println("trNo = " + trNo);
		return trNo;
	}
	
	public void updateReply(TogetherReplyVO togetherReplyVO) {
		logger.info("togetherReplyVO:"+togetherReplyVO);
		sqlSession.update("togetherBoardDAO.updateReply", togetherReplyVO);
	}
	
	public int deleteReply(int trNo) {
		System.out.println("TogetherBoardDAO deleteReply처리");
		return sqlSession.delete("togetherBoardDAO.deleteReply", trNo);
	}
	
	//모임 참여에 대한 부분
	public int updateJoin(TogetherMemberVO togetherMemberVO, String joinOrCancle) {
		System.out.println("TogetherBoardDAO updateJoinNow처리");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("togetherMemberVO", togetherMemberVO);
		params.put("joinOrCancle", joinOrCancle);
		int success = sqlSession.update("togetherBoardDAO.updateJoin", params);
		System.out.println(success);
		return success;
	}
	
	public int insertJoin(TogetherMemberVO togetherMemberVO) {
		System.out.println("TogetherBoardDAO insertJoinNow처리");
		int success = sqlSession.insert("togetherBoardDAO.insertJoin", togetherMemberVO);
		System.out.println(success);
		return success;
	}
	
	public TogetherBoardVO getJoinResult(TogetherMemberVO togetherMemberVO) {
		 TogetherBoardVO result = sqlSession.selectOne("togetherBoardDAO.selectJoin", togetherMemberVO);
		 logger.info("result: "+result);
		 return result;
	}
	
	public int cancleJoin(TogetherMemberVO togetherMemberVO) {
		int result = sqlSession.delete("togetherBoardDAO.cancleJoin", togetherMemberVO);
		logger.info("result: "+result);
		return result;
	}
	
	//북마크에 대한 부분
	public int updateBookmark(TogetherBoardVO togetherBoardVO) {
		logger.info("togetherBoardVO"+togetherBoardVO);
		return sqlSession.update("togetherBoardDAO.updateBookmark", togetherBoardVO);
	}
	
	public int insertBookmark(int tNo, int uNo) {
		logger.info("tNo:"+tNo+", uNo"+uNo);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tNo", tNo);
		params.put("uNo", uNo);
		return sqlSession.insert("togetherBoardDAO.insertBookmark", params);
	}
	
	public int deleteBookmark(int tNo, int uNo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tNo", tNo);
		params.put("uNo", uNo);
		return sqlSession.update("togetherBoardDAO.deleteBookmark", params);
	}
	
	//검색에 대한 부분
	public List<TogetherBoardVO> searchBoardList(String searchInput, int startNo) {
		logger.info("searchInput: "+searchInput);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchInput", searchInput);
		params.put("startNo", startNo);
		List<TogetherBoardVO> result = sqlSession.selectList("togetherBoardDAO.searchBoardList", params);
		logger.info("result: "+result);
		return result;
	}
	
	public int countTotalSearch(String searchInput) {
		return sqlSession.selectOne("togetherBoardDAO.countTotalSearch", searchInput);
	}
	
	//검색 자동 완성
	public List<TogetherBoardVO> previewBoardList(String searchInput) {
		logger.info("searchInput: "+searchInput);
		List<TogetherBoardVO> result = sqlSession.selectList("togetherBoardDAO.previewBoardList", searchInput);
		logger.info("result: "+result);
		return result;
	}
	//분류별 정렬
	public List<TogetherBoardVO> sortBoardList(String sortInput, String tHeader, int startNo, int uNo){
		logger.info("sortInput: "+sortInput+",tHeader: "+ tHeader);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sortInput", sortInput);
		params.put("tHeader", tHeader);
		params.put("startNo", startNo);
		params.put("uNo", uNo);
		List<TogetherBoardVO> result = sqlSession.selectList("togetherBoardDAO.sortBoardList", params);
		logger.info("result: "+result);
		return result;
	}
}
