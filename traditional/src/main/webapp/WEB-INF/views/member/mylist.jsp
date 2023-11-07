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

.body-main {
	max-width: 700px;
}

.table-list thead > tr:first-child { background: #f8f8f8; }
.table-list th, .table-list td { text-align: center; }

.table-list .notice { display: inline-block; padding:1px 3px; background: #ed4c00; color: #fff; }
.table-list .left { text-align: left; padding-left: 5px; }

.table-list .chk { width: 40px; color: #787878; }
.table-list .num { width: 60px; color: #787878; }
.table-list .subject { color: #787878; }
.table-list .name { width: 100px; color: #787878; }
.table-list .date { width: 100px; color: #787878; }
.table-list .hit { width: 70px; color: #787878; }

.table-list input[type=checkbox] { vertical-align: middle; }
.item-delete { cursor: pointer; padding: 7px 13px; }
.item-delete:hover { font-weight: 500; color: #2478FF; }

#btnDeleteList {
    background-color: gray;
    color: white;
    border: none;
    border-radius: 18px;
    padding: 10px 15px;
    cursor: pointer;
}

#btnDeleteList:hover {
    background-color: #0e4aae;
}

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
	    height: 420px;
	    margin-top: 30px;
	    
	}
	
	
	.table td:first-child {
	    width: 50%;
	    text-align: left;
	    color: #989898;
	    font-size:20px;
	    padding-left: 15px;
	    font-weight: 600;
	}
	
	.table td:last-child {
	    width: 50%;
	    text-align: right;
	    font-weight:bold;
	    font-size:18px;
	    color: #6c6c6c;
	    padding-right: 15px;
	}
	
	.sujung {
	    color: blue;
	    text-decoration: underline;
	    font-size: 18px;
	    font-weight: bold;
	}
	
.listbox {  
margin: 20px auto;
width: 700px;
}
.listbox tr { border-bottom:1px solid #b4b4b4; }
.listbox th, td { text-align: center; font-size: 15px; margin: 5px; }
.listbox thead tr th { white-space: nowrap;}
	
	
	
</style>
<script>
function deleteList(num){
	if(confirm('문의내역을 삭제하시겠습니까?')){
		location.href = "${pageContext.request.contextPath}/myqna/delete.do?num="+num;
	}
}


</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	
	<div class="main">
		<div>
			<p class="name" style="line-height:80px; float:right;">${memberDTO.mname} <span>님</span></p>
		</div>
		<div>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/member/mypage.do" style="color:#cccccc;">회원정보
			<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/member.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/review/myList.do" style="color:#cccccc;">마이리뷰
			<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/riview.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/member/orderList.do" style="color:#cccccc;">주문 내역
			<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/jomon.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/myqna/mylist.do">문의 내역
			<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/gogek.png">
			</a>
		</div>
	</div>	
	
	
	
	<div class="member">
		<div class="m1">
			<p>1:1 문의 내역<p>
			<hr>
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qna/list.do';">1:1문의하기 > </button>
			 
				<div class="wrap-inner">
			
					<div class="list-header">
						<span class="item-count">문의내역 ${dataCount}건</span>
						<span class="item-desc">[목록, ${page}/${total_page} 페이지]</span>
					</div>
					
					<div>
			<form name="listForm">
			
			<table class="listbox">
				<thead>
					<tr>
						<th class="num">번호</th>
						<th class="title">제목</th>
						<th class="content">내용</th>
						<th class="date">질문일자</th>
						<th class="hit">처리결과</th>
					</tr>
					
				</thead>
			
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">

						<tr>
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td><a href="${articleUrl}&num=${dto.num}">${dto.title}</a></td>
							<!-- <td>${dto.title}</td>  -->
							<td>${dto.content}</td>
							<td>${dto.reg_date}</td>
							<td>${not empty dto.answerId?"답변완료":"답변대기"}</td>
							<td>
								<button type="button" class="btns" id="btnDeleteList" onclick="deleteList('${dto.num}')">삭제</button>
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
			
</div>
</div>
</div>
	
</body>
</html>