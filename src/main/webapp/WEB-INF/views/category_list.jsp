<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath }/resources/css/styles.css" rel="stylesheet" />
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<style type="text/css">

.sub-title {
	font-size: 1.375rem;
	padding: 0 8px 8px;
	border-bottom: 2px #0bd solid;
	font-weight: normal;
}

.sub-menu {
	margin-bottom: 60px;
	list-style: none;
}
.sub-menu li{
	border-bottom: 1px #ddd solid;
}

.sub-menu a{
	color: #432;
	padding: 10px;
	display: block;
}

.sub-menu a:hover{
	color: #0bd;
}
</style>
</head>
<body>
	<aside>
		<h3>카테고리</h3>
		<ul>
			<li class="main"><a href="#">핸드폰</a>
				<ul class="sub" style="display:none">
					<li><a href="#">apple</a></li>
					<li><a href="#">samsung</a></li>
				</ul>
			</li>
			<li class="main"><a href="#">태블릿PC</a>
				<ul class="sub" style="display:none">
					<li><a href="#">apple</a></li>
					<li><a href="#">samsung</a></li>
				</ul>
			</li>
			<li class="main"><a href="#">스마트워치</a>
				<ul class="sub" style="display:none">
					<li><a href="#">apple</a></li>
					<li><a href="#">samsung</a></li>
				</ul>
			</li>
			<li class="main"><a href="#">블루투스 이어폰</a>
				<ul class="sub" style="display:none">
					<li><a href="#">apple</a></li>
					<li><a href="#">samsung</a></li>
				</ul>
			</li>
		</ul>
	</aside>
        <script>
            $(".main").click(function(){
                if($(this).find(".sub").is(":visible")){
                    $(this).find(".sub").slideUp();
                }
                else{
                    $(this).find(".sub").slideDown();
                }
            })
        </script>
</body>
</html>










