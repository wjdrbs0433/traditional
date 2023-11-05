<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보처리방침</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/index.css">

<script
	src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/popper.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<script type="text/javascript">
	$(function() {
		$("#accordion").accordion({
			header : "> div > h3"
		}).sortable({
			axis : "y",
			handle : "h3",
			stop : function(event, ui) {
				ui.item.children("h3").triggerHandler("focusout");

				$(this).accordion("refresh");
			}
		});
	});
</script>

</head>
<body id="body-pd">
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<h4 style="margin:30px auto; text-align:center;">[ 개인정보처리방침 ] </h4>
	<div id="accordion">
		<div class="group">
			<h3>1. 개인정보의 처리목적 및 수집항목</h3>
			<div>
				<p>
					- 회원가입 시 : 아이디, 비밀번호, 이름, 생년월일, 일반전화번호, 핸드폰 번호, 이메일,
					문자·이메일 수신여부를 수집합니다.<br><br>
					- 본 홈페이지에 링크되어 있는 웹사이트들이 개인정보를 수집하는 행위에 대해서는<br><br>
					 "청 바 지 개인정보처리방침"이 적용되지 않음을 알려 드립니다.<br><br>
					본 홈페이지(청 바 지)는 각 법인의 개인정보처리방침을 따릅니다.
				</p>
			</div>
		</div>
		<div class="group">
			<h3>2. 개인정보의 제3자 제공</h3>
			<div>
				<p>
				- 회사는 개인정보를 "1. 개인정보의 처리목적 및 수집항목"에서 고지한 범위내에서 사용하며,<br><br> 
				정보주체의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 개인정보를 외부에 공개하지 않습니다.<br><br> 
				다만, 아래의 경우에는 예외로 합니다.
				</p><br>
				<h6>
				- 정보주체가 사전에 동의한 경우
				</h6><br>
				<h6>
				- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
				</h6>
				
			</div>
		</div>
		<div class="group">
			<h3>3. 개인정보 처리의 위탁</h3>
			<div>
				<p>
				- 회사는 원활한 업무 처리를 위해서 아래와 같이 개인정보를 위탁하고 있으며,<br><br> 
				관계 법령에 따른 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.
				</p>
			</div>
		</div>
		<div class="group">
			<h3>4. 개인정보 파기절차 및 방법</h3>
			<div>
				<h6>
				- 개인정보는 원칙적으로 개인정보의 처리목적이 달성되면 지체 없이 파기합니다. 회사의 개인정보 파기절차 및 방법은 다음과 같습니다.
				</h6><br>
				<p>
				가. 파기절차<br>
				- 정보주체가 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함)<br>
				내부 방침 및 기타 관련 법령에 의한 보관사유에 따라<br>
				("4. 개인정보의 처리 및 보유기간" 참조)일정 기간 저장된 후 파기됩니다.<br>
				- 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.
				</p>
				<p>
				나. 파기방법<br>
				- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br>
				- 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
				</p>
				
			</div>
		</div>
		
		<div class="group">
			<h3>5. 정보주체의 권리·의무 및 그 행사방법</h3>
			<div>
				<p>
				- 정보주체는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 정보삭제 및 처리정지를 요청할 수도 있습니다.<br><br> 
				- 정보삭제 또는 처리정지를 원하시는 경우 개인정보보호 책임자에게 이메일로 연락하시면 지체 없이 조치하겠습니다.<br><br> 
				- 보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유/이용 기간 내에서 개인정보를 처리 및 보유하며,<br><br> 
				- 	원칙적으로 개인정보의 처리목적이 달성되면 지체 없이 파기합니다.
				</p>
			</div>
		</div>
		
		<div class="group">
			<h3>6. 개인정보의 안전성 확보조치</h3>
			<div>
				<p>
				- 회사는 개인정보를 처리함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 보호조치를 강구하고 있습니다.
				<br><br>
				1. 관리적 조치<br><br> 
				내부관리계획 수립/시행, 정기적인 취급자 교육 등<br><br> 
				2. 기술적 조치<br><br> 
				개인정보처리시스템 등의 접근권한 관리, 접근통제 시스템 설치, 주요 개인정보의 암호화<br><br> 
				3. 물리적 조치<br><br>
				관리자 서버 등의 접근 통제
				</p>
			</div>
		</div>
		
		<div class="group">
			<h3>7. 개인정보보호 책임자 및 연락처</h3>
			<div>
				<p>
				- 귀하께서는 홈페이지 등을 이용하시는 과정에서 발생하는 모든 개인정보보호 관련 민원을 개인정보보호 책임자에게 신고하실 수 있습니다.<br>
				회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.
				<br><br>
				<h6>
				[ 개인정보보호 책임자 및 연락처 ]
				</h6><br>
				<p>
				- 개인정보보호 책임자<br><br>
				이름 : 전태희<br><br> 
				소속 : 청 바 지<br><br> 
				직위 : 부회장<br><br> 
				메일 : bluejeans@naver.com
				</p>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>