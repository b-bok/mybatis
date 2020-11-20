package com.kh.mybatis.common.template;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Template {

	
	public static SqlSession getSqlSession() {
		
		//mybatis-config.xml 읽어들이면서 생성할것
		
		SqlSession sqlSession = null;
		
		try {
			
			InputStream stream = Resources.getResourceAsStream("/mybatis-config.xml") ;
			
			sqlSession = new SqlSessionFactoryBuilder().build(stream).openSession(false);
	
			
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		
		
		return sqlSession;
	}
	
	// close, rollback, commit => 정의 할 필요없음
}
