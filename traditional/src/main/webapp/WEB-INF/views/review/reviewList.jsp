<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<style type="text/css">

	.r1{
		margin: 50px 100px 30px 100px;
	}
	
	.r1 p{
		font-size:25px;
		font-weight: bold;
		color: gray;
		padding-left: 15px;
	}
/*
	
.body-main {
	max-width: 100%;
}
.table-list thead > tr:first-child{ background: #f8f8f8; }
.table-list th, .table-list td { text-align: center; }
.table-list .left { text-align: left; padding-left: 5px; }

.table-list .num { width: 60px; color: #787878; }
.table-list .image{ width : 100px;}
.table-list .subject { width: 200px; color: #787878; }
.table-list .content { width: 600px; color: #787878; }
.table-list .name { width: 100px; color: #787878; }
.table-list .date { width: 100px; color: #787878; }
.table-list .star { width: 70px; color: #787878; }
*/

.img { width:60px; height:60px;}

.review{
		width: 90%; /* 너비를 70%로 설정합니다. */
        margin: 0 auto; /* 왼쪽과 오른쪽에 10px의 공백을 추가합니다. */
   		margin-top: 50px;
        border: 1px solid #e2e2e2;
        border-radius: 20px;
}

.table th{
		
	    text-align: left;
	    color: #989898;
	    font-size:20px;
	    padding-left: 15px;
	    font-weight: 600;
}

</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	
	<div class="review">
		<div class="r1">
		<div>
			<p> 리뷰 게시판 </p>		
			
		</div>
			<table class="table table-border table-list">
				<thead>
					<tr>
						<th class="num">번호</th>
						<th class="image">이미지</th>
						<th class="subject">상품명</th>
						<th class="content">리뷰내용</th>
						<th class="name">작성자</th>
						<th class="date">작성일</th>
						<th class="star">별점</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${(page-1) * size + (status.index+1)}</td>
							<td><img class="img" src="${pageContext.request.contextPath }/resource/<c:out value="${dto.image}"/>"></td>
							<td>${dto.productName}</td>
							<td>${dto.reviewContent}</td>
							<td>${dto.mName}</td>
							<td>${dto.regDate}</td>
							<td>${dto.star}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<span style="float:right">${dataCount}개(${page}/${total_page} 페이지)</span>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
		</div>	
	</div>

</body>
</html>