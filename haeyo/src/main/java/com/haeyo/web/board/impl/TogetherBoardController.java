package com.haeyo.web.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haeyo.biz.user.UserVO;
import com.haeyo.biz.board.BoardVO;
import com.haeyo.biz.board.impl.TogetherPagingVO;
import com.haeyo.biz.board.impl.TogetherBoardServiceImpl;
import com.haeyo.biz.board.impl.TogetherBoardVO;
import com.haeyo.biz.board.impl.TogetherDestinationVO;
import com.haeyo.biz.board.impl.TogetherMemberVO;
import com.haeyo.biz.board.impl.TogetherReplyVO;

@Controller
public class TogetherBoardController {
	private static final Logger logger = LoggerFactory.getLogger(TogetherBoardController.class);
	
	@Autowired
	public TogetherBoardServiceImpl togetherBoardServiceImpl;
	
	@Autowired
	HttpSession session;
	
	@PostMapping("/t_insertBoard.do")
	public String insertBoard(@ModelAttribute TogetherBoardVO togetherBoardVO, @ModelAttribute TogetherDestinationVO togetherDestinationVO) throws Exception {
		logger.info("togetherBoardVO:"+togetherBoardVO+"togetherDestinationVO: "+togetherDestinationVO);
		togetherBoardVO = togetherBoardServiceImpl.uploadBoard(togetherBoardVO);
		logger.info("togetherBoardVO:"+togetherBoardVO);
		togetherBoardServiceImpl.insertBoard(togetherBoardVO,togetherDestinationVO);
		return "redirect:t_openBoardList.do";
	}
	
	@RequestMapping("/t_getUpdateBoard.do")
	public String getUpdateBoard(Model model, @RequestParam int tNo) {
		model.addAttribute("board",togetherBoardServiceImpl.getUpdateBoard(tNo));
		return "board.togetherUpdateBoard";
	}
	
	@PostMapping("/t_updateBoard.do")
	public String updateBoard(@ModelAttribute TogetherBoardVO togetherBoardVO, @ModelAttribute TogetherDestinationVO togetherDestinationVO) throws Exception {
		logger.info("첫 파라미터:"+togetherBoardVO+"togetherDestinationVO: "+togetherDestinationVO);
		
		UserVO userVO = (UserVO) session.getAttribute("user");
		togetherBoardVO = togetherBoardServiceImpl.uploadBoard(togetherBoardVO);
		logger.info("업로드 후 파라미터:"+togetherBoardVO);
		togetherBoardServiceImpl.updateBoard(togetherBoardVO,togetherDestinationVO);
		return "redirect:t_openBoardList.do";
	}

	@RequestMapping("/t_deleteBoard.do")
	public String deleteBoard(@RequestParam("tNo") int tNo) {
		logger.info("");
		togetherBoardServiceImpl.deleteBoard(tNo);
		return "redirect:t_openBoardList.do";
	}

	@RequestMapping(value="/t_getBoard.do", method=RequestMethod.GET)
	public String getBoard(@RequestParam("tNo") int tNo, HttpSession session, @RequestParam String tHeader, Model model) {
		logger.info("파라미터"+tNo);
		
		UserVO userVO = (UserVO) session.getAttribute("user");
		int uNo = userVO.getuNo();
//		UserVO userVO = new UserVO();
//		int uNo = 10001;
//		userVO.setuNo(uNo);
		
		//게시글 정보
		model.addAttribute("board", togetherBoardServiceImpl.getBoard(tNo, uNo , tHeader));
		//댓글 정보
		model.addAttribute("ReplyList", togetherBoardServiceImpl.getReply(tNo));
		//현재 접속중인 유저의 정보
		model.addAttribute("userVO", togetherBoardServiceImpl.getUserInfo(userVO));
		
		return "board.togetherBoard";
	}
	
	//main=>종합 리스트
	@RequestMapping("/t_getBoardMain.do")
	public String getBoardMain(Model model) {
		logger.info("");
		UserVO userVO = (UserVO) session.getAttribute("user");
//		UserVO userVO = new UserVO();
//		int uNo = user.getuNo();
//		userVO.setuNo(10001);
		
		model.addAttribute("boardList",togetherBoardServiceImpl.getBoardMain(userVO));
		return "board.togetherMain"; //jsp로 이동
	}
	
	@RequestMapping("/t_getBoardMainTime.do")
	@ResponseBody
	public List<TogetherBoardVO> getBoardMainTime(Model model, HttpSession session) {
		logger.info("");
//		UserVO userVO = new UserVO();
//		userVO.setuNo(10001);
		UserVO userVO = (UserVO) session.getAttribute("user");
		int uNo = userVO.getuNo();
		
		
		return togetherBoardServiceImpl.getBoardMain(userVO);
		
	}
	
	//카테고리별 게시글 리스트
	@RequestMapping("/t_getBoardList.do")
	@ResponseBody
	public Map<String,Object> getBoardList(Model model, HttpSession session, @RequestParam String tHeader,
			@RequestParam int nowPage ) {
		logger.info("tHeader: " + tHeader+", nowPage: "+nowPage);
		
		UserVO userVO = (UserVO) session.getAttribute("user");
//		int uNo = user.getuNo();
//		UserVO userVO = new UserVO();
//		userVO.setuNo(10001);
		
		//전체 게시글수
		int total = togetherBoardServiceImpl.countTotalBoard(tHeader);
		if(nowPage == 0) {
			nowPage = 1;
		}
		//전체 게시글수와 현재 페이지로 페이징 계산
		TogetherPagingVO pagingVO = new TogetherPagingVO(nowPage, total);
		
		//현재 로그인한 사용자의 위치정보를 얻어옴
		userVO = togetherBoardServiceImpl.getUserLocation(userVO);
		List<TogetherBoardVO> boardList = togetherBoardServiceImpl.getBoardList(userVO, tHeader, pagingVO);
		logger.info("boardList: "+boardList);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("paging", pagingVO);
		result.put("boardList", boardList);
		return result; //ajax방식으로 전달
	}
	
