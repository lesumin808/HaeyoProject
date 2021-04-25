package com.haeyo.web.board.impl;

import org.springframework.ui.Model;

import com.haeyo.biz.board.BoardVO;
import com.haeyo.biz.board.impl.SingleBoardVO;
import com.haeyo.web.board.BoardController;

public class SingleBoardController {

	public String insertBoard(SingleBoardVO boardVO) {
		return "singleboard";
	}

	public String updateBoard(BoardVO boardVO) {
		return "singleboard";
	}

	public String deleteBoard(int tNo) {
		return "singleboard";
	}

	public String getBoard(int tNo, Model model) {
		return "singleboard";
	}

	public String getBoardList(Model model) {
		// TODO Auto-generated method stub
		return "singleboard";
	}

}
