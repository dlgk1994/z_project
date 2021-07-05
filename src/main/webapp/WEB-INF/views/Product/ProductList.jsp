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
	.wrap{width: 1200px;height: 400px; margin: 20px 0 0 200px;}
	.button{margin: 0 0 0 900px;}
	.container{margin-top: 20px;}
	#b3{margin-top: 10px; margin-left: 10px;}
	.t{width: 1500px; height: 1000px;  margin: auto;}
	#a{width: 60px; text-align: center; color: black;}
	/* a:link{text-decoration:none; color: black;} */
	
	aside ul li { margin-bottom: 10px; list-style: none; }
 	aside { float: left; width: 200px; padding: 0 0 0 10px; }
 	#product{
 		
 		

	}
</style>

</head>
<body>
<c:import url="../header.jsp"/>

<aside>
	<jsp:include page="../category_list.jsp" />						
</aside>
<div class="t">

<div class="wrap">
<form action="${ contextPath }/Product/ProductSearch">
			<select name="ProductSearch_option">
	        	<option value="product_num"<c:if test="${ProductSearch_option eq 'product_num'}">selected</c:if>>상품번호</option>
	        	<option value=product_title<c:if test="${ProductSearch_option eq 'product_title'}"></c:if>>상품명</option>
	        	<option value=product_pee<c:if test="${ProductSearch_option eq 'product_pee'}">selected</c:if>>상품가격</option>
	        </select>
			   <input type="text" name="keyword" value="${keyword}">
			   <input type="submit" id="searchBtn" value="검색">
		</form>
	<div class="container" id="product">    
		
	 	 <table class="table table-striped">
	   	 <thead>
	      <tr style="text-align: center;">
	      </tr>
	    </thead>
	    <tbody>
	    
	    </tbody>  	
	  </table>

	  <table>
	  <c:forEach var="dto" items="${productList }">
	  
	  	<tr>
	  		<td>
	  			<input type="hidden" name="producNum" value="${dto.productNum }">
	  			<div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100" style="width: 300px;">
                            <!-- Product image-->
                           <!--  <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
                           <c:set var="src" value="${contextPath}${dto.filePath}/${dto.fileName}"/>
							<div class="thumbnail">
					            <div class="form-inline mb-2">
					               <div class="boardImg" id="titleImgArea">
					                  <img id="titleImg" width="200" height="200" src="${src}">
					               </div>
					            </div>
					         </div>
                            <!-- Product details-->
                            
                            <div class="card-body p-4">
                                <div class="text-center" >
                                    <!-- Product name-->
                                    ${dto.productName }
                                    <h5 class="fw-bolder"></h5>
                                    <!-- Product price-->
                                    ${dto.productPee }
                                </div>
                                
                            </div>
                            
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${contextPath }/Product/ProductView?productNum=${dto.productNum}">상세보기</a></div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
	  		</td>
	  	</tr>
	  	
	  	</c:forEach>	  
	  </table>
	  
	  
	  
	  
	  
	  
</div>	
</div>
</div>
<jsp:include page="../footer.jsp" />
<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
<script type="text/javascript">
// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
function LoadImg(value, num) {
   // value.files : 파일이 업로드되어 있으면 true
   // value.files[0] : 여러 파일 중 첫번째 파일이 업로드 되어 있으면 true
   
    if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
       
       var reader = new FileReader();
    // 자바스크립트 FileReader
   // 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 
   // 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 
   // 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체
   
   reader.readAsDataURL(value.files[0]);
  // FileReader.readAsDataURL()
   // 지정된의 내용을 읽기 시작합니다. 
   // Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.   
   
   reader.onload = function(e){
     // FileReader.onload
          // load 이벤트의 핸들러. 
          // 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.   
      
          // 읽어들인 내용(이미지 파일)을 화면에 출력
          
          $(".boardImg").eq(num).children("img").attr("src", e.target.result);
          // e.target.result : 파일 읽기 동작을 성공한 요소가 읽어들인 파일 내용
          
   }
    }
   
   
 }

</script>
</html>


























