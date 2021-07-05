<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">



<style type="text/css">
	.wrap{width: 1200px;height: 400px; margin: 0px 0 0 240px;}
	.button{margin: 0 0 0 900px;}
	.container{margin-top: 20px;}
	#b3{margin-top: 10px; margin-left: 10px;}
	.t{width: 1500px; height: 1000px;  margin: auto;}
	#a{width: 60px; text-align: center; color: black;}
	/* a:link{text-decoration:none; color: black;} */
	
	aside ul li { margin-bottom: 10px; list-style: none; }
 	aside { float: left; width: 200px; padding: 0 0 0 10px; }
</style>

</head>
<body>
<jsp:include page="../header.jsp" />

<aside>
	<jsp:include page="../category_list.jsp" />						
</aside>
<div class="t">

<div class="wrap">

	<div class="container">    
		
	 	 <table class="table table-striped">
	   	 <thead>
	      <c:if test="${productSearch.size() ==0 }">
	      	<tr><td colspan="5">검색된 글이 없습니다</td></tr>
	      </c:if>
	    </thead>
	    <tbody>
	    <c:forEach var="dto" items="${productSearch }">
	      <tr style="text-align: center;">
	      	<td>썸네일</td>
	      	<td><input type="checkbox" class="choice" name="choice" id="choice" value="${dto.productNum}"></td>
	        <td width="100px;">${dto.productNum }</td>
	        <td width="400px;"><a href="${contextPath }/adminProduct/adminProductView?productNum=${dto.productNum}">${dto.productTitle }</a></td>
	        <td>${dto.productPee }</td>
	      </tr> 
	     </c:forEach>
	    </tbody>  	
	  </table>
	  <form action="${ contextPath }/Product/ProductSearch">
			<select name="ProductSearch_option">
	        	<option value="product_num"<c:if test="${ProductSearch_option eq 'product_num'}">selected</c:if>>상품번호</option>
	        	<option value=product_title<c:if test="${ProductSearch_option eq 'product_title'}"></c:if>>상품명</option>
	        	<option value=product_pee<c:if test="${ProductSearch_option eq 'product_pee'}">selected</c:if>>상품가격</option>
	        </select>
			   <input type="text" name="keyword" value="${keyword}">
			   <input type="submit" id="searchBtn" value="검색">
		</form>
	  </div>
	  
</div>	
</div>
<jsp:include page="../footer.jsp" />
<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>

</html>


























