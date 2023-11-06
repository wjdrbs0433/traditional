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

<title>아이디 찾기</title>

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

<!-- 텍스트 -->
   .content {
      position: relative;
    }

    .content h2 {
      color: #fff; /* 텍스트 색상을 흰색으로 설정합니다. */
      font-size: 4em;
      position: relative;
      /* display: inline-block;  텍스트를 가로로 나열합니다. */
      margin: 0 10px; /* 각 텍스트 요소 사이의 간격을 조절합니다. */
      opacity: 1; /* 텍스트를 완전히 표시합니다. */
      line-height:50px;
    }

    .content h2:nth-child(1),
    .content h2:nth-child(3),
    .content h2:nth-child(5) {
      color: lightblue;
      -webkit-text-stroke: 2px white;
    }

    .content h2:nth-child(2),
    .content h2:nth-child(4),
    .content h2:nth-child(6) {
      animation: animate 2s ease-in-out infinite;
      -webkit-text-stroke: 2px white;
      opacity: 1; /* 텍스트를 완전히 표시합니다. */
    }
    
    .content h2:nth-child(2), .content h2:nth-child(4), .content h2:nth-child(6) {
      position: relative;
      left: 100px; /* 텍스트를 아래로 20px 이동시킵니다. */
      float:left;
      bottom: 45px;
    }

    @keyframes animate {
      0%,
      100% {
        clip-path: polygon(
          0% 45%,
          16% 44%,
          33% 50%,
          54% 60%,
          70% 61%,
          84% 59%,
          100% 52%,
          100% 100%,
          0% 100%
        );
      }

      50% {
        clip-path: polygon(
          0% 60%,
          15% 65%,
          34% 66%,
          51% 62%,
          67% 50%,
          84% 45%,
          100% 46%,
          100% 100%,
          0% 100%
        );
      }
    }

</style>
</head>
<body style="padding: 0px; margin: 0px; height: 150vh; overflow: hidden;">


	<div style="float: left; position: relative; width: 45%; height: 100vh;">
	    <div style="position: absolute; top: 50%; width: 400px; left: 50%; transform: translate(-50%, -50%);">
	        <h2>비밀번호 찾기</h2>
	        <p>회원님의 아이디는 <font color="red" style="font-size: 18px;">${id}</font> 입니다</p>
	        <div id="register-text">
	            <a href="${pageContext.request.contextPath}/member/login.do" class="login" style="width: 100%; display: block; text-align: center; border-radius: 20px; height: 50px; line-height: 50px; color: #fff; font-weight: bold; margin: 10px 0px;">로그인</a>
	            <a href="${pageContext.request.contextPath}/" class="mainpage" style="width: 100%; display: block; text-align: center; border-radius: 20px; height: 50px; line-height: 50px; color: #000; font-weight: bold; margin-bottom: 10px;">메인페이지</a>
	        </div>
	    </div>
	</div>
	<div class="login-keyimage" style="position: relative; width: 55%; height: 100vh; float: right; text-align: center; background: url('${pageContext.request.contextPath}/resource/images/playlist/mood/christina.jpg') center / cover;">
	    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);" class="content">
	      <h2>청</h2>
	      <h2>춘은</h2>
	      <h2>바</h2>
	      <h2>로</h2>
	      <h2>지</h2>
	      <h2>금</h2>
	</div>
	</div>
		
</body>
</html>