package com.haeyo.web.user;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.haeyo.biz.reservation.alramVO;
import com.haeyo.biz.user.UserService;
import com.haeyo.biz.user.UserVO;
import com.haeyo.biz.user.impl.UserServiceImpl;

@Controller
@SessionAttributes("user")
public class UserLoginController {
	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	@Autowired
	public UserServiceImpl userServiceImpl;

	@Autowired
	UserService userservice;

	@PostMapping("/insertUser.do")
	public String insertUser(@ModelAttribute UserVO vo) throws Exception {
		
		String uPwd = "";		// 인코딩 전 비밀번호
		String encodePw = ""; 	// 인코딩 후 비밀번호
		
		uPwd = vo.getuPwd(); 				// 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(uPwd);	// 비밀번호 인코딩
		vo.setuPwd(encodePw); 				// 인코딩된 비밀번호 vo객체에 다시 저장
		
		// 회원가입 쿼리 실행
		logger.info("UserVO : " + vo);
		userServiceImpl.insertUser(vo); //
		return "user.login";
	}

	@PostMapping("/insertPass.do")
	public String insertPass(@ModelAttribute UserVO vo) throws Exception {
		logger.info("UserVO : " + vo);
		userServiceImpl.insertUser(vo); //
		return "user.join_pro";
	}

	// 로그인이 실행되는 컨트롤
	@PostMapping("/login.do")
	public String login(HttpServletRequest request, UserVO vo, RedirectAttributes rttr) throws Exception {
		// logger.info("UserVO : " + vo);
		// model.addAttribute("user", userServiceImpl.getUser(vo));

		/*HttpSession session = request.getSession();
		UserVO vo1 = userServiceImpl.getUser(vo);

		if (vo1 == null) { // 아이디, 비밀번호 불일치
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "user.login";
		}

		session.setAttribute("vo", vo1); // 아이디, 비밀번호 일치

		return "haeyo.index";*/
		
		HttpSession session = request.getSession();
		String uPwd = "";
		String encodePw = "";
		
		UserVO vo1 = userservice.getUser(vo);	// 제출한 아이디와 일치하는 아이디가 있는지
		
		if(vo1 != null) {	//일치하는 아이디 존재 시
			
			uPwd = vo.getuPwd();		//사용자가 제출한 비밀번호
			encodePw = vo1.getuPwd();	//데이터베이스에 저장한 인코딩된 비밀번호
			
			if(true == pwEncoder.matches(uPwd, encodePw)) {		//비밀번호 일치여부 판단
				
				vo1.setuPwd(""); 					//인코딩된 비밀번호 정보 지움
				session.setAttribute("vo", vo1); 	//session에 사용자의 정보 저장
				return "haeyo.index";				//메인 페이지로 이동
				
			} else {
				
				rttr.addFlashAttribute("result", 0);
				return "user.login";	//로그인 페이지로 이동
				
			}
			
		} else {			//일치하는 아이디가 존재하지 않을 시
			
			rttr.addFlashAttribute("result", 0);
			return "user.login";	//로그인 페이지로 이동
		}
		
	}

	// 아이디 중복 검사
	@PostMapping(value = "/idChk.do")
	@ResponseBody
	public String idChk(@RequestParam String uEmail) throws Exception {
		logger.info("idChk() 진입");
		int result = userservice.idChk(uEmail);
		logger.info("결과값 =" + result);
		if (result != 0) {
			return "fail"; // 중복 아이디 존재
		} else {
			return "success"; // 중복 아이디 존재X
		}

	} // IdChkPOST() 종료

//	@PostMapping("/login.do")
//	public String login(UserVO vo, Model model) {
//		logger.info("UserVO Controller : " + vo);
//		model.addAttribute("user", userServiceImpl.getUser(vo));
//		if (vo.getuEmail() != null) {
//			return "haeyo.index";
//		} else {
//			return "user.login";
//		}
//	}

	// 로그인 시 불러오는 알림 - 이수민 210408
	@GetMapping("/selectAlram.do")
	@ResponseBody
	public List<alramVO> selectAlram(@RequestParam String uEmail) throws ParseException {
		logger.info("selectAlram컨트롤러 진입 uEmail : " + uEmail);
		logger.info("userServiceImpl.selectAlram(uEmail) 결과 : " + userServiceImpl.selectAlram(uEmail));
		return userServiceImpl.selectAlram(uEmail);
	}
}
