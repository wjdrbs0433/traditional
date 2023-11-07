<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style>
	.main{
		width: 60%; /* 너비를 70%로 설정합니다. */
        margin: 0 auto; /* 왼쪽과 오른쪽에 10px의 공백을 추가합니다. */
        padding: 20px; /* 내부 여백 (옵션) */
        
	}
	
	.jemok{
		font-size:31px;
		
	}
	
	caption{
		text-align: left;
		font-size:20px;
		margin-bottom: 10px; /* caption 아래에 10px의 공백 추가 */
	}
	
	.table {
	    width: 100%;
	    border-collapse: collapse; /* 테두리가 겹치지 않도록 설정 */
    	border-top: 2px solid black; /* 모든 테이블 셀에 2px 두께의 검은색 테두리 추가 */
    	border-bottom: 1px solid gray;
    	margin-top: 25px;
	}
	
	.table td:first-child {
	    width: 15%;
	    text-align: right;
	    padding-right: 15px;
	    background-color: ghostwhite;
	    border-right: 1px solid gray;
	    font-weight: bold;
	}
	
	.table td:last-child {
	    width: 85%;
	    text-align: left;
	    padding-left: 15px;
	}
	
	.table tr:first-child {
		height: 50px;
		border-top: 1px solid gray;
	}
	
	/* 두 번째 자식 행에 스타일 적용 */
	.table tr:nth-child(2) {
	    height: 50px; /* 원하는 높이 설정 */
	    border-top: 1px solid gray;
	}
	
	/* 세 번째 자식 행에 스타일 적용 */
	.table tr:nth-child(3) {
	    height: 50px; /* 원하는 높이 설정 */
	    border-top: 1px solid gray;
	}
	
	.table1 {
	    width: 100%;
	    border-collapse: collapse; /* 테두리가 겹치지 않도록 설정 */
    	border-top: 2px solid black; /* 모든 테이블 셀에 2px 두께의 검은색 테두리 추가 */
    	border-bottom: 1px solid gray;
    	margin-top: 25px;
	}
	
	.table1 td:first-child {
	    width: 15%;
	    text-align: right;
	    padding-right: 15px;
	    background-color: ghostwhite;
	    border-right: 1px solid gray;
	    font-weight: bold;
	}
	
	.table1 td:last-child {
	    width: 85%;
	    text-align: left;
	    padding-left: 15px;
	}
	
	.table1 tr:first-child {
		height: 50px;
		border-top: 1px solid gray;
	}
	
	/* 두 번째 자식 행에 스타일 적용 */
	.table1 tr:nth-child(2) {
	    height: 50px; /* 원하는 높이 설정 */
	    border-top: 1px solid gray;
	}
	
	/* 세 번째 자식 행에 스타일 적용 */
	.table1 tr:nth-child(3) {
	    height: 50px; /* 원하는 높이 설정 */
	    border-top: 1px solid gray;
	}
	
	.table1 tr:nth-child(4) {
	    height: 50px; /* 원하는 높이 설정 */
	    border-top: 1px solid gray;
	}
	
	.table1 tr:nth-child(5) {
	    height: 50px; /* 원하는 높이 설정 */
	    border-top: 1px solid gray;
	}
	
	.table2 {
	    width: 100%;
	    border-collapse: collapse; /* 테두리가 겹치지 않도록 설정 */
    	border-top: 2px solid black; /* 모든 테이블 셀에 2px 두께의 검은색 테두리 추가 */
    	border-bottom: 1px solid gray;
    	margin-top: 25px;
	}
	
	.table2 td:first-child {
	    width: 15%;
	    text-align: right;
	    padding-right: 15px;
	    background-color: ghostwhite;
	    border-right: 1px solid gray;
	    font-weight: bold;
	}
	
	.table2 td:last-child {
	    width: 85%;
	    text-align: left;
	    padding-left: 15px;
	}
	
	.table2 tr:first-child {
		height: 50px;
		border-top: 1px solid gray;
	}
	
	/* 두 번째 자식 행에 스타일 적용 */
	.table2 tr:nth-child(2) {
	    height: 50px; /* 원하는 높이 설정 */
	    border-top: 1px solid gray;
	}
	
	/* 세 번째 자식 행에 스타일 적용 */
	.table2 tr:nth-child(4) {
	    height: 50px; /* 원하는 높이 설정 */
	    border-top: 1px solid gray;
	}
	
	.table2 tr:nth-child(3) {
	    height: 50px; /* 원하는 높이 설정 */
	    border-top: 1px solid gray;
	}
	
	.kakao {
		margin: 40px auto;
		width: 180px;
		height: 60px;
	}
	
	.button{
		
	}
	
	.jemok-container {
	    display: flex; /* 가로 정렬을 위해 flexbox 사용 */
	    justify-content: space-between; /* 요소 간 공간을 최대한 확보하여 좌우 정렬 */
	    align-items: center; /* 요소를 수직 가운데 정렬 */
	    margin: 0px;
	    height:50px;
	}
	
	hr {
	    margin: 0;
	}
	
	.jemok1{
		margin-bottom: 0;
		color: blue;
		font-weight: bold;
	}
	
	.jemok1 span {
	    color: gray; /* 주문완료 부분을 회색으로 설정 */
	    font-weight: lighter;
	}
	
	.form-control {
	border: 1px solid #999999; border-radius: 4px; background-color: #ffffff;
	padding: 5px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	}
	
	.form-select {
		border: 1px solid #999999; border-radius: 4px; background-color: #ffffff;
		padding: 4px 5px; 
		font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
		vertical-align: baseline;
	}
	
	.button-container {
		background-color: #ffffff;
		color: #000000;
		border: 1px solid black;
		padding: 5px 10px;
		border-radius: 5px;
		cursor: pointer;
		width: 300px;
		text-align: center;
		height: 90px;
		margin: 5px auto;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		font-size: 18px;
		font-weight: bold;
	}
	
	.button-container:hover {
		background-color: #1682b0;
		color: white;
	}
	
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
        }
    }).open();
}

