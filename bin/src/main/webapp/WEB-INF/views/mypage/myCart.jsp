<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<!-- 
	<c:if test="${user == null}">
		<script>
			alert("권한이 없습니다.");
			location.href = "/main";
		</script>
	</c:if>
 -->
	<c:import url="../header.jsp"/>	

	<section id="container">
		<aside>
			<c:import url="../aside.jsp"/>				
		</aside>
		<div id="container_box">
		<h3>장바구니</h3>
		<!-- 모든 체크박스 체크 및 해제 -->
		<div class="allCheck">
			<input type="checkbox" name="allCheck" id="allCheck">전체 선택		
			<script type="text/javascript">
			$("#allCheck").click(function(){
				var chk = $("#allCheck").prop("checked");
				if(chk) {
					$(".chbox").prop("checked", true);
				} else {
					$(".chbox").prop("checked", false);
				}
			});
			</script>	
		</div>
		<div class="checkBox">
		<input type="hidden" id="userID" name="userID" value="${userForm.userID}"/> <!-- 현재 유저 -->
			<table border="1" style="width: 90%;">
				<tr>
					<th>상품선택</th><th colspan="2">상품명</th><th>대여가격</th><th>대여가능여부</th><th>선택</th>
				</tr>
				<c:if test="${ cartList.size() == 0 }">
					<tr><th colspan="5">장바구니가 비어 있습니다</th></tr>
				</c:if>
				<c:forEach var="dto" items="${ cartList }">
					<tr>
						<td>
							<input type="checkbox" name="chbox" class="chbox" value="${ dto.payment_total }" data-cartNum="${ dto.cart_no }">
							<script>
 								$(".chbox").click(function(){
									$("#allCheck").prop("checked", false);
									
									/*
									$("input[class='chBox']:checked").each(function(){
										checkArr.push($(this).val()); //check true인 것만 뽑아서 배열에 push
									});
									
									$.ajax({
										url : "totalPay",
										type : "post",
										data : { checkArr : checkArr },
										dataType : "json",
										success : function(result) {
											$("#total").html(result);
										   }, error : function() { alert('문제 발생') }
									}); */
									
									
								});
							</script>
 						</td>
						<td colspan="2">
							<img src="${ contextPath }/download?file=${ dto.cart_photo }" style="width: 50px; height: 50px">
							<a href="#">${ dto.product_name }</a>
						</td>
						<td>price</td>
						<td>${ dto.cart_state }</td>
						<td>
							<button type="button" onclick="#">대여</button>
							<button type="button" onclick="${ contextPath }/mypage/deleteCart?cart_no=${ dto.cart_no }&cart_photo=${ cart_photo }">삭제</button>
						</td>
					</tr>
					<c:set var="sum" value="${sum + dto.payment_total}" />
				</c:forEach>
				<tr>
					<td colspan="6" style="text-align: right;">
						<!-- 총 상품 금액 : <label id="total"></label>&nbsp; -->
						<div class="sum">
  							총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}"/>원
 						</div>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<button type="button" class="select">선택 상품 주문</button>
						
						<button type="button">전체 상품 주문</button>
						<button type="button" class="selectDelete">선택 상품 삭제</button>
						<script>
							$(".selectDelete").click(function(){
								var confirm_val = confirm("정말 삭제하시겠습니까?");
							  
								if(confirm_val) {
									var checkArr = new Array();
								   
									$("input[class='chBox']:checked").each(function(){
										checkArr.push($(this).attr("data-cartNum"));
									});
								    
								 	$.ajax({
								  		url : "/mypage/deleteCart",
								 		type : "post",
								    	data : { chbox : checkArr },
								    	success : function(result){
								    		if(result == 1) {          
								    			location.href = "/mypage/myCart";
								    		} else {
								    			alert("삭제 실패");
								    		}
								    	}
								   	});
							  	} 
						 	});
						</script>
						<button type="button">전체 상품 삭제</button>
					</td>
				</tr>
			</table>
		
		</div>
		<div>
			<c:forEach	var="num" begin="1" end="${ repeat }">
				<a href="${ contextPath }/mypage/myCart?num=${ num }">[${ num }]</a>
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