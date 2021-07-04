<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function payment() {	//결제페이지 이동
	location.href='payment'
}
</script>

</head>
<body>
<c:import url="../header.jsp"></c:import>
<div class="orderInfo">
<div class="row" id="titleDiv">
		<div class="col">
	 		<h3>상품 주문서</h3>		
	 	</div>
	</div>
	<input type="hidden" id="directOrder" value="${directOrder}"/>
	<hr class="sub-hr" noshade/>
	<div class="form-row align-items-center">
		<div class="col" align="center">
	 		<h5 style="text-decoration:underline; text-undeline-position: under;">주문 목록</h5>
	 		<div class="form-row align-items-center">
			<div class="col-1" align="center">#</div>
			<div class="col-2" align="center">상품이미지</div>
			<div class="col-2" align="center">상품명</div>					
			<div class="col-2" align="center">가격</div>
			<div class="form-group col-3" align="center">
				<label style="padding-right:20px; padding-top:-5px;"><strong>결제하실 금액</strong></label>			
			</div>
			<div class="form-group col-6"></div>				
			<div class="form-group col-3" align="center" id="finalTotal"></div>
				
	</div>		
	 	</div>	
	</div>
	<br>
	<hr  class="sub-secondary-hr" noshade/>
	

	<div class="form-row align-items-center">
		<input type="hidden" name="amount" value="${sum}" />
		<div class="inputArea">
			<label for="">수령인</label>
			<input type="text" name="orderRec" id="orderRec" required="required" />
		</div>
		<div class="inputArea">
			<label for="orderPhon">수령인 연락처</label>
			<input type="text" name="orderPhon" id="orderPhon" required="required" />
		</div>

		<div class="inputArea">
		<p>
			<input type="text" id="payment_addr1" placeholder="우편번호">
			<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
		</p>
		<p>
			<input type="text" name="payment_addr2" id="payment_addr2" placeholder="주소" >
			<input type="text" name="payment_addr3" id="payment_addr3" placeholder="상세주소">
		</p>
		
		<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
		<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>
		
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		    // 우편번호 찾기 화면을 넣을 element
		    var element_layer = document.getElementById('layer');
		
		    function closeDaumPostcode() {
		        // iframe을 넣은 element를 안보이게 한다.
		        element_layer.style.display = 'none';
		    }
		
		    function sample2_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("sample2_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample2_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample2_postcode').value = data.zonecode;
		                document.getElementById("sample2_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample2_detailAddress").focus();
		
		                // iframe을 넣은 element를 안보이게 한다.
		                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
		                element_layer.style.display = 'none';
		            },
		            width : '100%',
		            height : '100%',
		            maxSuggestItems : 5
		        }).embed(element_layer);
		
		        // iframe을 넣은 element를 보이게 한다.
		        element_layer.style.display = 'block';
		
		        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		        initLayerPosition();
		    }
		
		    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		    function initLayerPosition(){
		        var width = 300; //우편번호서비스가 들어갈 element의 width
		        var height = 400; //우편번호서비스가 들어갈 element의 height
		        var borderWidth = 5; //샘플에서 사용하는 border의 두께
		
		        // 위에서 선언한 값들을 실제 element에 넣는다.
		        element_layer.style.width = width + 'px';
		        element_layer.style.height = height + 'px';
		        element_layer.style.border = borderWidth + 'px solid';
		        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
		        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		    }
		</script>
		</div>
		<div>
		<label>결제 방법</label>
			<select name="payment_delivery" class="payment_delivery" style="border: 2px solid skyblue; border-radius: 5px;">
            <option value="0">카드 결제</option>
         </select>
         <div>
			<div>
			<label>배송메시지</label><br>
			<textarea rows="5" cols="60" class="${payment_memo}"></textarea>
		</div>
	</div>

	<div class="form-row align-items-center">
		<div class="form-group col" align="center">
			<button type="button" class="btn btn-outline-success" value="주문하기" onchange="payment()">주문하기</button>	
		</div>			
	</div>
	</div>					
</div>
<c:import url="../footer.jsp"></c:import>
</body>
</html>