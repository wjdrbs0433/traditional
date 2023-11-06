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
			<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);" class="content">
			      <h2>청</h2>
			      <h2>춘은</h2>
			      <h2>바</h2>
			      <h2>로</h2>
			      <h2>지</h2>
			      <h2>금</h2>
			</div>
		</div>
	</form>
	
	<c:if test="${not empty alertScript}">
        <c:out value="${alertScript}" escapeXml="false" />
    </c:if>
	
</body>
</html>