	@RequestMapping("/t_openBoardList.do")
	public String openBoardList(Model model, String tHeader) {
		logger.info("tHeader: " + tHeader);
		UserVO userVO = (UserVO) session.getAttribute("user");
		model.addAttribute("userVO", togetherBoardServiceImpl.getUaddress(userVO));
		model.addAttribute("tHeader", tHeader);
		return "board.togetherBoardList";
	}
	
	@RequestMapping("/t_getWritingBoard.do")
	public String getWritingBoard(Model model) {
		return "board.togetherInsertBoard";
	}
	
	//댓글에 대한 부분
	@RequestMapping("/t_insertReply.do")
	@ResponseBody 
	public TogetherReplyVO insertReply(@ModelAttribute TogetherReplyVO togetherReplyVO) {
		logger.info("togetherReplyVO:"+togetherReplyVO);
		return togetherBoardServiceImpl.insertReply(togetherReplyVO);
	}
	
	@RequestMapping("/t_updateReply.do")
	@ResponseBody
	public TogetherReplyVO updateReply(@ModelAttribute TogetherReplyVO togetherReplyVO) {
		logger.info("togetherReplyVO:"+togetherReplyVO);
		return togetherBoardServiceImpl.updateReply(togetherReplyVO);
	}
	
	@RequestMapping("/t_deleteReply.do")
	@ResponseBody
	public int deleteReply(@RequestParam int trNo) {
		logger.info("trNo:"+trNo);
		int result = togetherBoardServiceImpl.deleteReply(trNo);
		System.out.println(result);
		return result;
	}
	
	//모임 참여,취소
	@RequestMapping("/t_checkJoin.do")
	@ResponseBody
	public TogetherBoardVO checkJoin(@ModelAttribute TogetherMemberVO togetherMemberVO, @RequestParam String joinOrCancle,HttpSession session) {
		logger.info("togetherMemberVO"+togetherMemberVO+"joinOrCancle"+joinOrCancle);
		UserVO user = (UserVO) session.getAttribute("user");
		int uNo = user.getuNo();
		togetherMemberVO.setgNo(uNo);
//		togetherMemberVO.setgNo(10001);
		return togetherBoardServiceImpl.checkJoin(togetherMemberVO, joinOrCancle);
	}

	//북마크 체크,취소
	@RequestMapping("/t_checkBookmark.do")
	@ResponseBody
	public int checkBookmark(@RequestParam int tNo, @RequestParam int bookmark, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		int uNo = user.getuNo();
//		int uNo = 10001;
		logger.info("tNo: "+tNo+",tNo: "+ bookmark+",uNO: "+ uNo);
		return togetherBoardServiceImpl.checkBookmark(tNo, bookmark, uNo);
	}
	
	//검색창
	@RequestMapping("/t_searchBoardList.do")
	@ResponseBody
	public Map<String,Object> searchBoardList(@RequestParam String searchInput, @RequestParam int nowPage){
		logger.info("searchInput: "+searchInput+", nowPage: "+nowPage);

		int total = togetherBoardServiceImpl.countTotalSearch(searchInput);
		logger.info("total: "+total);
		if(nowPage == 0) {
			nowPage = 1;
		}
		
		TogetherPagingVO pagingVO = new TogetherPagingVO(nowPage, total);
		int startNo = pagingVO.getStartNo();
		List<TogetherBoardVO> boardList = togetherBoardServiceImpl.searchBoardList(searchInput, startNo);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("paging", pagingVO);
		result.put("boardList", boardList);
		
		return result;
	}
	
	//검색창 자동완성
	@RequestMapping("/t_previewBoardList.do")
	@ResponseBody
	public List<TogetherBoardVO> previewBoardList(@RequestParam String searchInput){
		logger.info("searchInput: "+searchInput);
		return togetherBoardServiceImpl.previewBoardList(searchInput);
	}
	
	//분류별 정렬
	@RequestMapping("/t_sortBoardList.do")
	@ResponseBody
	public Map<String,Object> sortBoardList(HttpSession session, @RequestParam String sortInput , @RequestParam String tHeader
			, @RequestParam int nowPage){
		
		UserVO user = (UserVO) session.getAttribute("user");
		int uNo = user.getuNo();
//		int uNo = 10001;
		
		logger.info("sortInput: "+sortInput+", tHeader: "+ tHeader+",nowPage: "+nowPage);
		
		int total = togetherBoardServiceImpl.countTotalBoard(tHeader);
		if(nowPage == 0) {
			nowPage = 1;
		}
		
		TogetherPagingVO pagingVO = new TogetherPagingVO(nowPage, total);
		int startNo = pagingVO.getStartNo();
		List<TogetherBoardVO> boardList = togetherBoardServiceImpl.sortBoardList(sortInput, tHeader, startNo, uNo);
		
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("paging", pagingVO);
		result.put("boardList", boardList);
		
		return result;
	}
	
}
