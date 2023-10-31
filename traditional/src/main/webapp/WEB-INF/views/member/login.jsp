<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">

<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>

<title>로그인</title>

<style>
#register-text input {
	width: 100%;
	height: 50px;
	border-radius: 20px;
	background-color: #ccc;
	margin: 7px 0px;
	border: 0px;
	padding-left: 20px;
}

#register-text input:focus {
	outline: 2px solid #1682b0;
}

.btn {
	background-color: #1682b0 !important;
}

.btn:hover {
	background-color: #006080 !important;
}

a {
	color: #ccc;
	font-size: 15px;
}

a:hover {
	color: #ccc;
}


</style>

<script type="text/javascript">
function sendLogin() {
    const f = document.loginForm;

	let str = f.mid.value;
    if(!str) {
        alert("아이디를 입력하세요. ");
        f.mid.focus();
        return;
    }

    str = f.mpwd.value;
    if(!str) {
        alert("패스워드를 입력하세요. ");
        f.mpwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/member/login_ok.do";
    f.submit();
}


</script>

</head>
<body style="padding: 0px; margin: 0px; height: 150vh; overflow: hidden;">

	<form method="post" name="loginForm" autocomplete="off">
	
		<div style="float: left; position: relative; width: 45%; height: 100vh;">
		
			<div style="position: absolute; top: 50%; width: 400px; left: 50%; transform: translate(-50%, -50%);">
				<h2 style="margin-bottom: 20px;">회원 로그인</h2>
				
				<div id="register-text">
					<input type="text" name="mid" placeholder="아이디를 입력하세요"> 
					
					<input type="password" name="mpwd" placeholder="비밀번호를 입력하세요" style="margin-bottom: 20px;"> 
					
					<button type="button" class="btn" 
							style="width: 100%; border-radius: 20px; height: 50px; color: white; font-weight: bold;" 
							onclick="sendLogin()">로그인하기
					</button>				
					<a href="${pageContext.request.contextPath}/member/idfind.do" style="margin-left: 10px; margin-right: 15px;">아이디 찾기</a> 
					<a href="${pageContext.request.contextPath}/member/pwdfind.do">비밀번호 찾기</a>
					<a href="${pageContext.request.contextPath}/member/member.do" style="float: right; margin-right: 10px;">회원가입</a>
				</div>
			</div>
		</div>
		
		
		
		<div class="login-keyimage"
			style="position: relative; background: url('${pageContext.request.contextPath}/resource/images/playlist/mood/christina.jpg') center/cover; width: 55%; height: 100vh; float: right; text-align: center;">
			<div
				style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
				<p>로고</p>
				<p style="color: #fff; font-size: 2.0em; font-weight: bold;">
					청춘은 <br> 바로&nbsp;&nbsp;&nbsp; <br>
					&nbsp;&nbsp;&nbsp;&nbsp;지금부터!
				</p>
			</div>
		</div>
	</form>
	
	<c:if test="${not empty alertScript}">
        <c:out value="${alertScript}" escapeXml="false" />
    </c:if>
	
</body>
</html>