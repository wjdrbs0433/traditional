<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
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
	<div class="main">
		<div>
			<p class="name">${memberDTO.mname} <span>님</span></p>
		</div>
		<div>
		</div>
		<div>
			<p>회원정보</p><img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/member.png">
		</div>
		<div>
			<p>리 뷰 </p><img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/riview.png">
		</div>
		<div>
			<p>주문 내역</p><img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/jomon.png">
		</div>
		<div>
			<p>문의내역</p><img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/gogek.png">
			
		</div>
	</div>	
	
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
                    <td>비밀번호</td>
                    <td>${memberDTO.mpwd}</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>${memberDTO.memail}</td>
                </tr>
                <tr>
                    <td>휴대폰번호</td>
                    <td>${memberDTO.mphone}</td>
                </tr>
                <tr>
                    <td>문자수신여부</td>
                    <td>${memberDTO.field}</td>
                </tr>
                <tr>
                    <td>이메일수신여부</td>
                    <td>${memberDTO.field2}</td>
                </tr>
                <tr>
                    <td> &nbsp</td>
                    <td> </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="color: blue; text-decoration: underline; font-weight: bold;"><a href="">수정</a></td>
                </tr>
            </table>
		</div>
		
	</div>
</body>
</html>