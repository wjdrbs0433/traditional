<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>

<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">

<script src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function modal() {
		alert("공지사항입니다.")
	}

	function calculate() {
	    var quantity = document.getElementById('quantity').value;
	    var price = document.getElementById('price').value;
	    var total = quantity * price;
	    var formattedTotal = total.toLocaleString();
	    document.getElementById('total').innerHTML = formattedTotal + '원';
	}

	function decreaseQuantity() {
		var quantity = document.getElementById('quantity');
		if (quantity.value > 1) {
			quantity.value--;
		}
		calculate();
	}

	function increaseQuantity() {
		var quantity = document.getElementById('quantity');
		if (quantity.value < 100) {
			quantity.value++;
		}
		calculate();
	}
</script>
<script>
function redirectToOrderPage() {
    var quantity = document.getElementById('quantity').value;
    var price = document.getElementById('price').value;
    var total = quantity * price;
    var productCode = ${product.productCode};
    var productPrice = ${product.productPrice};

    window.location.href = '${pageContext.request.contextPath}/product/order.do?total=' + total + '&productCode=' + productCode + '&quantity=' + quantity + '&productPrice=' + productPrice;
}
</script>
<style type="text/css">
.fixed-element {
	width: 350px;
	height: 500px;
	position: fixed;
	margin-top: 50px;
	left: 1250px;
	background-color: #f8f9fa;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
	display: flex;
	flex-flow: column;
	align-items: flex-start;
}

.fixed-element label {
	font-size: 25px;
	margin-right: 25px;
	font-weight: bold;
	text-shadow: 1px 0px 1px #000;
}

.fixed-element button {
	font-size: 25px;
	margin-right: 5px;
	text-shadow: 1px 0px 1px #000;
}

.button-container {
	background-color: #ffffff;
	color: #000000;
	border: none;
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

.social-sharing-buttons {
	display: flex;
	justify-content: space-between;
}

.social-sharing-buttons a {
	text-decoration: none;
	color: black;
	margin: 5px;
}

.image-container {
	display: flex;
	align-items: flex-start;
	margin-bottom: 20px;
}

.image-container img {
	width: 660px;
	margin-right: 20px;
}

.text-container {
	flex: 1;
}

.text-container h4 {
	font-weight: bold;
	margin-bottom: 10px;
}

.text-container p {
	margin-bottom: 5px;
}

.quantity-controls {
	display: flex;
	align-items: center;
}

.quantity-controls button {
	background-color: #1682b0;
	color: white;
	border: none;
	width: 30px;
	height: 30px;
	font-size: 18px;
	border-radius: 50%;
	cursor: pointer;
}

.quantity-controls input {
	width: 50px;
	text-align: center;
	font-size: 18px;
	border: 2px solid #1682b0;
	border-radius: 5px;
}
</style>

</head>

<body id="body-pd">
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
    

		<div class="fixed-element">
			<h2 style="margin-bottom: 30px; color: blue; text-shadow: 1px 0px 2px #000; margin:20px auto;">
				옵션
			</h2>

			<div>
				<div style="display: flex;">
					<label for="quantity">상품 수량 : </label>
					<div>
						<div style="display: flex;">
							<div class="quantity-controls">
						        <button onclick="decreaseQuantity()">-</button>
						        <input id="quantity" type="number" value="1" min="1" max="100" onchange="calculate()">
						        <button onclick="increaseQuantity()">+</button>
						    </div>	
						</div>
					</div>
				</div>
			</div>
			
			<div>
				<label for="price">상품 단가 : <fmt:formatNumber type="number" value="${product.productPrice}" pattern="#,###" />원</label>
				<input id="price" type="hidden" value="${product.productPrice}" min="0">
			</div>
			<div>
				<label for="total">총 가격:&nbsp;</label> 
				<label id="total" style="color:black"><fmt:formatNumber type="number" value="${product.productPrice}" pattern="#,###" />원</label>
			</div>

			<button type="button" class="button-container">장바구니</button>
			<button type="button" class="button-container" onclick="redirectToOrderPage()">구매하기</button>
			
			<div class="social-sharing-buttons" style="margin-top:10px; margin-left:170px;">
		        <a href="https://www.instagram.com/" target="_blank">
		            <img src="${pageContext.request.contextPath}/resource/images/icon/instagram.png" alt="Instagram" style="width:35px;">
		        </a>
		        <a href="https://www.facebook.com/" target="_blank">
		            <img src="${pageContext.request.contextPath}/resource/images/icon/facebook.png" alt="Facebook" style="width:35px;">
		        </a>
		        <a href="https://www.twitter.com/" target="_blank">
				    <img src="${pageContext.request.contextPath}/resource/images/icon/twitter.png" alt="Twitter" style="width:35px;">
				</a>
   			</div>
			
		</div>


		 <div class="image-container">
        <img src="${pageContext.request.contextPath}/resource/images/product/<c:out value="${product.productCode}" />.jpg">
        <div class="text-container">
            <h4>${product.productName}</h4>
            <h5>${product.productSubject}</h5>
            <a style="color:lightblue;">${product.hashtag}</a><br>
            <a style="color:lightblue;">#카페라떼처럼 부드러운</a> <br>
            <!-- 리뷰하는 곳 -->
            <a href="#" style="color:blue; text-decoration:underline;">
            	별점 5.0 / 리뷰 0개
            </a>
            <p style="margin-top:20px;">*주종 : ${product.productcategory}</p>
            <p>*도수 : ${product.alcoholPercent}%</p>
            <p style="margin-bottom:20px;">*용량 : ${product.volume}ml</p>
            <p style="color:#cccccc">배송기간 : 2일 이내 배송</p>
            <p style="color:#cccccc; margin-bottom:20px;">${product.breweryPage}</p>
            <p>판매 가격:</p>
            <h2><fmt:formatNumber type="number" value="${product.productPrice}" pattern="#,###" />원</h2>
            <p style="color:blue;">*유통기한 : ${product.expirationDate}까지</p>
            <p style="color:blue;">*보관방법 : ${product.productStorage}</p>
        </div>
    </div>
    <div class="image-container">
        <img src="${pageContext.request.contextPath}/resource/images/product/<c:out value="${product.productCode}" />.1.jpg">
    </div>

    <div class="image-container">
        <img src="${pageContext.request.contextPath}/resource/images/product/<c:out value="${product.productCode}" />.2.jpg">
    </div>



<hr style="1px solid #ccc; position: absolute; width: 100%; left: 0px;">
<div class="footer" style="padding: 0px 100px;">

</div>


	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

</body>
</html>