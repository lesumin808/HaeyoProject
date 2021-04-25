package com.haeyo.biz.user;

public interface UserMypageService {

	UserVO selectOneUser(UserVO vo);
	
	void selectPwdUser(UserVO vo);
	
	void deleteoneUser(int uNo);
	
	void updateMypage(UserVO vo);	//유저 마이페이지 정보 수정update
	
	UserVO uploadUserPic(UserVO vo) throws Exception;	//유저 마이페이지 프로필 사진 
}
