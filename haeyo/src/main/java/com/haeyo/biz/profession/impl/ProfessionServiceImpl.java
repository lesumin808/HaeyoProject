package com.haeyo.biz.profession.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haeyo.biz.profession.ProfessionBookmarksVO;
import com.haeyo.biz.profession.ProfessionListVO;
import com.haeyo.biz.profession.ProfessionService;
import com.haeyo.biz.profession.ProfessionSubVO;
import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.reservation.ReservationVO;

@Service("ProfessionService")
public class ProfessionServiceImpl implements ProfessionService {
	private static final Logger logger = LoggerFactory.getLogger(ProfessionServiceImpl.class);

	@Autowired
	HttpSession session;

	@Autowired
	private ProfessionDAO professionDAO;

	@Override
	public List<ProfessionListVO> getProList(ProfessionListVO vo) throws Exception {
		System.out.println("전문가 추천 리스트 출력");
		return professionDAO.getProList(vo);
	}

	@Override
	public List<ProfessionListVO> getAllList(ProfessionListVO vo) throws Exception {
		System.out.println("전문가 서비스 전체 리스트 출력");
		System.out.println(session.getAttribute("user"));
		return professionDAO.getAllList(vo);
	}

	@Override
	public ProfessionListVO getDetail(ProfessionListVO vo) throws Exception {
		System.out.println("전문가 디테일 페이지");
		return professionDAO.getDetail(vo);
	}

	@Override
	public List<ProfessionListVO> getReview(ProfessionListVO vo) throws Exception {
		System.out.println("전문가 리뷰 페이지");
		return professionDAO.getReview(vo);
	}

	@Override
	public ProfessionSubVO getSubCate(ProfessionListVO vo) throws Exception {
		System.out.println("서브카테고리 가져오기");
		if (vo.getpCategory().equals("수리")) {
			System.out.println("수리");
//			ProfessionSubVO proRepair = professionDAO.RepairCate(vo);
			return professionDAO.RepairCate(vo);
		} else if (vo.getpCategory().equals("이사")) {
			return professionDAO.MovingCate(vo);
		}
		return professionDAO.CleaningCate(vo);
	}

	@GetMapping("/test")
	@ResponseBody
	public String test(@RequestBody Map<String, Object> param) throws Exception {
		String pNo = param.get("pNo").toString();
		return pNo;
	}

	// 전문가 select ajax테스트
	@Override
	public List<ProfessionListVO> getList(ProfessionListVO vo) throws Exception {
		logger.info("전문가 ajax리스트: " + vo);
		return professionDAO.getLList(vo);
	}

	// 북마크
	@Override
	public int checkBook(ProfessionBookmarksVO vo, HttpSession session) throws Exception {
		if (session.getAttribute("user") != null) {
			logger.info("checkBookService 타기 : " + vo);
			logger.info("professionDAO.selectBook(vo) : " + professionDAO.selectBook(vo));
			if (professionDAO.selectBook(vo) == null) {
				logger.info("professionDAO.selectBook(vo) : " + professionDAO.selectBook(vo));
				professionDAO.insertBook(vo);
				return 0;
			} else {
				professionDAO.deleteBook(vo);
				System.out.println(professionDAO.deleteBook(vo));
				return 1;
			}
		} else {
			return -1;
		}
	}

	// 전문가 예약일정 셀렉트
	@Override
	public List<ReservationVO> getproReservation(ProfessionVO vo) throws Exception {
		logger.info("getproReservation: " + vo);
		return professionDAO.selectProReservation(vo);
	}

		// 210407 장현아 전문가 회원가입
		public void insertPro(ProfessionVO vo) {
			professionDAO.insertPro(vo);
		}
		
		//210408 장현아 전문가 세부내용 저장
		public void insertProCate01(ProfessionVO vo) {
			professionDAO.insertProCate01(vo);
		}
		
		public void insertProCate02(ProfessionVO vo) {
			professionDAO.insertProCate02(vo);
		}
		
		public void insertProCate03(ProfessionVO vo) {
			professionDAO.insertProCate03(vo);
		}
}
