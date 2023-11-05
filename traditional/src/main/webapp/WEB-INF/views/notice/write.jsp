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
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>

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
.table-form input[type=checkbox] { vertical-align: middle; }

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
function sendOk() {
    const f = document.noticeForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/notice/${mode}_ok.do";
    f.submit();
}

<c:if test="${mode=='update'}">
	function deleteFile(fileNum) {
		if(! confirm("파일을 삭제 하시겠습니까 ?")) {
			return;
		}
		
		let query = "num=${dto.num}&fileNum=" + fileNum + "&page=${page}&size=${size}";
		let url = "${pageContext.request.contextPath}/notice/deleteFile.do?" + query;
		location.href = url;
	}
</c:if>
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	
	<div class="main">
		<div>
			<p class="name1" style="line-height:80px; float:right;">♣ 공지사항 </p>
		</div>
		<div>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/notice/list.do">공지사항
				<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/member.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/event/list.do" style="color:#cccccc;">이벤트
				<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/riview.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/question.jsp" style="color:#cccccc;">자주묻는질문
				<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/jomon.png">
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
			<h2></h2>
	    </div>
	    
	    <div class="body-main mx-auto">
			<form name="noticeForm" method="post" enctype="multipart/form-data">
				<table class="table table-border table-form">
					<tr>
						<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
						<td> 
							<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
						</td>
					</tr>
	
					<tr>
						<td>공지여부</td>
						<td> 
							<p><input type="checkbox" name="notice" value="1" ${dto.notice==1 ? "checked ":"" }> <label>공지</label></p>
						</td>
					</tr>
	
					<tr> 
						<td>작성자</td>
						<td> 
							<p>${sessionScope.member.mid}</p>
						</td>
					</tr>
					
					<tr> 
						<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
						<td> 
							<textarea name="content" class="form-control">${dto.content}</textarea>
						</td>
					</tr>
					
					<tr>
						<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
						<td> 
							<input type="file" name="selectFile" class="form-control" multiple>
						</td>
					</tr>
	
					<c:if test="${mode=='update'}">
						<c:forEach var="vo" items="${listFile}">
							<tr>
								<td>첨부된파일</td>
								<td> 
									<p>
										<a href="javascript:deleteFile('${vo.fileNum}');"><i class="far fa-trash-alt"></i></a>
										${vo.originalFilename}
									</p>
								</td>
							</tr>
						</c:forEach> 
					</c:if>
				</table>
					
				<table class="table">
					<tr> 
						<td align="center">
							<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
							<button type="reset" class="btn">다시입력</button>
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/list.do?size=${size}';">${mode=='update'?'수정취소':'등록취소'}</button>
							<input type="hidden" name="size" value="${size}">
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
	
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

</body>
</html>