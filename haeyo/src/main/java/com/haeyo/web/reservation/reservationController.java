package com.haeyo.web.reservation;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.haeyo.biz.profession.ReviewsVO;
import com.haeyo.biz.reservation.ReservationCategoryVO;
import com.haeyo.biz.reservation.ReservationVO;
import com.haeyo.biz.reservation.alramVO;
import com.haeyo.biz.reservation.impl.ReservationServiceImpl;

@Controller
public class reservationController {
	private static final Logger logger = LoggerFactory.getLogger(reservationController.class);

	@Autowired
	private ReservationServiceImpl reservationServiceImpl;
	
	@Autowired
	HttpSession session;
	
	//전문가 신청서 컨트롤러
	@GetMapping("/application.do")
	public String application(@ModelAttribute ReservationCategoryVO vo, Model model, HttpSession session) throws JsonProcessingException {
		logger.info("ReservationCategoryVO:"+ vo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(vo);
		model.addAttribute("Catetxt", jsonString);
		model.addAttribute("pCon", vo);
		logger.info("mode" + model);
		return reservationServiceImpl.application(vo);
	}
	
	//전문가 예약상세 컨트롤러
	@GetMapping("/insertReser.do")
	public String insert(@ModelAttribute ReservationVO vo, Model model, HttpSession session) throws JsonProcessingException {
		session.setAttribute("reservation", vo);
		logger.info("session" + session.getAttribute("reservation"));
		logger.info("ReservationVO" + vo);
		model.addAttribute("ReservationInfo", vo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(vo);
		model.addAttribute("Catetxt", jsonString);
		return "profession.pay";
	}

	//전문가 예약삽입 컨트롤러
	@PostMapping("/insertReservation.do")
	public String insertReservation(@ModelAttribute ReservationVO vo) {
		logger.info("ReservationVO : " + vo);
		reservationServiceImpl.insertReservaiton(vo);
		return "profession.complete";
	}
	
	@GetMapping("/insertAlram.do")
	@ResponseBody
	public void insertAlram(@ModelAttribute alramVO vo) {
		logger.info("insertAlram" + vo);
		//서비스 임플에 vo를 넣어서 insert한다
		reservationServiceImpl.insertAlram(vo);
	}
	
	//리뷰 출력
	@GetMapping("/ajaxReview.do")
	@ResponseBody
	public ReviewsVO ajaxReview(@ModelAttribute ReviewsVO vo) {
		logger.info("ReviewsVO ajaxReview : " + vo);
		return reservationServiceImpl.ajaxReview(vo);
	}
	
}







