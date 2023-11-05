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
	* {
		box-sizing: border-box;
	}

	.main{
		width: 70%; /* 너비를 70%로 설정합니다. */
		height: 120px;
        margin: 0 auto; /* 왼쪽과 오른쪽에 10px의 공백을 추가합니다. */
   		margin-top: 50px;
        border: 1px solid #e2e2e2;
        border-radius: 20px;
        display: flex;
        justify-content: space-between;
	}
	
	.img{
		width: 40px;
		height: 40px;

	}
	
	.main div {
		margin: 0 20px;
		text-align:center;
	}
	
	.main div:first-child {
		height: 50px;
		width:30%;
		padding-top:17px;
	}
	
	.main div:nth-child(2) {
		height: 50px;
		width:20%;
		padding-top:28px;
	}
	
	.main div:nth-child(3) {
		height: 50px;
		width:12.5%;
		font-size:15px;
		font-weight: bold;
		padding-top: 15px;
	}
	
	.main div:nth-child(4) {
		height: 50px;
		width:12.5%;
		font-size:15px;
		font-weight: bold;
		padding-top: 15px;
	}
	
	.main div:nth-child(5) {
		height: 50px;
		width:12.5%;
		font-size:15px;
		font-weight: bold;
		padding-top: 15px;
	}
	
	.main div:nth-child(6) {
		height: 50px;
		width:12.5%;
		font-size:15px;
		font-weight: bold;
		padding-top: 15px;
	}
	
	.name {
		font-size: 25px;
		font-weight:bold;
	}
	
	.name span {
		color: gray;
		font-size: 20px;
		font-weight: normal;
	}
	
	.member{
		width: 70%; /* 너비를 70%로 설정합니다. */
        margin: 0 auto; /* 왼쪽과 오른쪽에 10px의 공백을 추가합니다. */
   		margin-top: 50px;
        border: 1px solid #e2e2e2;
        border-radius: 20px;
	}
	
	.m1{
		margin: 50px 100px 30px 100px;
	}
	.m1 p{
		font-size:25px;
		font-weight: bold;
		color: gray;
		padding-left: 15px;
	}
	
	.table {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	.img1{
		width: 70px;
		height:70px;
	}
	
	.table tr {
		height:100px;
	}
	
	.table tr:first-child{
		height:50px;
	}
	
	.table th {
	    border-top: 2px solid gray; /* 각 행의 아래쪽에 border 추가 */
	    border-bottom: 2px solid gray;
	    height:65px;
	}
	.table td {
		text-align: center;
		border-bottom: 1px solid gray;
	}
	
	.table th:first-child{
		width:20%;
	}
	
	.table th:nth-child(2) {
		width:15%;
	}
	
	.table th:nth-child(3) {
		width:20%;
	}
	
	.table th:nth-child(4) {
		width:10%;
	}
	
	.table th:nth-child(5) {
		width:5%;
	}
	
	.table th:nth-child(6) {
		width:15%;
	}
	
	.table th:nth-child(7) {
		width:15%;
	}
	
	.table td:first-child{
		width:20%;
	}
	
	.table td:nth-child(2) {
		width:15%;
	}
	
	.table td:nth-child(3) {
		width:20%;
	}
	
	.table td:nth-child(4) {
		width:10%;
	}
	
	.table td:nth-child(5) {
		width:5%;
	}
	
	.table td:nth-child(6) {
		width:15%;
	}
	
	.table td:nth-child(7) {
		width:15%;
	}
	
</style>
</head>
<body>
	<div class="main">
		<div>
			<p class="name">대식가박 <span>님</span></p>
		</div>
		<div>
		</div>
		<div>
			<p>회원정보</p><img class="img" src="resource/images/mypage/member.png">
		</div>
		<div>
			<p> &nbsp리 뷰&nbsp </p><img class="img" src="resource/images/mypage/riview.png">
		</div>
		<div>
			<p>주문 내역</p><img class="img" src="resource/images/mypage/jomon.png">
		</div>
		<div>
			<p>문의내역</p><img class="img" src="resource/images/mypage/gogek.png">
		</div>
	</div>	
	
	<div class="member">
		<div class="m1">
			<p>주문내역</p>
			<table class="table">
				<tr>
					<th>주문번호</th>
					<th>상품이미지</th>
					<th>제품이름</th>
					<th>가격</th>
					<th>수량</th>
					<th>주문상태</th>
					<th>리뷰</th>
				</tr>
				<tr>
					<td>1234567</td>
					<td><img class="img1" src="resource/images/product/1.jpg"></td>
					<td>사과주</td>
					<td>20,000</td>
					<td>2개</td>
					<td>입금완료</td>
					<td><button type="button" id="btnReview" onclick="#" >리뷰등록</button></td>
				</tr>
				
				
			</table>
		</div>
		
	</div>
</body>
</html>