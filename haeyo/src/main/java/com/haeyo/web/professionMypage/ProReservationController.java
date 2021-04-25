package com.haeyo.web.professionMypage;

import java.sql.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.professionMypage.impl.CompleteCountVO;
import com.haeyo.biz.professionMypage.impl.ProfessionReservationServiceImpl;
import com.haeyo.biz.reservation.ReservationCalVO;
import com.haeyo.biz.reservation.ReservationVO;
import com.haeyo.biz.user.UserVO;

@Controller
public class ProReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProReservationController.class);
	
	@Autowired
	private ProfessionReservationServiceImpl proRsvServiceImpl;
	
	@Autowired
	HttpSession session;
		
	
	@GetMapping("/getRsvListView.do")
	public String getRsvListView(Model model) {
		System.out.println("getRsvListView controller 진행");
		logger.info("session: " + session.getAttribute("user"));
		logger.info("session: " + session.getAttribute("profession"));
//		ProfessionVO pro = (ProfessionVO) session.getAttribute("profession");
//		int pNo = pro.getpNo();
//		model.addAttribute("pNo", pNo);
//		model.addAttribute("user", session.getAttribute("user"));
		return "proRSV.list";
	}
	
	@GetMapping("/getReservationList.do")
	@ResponseBody
	public List<ReservationCalVO> getReservationList(@RequestParam int pNo, Model model) {
	  System.out.println("getReservationList controller 진행");
      logger.info("param :" + pNo);
	  
	  List<ReservationCalVO> proRsvList = proRsvServiceImpl.getReservationList(pNo);
      logger.info("proRsvList: " + proRsvList);
	  return proRsvList;
	}
	
	@GetMapping("/getCompleteView.do")
	public String getCompleteView(Model model) {
		System.out.println("getCompleteView controller 진행");
		logger.info("session: " + session.getAttribute("user"));
		logger.info("session: " + session.getAttribute("profession"));
//		ProfessionVO pro = (ProfessionVO) session.getAttribute("profession");
//		int pNo = pro.getpNo();
//		model.addAttribute("pNo", pNo);
//		model.addAttribute("user", session.getAttribute("user"));
		return "proRSV.complete";
	}
	
	@GetMapping("/getProCompleteList.do")
	@ResponseBody
	public List<ReservationVO> getProCompleteList(@RequestParam Date startDate, Date endDate) {
	  System.out.println("getProCompleteList controller 진행");
	  
	  logger.info("session : " + session);
	  ProfessionVO pro = (ProfessionVO) session.getAttribute("profession");
	  int pNo = pro.getpNo();
	  
	  logger.info("pNo : " + pNo);
	  logger.info("startDate : " + startDate);
	  logger.info("endDate : " + endDate);
	  
	  Map<String, Object> params = new HashMap<String, Object>();
	  params.put("pNo", pNo);
	  params.put("startDate", startDate);
	  params.put("endDate", endDate);
	  
 	  List<ReservationVO> proComList = proRsvServiceImpl.getProCompleteList(params);
      logger.info("proRsvList: " + proComList);
	  return proComList;
	}
	
	@GetMapping("/getCompleteCount.do")
	@ResponseBody
	public CompleteCountVO getCompleteCount(Model model) {
	  System.out.println("getCompleteCount controller 진행");
	  
	  ProfessionVO pro = (ProfessionVO) session.getAttribute("profession");
	  int pNo = pro.getpNo();
	  logger.info("pNo : " + pNo);
   
	  CompleteCountVO proComCount = proRsvServiceImpl.getCompleteCount(pNo);
      logger.info("proComCount: " + proComCount);
	  
      return proComCount;
	}
	
	

}
