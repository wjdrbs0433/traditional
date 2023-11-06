<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>spring</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">
<script src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style type="text/css">
.body-main {
	max-width: 700px;
}

.table-list thead > tr:first-child { background: #f8f8f8; }
.table-list th, .table-list td { text-align: center; }

.table-list .notice { display: inline-block; padding:1px 3px; background: #ed4c00; color: #fff; }
.table-list .left { text-align: left; padding-left: 5px; }

.table-list .chk { width: 40px; color: #787878; }
.table-list .num { width: 60px; color: #787878; }
.table-list .subject { color: #787878; }
.table-list .name { width: 100px; color: #787878; }
.table-list .date { width: 100px; color: #787878; }
.table-list .hit { width: 70px; color: #787878; }

.table-list input[type=checkbox] { vertical-align: middle; }
.item-delete { cursor: pointer; padding: 7px 13px; }
.item-delete:hover { font-weight: 500; color: #2478FF; }

#btnDeleteList {
    background-color: gray;
    color: white;
    border: none;
    border-radius: 18px;
    padding: 10px 15px;
    cursor: pointer;
}

#btnDeleteList:hover {
    background-color: #0e4aae;
}

.main{
		width: 900px; /* 너비를 70%로 설정합니다. */
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
	
	.name1 {
		font-size: 25px;
		font-weight:bold;
	}
	
	.name1 span {
		color: gray;
		font-size: 20px;
		font-weight: normal;
	}
	
	.layout{
    max-width: 600px;
    margin: 0 auto;
	}
	
	.qna{
	    list-style: none;
	    margin: 0;
	    padding: 0;
	}
	.qna > li{
	  padding: 10px 0;
	  box-sizing: border-box;
	}
	.qna > li:nth-child(n+2){ /* 아이템 구분 점선 */
	  border-top: 1px dashed #aaa;
	}
	.qna input {
	  display: none;
	}
	
	.qna label { /* 제목 - 클릭 영역 */
	  font-weight: bold;
	  color: #000;
	  margin: 20px 0 0;
	  cursor: pointer;
	}
	.qna label::before { /* 제목 앞 화살표 */
	  display: block;
	  content: "";
	  width: 0;
	  height: 0;
	  border: 8px solid transparent;
	  border-left: 8px solid #a00;
	  margin: 2px 0 0 8px;
	  float: left;
	}
	.qna input:checked + label::before { /* 내용 펼침 상태 제목 앞 화살표 */
	  border: 8px solid transparent;
	  border-top: 8px solid #a00;
	  border-bottom: 0;
	  margin: 8px 4px 0;
	}
	
	.qna div { /* 내용 영역 - 기본 감춤 상태 */
	  display: none;
	  color: #666;
	  font-size: 0.9375em;
	  overflow: hidden;
	  padding: 10px 0 10px 30px;
	  box-sizing: border-box;
	  transition: max-height 0.4s;
	}
	.qna input:checked + label + div { /* 내용 영역 펼침 */
	  display: block;
	}
	
</style>

<script type="text/javascript">
function changeList() {
    const f = document.listForm;
    f.page.value="1";
    f.action="${pageContext.request.contextPath}/notice/list.do";
    f.submit();
}

function searchList() {
	const f = document.searchForm;
	f.submit();
}

<c:if test="${sessionScope.member.mid=='admin'}">
	$(function(){
		$("#chkAll").click(function(){
			$("input[name=nums]").prop("checked", $(this).is(":checked"));
		});
		
		$("#btnDeleteList").click(function(){
			let cnt = $("input[name=nums]:checked").length;
			if(cnt === 0) {
				alert("삭제할 게시물을 먼저 선택하세요.");
				return false;
			}
			
			if(confirm("선택한 게시물을 삭제 하시겠습니까 ?")) {
				const f = document.listForm;
				f.action="${pageContext.request.contextPath}/notice/deleteList.do";
				f.submit();
			}
		});
	});
</c:if>
</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	
	<div class="main">
		<div>
			<p class="name1" style="line-height:80px; float:right;">♣ 자주묻는질문 </p>
		</div>
		<div>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/notice/list.do" style="color:#cccccc;">공지사항
				<img class="img" src="${pageContext.request.contextPath}/resource/images/icon/notice1.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/event/list.do" style="color:#cccccc;">이벤트
				<img class="img" src="${pageContext.request.contextPath}/resource/images/icon/notice2.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/question.jsp">자주묻는질문
				<img class="img" src="${pageContext.request.contextPath}/resource/images/icon/notice3.png">
			</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/qna/list.do" style="color:#cccccc;">1:1문의
				<img class="img" src="${pageContext.request.contextPath}/resource/images/mypage/gogek.png">
			</a>
		</div>
	</div>	
	
	<div class="container body-container">
	    <div class="body-title">
			<h2 style="margin:10px auto; float:left;"></h2>
	    </div>
	    
	    <div class="body-main mx-auto" style="margin:40px auto;">
	
	
	<ul class="qna">
            <li>
                <input type="checkbox" id="qna-1">
                <label for="qna-1">다른 전통주는 없나요 ? </label>
                <div>
                    <p>찾으시는 양조장과 전통주를 말씀해주시면 저희가 직접 컨택하여 업데이트 하겠습니다.</p>
                    <p>막걸리, 와인, 양주, 소주, 수제맥주 등 국내에서 생산되는 모든 술을 찾겠습니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-2">
                <label for="qna-2">배송 안내</label>
                <div>
                    <p>택배마감 : 평일 pm2:00까지 결제 완료건은 당일발송</p>
                    <p>다만 배달 사정에 따라 배달이 1~3일 정도(토,일,공휴일 제외) 지연될 수도 있음을 참고바랍니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-3">
                <label for="qna-3">주문취소, 교환 및 환불</label>
                <div>
                    <p>결제후 취소는 저희 고객센터로 문의해 주시기 바랍니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-4">
                <label for="qna-4">결제 안내</label>
                <div>
                    <p>결제는 카카오페이로만 결제 가능합니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-5">
                <label for="qna-5">상품에 대해서 문의하려면 어떻게 해야 하나요?</label>
                <div>
                    <p>상품에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다.<br>
                    <p>상품 상세 내용에 판매자 전화번호가 표시되어 있다면 판매자에게 문의해 주십시오.</p>
                    <p>다만 표시가 되어 있지 않다면 고객센터 > 1:1문의해 주십시오.</p>
                </div>
            </li>
        </ul>
	</div>
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>