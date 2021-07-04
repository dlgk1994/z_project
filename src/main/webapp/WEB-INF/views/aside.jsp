<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a:link { text-decoration: none;}
	a:hover {
		color:blue;padding-bottom: 3px;
		border-bottom: 1px solid blue; transition:all 0.25s;
		text-decoration: none;
	}
	ul li a{color:black;}
</style>
</head>
<body>
	<aside>
		<c:choose>
			<c:when test="${login == admin }"><!-- ${login == admin } 관리자 로그인시 -->
				<h3>상품관리</h3>
				<ul>
					<li><a href="${contextPath }/adminProduct/adminProductList">상품조회</a></li>
				</ul>
				<h3>회원관리</h3>
				<ul>
					<li><a href="${contextPath }/adminMember/adminMemberList">회원관리</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<h3>마이페이지</h3>
				<ul>
					<li><a href="${ contextPath }/mypage/myCart">장바구니</a></li>
					<li><a href="#">개인정보 수정</a></li>
					<li><a href="${ contextPath }/mypage/myRental">주문 내역</a></li>
					<li><a href="${ contextPath }/mypage/myReview">내 리뷰</a></li>
					<li><a href="${ contextPath }/mypage/myEnquiry">내 질문</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
		
		<h3>고객센터</h3>
		<ul>
			<li><a href="${ contextPath }/board/faq">자주하는 질문</a></li>
			<li><a href="${ contextPath }/board/notice">공지사항</a></li>
			<li><a href="${ contextPath }/board/qna">Q&A</a></li>
		</ul>
	</aside>

</body>
</html>