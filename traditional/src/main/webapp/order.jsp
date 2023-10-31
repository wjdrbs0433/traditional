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
		font-size:30px;
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
	
</style>
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
				<td>이름</td>
				<td>박진영</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>jinyeong9571@hanmail.net</td>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td><input type="text" value="010-8935-9571">  <button class="button">수정</button></td>
			</tr>
		</table>
		<table class="table1">
			<caption>받는사람정보  <button class="button">배송지 변경</button></caption>
			<tr>
				<td>이름</td>
				<td>박진영</td>
			</tr>
			<tr>
				<td>배송주소</td>
				<td>서울특별시 마포구 서교동 449-1 성지빌딩 3층 미소리빙텔 104호</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>010-8935-9571</td>
			</tr>
			<tr>
				<td>배송 요청사항</td>
				<td>문 앞 <button class="button">변경</button></td>
			</tr>
		</table>
		<table class="table2">
			<caption>결제정보</caption>
			<tr>
				<td>총상품가격</td>
				<td>22,000원</td>
			</tr>
			<tr>
				<td>할인쿠폰</td>
				<td>0원              <button class="button">쿠폰입력</button></td>
			</tr>
			<tr>
				<td>총결제금액</td>
				<td>19,000</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td>3,000</td>
			</tr>
		</table>
	</div>
	<div style="text-align: center;">
		<p>위 주문 내용을 확인 하였으며, 회원 본인은 개인정보 이용 및 제공(해외직구의 경우 국외제공) 및 결제에 동의합니다.</p>
	</div>
	<div style="text-align: center;">
		<button style="background: white; border: none;"><img class="kakao" src="resource/images/order/kakao.png"></button>
	</div>
	
	
</body>
</html>