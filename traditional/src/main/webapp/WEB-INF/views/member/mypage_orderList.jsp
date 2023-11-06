<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resource/css/custom.css">
<link rel="stylesheet" href="./resource/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style>
.main {
	width: 70%; /* 너비를 70%로 설정합니다. */
	height: 120px;
	margin: 0 auto; /* 왼쪽과 오른쪽에 10px의 공백을 추가합니다. */
	margin-top: 50px;
	border: 1px solid #e2e2e2;
	border-radius: 20px;
	display: flex;
	justify-content: space-between;
}

.img {
	width: 40px;
	height: 40px;
}

.main div {
	margin: 0 20px;
	text-align: center;
}

.main div:first-child {
	height: 50px;
	width: 30%;
	padding-top: 17px;
}

.main div:nth-child(2) {
	height: 50px;
	width: 20%;
	padding-top: 28px;
}

.main div:nth-child(3) {
	height: 50px;
	width: 12.5%;
	font-size: 15px;
	font-weight: bold;
	padding-top: 15px;
}

.main div:nth-child(4) {
	height: 50px;
	width: 12.5%;
	font-size: 15px;
	font-weight: bold;
	padding-top: 15px;
}

.main div:nth-child(5) {
	height: 50px;
	width: 12.5%;
	font-size: 15px;
	font-weight: bold;
	padding-top: 15px;
}

.main div:nth-child(6) {
	height: 50px;
	width: 12.5%;
	font-size: 15px;
	font-weight: bold;
	padding-top: 15px;
}

.name {
	font-size: 25px;
	font-weight: bold;
}

.name span {
	color: gray;
	font-size: 20px;
	font-weight: normal;
}

.member {
	width: 70%; /* 너비를 70%로 설정합니다. */
	margin: 0 auto; /* 왼쪽과 오른쪽에 10px의 공백을 추가합니다. */
	margin-top: 50px;
	border: 1px solid #e2e2e2;
	border-radius: 20px;
}

.m1 {
	margin: 50px 100px 30px 100px;
}

.m1 p {
	font-size: 25px;
	font-weight: bold;
	color: gray;
	padding-left: 15px;
}

.table {
	width: 100%;
	height: 420px;
	margin-top: 30px;
}

.table td:first-child {
	width: 50%;
	text-align: left;
	color: #989898;
	font-size: 20px;
	padding-left: 15px;
	font-weight: 600;
}

.table td:last-child {
	width: 50%;
	text-align: right;
	font-weight: bold;
	font-size: 18px;
	color: #6c6c6c;
	padding-right: 15px;
}

.sujung {
	color: blue;
	text-decoration: underline;
	font-size: 18px;
	font-weight: bold;
}

.midDiv {
	font-family: arial;
    font-size: 18px;
    margin: auto;
    margin-top: 30px;
    margin-bottom: 50px;
    width: 35%;
    padding: 5px;
    text-align: center;
    display: flex;
    border: 2px solid #e2e2e2;
    border-radius: 20px;
}

.midDiv div {
	width: 100%;
    background-color: #ffffff;
    top: 50%;
    padding: 15px 5px 5px 5px;
    position: relative;
	flex-direction: row;
}

.midDiv div span {
	border-bottom : 1.5px solid gray;
}

.orderDiv {
	font-family: arial;
    font-size: 15px;
    margin: auto;
    margin-top: 30px;
    width: 30%;
    position: relative;
    padding: 0px;
    text-align: center;
    display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
    justify-content: space-between;
    align-items: center;
    border: 2px solid #e2e2e2;
    border-radius: 20px;
	color: gray;
}

.orderDiv div:nth-child(2) {
	background-color: #FDF5E6;
}

.orderDiv div {
	width: 100%;
    display: flex;
    justify-content: space-around;
    align-items: center;
    flex-wrap: nowrap;
}


}
</style>
<!-- <script type="text/javascript">
	function orderDetail() {
		const f = document.idfindForm;
		f.submit();
	}
