package com.kh.mybatis.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.mybatis.board.model.vo.Board;
import com.kh.mybatis.board.model.vo.Reply;
import com.kh.mybatis.common.model.vo.PageInfo;

public class BoardDao {

	public int selectListCount(SqlSession sqlSession) {
			
		return sqlSession.selectOne("boardMapper.selectListCount");

	}
	
	public ArrayList<Board> selectList(SqlSession sqlSession, PageInfo pi) {
		
		
		//ArrayList<Board> list = (ArrayList)sqlSession.selectList("boardMapper.selectList", pi);
		
		//마이바티스는 페이징 처리를 위해 RowBounds라는 객체 제공
		// RowBounds => 몇개의 게시글 건너뛰고 몇개 조회할건지 정의
		
		
		// * offset : 이번에 조회할 때 몇개의 게시글 건너뛰고 조회할지 값
		// ex) boardLimit : 5
		// currentPage = 1		1~5 		0개의 게시글 건너뛰고 1부터 5개 조회 
		// currentPage = 2 		6~10		5개의 게시글 건너뛰고 6부터 5개 조회
		// currentPage = 3 		11~15		10개의 게시글 건너뛰고 11부터 5개 조회
		// currentPage = 4 		16~20		15개의 게시글 건너뛰고 16부터 5개 조회
		
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimt();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimt());
		
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
		
		
	}

	public int selectSearchCount(SqlSession sqlSession, String condition, String keyword) {
		
		HashMap<String,String> map = new HashMap<>();
		
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		
		return sqlSession.selectOne("boardMapper.selectSearchCount", map);
		
		
	}

	public ArrayList<Board> selectSearchList(SqlSession sqlSession, String condition, String keyword, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimt();
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("condition",condition);
		map.put("keyword",keyword);
		
		
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimt());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
		
		
	}

	public int increseCount(SqlSession sqlSession, int bno) {
		
		
		return sqlSession.update("boardMapper.increaseCount", bno);
		
	}

	public Board selectDetailBoard(SqlSession sqlSession, int bno) {
		
		
		return sqlSession.selectOne("boardMapper.selectDetailBoard", bno);
		
	}

	public ArrayList<Reply> selectReplyList(SqlSession sqlSession, int bno) {

		return (ArrayList)sqlSession.selectList("boardMapper.selectReply", bno);
	}
	

}
