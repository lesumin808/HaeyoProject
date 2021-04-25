package com.haeyo.biz.user.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haeyo.biz.reservation.alramVO;
import com.haeyo.biz.user.UserService;
import com.haeyo.biz.user.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService {
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserDAOMybatis userDAO;
	
	@Autowired
	UserService userservice;
	
	@Autowired
	HttpSession session;
	
	//장현아
	/* 회원가입 */
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}

	/* 로그인  */
	@Override
	public UserVO getUser(UserVO vo) {
		logger.info("UserVO"+vo);
		return userDAO.getUser(vo);
	}
	
	//아이디 중복 확인
	@Override
	public int idChk(String uEmail) throws Exception {
		return userDAO.idChk(uEmail);
	}

	//셀렉트 알림
	@Override
	public List<alramVO> selectAlram(String uEmail) throws ParseException {
		logger.info("selectAlram서비스 진입 uEmail : " + uEmail);
		List<alramVO> alram = userDAO.selectAlram(uEmail);
		
		//현재 시각 구하기
		Date today = new Date();
		System.out.println(today);
		Date dateNow = new Date(System.currentTimeMillis());
		
		
		for (alramVO list : alram) {
			System.out.println(list);
			list.getAlCredate();
			System.out.println(list.getAlCredate());
			
			String alramDatetxt = list.getAlCredate();
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date alramDate = fm.parse(alramDatetxt);
			
			long subtime = (today.getTime() - alramDate.getTime())/60000;
			//분으로 표기
			
			System.out.println(subtime);
			
			//분으로 나오니까 60 이상
			
			if(subtime >= 10080) {
				userDAO.deleteAlarm(list.getAlNo());
			}else if(subtime > 1440) {
				list.setSubTime((int)(subtime/60/24) + "일 전");
			}else if(subtime > 60) {
				list.setSubTime((int)(subtime/60) + "시간 전");
			}
			else if(subtime > 1) {
				list.setSubTime((int)(subtime) + "분 전");
			}else {
				list.setSubTime("방금 전");
			}
		
		}
		return alram;
	}

}