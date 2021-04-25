
package com.haeyo.biz.board.impl;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.haeyo.biz.board.BoardVO;
import com.haeyo.biz.user.UserVO;

@Service("TogetherBoardService")
public class TogetherBoardServiceImpl {
	private static final Logger logger = LoggerFactory.getLogger(TogetherBoardServiceImpl.class);
	
	@Autowired
	public TogetherBoardDAO togetherBoardDAO;
	
	@Autowired
	HttpSession httpSession;
	
	public void insertBoard(TogetherBoardVO togetherBoardVO, TogetherDestinationVO togetherDestinationVO) {
		logger.info("파라미터:"+ togetherBoardVO);
		togetherBoardDAO.insertBoard(togetherBoardVO, togetherDestinationVO);
	}

	public TogetherBoardVO getUpdateBoard(int tNo) {
		logger.info("tNo:"+tNo);
		return togetherBoardDAO.getUpdateBoard(tNo);
	}
	
	public void updateBoard(TogetherBoardVO togetherBoardVO, TogetherDestinationVO togetherDestinationVO) {
		togetherBoardDAO.updateBoard(togetherBoardVO, togetherDestinationVO);
	}
	
	public void deleteBoard(int tNo) {
		togetherBoardDAO.deleteBoard(tNo);

	}
	
	public UserVO getUaddress(UserVO userVO) {
		logger.info("userVO:"+userVO);
		return togetherBoardDAO.getUaddress(userVO);
	}

	public TogetherBoardVO getBoard(int tNo, int uNo , String tHeader) {
		logger.info("tNo:"+tNo);
		return togetherBoardDAO.getBoard(tNo, uNo , tHeader);
	}
	
	public List<TogetherBoardVO> getBoardMain(UserVO userVO) {
		logger.info("userVO:"+userVO);
		return togetherBoardDAO.getBoardMain(userVO);
	}

	public List<TogetherBoardVO> getBoardList(UserVO userVO, String tHeader, TogetherPagingVO pagingVO) {
		logger.info("userVO:"+userVO+"tHeader:"+tHeader);
		return togetherBoardDAO.getBoardList(userVO, tHeader, pagingVO);
	}
	
	public UserVO getUserLocation(UserVO userVO) {
		return togetherBoardDAO.getUserLocation(userVO);
	}
	
	public UserVO getUserInfo(UserVO userVO) {
		return togetherBoardDAO.getUserInfo(userVO);
	}
	public int countTotalBoard(String tHeader) {
		return togetherBoardDAO.countTotalBoard(tHeader);
	}

	public TogetherBoardVO uploadBoard(TogetherBoardVO togetherBoardVO) throws Exception {
		logger.info("togetherBoardVO"+ togetherBoardVO);
		MultipartFile uploadFile1 = togetherBoardVO.getUploadFile1(); //파일 업로드 객체 생성
		MultipartFile uploadFile2 = togetherBoardVO.getUploadFile2(); //파일 업로드 객체 생성
		logger.info("uploadFile1: " + uploadFile1+", uploadFile2: " + uploadFile2);
		System.out.println("uploadBoard() 처리 중");
		
		if(!uploadFile1.isEmpty() && !uploadFile2.isEmpty()) {
			String tPic1 = uploadFile1.getOriginalFilename();
			String tPic2 = uploadFile2.getOriginalFilename();
			String rootPath = httpSession.getServletContext().getRealPath("/");
			String attachPath ="/WEB-INF/boardImages/";
			System.out.println(rootPath+attachPath+tPic1);
			System.out.println(rootPath+attachPath+tPic2);
			
			uploadFile1.transferTo(new File(rootPath+attachPath+tPic1)); //해당 경로에 받은 이름의 파일을 만들어 저장
			uploadFile2.transferTo(new File(rootPath+attachPath+tPic2)); //해당 경로에 받은 이름의 파일을 만들어 저장
			togetherBoardVO.settPic1(tPic1);
			togetherBoardVO.settPic2(tPic2);
		}
		return togetherBoardVO;
	}
	
	public List<TogetherReplyVO> getReply(int tNo) {
		System.out.println("TogetherBoardService에서 getBoardReply 처리");
		return togetherBoardDAO.getReply(tNo);
	}
	
	public TogetherReplyVO insertReply(TogetherReplyVO togetherReplyVO) {
		System.out.println("TogetherBoardServiceImpl insertReply처리");
		int trNo = togetherBoardDAO.insertReply(togetherReplyVO);
		return togetherBoardDAO.getReplyOne(trNo);
	}
	
	public TogetherReplyVO updateReply(TogetherReplyVO togetherReplyVO) {
		logger.info("");
		togetherBoardDAO.updateReply(togetherReplyVO);
		return togetherBoardDAO.getReplyOne(togetherReplyVO.getTrNo());
	}
	
	public int deleteReply(int trNo) {
		System.out.println("TogetherBoardServiceImpl deleteReply처리");
		return togetherBoardDAO.deleteReply(trNo);
	}
	
	public TogetherBoardVO checkJoin(TogetherMemberVO togetherMemberVO, String joinOrCancle) {
		logger.info("togetherMemberVO: "+togetherMemberVO+", joinOrCancle: "+joinOrCancle);
		
		if(joinOrCancle.equals("참여하기")) {
			int insertSuccess = togetherBoardDAO.insertJoin(togetherMemberVO);
			System.out.println("insertSuccess: "+insertSuccess);
		}else if(joinOrCancle.equals("참여취소")){
			int deleteSuccess = togetherBoardDAO.cancleJoin(togetherMemberVO);
			System.out.println("deleteSuccess: "+deleteSuccess);
		}
		int updateSuccess = togetherBoardDAO.updateJoin(togetherMemberVO, joinOrCancle);
		System.out.println("updateSuccess: "+ updateSuccess);
		return togetherBoardDAO.getJoinResult(togetherMemberVO);
	}
	
	public int checkBookmark(int tNo, int boomark, int uNo) {
		logger.info("tNo"+tNo+",uNo: "+uNo+", boomark: "+boomark);
		int Success = 0;
		
		// 이미 체크된 북마크를 다시 누른 상황
		if(boomark == 1) {
			int deleteSuccess = togetherBoardDAO.deleteBookmark(tNo, uNo);
			logger.info("deleteSuccess: "+deleteSuccess);
		// 체크가 안된 북마크를 누른 상황
		}else if(boomark == 0) {
			int insertSuccess = togetherBoardDAO.insertBookmark(tNo, uNo);
			logger.info("insertSuccess: "+insertSuccess);
			Success = 1;
		}
		return Success;
	}
	
	//검색에 대한 부분
	public List<TogetherBoardVO> searchBoardList(String searchInput, int startNo) {
		logger.info("searchInput: "+searchInput+",startNo: "+startNo);
		return  togetherBoardDAO.searchBoardList(searchInput, startNo);
	} 
	
	public List<TogetherBoardVO> previewBoardList(String searchInput) {
		logger.info("searchInput: "+searchInput);
		return  togetherBoardDAO.previewBoardList(searchInput);
	} 
	
	public List<TogetherBoardVO> sortBoardList(String sortInput, String tHeader, int startNo, int uNo){
		logger.info("sortInput: "+sortInput+", tHeader: "+tHeader+"uNo: "+uNo);
		return togetherBoardDAO.sortBoardList(sortInput, tHeader, startNo, uNo);
	}
	
	public int countTotalSearch(String searchInput) {
		return togetherBoardDAO.countTotalSearch(searchInput);
	}
}
