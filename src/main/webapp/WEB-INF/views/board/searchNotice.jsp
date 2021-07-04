<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style type="text/css">
	section#container { padding: 20px 0; border-top: 2px solid #eee; border-bottom: 2px solid #eee; }
 	section#container::after { content: ""; display: block; clear: both; }
	aside { float: left; width: 200px; padding: 0 0 0 10px; }
 	div#container_box { float: right; width: calc(100% - 200px - 20px); }
 	aside ul li { margin-bottom: 10px; list-style: none; }
</style>
</head>
<body>
	<c:import url="../header.jsp"/>	
	<section id="container">
		<aside>
			<c:import url="../aside.jsp"/>				
		</aside>
		<div id="container_box">
		
		<h3>검색 결과</h3>
		<div>
		<input type="button" onclick="location.href='${ contextPath }/board/notice'" value="전체목록">
			<table border="1" style="width: 90%;">
				<tr>
					<th>글번호</th><th>공지분류</th><th>제목</th><th>등록일</th><th>조회수</th>
				</tr>
				<c:if test="${ searchNotice.size() == 0 }">
					<tr><th colspan="5">일치하는 공지사항이 없습니다</th></tr>
				</c:if>
				<c:forEach var="dto" items="${ searchNotice }">
				<tr>
					<td>${ dto.notice_no }</td>
					<td>${ dto.notice_group }</td>
					<td>
						<a href="${ contextPath }/board/selectNotice?notice_no=${ dto.notice_no }">${ dto.notice_title }</a>
					</td>
					<td>${ dto.notice_writedate }</td>
					<td>${ dto.notice_hit }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<form action="${ contextPath }/board/searchNotice" method="post">
				<select name="search_option">
		        	<option value="notice_title"<c:if test="${search_option eq 'enquiry_subject'}">selected</c:if>>제목</option>
		    
		        	<option value="notice_content"<c:if test="${search_option eq 'enquiry_content'}">selected</c:if>>내용</option>
		   			
		   			<option value="all"<c:if test="${search_option eq 'all'}">selected</c:if>>제목+내용</option>
		   		</select>
				<input type="text" name="keyword" value="${ keyword }">
				<input type="submit" id="searchBtn" value="검색">
			</form>
		</div>
		</div>
	</section>
	<c:import url="../footer.jsp"/>
	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>