<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<body>


</head>



</body>
<meta charset="UTF-8">
<title>main page</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="./resource/css/bootstrap.min.css">
<link rel="stylesheet" href="./resource/css/custom.css">
<link rel="stylesheet" href="./resource/css/index.css">


<script src="./resource	/js/jquery.min.js"></script>
<script src="./resource/js/popper.js"></script>
<script src="./resource/js/bootstrap.min.js"></script>
<script src="./resource/js/custom.js"></script>

<script type="text/javascript">


function modal() {
	alert("공지사항입니다.")
}


function calculate() {
  var quantity = document.getElementById('quantity').value;
  var price = document.getElementById('price').value;
  var total = quantity * price;
  document.getElementById('total').innerHTML = total + '원';
}

</script>



<div style="position: fixed; top: 200px; right: 300px; background-color: #f8f9fa; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); display: flex; flex-flow: column; align-items: center;">
    <h2 style="margin-bottom: 20px;">옵션</h2>

    <div style="margin-bottom: 10px;">
        <label for="quantity">상품 수량:</label>
        <div style="display: flex;">
            <button onclick="decreaseQuantity()" style="margin-right: 5px;">-</button>
            <input id="quantity" type="number" value="1" min="1" max="100" onchange="calculate()" style="width: 50px; text-align: center;">
            <button onclick="increaseQuantity()" style="margin-left: 5px;">+</button>
        </div>
    </div>
    <div style="margin-bottom: 10px;">
        <label for="price">개당 가격:</label>
        <input id="price" type="hidden" value="1000" min="1">
    </div>
    <div style="margin-bottom: 20px;">
        <label for="total">총 가격:</label>
        <span id="total"></span>
    </div>
    
    <div style="background-color: #ffffff; color: #000000; border: none; padding: 5px 10px; border-radius: 5px; cursor: pointer; margin-bottom: 10px;">장바구니</div>
    <div style="background-color: #ffffff; color: #000000; border: none; padding: 5px 10px; border-radius: 5px; cursor: pointer; margin-bottom: 10px;">선물하기</div>
    <div style="background-color: #1682b0; color: white; border: none; padding: 5px 10px; border-radius: 5px; cursor: pointer;">구매하기</div>
</div>

<script type="text/javascript">
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

function calculate() {
  var quantity = document.getElementById('quantity').value;
  var price = document.getElementById('price').value;
  var total = quantity * price;
  document.getElementById('total').innerHTML = total + '원';
}
</script>

</head>

