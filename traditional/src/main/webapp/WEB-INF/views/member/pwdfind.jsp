<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">

<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>

<title>비밀번호 찾기</title>

<style type="text/css">
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

.selectoption2{
	width : 25.5%;
	height: 50px;
	border-radius: 20px;
	background-color: #ccc;
	margin: 7px auto;
	border: 0px;
	padding-left: auto;
	text-align:center;
}

.selectoption1{
	width : 25.5%;
	height: 50px;
	border-radius: 20px;
	background-color: #ccc;
	margin: 7px auto;
	border: 0px;
	padding-left: auto;
	text-align:center;
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
function pwdfind() {
	const f = document.pwdfindForm;
	let str;
	
	const registerForm = document.forms['pwdfindForm'];

	str = f.mid.value;
    if (!str) {
        alert("아이디를 입력하세요.");
        f.mid.focus();
        return;
    }
	
    if (registerForm.mname.value == "") {
        alert("이름을 입력해 주세요.");
        registerForm.mname.focus();
        return;
    }
    
    
    
    if (registerForm.memail1.value == "") {
        alert("이메일 주소를 입력하세요.");
        registerForm.memail1.focus();
        return;
    }
    
    if (registerForm.memail2.value == "") {
        alert("이메일 주소를 확인해주세요.");
        registerForm.memail2.focus();
        return;
    }
    
    if (registerForm.mphone1.value == "") {
        alert("휴대폰번호를 입력하세요.");
        registerForm.mphone.focus();
        return;
    }
    
    if (registerForm.mphone2.value == "") {
        alert("휴대폰번호를 입력하세요.");
        registerForm.mphone2.focus();
        return;
    }
    
    if (registerForm.mphone3.value == "") {
        alert("휴대폰번호를 입력하세요.");
        registerForm.mphone3.focus();
        return;
    }
    
    f.submit();
}

function changeEmail() {
    const f = document.pwdfindForm;
	    
    let str = f.selectEmail.value;
    if(str !== "direct") {
        f.memail2.value = str; 
        f.memail2.readOnly = true;
        f.memail1.focus(); 
    }
    else {
        f.memail2.value = "";
        f.memail2.readOnly = false;
        f.memail1.focus();
    }
}

</script>

</head>


<body style="padding: 0px; margin: 0px; height: 150vh; overflow: hidden;">

<form method="post" name="pwdfindForm" autocomplete="off" action="${pageContext.request.contextPath}/member/pwdfind_ok.do">
	
	<div style="float: left; position: relative; width: 45%; height: 100vh;">
		<div style="position: absolute; top: 50%; width: 400px; left: 50%; transform: translate(-50%, -50%);">
		
			<h2 style="margin-bottom: 20px;">비밀번호 찾기</h2>
			
			<div id="register-text">
				<input type="text" name="mid" placeholder="아이디를 입력하세요">
				
				<input type="text" name="mname" placeholder="이름을 입력하세요">
				
				<select name="selectEmail" onchange="changeEmail();" class="selectoption1">
						<option value="">선 택</option>
						<option value="naver.com"   ${dto.memail2=="naver.com" ? "selected" : ""}>네이버 메일</option>
						<option value="hanmail.net" ${dto.memail2=="hanmail.net" ? "selected" : ""}>한 메일</option>
						<option value="gmail.com"   ${dto.memail2=="gmail.com" ? "selected" : ""}>지 메일</option>
						<option value="hotmail.com" ${dto.memail2=="hotmail.com" ? "selected" : ""}>핫 메일</option>
						<option value="direct">직접입력</option>
				</select>
				<input type="text" name="memail1" maxlength="30" value="${dto.memail1}" style="width: 33%;" placeholder="이메일 주소*"> @ 
				<input type="text" name="memail2" maxlength="30" value="${dto.memail2}" style="width: 33%;" readonly>
				
				<select name="mphone1" class="selectoption2">
					<option value="">선 택</option>
					<option value="010" ${dto.mphone1=="010" ? "selected" : ""}>010</option>
					<option value="011" ${dto.mphone1=="011" ? "selected" : ""}>011</option>
					<option value="016" ${dto.mphone1=="016" ? "selected" : ""}>016</option>
					<option value="017" ${dto.mphone1=="017" ? "selected" : ""}>017</option>
					<option value="019" ${dto.mphone1=="019" ? "selected" : ""}>019</option>
				</select>
					- <input type="text" name="mphone2" maxlength="4" value="${dto.mphone2}" style="width: 32%;"> -
					<input type="text" name="mphone3" maxlength="4"  value="${dto.mphone3}" style="width: 32%;">
				
				<button type="button" class="btn" style="width: 100%; border-radius: 20px; height: 50px; color: white; font-weight: bold;" onclick="pwdfind();">비밀번호 찾기</button>
				<a href="${pageContext.request.contextPath}/member/idfind.do" style="margin-left: 10px">아이디찾기</a>
				<a href="${pageContext.request.contextPath}/member/member.do" style="float: right; margin-right: 10px;">회원가입</a>
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
	
</form>

</body>
</html>