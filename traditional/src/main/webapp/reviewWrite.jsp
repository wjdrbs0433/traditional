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
.body-main {
	max-width: 700px;
	padding-top: 15px;
}

.table-form td { padding: 7px 0; }
.table-form p { line-height: 200%; }
.table-form tr:first-child { border-top: 2px solid #212529; }
.table-form tr > td:first-child { width: 110px; text-align: center; background: #f8f8f8; }
.table-form tr > td:nth-child(2) { padding-left: 10px; }

.table-form input[type=text], .table-form input[type=file], .table-form textarea {
	width: 96%; }
</style>

<script type="text/javascript">
function sendOk() {
    const f = document.boardForm;
	let str;
	/*
    str = f.subject.value.trim();
    if(!str) {
        alert("별점을 입력하세요. ");
        f.subject.focus();
        return;
    }
*/
    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/bbs/${mode}_ok.do";
    f.submit();
}
</script>
</head>


<body>

<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</header>

<main>

	<div class="container ">
	    <div class="body-title">
			<h2> 리뷰 게시판 </h2>
	    </div>
	    
	    <div class="body-main mx-auto">
			<form name="boardForm" method="post">
				<table class=" table table-border table-form">
					<tr> 
						<td valign="top">상품명</td>
						<td> 
							<p>{dto.subject}</p>
						</td>
					</tr>
					
					<tr> 
						<td valign="top">작성자</td>
						<td> 
							<p>{sessionScope.member.userName}</p>
						</td>
					</tr>
					
					<tr> 
						<td valign="top">별&nbsp;&nbsp;&nbsp;&nbsp;점</td>
						<td> 
							<p>☆</p>
						</td>
					</tr>
					
					
					<tr> 
						<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
						<td> 
							<textarea name="content" class="form-control"></textarea>
						</td>
					</tr>
				</table>
					
				<table class="table">
					<tr> 
						<td align="center">
							<button type="button" class="btn" onclick="sendOk();">등록하기</button>
							<button type="reset" class="btn">다시입력</button>
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/bbs/list.do';">등록취소</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
		
			</form>
		</div>
	</div>

</main>

</body>
</html>