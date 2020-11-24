<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>

	#list-area{
		border: 1px solid white;
		text-align : center;

	}
	
	#list-area>tbody>tr:hover{
		background: darkgray;
		cursor: pointer;
	}

	#paging-area a {
		color : white;
		text-decoration : none;
	}
	
	

</style>



</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>

	<div class="outer">
		<br>
		<h1 align="center">게시판</h1>

		<div id="search-area" align="center">
		
			<form action="search.bo">
				<input type="hidden" name="currentPage" value="1" />
				<select name="condition">

					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>

				</select>
				<input type="text" name="keyword" value="${ keyword }">
				<button type="submit">검색하기</button>
				
			</form>


		</div>
		
		<c:if test="${ !empty condition }">
			<script>
				
				$(function(){
					
					$("#search-area option[value=${condition}]").attr("selected", true);
					
				})
			</script>	
		</c:if>	
		
		
		

		<br><br>

		<table id="list-area" align="center">

			<thead>
				<tr>

					<th>글번호</th>
					<th width="400">제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>

				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="b" items="${ list }">
				<tr>
					<td>${b.boardNo }</td>
					<td><a href="detail.bo?bno=${b.boardNo }">${b.boardTitle }</a></td>
					<td>${b.boardWriter }</td>
					<td>${b.count }</td>
					<td>${b.createDate }</td>
				</tr>
			</c:forEach>
			</tbody>



		</table>

		<br>

		<div id="paging-area" align="center">
			
		<c:choose>
			
			<c:when test="${ empty condition }">
			
			<c:if test="${ pi.currentPage ne pi.startPage }">
			<a href="list.bo?currentPage=${ pi.currentPage -1 }">[이전]</a>
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${pi.endPage }">
			<a href="list.bo?currentPage=${ p }">[${ p }]</a>
			</c:forEach>
			
			<c:if test="${ pi.currentPage ne pi.endPage }">
			<a href="list.bo?currentPage=${ pi.currentPage +1 }">[다음]</a>
			</c:if>
			
			</c:when>
	
			<c:otherwise>
			
			<c:if test="${ pi.currentPage ne pi.startPage }">
			<a href="search.bo?currentPage=${ pi.currentPage -1 }&condition=${ condition }&keyword=${ keyword }">[이전]</a>
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${pi.endPage }">
			<a href="search.bo?currentPage=${ p }&condition=${ condition }&keyword=${ keyword }">[${ p }]</a>
			</c:forEach>
			
			<c:if test="${ pi.currentPage ne pi.endPage }">
			<a href="search.bo?currentPage=${ pi.currentPage +1 }&condition=${ condition }&keyword=${ keyword }">[다음]</a>
			</c:if>
			
			</c:otherwise>

		</c:choose>		
		
		</div>



		<br><br>



	</div>
	


</body>
</html>