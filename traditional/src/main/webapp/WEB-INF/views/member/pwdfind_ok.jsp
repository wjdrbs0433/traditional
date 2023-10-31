<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">

<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>

<title>비밀번호 찾기</title>

<style>
.login {
	background-color: #1682b0;
}
.login:hover {
	background-color: #006080;
}
.mainpage {
	background-color: #cccccc;
}
.mainpage:hover {
	background-color: #a3a3a3;
}
</style>
</head>
<body style="padding: 0px; margin: 0px; height: 150vh; overflow: hidden;">


	<div style="float: left; position: relative; width: 45%; height: 100vh;">
	    <div style="position: absolute; top: 50%; width: 400px; left: 50%; transform: translate(-50%, -50%);">
	        <h2>비밀번호 찾기</h2>
	        <p>회원님의 비밀번호는 <font color="red" style="font-size: 18px;">${password}</font> 입니다</p>
	        <div id="register-text">
	            <a href="${pageContext.request.contextPath}/member/login.do" class="login" style="width: 100%; display: block; text-align: center; border-radius: 20px; height: 50px; line-height: 50px; color: #fff; font-weight: bold; margin: 10px 0px;">로그인</a>
	            <a href="${pageContext.request.contextPath}/" class="mainpage" style="width: 100%; display: block; text-align: center; border-radius: 20px; height: 50px; line-height: 50px; color: #000; font-weight: bold; margin-bottom: 10px;">메인페이지</a>
	        </div>
	    </div>
	</div>
	<div class="login-keyimage" style="position: relative; width: 55%; height: 100vh; float: right; text-align: center; background: url('${pageContext.request.contextPath}/resource/images/playlist/mood/christina.jpg') center / cover;">
	    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
				<p>로고</p>
				<p style="color: #fff; font-size: 2.0em; font-weight: bold;">
					청춘은 <br> 바로&nbsp;&nbsp;&nbsp; <br>
					&nbsp;&nbsp;&nbsp;&nbsp;지금부터!
				</p>
			</div>
	</div>
		
</body>
</html>