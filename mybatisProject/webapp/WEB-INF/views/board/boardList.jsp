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


</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>

	<div class="outer">
		<br>
		<h1 align="center">게시판</h1>

		<div id="serach-area" align="center">

			<form action="">

				<select name="condition">

					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>

				</select>
				<input type="text" name="keyword">
				<button type="submit">검색하기</button>
				
			</form>


		</div>

		<br><br>

		<table id="list-area" align="center" border="1">

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
					<td>${b.boardTitle }</td>
					<td>${b.boardWriter }</td>
					<td>${b.count }</td>
					<td>${b.createDate }</td>
				</tr>
			</c:forEach>
			</tbody>



		</table>

		<br>

		<div id="paging-area" align="center">
			
			
			<c:if test="${ pi.currentPage ne pi.startPage }">
			<a href="list.bo?currentPage=${ pi.currentPage -1 }">[이전]</a>
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${pi.endPage }">
			<a href="list.bo?currentPage=${ p }">[${ p }]</a>
			</c:forEach>
			
			<c:if test="${ pi.currentPage ne pi.endPage }">
			<a href="list.bo?currentPage=${ pi.currentPage +1 }">[다음]</a>
			</c:if>
			
			
		</div>



		<br><br>



	</div>
	
	<script>
	
	$(function(){
		
		
		$("#list-area>tbody").on("click","tr",function(){
			
			var bno = $(this).children().eq(0).text();
			
			location.href="detail.bo?bno=" + bno;
			
			
		})
			
	})
	

	
	</script>
	



</body>
</html>