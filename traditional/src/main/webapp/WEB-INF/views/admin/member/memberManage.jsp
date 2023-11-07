<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">



<script src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>


<style>
.mytable {
/*
	border-bottom: 1px;
	width:100%;
	border-radius:10px; 
	border-style: hidden; 
	box-shadow: 0 0 0 1px #999;
	margin :30px;
*/
margin: 5px auto; padding-bottom: 0;
width: 1100px;
box-shadow: 0 0 0 1px #999;
}

.mytable tr td { text-align: left; padding:10px; }
.mytable tr th {text-align: right; padding:10px; }

.btn {
	color: #333333;
	border: 1px solid #999999;
	background-color: #ffffff;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor:pointer;
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.btn:active, .btn:focus, .btn:hover {
	background-color: #f8f9fa;
	color:#333333;
}
.btn[disabled], fieldset[disabled] .btn {
	pointer-events: none;
	cursor: not-allowed;
	filter: alpha(opacity=65);
	-webkit-box-shadow: none;
	box-shadow: none;
	opacity: .65;
}

.btn-primary {
    background: #106eea;
	border:1px solid #00a6eb;
    color:#ffffff;
}
.btn-primary:hover, .btn-primary:active, .btn-primary:focus {
    background: #3284f1;
    border:1px solid #00a6eb;
    color:#ffffff;
}
.table-list {
table-layout: auto; 
margin: 0 20px 0 10px auto;

}
.table-list tr { border-bottom:1px solid #b4b4b4; }
.table-list th { text-align: center; font-size: 15px; }
.table-list td {font-size: 15px; }
.table-list thead tr th { white-space: nowrap; }

header { padding-bottom: 30px; }
header th { padding: 10px 10px 10px 5px; }
header td { padding: 10px 0px 10px 20px; }

main th, td{ padding: 10px; }

</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}

function deleteMember(mNum){
	if(confirm('회원 삭제하시겠습니까?')){
		location.href = "${pageContext.request.contextPath}/admin/member/update_ok.do?mNum="+mNum;
	}
}

$(function(){
	$("#chkAll").click(function(){
		$("input[name=members]").prop("checked", $(this).is(":checked"));
	});
	
	$("#btnDeleteList").click(function(){
		let cnt = $("input[name=members]:checked").length;
		if(cnt === 0) {
			alert("삭제할 회원을 먼저 선택하세요.");
			return false;
		}
		
		if(confirm("선택한 회원을 삭제 하시겠습니까 ?")) {
			const f = document.listForm;
			f.action="${pageContext.request.contextPath}/admin/member/updateList.do";
			f.submit();
		}
	});
});


</script>

</head>
<body id="body-pd">
<jsp:include page="/WEB-INF/views/layout/adminheader.jsp"/>

    <div id="wrap" style="padding: 0px 50px;">
    <div class="navbar" style="margin-top: 52px;">
        
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/member/list.do" style="position: absolute; left: 45%;">
           	회원 리스트
        </a>
        
    </div>
    <hr>
    <div id="recommend">
    <h6 style="margin: 10px;">회원관리 > 회원 리스트</h6>
    </div>
    
    <div class="body-main mx-auto">
    <header>
    <div>
    	<form name="searchForm" action="${pageContext.request.contextPath}/admin/member/list.do" method="post">
    	<table class="mytable">
    		<tr>
    			<th>수신동의</th>
    			<td>
    				<input type="checkbox" name="agreeSms" value="Y">&nbsp; sms
    				<input type="checkbox" name="agreeEmail" value="Y">&nbsp; Email
    			</td>
    		</tr>
    		<tr style="border:hidden">
    			<th>검색</th>
    			<td>
					<select name="schType">
						<option value="">:::선택:::</option>
						<option value="mName">이름</option>
						<option value="mAge">연령대</option>
						<option value="mRegDate">가입일</option>
					</select>
					<input type="text" name="kwd" value="${kwd}" style="width:300px">
					<button type="button" class="btn" onclick="searchList();">검색</button>
    			</td>
    		</tr>
    		
    	</table>
    	</form>
		
    </div>
    </header>
    <main>
    		<form name="listForm" action="${pageContext.request.contextPath}/admin/member/update.do" method="post">
    		<!-- 
    		<table class="table mytable2">
				<tr>
					<td width="50%">
						${dataCount}개(${page}/${total_page} 페이지)
					</td>
					<td align="right">&nbsp;</td>
				</tr>
			</table>
			 -->
			 
			 <h6>${dataCount}개(${page}/${total_page} 페이지)</h6>
			
			<table class="table table-border table-list mytable2" style="text-align:center;">
				<thead>
					<tr>
						<th>
							<input type="checkbox" name="chkAll" id="chkAll" onclick="check();">        
						</th>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>일반전화번호</th>
						<th>핸드폰번호</th>
						<th>이메일</th>
						<th>가입일</th>
						<th>문자수신</th>
						<th>이메일수신</th>
						<th>관리자여부</th>
						<th>회원삭제<th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
					<c:if test="${dto.deleteOrNot==0}">
						<tr>
							<td>
								<input type="checkbox" name="members" value="${ dto.mNum }">
							</td>
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td>${dto.mId}</td>
							<td>${dto.mName}</td>
							<td>${dto.mRnum}</td>
							<td>${dto.mTel}</td>
							<td>${dto.mPhone}</td>
							<td>${dto.mEmail}</td>
							<td>${dto.mRegDate}</td>
							<td>${dto.field}</td>
							<td>${dto.field2}</td>
							<td>${dto.adminOrNot}</td>
							<td>
								<span title="삭제" onclick="deleteMember('${dto.mNum}');"><i class="fa-regular fa-trash-can"></i></span>
							</td>
							
						</tr>
					</c:if>
					</c:forEach>
				</tbody>
			</table>
			</form>
			</main>
			<button type="button" id="btnDeleteList" >선택삭제</button>
			
			 
			<div class="page-navigation" style="text-align: center">
				${dataCount == 0 ? "등록된 회원이 없습니다." : paging}
			</div>
				
	    </div>
</div>

</body>

</html>