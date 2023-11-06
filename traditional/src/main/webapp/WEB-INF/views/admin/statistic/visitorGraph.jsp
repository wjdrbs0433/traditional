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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

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
.box1 {
	display: flex;
	overflow: auto;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.dashbox {
	border: 2px solid skyblue;
	width: 300px;
	margin: 10px;
}

.dash {
	display: flex;
	flex-wrap: wrap;
	overflow: auto;
	justify-content: center;
    align-items: center;
}
</style>





<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>

<body id="body-pd">
	<jsp:include page="/WEB-INF/views/layout/adminheader.jsp" />

	<div id="wrap" style="padding: 0px 20px;">
		<div class="navbar" style="margin-top: 52px;">

			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/admin/statistic/statistic.do"
				style="position: absolute; left: 49%;"> 통 계 </a>

		</div>
		<hr>
		
		<div class="dash">
			<div class="box1">
				<table class="dashbox">
					<tr>
						<th
							onclick="location.href='${pageContext.request.contextPath}/admin/statistic/graph.do';"><i
							class="fa-solid fa-store"></i>&nbsp; 회원 가입자 통계</th>
					</tr>
				</table>

				<table class="dashbox">
					<tr>
						<th
							onclick="location.href='${pageContext.request.contextPath}/admin/statistic/sales.do';"><i
							class="fa-solid fa-truck-fast"></i>&nbsp; 매출 관리</th>
					</tr>
				</table>

				<table class="dashbox">
					<tr>
						<th
							onclick="location.href='${pageContext.request.contextPath}/admin/statistic/visitor.do';"><i 
							class="fa-solid fa-newspaper"></i>&nbsp; 접속자 수 관리</th>
					</tr>
				</table>
			</div>
		</div>
		
		<hr>
		
		
		<div id="recommend">
			<h6 style="margin: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;통계 > 접속자 수 ${date == "2" ? "> 월별" : "> 일별"}</h6>
		</div>

		<header> </header>

		<main>

			<div style="width: 80%; height: 80%; margin: 0px auto;">
				<form name="dateForm"
					action="${pageContext.request.contextPath}/admin/statistic/visitor.do"
					method="post">

					<table class="listbox">
						<thead>
							<tr>

								<td><span style="align-items: flex-end;">기간</span> <select
									name="date" id="date">
										<option value="1" ${ date == "1" ? "selected":"0"}>일별</option>
										<option value="2" ${ date == "2" ? "selected":"0"}>월별</option>
										<%-- 								<option value="3" ${ date == "3" ? "selected":"0"}>연별</option> --%>
								</select>
									<button type="submit"
										onclick="location.href='${pageContext.request.contextPath}/admin/statistic/visitor.do';">
										전송</button></td>
							</tr>

						</thead>

						<tbody>
							<canvas id="myChart">
							</canvas>
						</tbody>
					</table>
		
				</form>
				</div>
		</main>

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
            label: '접속자 수 (단위 : 명)',
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
                /* 'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)' */
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