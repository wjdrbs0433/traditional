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
		width:25%;
	}
	
	.table th:nth-child(3) {
		width:10%;
	}
	
	.table th:nth-child(4) {
		width:25%;
	}
	
	.table th:nth-child(5) {
		width:20%;
	}
	

	
	.table td:first-child{
		width:20%;
	}
	
	.table td:nth-child(2) {
		width:25%;
	}
	
	.table td:nth-child(3) {
		width:10%;
	}
	
	.table td:nth-child(4) {
		width:25%;
	}
	
	.table td:nth-child(5) {
		width:20%;
	}
	
	
	img { width:60px; height:60px;}
	
</style>
</head>
<body>

	
	<div class="member">
		<div class="m1">
			<p>작성가능한 리뷰</p>
			<table class="table">
				<tr>
					<th>주문일자</th>
					<th>상품이미지</th>
					<th>상품코드</th>
					<th>상품이름</th>
					<th>리뷰등록</th>
				</tr>
				
				
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td>${dto.orderDate}</td>
						<td><img src="${pageContext.request.contextPath }/resource/<c:out value="${dto.image}"/>"></td>
						<td>${dto.productCode}</td>
						<td>${dto.productName}</td>
						<td><button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/review/reviewWrite.do';">리뷰등록</button></td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
		
	</div>
</body>
</html>