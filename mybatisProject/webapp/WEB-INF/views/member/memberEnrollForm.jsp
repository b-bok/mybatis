<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	    <!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>

    <div class="outer">
        <br>
        <h1 align="center">회원가입</h1>
        <br>

        <form id="enroll-form" action="insert.me" method="POST">

            <table align="center">
                <tr>
                    <td>* ID</td>
                    <td><input type="text" name="userId" placeholder="아이디를 입력해주시오" required></td>
                </tr>
                <tr>
                    <td>* PWD</td>
                    <td><input type="password" name="userPwd" placeholder="비밀번호 입력하시오" required></td>
                </tr>
                <tr>
                    <td>* PWD CHECK</td>
                    <td><input type="password" placeholder="한번더 입력해봐!" required></td>
                </tr>
                <tr>
                    <td>* NAME</td>
                    <td><input type="text" name="userName" placeholder="이름 입력 빨리!" required></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp; EMAIL</td>
                    <td><input type="text" name="email" placeholder="이메일 있지?" ></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;BIRTHDAY</td>
                    <td><input type="text" name="birthday" placeholder="생년월일 6자리"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;GENDER</td>
                    <td align="center">
                        <input type="radio" name="gender" value="M" id="M"><label for="M">남</label>
                        <input type="radio" name="gender" value="F" id="F"><label for="F">여</label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;PHONE</td>
                    <td><input type="phone" name="phone" placeholder="'-'포함해서 작성"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;ADDRESS</td>
                    <td><input type="text" name="address"></td>
                </tr>
            </table>

            <br>

            <div align="center">
                <button type="reset">초기회</button>
                <button type="submit">회원가입</button>
            </div>

        </form>
        <br /><br />
      
    </div>
    

</body>
</html>