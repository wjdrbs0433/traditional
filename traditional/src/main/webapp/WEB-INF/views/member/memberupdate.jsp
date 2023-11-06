<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script type="text/javascript">
		function checkValue() {
			const f = document.memberupdate;
			let str;

			str = f.mpwd.value;
			if (!str) {
				alert("패스워드를 입력하세요.");
				f.mpwd.focus();
				return;
			}

			// 서버로 폼 데이터 전송
			f.submit();
		}
</script>
<style>
	.main{
		width: 70%; /* 너비를 70%로 설정합니다. */
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
	
	.name {
		font-size: 25px;
		font-weight:bold;
	}
	
	.name span {
		color: gray;
		font-size: 20px;
		font-weight: normal;
	}
	
	.member{
		width: 70%; /* 너비를 70%로 설정합니다. */
        margin: 0 auto; /* 왼쪽과 오른쪽에 10px의 공백을 추가합니다. */
   		margin-top: 50px;
        border: 1px solid #e2e2e2;
        border-radius: 20px;
	}
	
	.m1{
		margin: 50px 100px 30px 100px;
	}
	.m1 p{
		font-size:25px;
		font-weight: bold;
		color: gray;
		padding-left: 15px;
	}
	
	.table {
	    width: 100%;
	    height: 420px;
	    margin-top: 30px;
	    
	}
	
	
	.table td:first-child {
	    width: 50%;
	    text-align: left;
	    color: #989898;
	    font-size:20px;
	    padding-left: 15px;
	    font-weight: 600;
	}
	
	.table td:last-child {
	    width: 50%;
	    text-align: right;
	    font-weight:bold;
	    font-size:18px;
	    color: #6c6c6c;
	    padding-right: 15px;
	}
	
	.sujung {
	    color: blue;
	    text-decoration: underline;
	    font-size: 18px;
	    font-weight: bold;
	}

	
</style>
</head>
<body>	
<form name="memberupdate" action="${pageContext.request.contextPath}/member/memberupdate.do" method="post">
	<div class="member">
		<div class="m1">
			<p>회원정보</p>
			<hr>
			 <table class="table">
                <tr>
                    <td>회원 이름</td>
                    <td>${memberDTO.mname}</td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td>${memberDTO.mid}</td>
                </tr>
                <tr>
                    <td>비밀번호11</td>
                    <td><input type="password" name="mpwd" placeholder="${memberDTO.mpwd}" style="width: 80px; height:20px;"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>${memberDTO.memail}</td>
                </tr>
                <tr>
                    <td>휴대폰번호11</td>
                    <td>
	                    <input type="text" name="mphone1" maxlength="3" placeholder="${memberDTO.mphone.split('-')[0]}" style="width: 50px;">
				        - 
				        <input type="text" name="mphone2" maxlength="4" placeholder="${memberDTO.mphone.split('-')[1]}" style="width: 50px;">
				        - 
				        <input type="text" name="mphone3" maxlength="4" placeholder="${memberDTO.mphone.split('-')[2]}" style="width: 50px;">
			        </td>
                </tr>
                <tr>
                    <td>문자수신여부11</td>
                    <td><input type="checkbox" name="field" value="1" ${memberDTO.field == 'Y' ? 'checked' : ''}></td>
                </tr>
                <tr>
                    <td>이메일수신여부11</td>
                    <td><input type="checkbox" name="field2" value="1" ${memberDTO.field2 == 'Y' ? 'checked' : ''}></td>
                </tr>
                <tr>
                    <td> &nbsp;</td>
                    <td> </td>
                </tr>
                <tr>
                    <td></td>
                    <td><button type="button" onclick="checkValue()">회원수정</button></td>
                </tr>
            </table>
		</div>
		
	</div>
</form>
</body>
</html>