<body id="body-pd">
<div class="header">
   	
  
</div>
  
   
    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
        
                <div class="nav__brand">
                        <img src="./resource/images/icon/more.png" name="menu-outline" class="nav__toggle" id="nav-toggle" style="width: 28px;" onclick="langHide()">
                </div>
                <div class="nav__list">
                    <a href="#" class="nav__link active">
                        <img src="./resource/images/icon/person.png" style="width: 28px; background-color: #cccccc; border-radius: 50%; padding: 5px;" name="menu1">
                        	<span class="nav_name">로그인 / 회원가입</span>
                         </a>
                    <a href="#" class="nav__link">
                        <img src="./resource/images/icon/home.png" style="width: 28px;" name="menu2">
                        <span class="nav_name" style="color: #1682b0;">홈</span>
                    </a>
                    <a href="#" class="nav__link" onmouseover="menu3.src='./resource/images/icon/messenger_hover.png'" onmouseout="menu3.src='./resource/images/icon/messenger.png'">
                        <img src="./resource/images/icon/messenger.png" style="width: 28px;" name="menu3">
                        <span class="nav_name">커뮤니티</span>
                    </a>
                    <a href="#" class="nav__link" onmouseover="menu4.src='./resource/images/icon/comment01.png'" onmouseout="menu4.src='./resource/images/icon/comment.png'">
                        <img src="./resource/images/icon/comment.png" style="width: 28px;" name="menu4">
                        <span class="nav_name">사용가이드</span>
                    </a>
                </div>
                
            </div>
        </nav>
    </div>
    
   
    
    
    
    <div id="wrap" style="padding: 0px 100px;">
    <div class="navbar" style="margin-top: 52px;">
        <form class="row">
            <div class="col-auto" style="position: relative; width: 300px;">
                <button class="btn" type="submit" style="position: absolute; bottom: -3px;">
                    <img src="./resource/images/icon/search.png" width="28">
                </button>
                <input id="search" class="form-control" type="search" placeholder="검색어를 입력하세요." aria-label="Search" style="width: 100%; padding-left: 50px;">
            </div>
        </form>
        <a class="navbar-brand" href="productdetail.jsp" style="position: absolute; left: 45%;">
            청 바 지
        </a>
        <div class="col-auto">
            <a class="btn" id="btn-modal" data-toggle="modal" href="#notificationModal"style="border: 0px; padding: 2px;" onclick="modal();">
            	<img src="./resource/images/icon/notification.png" width="28">
            </a>
            <a href="loginRegister.jsp"><img src="./resource/images/icon/person.png" width="52" style="background-color: #1682b0; border-radius: 40px; padding: 10px;"></a>
        </div>
    </div>
    <hr>
    
    <div id="imageContainer" style="display: flex;">
    <div class="box">
        <img id="image1" src="./resource/img/images/productdetail/productdetail1.jpg.jpg" alt="Product Image" class="resized-image">
    </div>
    <div class="box">
        <img id="image2" src="./resource/img/images/productdetail/productdetail1_1.png" alt="Product Image" class="resized-image">
    </div>
</div>

<div>
    <img id="image3" src="./resource/img/images/productdetail/productdetail1_2.png" alt="Product Image" class="resized-image">
</div>

<div>
    <img id="image4" src="./resource/img/images/productdetail/productdetail1_3.png" alt="Product Image" class="resized-image">
</div>

<div>
    <img id="image5" src="./resource/img/images/productdetail/productdetail1_4.png" alt="Product Image" class="resized-image">
</div>

<div>
    <img id="image6" src="./resource/img/images/productdetail/productdetail1_5.png" alt="Product Image" class="resized-image">
</div>




<script type="text/javascript">
window.onload = function() {
    var image1 = document.getElementById('image1');
    var image2 = document.getElementById('image2');
    var image3 = document.getElementById('image3');
    var image4 = document.getElementById('image4');
    var image5 = document.getElementById('image5');
    var image6 = document.getElementById('image6');
    
    var totalWidth = image1.offsetWidth + image2.offsetWidth;
    image3.style.width = totalWidth + 'px';
    
    var totalWidth = image1.offsetWidth + image2.offsetWidth;
    image4.style.width = totalWidth + 'px';
    
    var totalWidth = image1.offsetWidth + image2.offsetWidth;
    image5.style.width = totalWidth + 'px';
    
    
    var totalWidth = image1.offsetWidth + image2.offsetWidth;
    image6.style.width = totalWidth + 'px';
    
}
</script>
   
    
    
<hr style="1px solid #ccc; position: absolute; width: 100%; left: 0px;">
<div class="footer" style="padding: 0px 100px;">
	
	
	
	
</div>
<%--
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
    InitialContext ic = new InitialContext();
    DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/OracleDB");
    Connection conn = ds.getConnection();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM reviews");
%>

<table>
    <tr>
        <th>No</th>
        <th>User</th>
        <th>Review</th>
        <th>Rating</th>
    </tr>
    <% while (rs.next()) { %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("user_name") %></td>
        <td><%= rs.getString("review") %></td>
        <td><%= rs.getInt("rating") %></td>
    </tr>
    <% } %>
</table>

<%
    rs.close();
    stmt.close();
    conn.close();
%>



 --%>


</body>

</html>