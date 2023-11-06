<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
.body-main {
	max-width: 700px;
}

.table-list thead > tr:first-child{ background: #f8f8f8; }
.table-list th, .table-list td { text-align: center; }
.table-list .left { text-align: left; padding-left: 5px; }

.table-list .num { width: 60px; color: #787878; }
.table-list .image{ width : 100px;}
.table-list .subject { width: 400px; color: #787878; }
.table-list .name { width: 100px; color: #787878; }
.table-list .date { width: 100px; color: #787878; }
.table-list .hit { width: 70px; color: #787878; }

img { width:60px; height:60px;}
</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>
</head>
<body>
	<main>
	<div class="container body-container">
	    <div class="body-title">
			<h2> 리뷰 게시판 </h2>
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
						<th class="image">이미지</th>
						<th class="subject">상품명</th>
						<th class="name">작성자</th>
						<th class="date">작성일</th>
						<th class="hit">조회수</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${(page-1) * size + (status.index+1)}</td>
							<td><img src="${pageContext.request.contextPath }/resource/<c:out value="${dto.image}"/>"></td>
							<td>${dto.productName}</td>
							<td>${dto.reviewer}</td>
							<td>${dto.regDate}</td>
							<td>${dto.hitCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
			
			<table class="table">
				<tr>
					<td width="100">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/bbs/list.do';" title="새로고침"><i class="fa-solid fa-arrow-rotate-right"></i></button>
					</td>
					<td align="center">
						<form name="searchForm" action="${pageContext.request.contextPath}/bbs/list.do" method="post">
							<select name="schType" class="form-select">
								<option value="all"      ${schType=="all"?"selected":"" }>제목+내용</option>
								<option value="userName" ${schType=="userName"?"selected":"" }>작성자</option>
								<option value="reg_date"  ${schType=="reg_date"?"selected":"" }>등록일</option>
								<option value="subject"  ${schType=="subject"?"selected":"" }>제목</option>
								<option value="content"  ${schType=="content"?"selected":"" }>내용</option>
							</select>
							<input type="text" name="kwd" value="${kwd}" class="form-control">
							<button type="button" class="btn" onclick="searchList();">검색</button>
						</form>
					</td>
					
				</tr>
			</table>

	    </div>
	</div>
</main>
</body>
</html>