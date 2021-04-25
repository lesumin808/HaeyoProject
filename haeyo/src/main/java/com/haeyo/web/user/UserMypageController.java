package com.haeyo.web.user;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.deser.DataFormatReaders.Match;
import com.google.gson.Gson;
import com.haeyo.biz.user.UserService;
import com.haeyo.biz.user.UserVO;
import com.haeyo.biz.user.impl.UserMypageServiceImpl;
import com.haeyo.biz.user.impl.UserServiceImpl;

@Controller
@SessionAttributes("user")		// 세션에 user객체를 보관해라
public class UserMypageController {
	private static final Logger logger = LoggerFactory.getLogger(UserMypageController.class);
	
	@Autowired
	public UserMypageServiceImpl userMypageServiceImpl;

	@Autowired
	HttpSession session;
	
	//유저 마이페이지 댓글 모아보기 
	@RequestMapping(value="/getUserReply.do", method=RequestMethod.GET)
	public String getUserReply(@RequestParam("uNo")int uNo, Model model) {
		logger.info("파라미터"+uNo);
		model.addAttribute("tReplyList", userMypageServiceImpl.getUserReply(uNo));
		UserVO user = (UserVO)session.getAttribute("user");
		model.addAttribute("user", user);
		return "userMypage.Reply";
	}
	
	//유저 마이페이지 내가 쓴 댓글 삭제하기  trNo로  내 댓글 개별
	@RequestMapping(value="/deleteUserReply.do", method=RequestMethod.GET)
		public String deleteUserReply(@RequestParam("trNo")int trNo, Model model) {
			logger.info("파라미터"+trNo);
			model.addAttribute("tReplyList", userMypageServiceImpl.deleteUserReply(trNo));		
			UserVO user = (UserVO)session.getAttribute("user");
			int uNo = user.getuNo();
			return "redirect:getUserReply.do?uNo="+uNo;
		}
		
	//유저 마이페이지 내가 쓴 댓글 전체삭제하기    uNo로 내 댓글 전체 
	@RequestMapping(value="/deleteUserAllReply.do", method=RequestMethod.GET)
		public String deleteUserAllReply(@RequestParam("uNo")int uNo, Model model) {
			logger.info("deleteUserAllReply파라미터"+uNo);
			model.addAttribute("tReplyList", userMypageServiceImpl.deleteUserAllReply(uNo));
			return "redirect:getUserReply.do?uNo="+uNo;
		}
	

	
	
	
	//마이페이지 전체 수정화면 보여주기 
	@GetMapping("/UserMypageInfoUpdate.do")
	public String getUpdateMypage(Model model, HttpSession session) {
		
		return "userMypage.InfoUpdate";
	}
		
	
	// @ModelAttribute("user")를 해주면 vo에 session에 있는 user를 채워넣고, 브라우저가 보낸 수정된 부분만 갱신한다
	@PostMapping("/updateMypage.do")
	public String updateMypage(@ModelAttribute("user") UserVO vo, Model model) throws Exception {
		System.out.println("UserMypageController updateMypage 냥냥 ");
		logger.info("MypageUpdatecontroller updateMypage" + vo);

		userMypageServiceImpl.uploadUserPic(vo);
		userMypageServiceImpl.updateMypage(vo);
		
		model.addAttribute("user", vo);		// 세션에 다시 user가 저장된다
		
		return "userMypage.Info";
	}
	//마이페이지 유저 비밀번호 열람화면 
	@GetMapping("/getUpdatePwdUser.do")	 
	public String getUpdatePwdUser(HttpSession session) {
		
		return "userMypage.Pwd";
	}
	
	//마이페이지 유저 비밀번호 변경하기
	@PostMapping("/getUpdatePwdUser.do")
	public String updateUserPwd(@ModelAttribute("user") UserVO vo) throws Exception{
		System.out.println("UserMypageController updateUserPwd 컴온" + vo + "    가져왔다 1");
		
		userMypageServiceImpl.updateUserPwd(vo);
		logger.info("UserMypageController updateUserPwd update를 해볼까 ?2 " + vo);
		
		UserVO user = (UserVO)session.getAttribute("user");
		logger.info("UserMypageController updateUserPwd 세션으로 저장!~ 3 " + vo);

		return "userMypage.Info";
	}
	
	@GetMapping("/getOnePwd.do")	
	@ResponseBody //마이페이지 유저 비밀번호 셀렉 
	public UserVO selectOnePwd() {
		UserVO user = (UserVO) session.getAttribute("user");
		logger.info("Controller selectOnePwd~~~2" + user);

		UserVO result = userMypageServiceImpl.selectOnePwd(user);
		System.out.println("UserCont selectOnePwd result" + result);
		return result;
			
	}
	
	
	
	// 마이페이지 인포화면 뷰
	@GetMapping("/mypageinfo.do")
	public String selectOneUser(Model model, HttpSession session) {
		logger.info("GetMapping__session" + session.getAttribute("user"));
		UserVO user = (UserVO)session.getAttribute("user");
		System.out.println("마이페이지 인포 화면에 회원 데이터 출력");
		// model에 user로 저장하면 user이름이 session에 저장되도록 했으므로 세션에 보관됨
		model.addAttribute("user", userMypageServiceImpl.selectOneUser(user));
		logger.info("user result" + userMypageServiceImpl.selectOneUser(user));

		//session.setAttribute("user", userServiceImpl.selectOneUser(user));
		//return "redirect: mypageinfo.do";		
		return "userMypage.Info";
	}
	
	//회원 탈퇴
	@RequestMapping(value="/deleteoneUser.do", method=RequestMethod.GET)
	public String deleteoneUser(HttpSession session, @RequestParam("uNo") int uNo) {
		userMypageServiceImpl.deleteoneUser(uNo);
		logger.info("UserMypageController 회원 탈퇴 !  uNo" + uNo);
		return "haeyo.index";
	}
		
}