function redirectToOrderPage1() {
	var name = document.getElementById('name').value;
    var zip = document.getElementById('zip').value;
    var addr1 = document.getElementById('addr1').value;
    var addr2 = document.getElementById('addr2').value;
    var tel1 = document.getElementsByName('tel1')[0].value;
    var tel2 = document.getElementsByName('tel2')[0].value;
    var tel3 = document.getElementsByName('tel3')[0].value;
    var baesong = document.getElementsByName('baesong')[0].value;
    var productPrice = "${productPrice}"; 
    var quantity = "${quantity}"; 
    var total = "${total}"; 
    var productCode = "${productCode}"
    var orderNum = "${orderNum}";

    var url = '${pageContext.request.contextPath}/product/orderok.do' +
        '?name=' + encodeURIComponent(name) +
        '&orderNum='+orderNum + 
        '&zip=' + encodeURIComponent(zip) +
        '&addr1=' + encodeURIComponent(addr1) +
        '&addr2=' + encodeURIComponent(addr2) +
        '&tel1=' + encodeURIComponent(tel1) +
        '&tel2=' + encodeURIComponent(tel2) +
        '&tel3=' + encodeURIComponent(tel3) +
        '&baesong=' + encodeURIComponent(baesong) +
        '&productCode=' + encodeURIComponent(productCode) +
        '&productPrice=' + encodeURIComponent(productPrice) +
        '&quantity=' + encodeURIComponent(quantity) +
        '&total=' + encodeURIComponent(total);

    window.location.href = url;
}
</script>

<%-- 카카오 페이--%>

</head>
<body>
	<div class="main">
		<div class="jemok-container">
			<p class="jemok">주문/결제</p>
			 <p class="jemok1">주문결제 > <span>주문완료</span></p>
		</div>
		<hr>
		<table class="table">
			<caption>구매자정보</caption>
			<tr>
				<td>회원이름</td>
				<td>${memberDTO.mname}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${memberDTO.memail}</td>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td>${memberDTO.mphone}</td>
			</tr>
		</table>
		<table class="table1">
			<caption>받는사람정보</caption>
			<tr>
				<td>받는이</td>
				<td><input type="text" name="name" id="name" class="form-control" maxlength="4" style="width: 20%;"></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>
					<input type="text" name="zip" id="zip" maxlength="7" class="form-control" value="${dto.zip}" readonly style="width: 20%;">
					<button type="button" class="btn" onclick="daumPostcode();">우편번호검색</button>
				</td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td>	<p>
							<input type="text" name="addr1" id="addr1" maxlength="50" class="form-control" value="${dto.addr1}" readonly style="width: 70%;">
						</p>
						<p class="block">
							<input type="text" name="addr2" id="addr2" maxlength="50" class="form-control" value="${dto.addr2}" style="width: 70%;">
						</p></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
						  <select name="tel1" class="form-select">
							    <option value="">선 택</option>
							    <option value="010">010</option>
							    <option value="02">02</option>
							    <option value="031">031</option>
							    <option value="032">032</option>
							    <option value="033">033</option>
							    <option value="041">041</option>
							    <option value="042">042</option>
							    <option value="043">043</option>
							    <option value="044">044</option>
							    <option value="051">051</option>
							    <option value="052">052</option>
							    <option value="053">053</option>
							    <option value="054">054</option>
							    <option value="055">055</option>
							    <option value="061">061</option>
							    <option value="062">062</option>
							    <option value="063">063</option>
							    <option value="064">064</option>
							    <option value="070">070</option>
							</select>
							- <input type="text" name="tel2" maxlength="4" class="form-control" value="" style="width: 10%;"> -
							<input type="text" name="tel3" maxlength="4" class="form-control" value="" style="width: 10%;">
					</td>
			</tr>
			<tr>
				<td>배송 요청사항</td>
				<td>
					<select name="baesong" class="form-select">
					    <option value="문앞">문앞</option>
					    <option value="직접받고 부재 시 문 앞">직접받고 부재 시 문 앞</option>
					    <option value="경비실">경비실</option>
					    <option value="택배함">택배함</option>
					</select>
				</td>
			</tr>
		</table>
		<table class="table2">
			<caption>결제정보</caption>
			<tr>
				<td>상품가격</td>
				<td><fmt:formatNumber type="number" value="${productPrice}" pattern="#,###" />원</td>
				
			</tr>
			<tr>
				<td>수량</td>
				<td>${quantity}개</td>
			</tr>
			
			<tr>
				<td>배송비</td>
				<td>3,000원</td>
			</tr>
			<tr>
				<td>총결제금액</td>
				<td><fmt:formatNumber type="number" value="${total + 3000}" pattern="#,###" />원</td>
			</tr>
		</table>
		<div style="text-align: center;">
			<p>
				<input type ="checkbox">
				위 주문 내용을 확인 하였으며, 회원 본인은 개인정보 이용 및 제공(해외직구의 경우 국외제공) 및 결제에 동의합니다.
			</p>
			<button type="button" class="button-container" onclick="redirectToOrderPage()">구매하기</button>
		</div>
		
			
	</div>
	
</body>
</html>