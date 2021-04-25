package com.haeyo.web.board;

import org.springframework.ui.Model;

import com.haeyo.biz.board.BoardVO;

public interface BoardController {
	String insertBoard(BoardVO boardVO);
	String updateBoard(BoardVO boardVO);
	String deleteBoard(int tNo);
	String getBoard(int tNo, Model model);
	String getBoardList(Model model);
}
