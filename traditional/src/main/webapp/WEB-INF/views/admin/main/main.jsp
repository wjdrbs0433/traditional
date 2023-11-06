<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin main page</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
<style type="text/css">
.box1 { width: 1600px; 
	display: flex;
	overflow: auto;
	justify-content: center;
    align-items: center;}
    
.box2 { width: 1600px;}

.dashbox { border: 1px solid skyblue; width: 300px;  margin: 10px;}

.summary { border: 1px solid skyblue; width: 50%; text-align: right; margin: 10px 15px 40px 15px;}

th, td { padding: 10px; }


.dashbox td:nth-child(2n-1) { text-align: left; }
.dashbox td:nth-child(2n) { text-align: right; }

.summary tr:last-child {border-top: 1px dotted gray; border-collapse: collapse;}
.summary td:nth-child(6n+1) { text-align: center; }

.dash {
	display: flex;
	flex-wrap: wrap;
	overflow: auto;
	justify-content: center;
    align-items: center;
}

</style>


<script src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>

<script type="text/javascript">
function modal() {
	alert("통계페이지로 이동합니다.");
}

</script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>
<body id="body-pd">
    
    
    <jsp:include page="/WEB-INF/views/layout/adminheader.jsp"/>
	
	<div id="wrap" style="padding: 0px 100px;">
    <div class="navbar" style="margin-top: 52px;">
        <form class="row">
        </form>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/main.do" style="position: absolute; left: 45%;">
           	관리자 페이지
        </a>
        <div class="col-auto">
            <a class="btn" id="btn-modal" data-toggle="modal" href="${pageContext.request.contextPath}/admin/statistic/statistic.do" style="border: 0px; padding: 2px;" onclick="modal();">
            	<img src="${pageContext.request.contextPath}/resource/images/icon/notification.png" width="28">
            </a>
           <c:choose>
                  <c:when test="${empty sessionScope.member}">
                     <!--로그인 전-->
                <a href="${pageContext.request.contextPath}/member/login.do" title="로그인">     
	            	<img src="${pageContext.request.contextPath}/resource/images/icon/person.png" width="52" 
	            				style="background-color: #1682b0; border-radius: 40px; padding: 10px;">
	            </a>
	        </c:when>
	        
	        <c:when test="${sessionScope.member.mid == 'admin'}">
                     <!--관리자 모드-->
                <a href="${pageContext.request.contextPath}/member/logout.do" title="로그아웃">
                	<img src="${pageContext.request.contextPath}/resource/images/icon/play-button.png" width="52" 
	            				style="background-color: #1682b0; border-radius: 40px; padding: 10px;"></a>
            </c:when>
            
            <c:otherwise>
                     <!--로그인 후-->
                <a href="${pageContext.request.contextPath}/member/logout.do" title="로그아웃">
                	<img src="${pageContext.request.contextPath}/resource/images/icon/play-button.png" width="52" 
	            				style="background-color: #1682b0; border-radius: 40px; padding: 10px;"></a>
            </c:otherwise>
            </c:choose>
        </div>
    </div>
   
    <hr>
    
    <div id="recommend">
    <h2 style="margin: 40px;">DASHBOARD</h2>
    </div>
    
    <div class="dash">
    <div class="box1">
    	<table class="dashbox"> <!-- 대략적인 정보만 보여주기 or 바로가기 메뉴 -->
    		<tr>
    			<th><i class="fa-solid fa-store"></i>&nbsp;상품관리</th>
    		</tr>
    		<tr>
    			<td>판매중</td>
    			<td>?개</td>
    		</tr>
    		<tr>
    			<td>일시품절</td>
    			<td>?개</td>
    		</tr>
    		<tr>
    			<td>삭제된상품</td>
    			<td>?개</td>
    		</tr>
    	</table>
    	
    	
    	<table class="dashbox">
    		<tr>
    			<th><i class="fa-solid fa-truck-fast"></i>&nbsp;주문관리</th>
    		</tr>
    		<tr>
    			<td>결제확인</td>
    			<td>?건</td>
    		</tr>
    		<tr>
    			<td>배송준비중</td>
    			<td>?건</td>
    		</tr>
    		<tr>
    			<td>배송완료</td>
    			<td>?건</td>
    		</tr>
    	</table>
    	
    	<table class="dashbox">
    		<tr>
    			<th><i class="fa-solid fa-pen-to-square"></i>&nbsp;리뷰 및 문의</th>
    		</tr>
    		<tr>
    			<td>최근리뷰</td>
    			<td>?건</td>
    		</tr>
    		<tr>
    			<td>최근문의</td>
    			<td>?건</td>
    		</tr>
    		<tr>
    			<td>답변완료</td>
    			<td>?건</td>
    		</tr>
    	</table>
    	
    	<table class="dashbox">
    		<tr>
    			<th><i class="fa-solid fa-newspaper"></i>&nbsp;사이트현황</th>
    		</tr>
    		<tr>
    			<td>금일 가입자수</td>
    			<td>${todayReg} 명</td>
    		</tr>
    		<tr>
    			<td>금일 탈퇴자수</td>
    			<td>?명</td>
    		</tr>
    		<tr>
    			<td>일 주문건수</td>
    			<td>?건</td>
    		</tr>
    	</table>
    	
    	<table class="dashbox" >
    		<tr>
    			<th><i class="fa-solid fa-sitemap"></i>&nbsp;홈페이지관리</th>
    		</tr>
    		<tr>
    			<td>최근리뷰</td>
    			<td>?건</td>
    		</tr>
    		<tr>
    			<td>공지사항관리</td>
    		</tr>
    		<tr>
    			<td>이벤트관리</td>
    		</tr>
    	</table>
    </div>
    
    	<div class="box2">
    		<canvas id="myChart">
    		</canvas>
    	</div>
    	
    	<!-- 
    	<table class="dashbox" style="text-align: center">
    		<tr>
    			<th>TODAY'S VISITOR</th>
    		</tr>
    		<tr>
    			<td><h3 style="text-align: center">n명</h3></td>
    		</tr>
    	</table>
    	 -->
    </div>
 </div>

    


</body>

<script>
const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [
        	'${label}'
        	/* 'Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange' */
        	],
        datasets: [{
            label: '회원가입자 수',
            data: [
            	/* 12, 19, 3, 5, 2, 3 */
            	${data}
            	],
            backgroundColor: [
                /* 'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)' */
            ],
            borderColor: [
                 'rgba(135, 206, 235, 1)',
                'rgba(135, 206, 235, 1)',
                'rgba(135, 206, 235, 1)',
                'rgba(135, 206, 235, 1)',
                'rgba(135, 206, 235, 1)',
                'rgba(135, 206, 235, 1)',
                'rgba(135, 206, 235, 1)',
                'rgba(135, 206, 235, 1)',
                'rgba(135, 206, 235, 1)'
                
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>

</html>