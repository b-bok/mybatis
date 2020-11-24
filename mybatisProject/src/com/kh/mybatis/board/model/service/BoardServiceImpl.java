package com.kh.mybatis.board.model.service;

import static com.kh.mybatis.common.template.Template.getSqlSession;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.mybatis.board.model.dao.BoardDao;
import com.kh.mybatis.board.model.vo.Board;
import com.kh.mybatis.board.model.vo.Reply;
import com.kh.mybatis.common.model.vo.PageInfo;

public class BoardServiceImpl implements BoardService {

	BoardDao bDao = new BoardDao();
	

	@Override
	public int selectListCount() {
		
		SqlSession sqlSession = getSqlSession();
		
		int listCount = bDao.selectListCount(sqlSession);
		
		sqlSession.close();
		
		return listCount;
		
	}
	
	
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		
		SqlSession sqlSession = getSqlSession();
		
		ArrayList<Board> list = bDao.selectList(sqlSession, pi);
		
		return list;
		
	}
	



	@Override
	public int increaseCount(int bno) {
		
		SqlSession sqlSession = getSqlSession();
		
		int result = bDao.increseCount(sqlSession , bno);
		
		if(result>0) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
	
		sqlSession.close();

		return result;
	}
	
	

	@Override
	public Board selectDetailBoard(int bno) {
		
		SqlSession sqlSession =getSqlSession();
		
		Board b = bDao.selectDetailBoard(sqlSession, bno);
		
		sqlSession.close();		
		
		return b;
		
	}



	@Override
	public int selectSearchCount(String condition, String keyword) {
		
		SqlSession sqlSession = getSqlSession();
		
		int searchCount = bDao.selectSearchCount(sqlSession, condition, keyword);
		
		sqlSession.close();
		
		return searchCount;
		
		
	}



	@Override
	public ArrayList<Board> selectSearchList(String condition, String keyword, PageInfo pi) {
		
		SqlSession sqlSession = getSqlSession();
		
		
		ArrayList<Board> list = bDao.selectSearchList(sqlSession, condition, keyword, pi);
		
		sqlSession.close();
		
		return list;
		
		
	}



	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		
		SqlSession sqlSession = getSqlSession();
		
		ArrayList<Reply> list = bDao.selectReplyList(sqlSession, bno);
		
		sqlSession.close();
		
		return list;
		
	}

}
