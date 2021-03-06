<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<h3>내 리뷰</h3>
			<div>
				<table border="1" style="width: 90%;">
					<tr>
						<th>글번호</th><th colspan="2">상품명</th><th>내용</th><th>등록일</th>
					</tr><c:if test="${ reviewList.size() == 0 }">
						<tr><th colspan="5">작성한 리뷰가 없습니다</th></tr>
					</c:if>
					<c:forEach var="dto" items="${ reviewList }">
						<tr>
							<td>${ dto.review_no }</td>
							<td colspan="2">
								<img src="${ dto.product_photo }" style="width: 50px; height: 50px">
								<a href="">${ dto.product_name }</a> <!-- 상품 링크 걸기 -->
							</td>
							<td><a href="${ contextPath }/mypage/selectReview?review_no=${ dto.review_no }">${ dto.review_content }</a></td>
							<fmt:parseDate var="parseRegDate" value="${ dto.review_writedate }" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate var="formatRegDate" value="${ parseRegDate }" pattern="yyyy.MM.dd"/>
							<td>${ formatRegDate }</td>
							
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<c:forEach	var="num" begin="1" end="${ repeat }">
					<a href="${ contextPath }/mypage/myReview?num=${ num }">[${ num }]</a>
				</c:forEach>
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