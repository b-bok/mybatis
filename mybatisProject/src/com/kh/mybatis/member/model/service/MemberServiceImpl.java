package com.kh.mybatis.member.model.service;

import org.apache.ibatis.session.SqlSession;

import static com.kh.mybatis.common.template.Template.getSqlSession;

import com.kh.mybatis.member.model.dao.MemberDao;
import com.kh.mybatis.member.model.vo.Member;



public class MemberServiceImpl implements MemberService {

	/**
	 *회원 가입용 서비스
	 */
	@Override
	public int insertMember(Member m) {
		
		//DB와 접속된 Connection 객체 생성 (JDBCTemplate 클래스의 getConnection() 호출)
		// => 마이바티스 sqlSEssion 객체 생성 (Template 클래스의 getSqlSession() 호출)
		
		SqlSession sqlSession = getSqlSession();

		// DAO 메소드 호출 (Connection 객체, Controller전달된 값 넘기면서)
		// => DAO 메소드 호출 (SqlSession 객체, Controller에서 전달된값 넘기면서 )
		
		int result = new MemberDao().insertMember(sqlSession, m);
		
		
		
		//[트랜잭션 처리]
		// JDBCTemplate 클래스의 commit(); rollback() 호출
		// => SqlSession 객체에서 이미 제공하고 있는 commit(), rollback() 호출
		if(result > 0) {
			sqlSession.commit();
		}
		// Connection 객체 반남 (JDBCTemplate 클래스의 close() 호출)
		// => SqlSession 객체에서 이미 제공하고 있는 close() 호출 
		sqlSession.close();
		// 결과 리턴 
		return result;
	}

	/**
	 *로그인용 서비스
	 */
	@Override
	public Member loginMember(Member m) {
		
		return null;
	}
	
	
	
	
}
