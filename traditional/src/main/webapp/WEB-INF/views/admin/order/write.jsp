<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin main page</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
<style type="text/css">
.table {  width: 1000px; margin: 20px auto;}

.tablebutton { margin: 20px auto; }

#tbox { width: 500px;  }

.btn {
	color: #333333;
	border: 1px solid #999999 !important; 
	background-color: #ffffff;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor:pointer;
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}

</style>


<script src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>

<script type="text/javascript">
function modal() {
	alert("공지사항입니다.")
}

function sendOk() {
    
	const f = document.updateForm;
	
	let str;
	
    
    
    str = f.orderStatusKwd.value.trim();
    if(!str) {
        alert("주문 상태를 선택하세요. ");
        f.orderStatusKwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/admin/order/update_ok.do";
    	/* ?orderNum=${dto.orderNum}&orderDate=${dto.orderDate}&orderPrice=${dto.orderPrice}&totalPrice=${dto.totalPrice}&deliveryNum=${dto.deliveryNum}&mNum=${dto.mNum}&shippingFee=${dto.shippingFee}&orderStatusKwd=${orderStatusKwd}&page=${page}" */
    
    /*  */
    f.submit();
}


</script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>
<body id="body-pd">
<jsp:include page="/WEB-INF/views/layout/adminheader.jsp"/>
    
    
    <div id="wrap" style="padding: 0px 100px;">
    <div class="navbar" style="margin-top: 52px;">
        
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/order/list.do" style="position: absolute; left: 45%;">
           	주문 수정
        </a>
    </div>
     
    <hr>
    <div id="recommend">
    <h6 style="margin: 10px;">
    주문 관리 > 주문 리스트 > 주문 수정</h6>
    </div>
    
	
	<form name="updateForm" method="post" enctype="multipart/form-data">
	<table class="table table-form">

		<tr>
			<td>주문 번호</td>
			<td>
				<input type="text" name="orderNum" class="form-control" id="tbox" readonly="readonly" value="${dto.orderNum}">
				
			</td>
		</tr>
		<tr>
			<td>배송지 코드</td>
			<td>
				<input type="text" name="deliveryNum" class="form-control" id="tbox" readonly="readonly" value="${dto.deliveryNum}">
			</td>
		</tr>
		<tr>
			<td>주문 날짜</td>
			<td>
				<input type="text" name="orderDate" class="form-control" id="tbox" readonly="readonly" value="${dto.orderDate}">
			</td>
		</tr>
		<tr>
			<td>주문 금액</td>
			<td>
				<input type="text" name="orderPrice" class="form-control" id="tbox" readonly="readonly" value="${dto.orderPrice}">
			</td>
		</tr>
		
		<tr>
			<td>배송비</td>
			<td>
				<input type="text" name="shippingFee" class="form-control" id="tbox" readonly="readonly" value="${dto.shippingFee}">
			</td>
		</tr>
		<tr>
			<td>총 결제 금액</td>
			<td>
				<input type="text" name="totalPrice" class="form-control" id="tbox" readonly="readonly" value="${dto.totalPrice}">
			</td>
		</tr>
		<tr>
			<td>주문 상태</td>
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
		<tr>
			<td>회원번호</td>
			<td>
				<input type="text" name="mNum" class="form-control" id="tbox" readonly="readonly" value="${dto.mNum}">
			</td>
		</tr>
		
	</table>
	
	<table class="tablebutton">
		<tr align="center">
			<td>
	 			<button type="button" class="btn" onclick="sendOk();">수정완료</button>
				<button type="reset" class="btn">다시입력</button>
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/order/list.do?size=${size}';">수정취소</button>

			</td>
		</tr>
	</table>
	</form>
</div>
    
    


    


</body>

</html>