package com.kh.mybatis.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.mybatis.member.model.vo.Member;

public class MemberDao {

	
	public int insertMember(SqlSession sqlSession, Member m) {

		/*
		 * 
		 * sqlSession 객체를 통해서 메소드 호출만으로 sql문 실행
		 * .insert(), .update(), .delete(), .selectOne(), .selectList()
		 * 
		 * sqlSession.xxx("실할sql문"[, 그 sql문을 완성시킬 객체])
		 * 
		 * 첫번째 인자 : sql문이 존재하는 "매퍼의별칭.해당sql문의 아이디"
		 * 두번째 인자 : 해당 미완성된 sql문에 전달해서 완성시킬 객체
		 * 
		 */

		/*
		 * int result = sqlSession.insert("memberMapper.insertMember", m);
		 * return result;
		 */
		
		return sqlSession.insert("memberMapper.insertMember", m);

	}
	
}
