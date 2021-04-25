package com.haeyo.biz.board.impl;

import java.util.List;

public class TogetherBoardListVO {
	private List<TogetherBoardVO> boardList;

	public List<TogetherBoardVO> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<TogetherBoardVO> boardList) {
		this.boardList = boardList;
	}

	@Override
	public String toString() {
		return "TogetherBoardListVO [boardList=" + boardList + "]";
	}
	  
}
