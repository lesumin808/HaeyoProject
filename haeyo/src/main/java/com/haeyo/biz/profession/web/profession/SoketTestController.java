package com.haeyo.biz.profession.web.profession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SoketTestController {
	/*
	 * //채팅방 입장
	 * 
	 * @GetMapping("/chat.do") public String view_chat(HttpServletRequest request,
	 * HttpServletResponse response, Model model) throws Exception { return
	 * "view_chat"; }
	 */

	@GetMapping("/chat.do")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("view_chat");
		return mv;
	}
}
