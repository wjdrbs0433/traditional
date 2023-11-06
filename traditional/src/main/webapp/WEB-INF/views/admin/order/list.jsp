<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin main page</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/index.css">

<script
	src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/popper.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>


<style>
.searchbox {
	margin: 5px auto;
	padding-bottom: 0;
	box-shadow: 0 0 0 1px #999;
	width: 1100px;
}

.searchbox th {
	text-align: right;
	padding: 10px;
}

.searchbox td {
	text-align: left;
	padding: 10px;
}

#tbox {
	width: 200px;
}

.searchbutton {
	margin: 0 auto;
}

.btns {
	color: #333333;
	border: 1px solid #999999 !important;
	background-color: #ffffff;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor: pointer;
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}

.listbox {
	table-layout: auto;
	margin: 20px auto;
}

.listbox tr {
	border-bottom: 1px solid #b4b4b4;
}

.listbox th {
	text-align: center;
	font-size: 15px;
	margin: 5px;
}

.listbox td {
	font-size: 15px;
	margin: 5px;
}

.listbox thead tr th {
	white-space: nowrap;
}

header {
	padding-bottom: 30px;
}

header th {
	padding: 10px 10px 10px 5px;
}

header td {
	padding: 10px 0px 10px 20px;
}

main th, td {
	padding: 10px;
}

#body-pd {
	overflow: auto;
	white-space: nowrap;
}
</style>



<script type="text/javascript">
	function modal() {
		alert("공지사항입니다.")
	}

	function searchList() {
		const f = document.searchForm;
		f.submit();
	}

</script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>

<body id="body-pd">
	<jsp:include page="/WEB-INF/views/layout/adminheader.jsp" />

	<div id="wrap" style="padding: 0px 20px;">
		<div class="navbar" style="margin-top: 52px;">

			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/admin/order/list.do"
				style="position: absolute; left: 45%;"> 주문 리스트 </a>

		</div>
		<hr>
		<div id="recommend">
			<h6 style="margin: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;주문관리 > 주문 리스트</h6>
		</div>

		<header>
			<div>
				<div class="search">
					<form name="searchForm"
						action="${pageContext.request.contextPath}/admin/order/list.do"
						method="post">
						<table class="searchbox">
							<tr>
								<th>주문번호</th>
								<td><input type="text" name="orderNumKwd"
									value="" id="tbox" class="form-control">
								</td>
							</tr>
							<tr>
								<th>주문 날짜</th>
								<td><input type="date" name="orderDateStart" value="o1">~
									<input type="date" name="orderDateEnd" value="o2">
								</td>
							</tr>
							<tr>
								<th>주문금액</th>
								<td>
									<input type="checkbox" name="orderPriceKwd" value="p1">&nbsp;1만원 미만&nbsp;&nbsp; 
									<input type="checkbox" name="orderPriceKwd" value="p2">&nbsp;1만원 이상 ~ 3만원 미만&nbsp;&nbsp; 
									<input type="checkbox" name="orderPriceKwd" value="p3">&nbsp;3만원 이상 ~ 5만원 미만&nbsp;&nbsp; 
									<input type="checkbox" name="orderPriceKwd" value="p4">&nbsp;5만원 이상&nbsp;&nbsp;</td>
							</tr>
							
							
							<tr>
								<th>총 결제 금액</th>
								<td>
									<input type="checkbox" name="totalPriceKwd" value="p1">&nbsp;1만원 미만&nbsp;&nbsp; 
									<input type="checkbox" name="totalPriceKwd" value="p2">&nbsp;1만원 이상 ~ 3만원 미만&nbsp;&nbsp; 
									<input type="checkbox" name="totalPriceKwd" value="p3">&nbsp;3만원 이상 ~ 5만원 미만&nbsp;&nbsp; 
									<input type="checkbox" name="totalPriceKwd" value="p4">&nbsp;5만원 이상&nbsp;&nbsp;
								</td>
							</tr>
							
							<tr>
								<th>주문 상태</th>
								<td>
									<select name="orderStatusKwd">
										<option value="">:::선택:::</option>
										<option value="결제 완료">결제 완료</option>
										<option value="배송 준비중">배송 준비중</option>
										<option value="배송중">배송중</option>
										<option value="배송 완료">배송 완료</option>
										<option value="구매 확정">구매 확정</option>
									</select>
								</td>
							</tr>
							
							
							
							<!-- [결제 완료 / 배송 준비중 / 배송중 / 배송 완료 / 구매 확정] -->
							

						</table>
					</form>
				</div>
				<div>
					<table class="searchbutton">
						<tr align="center">
							<td width="100">
								<button type="button" class="btns" onclick="searchList();">검색</button>
							</td>
							<td width="100">
								<button type="button" class="btns"
									onclick="location.href='${pageContext.request.contextPath}/admin/order/list.do';">초기화</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</header>

		<main>

			<div>
				<form name="listForm">

					<h6>${dataCount}개(${page}/${total_page}페이지)</h6>

					<table class="listbox">
						<thead>
							<tr>
								<th>번호</th>
								<th>주문 번호</th>
								<th>주문 날짜</th>
								<th>주문 금액</th>
								<th>총 결제 금액</th>
								<th>배송비</th>
								<th>주문 상태</th>
								<th>회원 번호</th>
								<th>수정</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr>
									<td>${dataCount-(page-1)*size - status.index }</td>
									<td>${dto.orderNum}</td>
									<td>${dto.orderDate}</td>
									<td>${dto.orderPrice}</td>
									<td>${dto.totalPrice}</td>
									<td>${dto.shippingFee}</td>
									<td>${dto.orderStatus}</td>
									<td>${dto.mNum}</td>
									<td>
										<button type="button" class="btns"
											onclick="location.href='${pageContext.request.contextPath}/admin/order/update.do?orderNum=${dto.orderNum}&page=${page}';">수정</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>


				<div class="page-navigation" style="text-align: center">
					${dataCount == 0 ? "등록된 게시글이 없습니다." : paging }
				</div>
			</div>
		</main>

	</div>




</body>

</html>