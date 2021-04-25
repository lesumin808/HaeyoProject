package com.haeyo.biz.professionMypage.impl;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.haeyo.biz.profession.ProfessionSubVO;
import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.user.UserVO;

public interface ProfessionMypageService {
	void updateProfile(ProfessionVO vo, MultipartHttpServletRequest request) throws Exception;
	void insertSubCate(ProfessionSubVO subvo, ProfessionVO vo);
//    void deleteProfile(ProfessionVO vo);
    void deleteProfile(int pNo);
    void deleteSubCate(ProfessionVO ProVO);
//	ProfessionVO getProfile(ProfessionVO vo);
    ProfessionSubVO getSubCategory(int pNo, String pCategory);
    ProfessionVO getProfile(UserVO user);
//    ProfessionVO getProfile(int uNo);
//	ProfessionVO uploadFiles(ProfessionVO vo) throws Exception;
}