</script> -->
</head>
<body>
	<div class="main">
		<div>
			<p class="name">${memberDTO.mname} <span>님</span></p>
		</div>
		<div>
		</div>
		<div>
			<p>회원정보</p><img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/member.png">
		</div>
		<div>
			<p>리 뷰 </p><img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/riview.png">
		</div>
		<div>
			<p>주문 내역</p><img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/jomon.png">
		</div>
		<div>
			<p>문의내역</p><img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/gogek.png">
			
		</div>
	</div>	
	

	<div class="midDiv">
			<div>
				<span onclick=""> 0 </span>
				<p>입금 대기</p>
			</div>

			<div>
				<span> 0 </span>
				<p>상품 준비</p>
			</div>

			<div>
				<span> 0 </span>
				<p>배송 중</p>
			</div>

			<div>
				<span> 0 </span>
				<p>배송 완료</p>
			</div>
			<div>
				<span> 0 </span>
				<p>수령 확인</p>
			</div>
	</div>
	
	<!-- "location.href='${pageContext.request.contextPath}/admin/product/update.do?productCode=${dto.productCode}&page=${page}';"
	 -->
	 
	
	<c:forEach var="dto" items="${list}" varStatus="status">
	<div class = "orderDiv">
		<!-- 날짜 + 주문상세보기 링크 -->	
		<div style="height: 70px;">
			<span style="color: black; font-weight: bold; font-size: 20px; display: inline-block; width: 80%; text-align: left; line-height: 70px;
vertical-align: middle;" > ${dto.orderDate}</span>
			<%-- <form method="post" name="orderDetailForm" autocomplete="off" action="${pageContext.request.contextPath}/member/orderListDetail.do"> --%>

				<a onclick="location.href='${pageContext.request.contextPath}/member/orderListDetail.do?orderDetailNum=${dto.orderDetailNum}';"><span style="font-weight: bold"> 주문 상세 보기 > </span></a>
				<%-- <input type="hidden" name="orderDetailNum" value="${dto.orderDetailNum}"> --%>
			<!-- </form> -->
		</div>
		
		<!-- 이름 + 전화번호(가운데 4자리는 *로) -->
		<div style="height: 55px;" >
			<span style="font-weight: bold; display: inline-block; width: 40%; line-height: 55px;
vertical-align: middle;">${dto.memberName}</span>
			<span style="font-weight: bold; display: inline-block; width: 10%; text-align: left; line-height: 55px;
vertical-align: middle;">|</span>
			<span style="font-weight: bold; display: inline-block; width: 80%; text-align: left; line-height: 55px;
vertical-align: middle;">${dto.memberPhone}</span>
		<input type="hidden" name="orderDetailNum" value="${dto.orderDetailNum}">
		</div>
		<hr>
		<!-- 주문상태 -->
		<div style="height: 55px;">
			<span style="color: rgb(244, 112, 112); font-weight: bold; font-size: 20px; display: inline-block; width: 85%; text-align: left; line-height: 55px;
vertical-align: bottom;"> ${dto.orderStatus}</span>
		</div>
		
	
		<!-- 제품정보 -->
		<div style='display: flex; flex-direction: row; border-top: 1px solid gray; border-bottom: 1px solid gray; width: 90%;'>
			<!-- 제품사진 -->
			<div>
				<img src="${pageContext.request.contextPath }/resource/images/product/<c:out value="${dto.productCode}" />.jpg"
								 width="100px" height="100px">
			</div>
			<!-- 제품 이름, 용량 옵션, 가격, 수량 -->
			<div style='display: flex; flex-direction: column; background-color: white;'>
				<span style="font-weight: bold; width: 300px; text-align: left; font-size: 13px; color: rgb(0, 220, 146);">&nbsp;&nbsp;담화배송</span>
			
				<span style="width: 300px; text-align: left; font-weight: bold;">&nbsp; ${dto.productName}</span>
				<span style="width: 300px; text-align: left;">&nbsp; ${dto.productVolume} | ${dto.productName}</span>
				
				<hr>
				<span style="width: 300px; text-align: left;">&nbsp; ${dto.productPrice} / ${dto.orderCount}</span>
				<hr>
			</div>
			<!-- 배송조회 -->
			<div>
				<span> 배송조회 </span>
			</div>
		</div>
		<hr>
		<!-- 배송비 -->
		<div>
			<span style="width: 500px; text-align: right; font-weight: bold; margin-right: 30px;"><i class="fa-solid fa-truck-fast"></i>${dto.shippingFee}</span>
		</div>
			<hr>
	</div>
	</c:forEach>
	<div class="page-navigation">
			${dataCount == 0 ? "주문 내역이 없습니다." : paging }
	</div>
	
	
</body>
</html>