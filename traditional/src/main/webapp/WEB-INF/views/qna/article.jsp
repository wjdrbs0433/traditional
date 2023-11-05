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
	padding-top: 15px;
}

.table-article tr>td { padding-left: 5px; padding-right: 5px; }
.file-item { padding: 7px; margin-bottom: 3px; border: 1px solid #ced4da; color: #777777; }

.reply { padding: 20px 0 10px; }
.reply .bold { font-weight: 600; }
.reply .form-header { padding-bottom: 7px; }

.reply-form  tr>td { padding: 2px 0 2px; }
.reply-form textarea { width: 100%; height: 75px; }
.reply-form button { padding: 8px 25px; }

.row-flex { display: flex; justify-content: space-between; }
.left-item {
	width:30px; margin-right: 1px;    padding:10px 10px;
    width:30px;
    text-align: center;
	font-weight: 600;
	color: #fff;
}
.right-item {
	flex-grow: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    word-spacing: nowrap;
    box-sizing: border-box;
    padding: 10px 7px;
	font-weight: 600;
	color: #fff;
}
.left-question { background: #0d6efd; }
.right-question { background: #0d6efd; }

.left-answer { background: #198754; }
.right-answer { background: #198754; }

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

<c:if test="${sessionScope.member.mid==dto.userId || sessionScope.member.mid=='admin'}">
	<script type="text/javascript">
		function deleteOk(mode) {
			let s = mode === "question" ? "질문" : "답변";
			
			if(confirm(s + "을 삭제 하시 겠습니까 ? ")) {
				let query = "num=${dto.num}&${query}&mode="+mode;
				let url = "${pageContext.request.contextPath}/qna/delete.do?" + query;
				location.href = url;
			}
		}
	</script>
</c:if>

<c:if test="${sessionScope.member.mid=='admin'}">
	<script type="text/javascript">
		$(function(){
			let answer = "${dto.answer}";
			if(! answer) {
				$(".reply").show();
			}
		});
		
		$(function(){
			$(".btnSendAnswer").click(function(){
				const f = document.answerForm;
				if(! f.answer.value.trim()) {
					f.answer.focus();
					return false;
				}
				
				f.action = "${pageContext.request.contextPath}/qna/answer.do";
				f.submit();
			});
		});
		
		$(function(){
			$(".btnUpdateAnswer").click(function(){
				let mode = $(this).attr("data-mode");
				if(mode === "update") {
					$(".reply").show();
					$(this).text("답변 수정 취소")
					$(this).attr("data-mode", "cancel");
				} else {
					$(".reply").hide();
					$(this).attr("data-mode", "update");
					$(this).text("답변 수정")
				}
			});
		});
	</script>
</c:if>

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
				<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/member.png">
			</a>
		</div>
		<div>
			<a href="" style="color:#cccccc;">이벤트
				<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/riview.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/question.jsp" style="color:#cccccc;">자주묻는질문
				<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/jomon.png">
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
			<h2> </h2>
	    </div>
	    
	    <div class="body-main mx-auto">
			<table class="table table-border table-article">
				<tbody>
					<tr style="border: none;">
						<td colspan="2" style="padding: 10px 0 0 0;">
							<div class="row-flex">
								<div class="left-item left-question">Q</div>
								<div class="right-item right-question">${dto.title}</div>
							</div>
						</td>						
					</tr>				
					<tr>
						<td width="50%">
							아이디 : ${dto.userId}
						</td>
						<td align="right">
							문의일자 : ${dto.reg_date}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="200">
							${dto.content}
						</td>
					</tr>
					
				</tbody>
			</table>
				
			<c:if test="${not empty dto.answer}">
				<table class="table table-border table-article">
					<tbody>
						<tr style="border: none;">
							<td colspan="2" style="padding: 0 0 0 0;">
								<div class="row-flex">
									<div class="left-item left-answer">A</div>
									<div class="right-item right-answer">${dto.title}</div>
								</div>
							</td>							
						</tr>
					
						<tr>
							<td width="50%">
								담당자 : ${dto.answerId}				
							</td>
							<td align="right">
								답변일자 :  ${dto.answer_date}
							</td>
						</tr>
						
						<tr>
							<td colspan="2" valign="top" height="150">
								${dto.answer}
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
				
			<table class="table table-border table-article">
				<tr>
					<td colspan="2">
						이전글 :
						<c:if test="${not empty prevDto}">
							<c:choose>
								<c:when test="${prevDto.secret==1}">
									<c:if test="${sessionScope.member.mid==prevDto.userId || sessionScope.member.mid=='admin'}">
										<a href="${pageContext.request.contextPath}/qna/article.do?num=${prevDto.num}&${query}">${prevDto.title}</a>
									</c:if>
									<c:if test="${sessionScope.member.mid!=prevDto.userId && sessionScope.member.mid!='admin'}">
										비밀글 입니다.
									</c:if>
									<i class="bi bi-file-lock2"></i>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/qna/article.do?num=${prevDto.num}&${query}">${prevDto.title}</a>
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						다음글 :
						<c:if test="${not empty nextDto}">
							<c:choose>
								<c:when test="${nextDto.secret==1}">
									<c:if test="${sessionScope.member.mid==nextDto.userId || sessionScope.member.mid=='admin'}">
										<a href="${pageContext.request.contextPath}/qna/article.do?num=${nextDto.num}&${query}">${nextDto.title}</a>
									</c:if>
									<c:if test="${sessionScope.member.mid!=nextDto.userId && sessionScope.member.mid!='admin'}">
										비밀글 입니다.
									</c:if>
									<i class="icofont-lock"></i>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/qna/article.do?num=${nextDto.num}&${query}">${nextDto.title}</a>
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
				</tr>
			</table>
			
			<table class="table">
				<tr>
					<td width="50%">
						<c:if test="${sessionScope.member.mid==dto.userId && empty dto.answer}">
							<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/update.do?num=${dto.num}&page=${page}';">질문수정</button>
						</c:if>
						<c:if test="${sessionScope.member.mid==dto.userId || sessionScope.member.mid=='admin'}">
							<button type="button" class="btn" onclick="deleteOk('question');">질문삭제</button>
						</c:if>
						<c:if test="${not empty dto.answer and sessionScope.member.mid==dto.answerId}">
							<button type="button" class="btn btnUpdateAnswer" data-mode="update">답변수정</button>
						</c:if>
						<c:if test="${not empty dto.answer && (sessionScope.member.mid==dto.answerId)}">
							<button type="button" class="btn" onclick="deleteOk('answer');">답변삭제</button>
						</c:if>
					</td>
					<td align="right">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qna/list.do?${query}';">리스트</button>
					</td>
				</tr>
			</table>

			<div class="reply" style="display: none;">
				<form name="answerForm" method="post">
					<div class='form-header'>
						<span class="bold">질문에 대한 답변</span>
					</div>
					
					<table class="table reply-form">
						<tr>
							<td>
								<textarea class='form-control' name="answer">${dto.answer}</textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						   		<input type="hidden" name="num" value="${dto.num}">	
						   		<input type="hidden" name="page" value="${page}">					   
						        <button type='button' class='btn btnSendAnswer'>답변 등록</button>
						    </td>
						 </tr>
					</table>
				</form>
			</div>

	    </div>
	</div>


    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>


</body>
</html>