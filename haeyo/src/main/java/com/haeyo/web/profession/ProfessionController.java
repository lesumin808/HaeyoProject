package com.haeyo.web.profession;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haeyo.biz.profession.ProfessionBookmarksVO;
import com.haeyo.biz.profession.ProfessionListVO;
import com.haeyo.biz.profession.ProfessionService;
import com.haeyo.biz.profession.ProfessionSubVO;
import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.reservation.ReservationVO;

@Controller
public class ProfessionController {
	private static final Logger logger = LoggerFactory.getLogger(ProfessionController.class);

	@Autowired
	private ProfessionService professionService;

	@GetMapping("/checkList.do")
	public String viewCheckList() throws Exception {
		return "profession.check";
	}

	@GetMapping("/recommend.do")
	public String getProList(ProfessionListVO vo, Model model) throws Exception {
		System.out.println("전문가 컨트롤러 처리");
		String serchloc = vo.getSerchloc();
		model.addAttribute("serchloc", serchloc);
		logger.info("serchloc" + serchloc);
		model.addAttribute("proRecom", professionService.getProList(vo));
		logger.info("professionService.getProList(vo)" + professionService.getProList(vo));
		model.addAttribute("proList", professionService.getAllList(vo));
		System.out.println(model);
		return "profession.list";
	}

	@GetMapping("/detail.do")
	public String getDetail(ProfessionListVO vo, Model model) throws Exception {
		System.out.println("전문가 디테일 컨트롤러");
		model.addAttribute("proDetail", professionService.getDetail(vo));
		model.addAttribute("proReview", professionService.getReview(vo));
		model.addAttribute("proSubCate", professionService.getSubCate(vo));
		logger.info("professionService.getSubCate(vo)" + professionService.getSubCate(vo));
		return "profession.detail";
	}

	@RequestMapping(value = "/getList.do", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<ProfessionListVO> getList(@ModelAttribute ProfessionListVO vo) throws Exception {
		logger.info("getAllList" + professionService.getList(vo));
		List<ProfessionListVO> proList = professionService.getList(vo);
		logger.info("proList" + proList);

		return proList;
	}

	// 북마크
	@RequestMapping(value = "/bookmark.do", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public int bookmark(@ModelAttribute ProfessionBookmarksVO vo, HttpSession session) throws Exception {
		logger.info("bookmark vo : " + vo);
		return professionService.checkBook(vo, session);
	}

	// 전문가일정 가져오기
	@RequestMapping(value = "/calendal.do", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<ReservationVO> calendarView(@ModelAttribute ProfessionVO vo, Model model) throws Exception {
		logger.info("캘린더 리스트 : " + vo);
		logger.info("캘린더 반환 : " + professionService.getproReservation(vo));
		return professionService.getproReservation(vo);
	}

	// 전문가 달력 페이지 연결
	@GetMapping("/viewproCalendar.do")
	public String viewproCalendar(@ModelAttribute ProfessionVO vo, Model model) {
		model.addAttribute("pNo", vo);
		logger.info("viewPorCalendar : " + vo);
		return "calendal";
	}

	// 210407 장현아 전문가 회원가입
	@PostMapping("/insertPro.do")
	public String insertPro(@ModelAttribute ProfessionVO vo, Model model) throws Exception {
		model.addAttribute("uNo", vo);
		logger.info("ProfessionVO : " + vo);
		model.addAttribute("pCategory", vo.getpCategory());
		professionService.insertPro(vo); //
		return "user.join_pro_category";
	}

	// 210408 장현아 전문가 세부내용 저장
	@PostMapping("/insertProCate01.do")
	public String insertProCate01(@ModelAttribute ProfessionVO vo, Model model) throws Exception {
		model.addAttribute("pNo", vo);
		logger.info("ProfessionVO : " + vo);
		professionService.insertProCate01(vo);
		return "user.login";
	}
	
	@PostMapping("/insertProCate02.do")
	public String insertProCate02(@ModelAttribute ProfessionVO vo, Model model) throws Exception {
		model.addAttribute("pNo", vo);
		logger.info("ProfessionVO : " + vo);
		professionService.insertProCate02(vo);
		return "user.login";
	}
	
	@PostMapping("/insertProCate03.do")
	public String insertProCate03(@ModelAttribute ProfessionVO vo, Model model) throws Exception {
		model.addAttribute("pNo", vo);
		logger.info("ProfessionVO : " + vo);
		professionService.insertProCate03(vo);
		return "user.login";
	}
}
