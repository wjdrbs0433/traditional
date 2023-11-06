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

<style type="text/css">
.body-main {
	max-width: 700px;
}

.table-list thead > tr:first-child { background: #f8f8f8; }
.table-list th, .table-list td { text-align: center; }
.table-list .left { text-align: left; padding-left: 5px; }

.table-list .num { width: 60px; color: #787878; }
.table-list .subject { color: #787878; }
.table-list .name { width: 100px; color: #787878; }
.table-list .date { width: 100px; color: #787878; }
.table-list .hit { width: 70px; color: #787878; }
.table-list .file { width: 50px; color: #787878; }

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
			<p class="name1" style="line-height:80px; float:right;">♣ 이벤트 </p>
		</div>
		<div>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/notice/list.do" style="color:#cccccc;">공지사항
				<img class="img" src="${pageContext.request.contextPath}/resource/images/icon/notice1.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/event/list.do">이벤트
				<img class="img" src="${pageContext.request.contextPath}/resource/images/icon/notice2.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/question.jsp" style="color:#cccccc;">자주묻는질문
				<img class="img" src="${pageContext.request.contextPath}/resource/images/icon/notice3.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/qna/list.do" style="color:#cccccc;">1:1문의
				<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/gogek.png">
			</a>
		</div>
	</div>	
	

	<div class="container body-container">
	    <div class="body-title">
			<h2><i class="fas fa-graduation-cap"></i> 
			</h2>
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
						<th class="date">작성일</th>
						<th class="hit">조회수</th>
						<th class="file">첨부</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td class="left">
								<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
							</td>
							<td>${dto.mname}</td>
							<td>${dto.reg_date}</td>
							<td>${dto.hitCount}</td>
							<td>
								<c:if test="${not empty dto.saveFilename}">
									<a href="${pageContext.request.contextPath}/event/download.do?num=${dto.num}">
										첨부
									</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page-navigation" style="text-align:center; margin:20px auto;">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
			
			<table class="table">
				<tr>
					<td align="center">
						<form name="searchForm" action="${pageContext.request.contextPath}/event/list.do" method="post">
						 <div style="display: flex; align-items: center;">
							<select name="schType" class="form-select" style="width: 120px;">
								<option value="all"      ${schType=="all"?"selected":"" }>제목+내용</option>
								<option value="mname" ${schType=="mname"?"selected":"" }>작성자</option>
								<!-- <option value="reg_date"  ${schType=="reg_date"?"selected":"" }>등록일</option> -->
								<option value="subject"  ${schType=="subject"?"selected":"" }>제목</option>
								<option value="content"  ${schType=="content"?"selected":"" }>내용</option>
							</select>
							<input type="text" name="kwd" value="${kwd}" class="form-control" 
					                    style="border: 1px solid #cccccc; border-radius: 5px; padding: 5px; display: inline-block; width: 150px;">
					         <button type="button" class="btn" onclick="searchList();" 
					             style="border: 1px solid #cccccc; border-left: none; border-radius: 0 5px 5px 0; padding: 5px; display: inline-block;">
					             검색
					         </button>
							 </div>
						</form>
					</td>
					
					<td align="right" width="100">
						<c:if test="${sessionScope.member.mid=='admin'}">
							<button type="button" id="btnDeleteList" onclick="location.href='${pageContext.request.contextPath}/event/write.do?category=${category}';">이벤트<br>올리기</button>
						</c:if>
					</td>
					<td width="100">
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/event/list.do?category=${category}';"
							title="새로고침" id="btnDeleteList">새로<br>고침
						</button>
					</td>
					
				</tr>
			</table>

	    </div>
	</div>



    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>



</body>
</html>