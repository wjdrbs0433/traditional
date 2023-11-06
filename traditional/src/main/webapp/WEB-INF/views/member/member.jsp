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
	
    <title>회원가입</title>

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

.idCheck, .btn {
	background-color: #1682b0 !important;
}
.idCheck:hover, .btn:hover {
	background-color: #006080 !important;
}

input[type="date"] {
    width: 200px;
    padding: 10px;
}
  
input[type="date"]::-webkit-calendar-picker-indicator {
    transform: scale(2);
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

function checkValue() {
    const f = document.memberForm;
    let str;

    const registerForm = document.forms['memberForm'];

    if (registerForm.mname.value == "") {
        alert("이름을 입력해 주세요.");
        registerForm.mname.focus();
        return;
    }
    
    str = f.mid.value;
    if (!str) {
        alert("아이디를 입력하세요.");
        f.mid.focus();
        return;
    }

    str = f.mpwd.value;
    if (!str) {
        alert("패스워드를 입력하세요.");
        f.mpwd.focus();
        return;
    }

    if (registerForm.mpwd.value == "") {
        alert("비밀번호를 확인해 주세요.");
        registerForm.mpwd.focus();
        return;
    }

    if (registerForm.passwordCheck.value == "" || registerForm.mpwd.value !== registerForm.passwordCheck.value) {
        alert("비밀번호가 일치하지 않습니다.");
        registerForm.passwordCheck.focus();
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

    if (registerForm.mrnum.value == "") {
        alert("생년월일을 선택하세요.");
        registerForm.mrnum.focus();
        return;
    }

    if (registerForm.mtel1.value == "") {
        alert("전화번호를 입력하세요.");
        registerForm.mtel1.focus();
        return;
    }
    
    if (registerForm.mtel2.value == "") {
        alert("전화번호를 입력하세요.");
        registerForm.mtel2.focus();
        return;
    }
    
    if (registerForm.mtel3.value == "") {
        alert("전화번호를 입력하세요.");
        registerForm.mtel3.focus();
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

    if (!document.querySelector('input[name="personalInfo"]').checked) {
        alert("개인정보 처리방침에 동의해야 합니다.");
        return;
    }

    f.action = "${pageContext.request.contextPath}/member/${mode}_ok.do";
    f.submit();   
}

function changeEmail() {
    const f = document.memberForm;
	    
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
<form method="post" name="memberForm" autocomplete="off">
    <div style="float: left; position: relative; width: 45%; height: 100vh;">
        <div style="position: absolute; top: 50%; width: 400px; left: 50%; transform: translate(-50%, -50%);">
        
            <h2>회원가입</h2>
            
            <small style="float: right; color: #1682b0;">*필수입니다</small><br>
            
            
            <div id="register-text">
                <input type="text" name="mname" placeholder="이름*" value="${dto.userName}">
                
                <input type="text" name="mid" placeholder="아이디*" 
                		value="${dto.mid}" ${mode=="update" ? "readonly ":""} >
                
                <!-- <input type="button" class="idCheck" value="아이디 중복" style="width: 30%; float: right; padding-right: 20px; color: white;" onClick="checkID()"> -->
                <input type="password" name="mpwd" placeholder="비밀번호*">
                <input type="password" name="passwordCheck" placeholder="비밀번호 확인*">
                
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
				
                <input type="date" name="mrnum" placeholder="생년월일*" value="${dto.mbirth}" >
                
                <select name="mtel1" class="selectoption2">
					<option value="">선 택</option>
					<option value="02"  ${dto.mtel1=="02"  ? "selected" : ""}>02</option>
					<option value="031" ${dto.mtel1=="031" ? "selected" : ""}>031</option>
					<option value="032" ${dto.mtel1=="032" ? "selected" : ""}>032</option>
					<option value="033" ${dto.mtel1=="033" ? "selected" : ""}>033</option>
					<option value="041" ${dto.mtel1=="041" ? "selected" : ""}>041</option>
					<option value="042" ${dto.mtel1=="042" ? "selected" : ""}>042</option>
					<option value="043" ${dto.mtel1=="043" ? "selected" : ""}>043</option>
					<option value="044" ${dto.mtel1=="044" ? "selected" : ""}>044</option>
					<option value="051" ${dto.mtel1=="051" ? "selected" : ""}>051</option>
					<option value="052" ${dto.mtel1=="052" ? "selected" : ""}>052</option>
					<option value="053" ${dto.mtel1=="053" ? "selected" : ""}>053</option>
					<option value="054" ${dto.mtel1=="054" ? "selected" : ""}>054</option>
					<option value="055" ${dto.mtel1=="055" ? "selected" : ""}>055</option>
					<option value="061" ${dto.mtel1=="061" ? "selected" : ""}>061</option>
					<option value="062" ${dto.mtel1=="062" ? "selected" : ""}>062</option>
					<option value="063" ${dto.mtel1=="063" ? "selected" : ""}>063</option>
					<option value="064" ${dto.mtel1=="064" ? "selected" : ""}>064</option>
					<option value="070" ${dto.mtel1=="070" ? "selected" : ""}>070</option>
				</select>
					- <input type="text" name="mtel2" maxlength="4" value="${dto.mtel2}" style="width: 32%;"> -
					<input type="text" name="mtel3" maxlength="4" value="${dto.mtel3}" style="width: 32%;">
                
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
            </div>
            
           	<label><input type="checkbox" name="personalInfo" value="1" style="margin-left: 5px;"> 개인정보 처리방침에 동의합니다.</label><br>
			<label><input type="checkbox" name="field" value="1" style="margin-left: 5px;"> 문자 수신 여부</label>
			<label><input type="checkbox" name="field2" value="1" style="margin-left: 5px;"> 이메일 수신 여부</label><br>
			<label><input type="checkbox" name="adminOrNot" value="0" style="margin-left: 5px;"> 관리자 여부</label>
			<button type="button" class="btn" 
                style="width: 100%; border-radius: 20px; height: 50px; color: white; font-weight: bold; margin-top: 25px;" onClick="checkValue()">
                ${mode == "member" ? "회원가입" : "정보수정"}
            </button>
        </div>
    </div>
	<div class="login-keyimage" style="position: relative; background:url('${pageContext.request.contextPath}/resource/images/playlist/mood/christina.jpg') center / cover; width: 55%; height: 100vh; float: right; text-align: center;">
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