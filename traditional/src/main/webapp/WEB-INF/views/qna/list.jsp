<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>spring</title>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
<script src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style type="text/css">
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

.main{
		width: 900px; /* 너비를 70%로 설정합니다. */
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
	
	.name1 {
		font-size: 25px;
		font-weight:bold;
	}
	
	.name1 span {
		color: gray;
		font-size: 20px;
		font-weight: normal;
	}
	.page-navigation {
		clear: both;
		padding: 20px 0;
		text-align: center;
	}
	.paginate {
		clear: both;
		text-align: center;
		white-space: nowrap;
		font-size: 14px;	
	}
	.paginate a {
		border: 1px solid #cccccc;
		color: #000000;
		font-weight: 600;
		text-decoration: none;
		padding: 3px 7px;
		margin-left: 3px;
		vertical-align: middle;
	}
	.paginate a:hover, .paginate a:active {
		color: #6771ff;
	}
	.paginate span {
		border: 1px solid #e28d8d;
		color: #cb3536;
		font-weight: 600;
		padding: 3px 7px;
		margin-left: 3px;
		vertical-align: middle;
	}
	.paginate :first-child {
		margin-left: 0;
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

	<div class="main">
		<div>
			<p class="name1" style="line-height:80px; float:right;">♣ 1:1문의 </p>
		</div>
		<div>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/notice/list.do" style="color:#cccccc;">공지사항
				<img class="img" src="${pageContext.request.contextPath}/resource/images/icon/notice1.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/event/list.do" style="color:#cccccc;">이벤트
				<img class="img" src="${pageContext.request.contextPath}/resource/images/icon/notice2.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/question.jsp" style="color:#cccccc;">자주묻는질문
				<img class="img" src="${pageContext.request.contextPath}/resource/images/icon/notice3.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/qna/list.do">1:1문의
				<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/gogek.png">
			</a>
		</div>
	</div>	

	<div class="container body-container">
	    <div class="body-title">
			<h2><i class="fa-solid fa-person-circle-question"></i>  </h2>
	    </div>
	    
	    <div class="body-main mx-auto">
			<table class="table">
				<tr>
					<td width="50%">
						${dataCount}개(${page}/${total_page} 페이지)
					</td>
					<td align="right">&nbsp;</td>
				</tr>
			</table>
			
			<table class="table table-border table-list">
				<thead>
					<tr>
						<th class="num">번호</th>
						<th class="subject">제목</th>
						<th class="name">작성자</th>
						<th class="date">질문일자</th>
						<th class="hit">처리결과</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td class="left">
								<c:choose>
									<c:when test="${dto.secret==1}">
										<c:if test="${sessionScope.member.mid==dto.userId || sessionScope.member.mid=='admin'}">
											<a href="${articleUrl}&num=${dto.num}">${dto.title}</a>
										</c:if>
										<c:if test="${sessionScope.member.mid!=dto.userId && sessionScope.member.mid!='admin'}">
											비밀글 입니다.
										</c:if>
										<i class="fa-solid fa-key"></i>
									</c:when>
									<c:otherwise>
										<a href="${articleUrl}&num=${dto.num}">${dto.title}</a>
									</c:otherwise>
								</c:choose>								
								
							</td>
							<td>${dto.userId}</td>
							<td>${dto.reg_date}</td>
							<td>${not empty dto.answerId?"답변완료":"답변대기"}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page-navigation" style="text-align:center; margin:20px auto;">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
			
			<table class="table">
				<tr>
					<td width="100">

						<button type="button" onclick="location.href='${pageContext.request.contextPath}/qna/list.do';" 
							title="새로고침" id="btnDeleteList">새로<br>고침
						</button>
					</td>
					<td align="center">
						<form name="searchForm" action="${pageContext.request.contextPath}/qna/list.do" method="post">
							<input type="text" name="kwd" value="${kwd}" class="form-control"
									style="width: 200px;" 
									placeholder="검색 키워드를 입력하세요">
							<button type="button" class="btn" onclick="searchList();">검색</button>
						</form>
					</td>
					<td align="right" width="100">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qna/write.do';" id="btnDeleteList">
							질문<br>등록
						</button>
					</td>
					
				</tr>
			</table>

	    </div>
	</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</html>