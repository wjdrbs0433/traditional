<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
<script src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>

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
	
	.table .btn{
		background-color: gray;
	    color: white;
	    border: none;
	    border-radius: 18px;
	    padding: 10px 15px;
	    cursor: pointer;
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
	
	.review{
		width: 70%; /* 너비를 70%로 설정합니다. */
        margin: 0 auto; /* 왼쪽과 오른쪽에 10px의 공백을 추가합니다. */
   		margin-top: 50px;
        border: 1px solid #e2e2e2;
        border-radius: 20px;
	}
	
	.r1{
		margin: 50px 100px 30px 100px;
	}
	.r1 p{
		font-size:25px;
		font-weight: bold;
		color: gray;
		padding-left: 15px;
	}
	
	.table {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	.table th{
		
	    text-align: center;
	    color: #989898;
	    font-size:20px;
	    padding-left: 15px;
	    font-weight: 600;
	}
	.table td {
		text-align: center;
	}
	.img{
		width: 40px;
		height: 40px;

	}
	
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	
	
	<div class="main">
		<div>
			<p class="name" style="line-height:80px; float:right;">${sessionScope.member.mname} <span>님</span></p>
		</div>
		<div>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/member/mypage.do" style="color:#cccccc;">회원정보
			<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/member.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/review/myList.do">마이리뷰
			<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/riview.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/member/orderList.do" style="color:#cccccc;">주문 내역
			<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/jomon.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/myqna/mylist.do" style="color:#cccccc;">문의 내역
			<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/gogek.png">
			</a>
		</div>
	</div>	
	
	<div class="review">
		<div class="r1">
			<p>작성가능한 리뷰</p>
			<hr>
			<table class="table">
				<tr>					
					<th>주문번호</th>
					<th>주문일자</th>
					<th>이미지</th>
					<th>상품이름</th>
					<th>&nbsp;</th>
				</tr>
				
				
				<c:forEach var="dto" items="${list}" varStatus="status">
				
					<tr>						
						<td>${dto.orderNum}</td>
						<td>${dto.orderDate}</td>
						<td><img src="${pageContext.request.contextPath }/resource/images/product/<c:out value="${dto.productCode}"/>.jpg" width="60px" height="60px"></td>
						<td>${dto.productName}</td>
						<td><button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/review/reviewWrite.do?productCode=${dto.productCode}&orderDetailNum=${dto.orderDetailNum}';">리뷰등록</button></td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
		
	</div>
</body>
</html>