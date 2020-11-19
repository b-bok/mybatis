<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	여기는 index페이지다.
	
	<!-- 
		WEB-INF 폴더는 WAS(톰캣)가 관리하는 폴더이기 때문에
		views폴더가 WEB-INF 폴더 안에 있을 경우
		WAS 서버로 요청해서 forwarding 방식을 통해서만 접근 가능하다.
	
	 -->
	
	<jsp:forward page="WEB-INF/views/main.jsp"></jsp:forward>
	
	
</body>
</html>