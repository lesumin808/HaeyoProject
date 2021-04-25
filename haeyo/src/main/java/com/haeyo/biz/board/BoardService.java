package com.haeyo.biz.board;

import java.util.List;

import com.haeyo.biz.user.UserVO;

public interface BoardService {
	void insertBoard(BoardVO boardVO);
	void updateBoard(BoardVO boardVO);
	void deleteBoard(int tNo);
	BoardVO getBoard(int tNo);
	List<BoardVO> getBoardList(UserVO userVO);
}
