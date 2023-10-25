﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>spring</title>

<jsp:include page="/WEB-INF/views/layout/staticHeader.jsp"/>

<style type="text/css">
.body-main {
	max-width: 800px;
	padding-top: 15px;
}

.table-form td { padding: 7px 0; }
.table-form tr:first-child { border-top: 2px solid #212529; }
.table-form tr td:first-child{ background: #f8f8f8; text-align: center; width: 120px; font-weight: 500; }
.table-form tr td:nth-child(2) { text-align: left; padding-left: 10px; }

.table-form input[type=text]:focus, .table-form input[type=date]:focus, .table-form input[type=password]:focus {
	border: 1px solid #222222; }

.help-block, .block { margin-top: 5px; }
.msg-box { text-align: center; color: blue; }
</style>

<script type="text/javascript">
function memberOk() {
	const f = document.memberForm;
	let str;

	str = f.userId.value;
	if( !/^[a-z][a-z0-9_]{4,9}$/i.test(str) ) { 
		alert("아이디를 다시 입력 하세요. ");
		f.userId.focus();
		return;
	}

	str = f.userPwd.value;
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
		alert("패스워드를 다시 입력 하세요. ");
		f.userPwd.focus();
		return;
	}

	if( str !== f.userPwd2.value ) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwd.focus();
        return;
	}
	
    str = f.userName.value;
    if( !/^[가-힣]{2,5}$/.test(str) ) {
        alert("이름을 다시 입력하세요. ");
        f.userName.focus();
        return;
    }

    str = f.birth.value;
    if( !str ) {
        alert("생년월일를 입력하세요. ");
        f.birth.focus();
        return;
    }
    
    str = f.tel1.value;
    if( !str ) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
    if( !/^\d{3,4}$/.test(str) ) {
        alert("숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
    if( !/^\d{4}$/.test(str) ) {
    	alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    
    str = f.email1.value.trim();
    if( !str ) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

    str = f.email2.value.trim();
    if( !str ) {
        alert("이메일을 입력하세요. ");
        f.email2.focus();
        return;
    }

   	f.action = "${pageContext.request.contextPath}/";
    f.submit();
}

function changeEmail() {
    const f = document.memberForm;
	    
    let str = f.selectEmail.value;
    if(str !== "direct") {
        f.email2.value = str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value = "";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}

</script>
</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
</header>
	
<main>
	<div class="container body-container">
	    <div class="body-title">
			<h2><i class="fas fa-user"></i> ${title} </h2>
	    </div>
	    
	    <div class="body-main mx-auto">
			<form name="memberForm" method="post">
			<table class="table table-border table-form">
				<tr>
					<td>아&nbsp;이&nbsp;디</td>
					<td>
						<p>
							<input type="text" name="userId" id="userId" maxlength="10" class="form-control" value="${dto.userId}" 
								style="width: 50%;" 
								${mode=="update" ? "readonly ":""}>
						</p>
						<c:if test="${mode=='member'}">
							<p class="help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</p>
						</c:if>
					</td>
				</tr>
			
				<tr>
					<td>패스워드</td>
					<td>
						<p>
							<input type="password" name="userPwd" class="form-control" maxlength="10" style="width: 50%;" autocomplete="off">
						</p>
						<p class="help-block">패스워드는 5~10자 이내이며, 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</p>
					</td>
				</tr>
			
				<tr>
					<td>패스워드 확인</td>
					<td>
						<p>
							<input type="password" name="userPwd2" class="form-control" maxlength="10" style="width: 50%;" autocomplete="off">
						</p>
						<p class="help-block">패스워드를 한번 더 입력해주세요.</p>
					</td>
				</tr>
			
				<tr>
					<td>이&nbsp;&nbsp;&nbsp;&nbsp;름</td>
					<td>
						<input type="text" name="userName" maxlength="10" class="form-control" value="${dto.userName}" style="width: 50%;" ${mode=="update" ? "readonly ":""}>
					</td>
				</tr>
			
				<tr>
					<td>생년월일</td>
					<td>
						<input type="date" name="birth" class="form-control" value="${dto.birth}" style="width: 50%;">
					</td>
				</tr>
			
				<tr>
					<td>이 메 일</td>
					<td>
						  <select name="selectEmail" class="form-select" onchange="changeEmail();">
								<option value="">선 택</option>
								<option value="naver.com"   ${dto.email2=="naver.com" ? "selected" : ""}>네이버 메일</option>
								<option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected" : ""}>한 메일</option>
								<option value="gmail.com"   ${dto.email2=="gmail.com" ? "selected" : ""}>지 메일</option>
								<option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected" : ""}>핫 메일</option>
								<option value="direct">직접입력</option>
						  </select>
						  <input type="text" name="email1" maxlength="30" class="form-control" value="${dto.email1}" style="width: 33%;"> @ 
						  <input type="text" name="email2" maxlength="30" class="form-control" value="${dto.email2}" style="width: 33%;" readonly>
					</td>
				</tr>
				
				<tr>
					<td>전화번호</td>
					<td>
						  <select name="tel1" class="form-select">
								<option value="">선 택</option>
								<option value="010" ${dto.tel1=="010" ? "selected" : ""}>010</option>
								<option value="02"  ${dto.tel1=="02"  ? "selected" : ""}>02</option>
								<option value="031" ${dto.tel1=="031" ? "selected" : ""}>031</option>
								<option value="032" ${dto.tel1=="032" ? "selected" : ""}>032</option>
								<option value="033" ${dto.tel1=="033" ? "selected" : ""}>033</option>
								<option value="041" ${dto.tel1=="041" ? "selected" : ""}>041</option>
								<option value="042" ${dto.tel1=="042" ? "selected" : ""}>042</option>
								<option value="043" ${dto.tel1=="043" ? "selected" : ""}>043</option>
								<option value="044" ${dto.tel1=="044" ? "selected" : ""}>044</option>
								<option value="051" ${dto.tel1=="051" ? "selected" : ""}>051</option>
								<option value="052" ${dto.tel1=="052" ? "selected" : ""}>052</option>
								<option value="053" ${dto.tel1=="053" ? "selected" : ""}>053</option>
								<option value="054" ${dto.tel1=="054" ? "selected" : ""}>054</option>
								<option value="055" ${dto.tel1=="055" ? "selected" : ""}>055</option>
								<option value="061" ${dto.tel1=="061" ? "selected" : ""}>061</option>
								<option value="062" ${dto.tel1=="062" ? "selected" : ""}>062</option>
								<option value="063" ${dto.tel1=="063" ? "selected" : ""}>063</option>
								<option value="064" ${dto.tel1=="064" ? "selected" : ""}>064</option>
								<option value="070" ${dto.tel1=="070" ? "selected" : ""}>070</option>
						  </select>
						  <input type="text" name="tel2" maxlength="4" class="form-control" value="${dto.tel2}" style="width: 33%;"> -
						  <input type="text" name="tel3" maxlength="4" class="form-control" value="${dto.tel3}" style="width: 33%;">
					</td>
				</tr>
			
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" name="zip" id="zip" maxlength="7" class="form-control" value="${dto.zip}" readonly style="width: 50%;">
						<button type="button" class="btn" onclick="daumPostcode();">우편번호검색</button>
					</td>
				</tr>
				
				<tr>
					<td valign="top">주&nbsp;&nbsp;&nbsp;&nbsp;소</td>
					<td>
						<p>
							<input type="text" name="addr1" id="addr1" maxlength="50" class="form-control" value="${dto.addr1}" readonly style="width: 96%;">
						</p>
						<p class="block">
							<input type="text" name="addr2" id="addr2" maxlength="50" class="form-control" value="${dto.addr2}" style="width: 96%;">
						</p>
					</td>
				</tr>
				
			</table>
			
			<table class="table">
				<c:if test="${mode=='member'}">
					<tr>
						<td align="center">
							<span>
								<input type="checkbox" name="terms" value="1" checked onchange="form.btnOk.disabled = !checked">
								약관에 동의하시겠습니까 ?
							</span>
							<span><a href="">약관보기</a></span>
						</td>
					</tr>
				</c:if>
						
				<tr>
					<td align="center">
					    <button type="button" class="btn" name="btnOk" onclick="memberOk();"> ${mode=="member"?"회원가입":"정보수정"} </button>
					    <button type="reset" class="btn"> 다시입력 </button>
					    <button type="button" class="btn" 
					    	onclick="javascript:location.href='${pageContext.request.contextPath}/';"> ${mode=="member"?"가입취소":"수정취소"} </button>
					</td>
				</tr>
				
				<tr>
					<td align="center">
						<span class="msg-box">${message}</span>
					</td>
				</tr>
			</table>
			</form>
	    </div>
	</div>
	
</main>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>

<footer>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

<jsp:include page="/WEB-INF/views/layout/staticFooter.jsp"/>
</body>
</html>