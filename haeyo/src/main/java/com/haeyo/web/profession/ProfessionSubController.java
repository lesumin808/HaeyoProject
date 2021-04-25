package com.haeyo.web.profession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.haeyo.biz.profession.ProfessionListVO;
import com.haeyo.biz.profession.ProfessionService;
import com.haeyo.web.board.impl.TogetherBoardController;

@RestController
public class ProfessionSubController {
	private static final Logger logger = LoggerFactory.getLogger(ProfessionSubController.class);
	
	@Autowired
	private ProfessionService professionService;
	
	@RequestMapping(value="/subCategory.do", method=RequestMethod.GET, produces="application/text;charset=utf-8")
	@ResponseBody
	public String getSubCate(ProfessionListVO vo) throws Exception {
		System.out.println(professionService.getSubCate(vo));
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(professionService.getSubCate(vo));
		return jsonString;
	}
}
