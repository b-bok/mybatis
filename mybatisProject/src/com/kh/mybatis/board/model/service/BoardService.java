package com.kh.mybatis.board.model.service;

import java.util.ArrayList;

import com.kh.mybatis.board.model.vo.Board;
import com.kh.mybatis.board.model.vo.Reply;
import com.kh.mybatis.common.model.vo.PageInfo;

public interface BoardService {

	
	
	// 1. 게시판리스트 요청시
	int selectListCount();
	
	ArrayList<Board> selectList(PageInfo pi);
	
	
	// 2. 게시판 검색 요청시
	int selectSearchCount(String condition, String keyword);
	
	ArrayList<Board> selectSearchList(String condition, String keyword, PageInfo pi);
	

	// 3. 게시판 상세조회 요청시
	int increaseCount(int bno);
	
	Board selectDetailBoard(int bno);
	
	ArrayList<Reply> selectReplyList(int bno);
	
	
	
}
