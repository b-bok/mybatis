package com.kh.mybatis.member.model.service;

import com.kh.mybatis.member.model.vo.Member;

public interface MemberService {	// 상수필드 + 추상메소드(public abstract)
	
	// 로그인, 회원가입, 정보수정, 회원탈퇴
	
	// 1. 회원가입용 서비스
	/* [public abstract]  반환형 메소드명(매개변수);*/
	int insertMember(Member m);
		
	// 2. 로그인용 서비스
	Member loginMember(Member m);
	
	
	
	
}
