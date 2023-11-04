<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin main page</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="./resource/css/bootstrap.min.css">
<link rel="stylesheet" href="./resource/css/custom.css">
<link rel="stylesheet" href="./resource/css/index.css">

<script src="./resource	/js/jquery.min.js"></script>
<script src="./resource/js/popper.js"></script>
<script src="./resource/js/bootstrap.min.js"></script>
<script src="./resource/js/custom.js"></script>


<style>
body { width: 100%; }

.searchbox { margin: 5px auto; padding-bottom: 0;}

.searchbox th { text-align: right; }
.searchbox td { text-align: left; }
#tbox { width: 200px;  }

.searchbutton { margin: 0 auto; }

  
.btns {
	color: #333333;
	border: 1px solid #999999 !important; 
	background-color: #ffffff;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor:pointer;
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}


.listbox { 
border: 1px solid #b4b4b4; table-layout: auto; 
margin: 20px auto;
}
.listbox th { text-align: center; font-size: 15px;}
.listbox td { font-size: 15px;}
.listbox thead tr th { white-space: nowrap; }

header { padding-bottom: 30px; }
header th { padding: 10px 10px 10px 5px; }
header td { padding: 10px 0px 10px 20px; }

main th, td{ padding: 10px; }



</style>



<script type="text/javascript">
function modal() {
	alert("공지사항입니다.")
}

function searchList() {
	const f = document.searchForm;
	f.submit();
}

$(function(){
	$("#chkAll").click(function(){
		$("input[name=check]").prop("checked", $(this).is(":checked"));
	});
});
/*
function check() {
	const f = document.listForm;
	const chkEls = document.querySelectorAll('form input[name=check]');
	/*
	// checked 속성 : checkbox, radio 버튼의 선택/해제하거나 선택 유무 반환(true/false)
	for(let el of chkEls) {
		el.checked = f.chkAll.checked;
	}
	
	chkEls.forEach( el => el.checked = f.chkAll.checked);
	
}
*/
/*
$(function(){
	$("#chkAll").click(function(){
		$("input[name=check]").prop("checked", $(this).is(":checked"));
	});
	
	$("#btnDeleteList").click(function(){
		let cnt = $("input[name=members]:checked").length;
		if(cnt === 0) {
			alert("삭제할 회원을 먼저 선택하세요.");
			return false;
		}
		
		if(confirm("선택한 회원을 삭제 하시겠습니까 ?")) {
			const f = document.listForm;
			f.action="${pageContext.request.contextPath}/admin/member/updateList.do";
			f.submit();
		}
	});
	
});
*/

/*
function deleteList() {
	const f = document.listForm
	const chks = f.querySelectorAll('input[name=check]:checked');
	
	if(chks.length === 0) {
		alert('삭제할 게시글을 먼저 선택하세요...');
		return;
	}
	
	if(confirm('선택한 게시글을 삭제하시겠습니까 ? ')) {
		f.action = 'deleteList.jsp';
		f.submit();
	}
}
*/

</script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>
<body id="body-pd">
    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>	
                <div class="nav__brand">
                        <img src="./resource/images/icon/more.png" name="menu-outline" class="nav__toggle" id="nav-toggle" style="width: 28px;" onclick="langHide()">
                </div>
                <div class="nav__list">
                    <a href="#" class="nav__link active">
                        <img src="./resource/images/icon/person.png" style="width: 28px; background-color: #cccccc; border-radius: 50%; padding: 5px;" name="menu1">
                        	<span class="nav_name">로그인 / 회원가입</span>
                         </a>
                    <a href="#" class="nav__link">
                        <img src="./resource/images/icon/home.png" style="width: 28px;" name="menu2">
                        <span class="nav_name" style="color: #1682b0;">홈</span>
                    </a>
                    <a href="#" class="nav__link" onmouseover="menu3.src='./resource/images/icon/messenger_hover.png'" onmouseout="menu3.src='./resource/images/icon/messenger.png'">
                        <img src="./resource/images/icon/messenger.png" style="width: 28px;" name="menu3">
                        <span class="nav_name">커뮤니티</span>
                    </a>
                    <a href="#" class="nav__link" onmouseover="menu4.src='./resource/images/icon/comment01.png'" onmouseout="menu4.src='./resource/images/icon/comment.png'">
                        <img src="./resource/images/icon/comment.png" style="width: 28px;" name="menu4">
                        <span class="nav_name">사용가이드</span>
                    </a>
                </div>
                
            </div>
        </nav>
    </div>
    
    <div id="wrap" style="padding: 0px 100px;">
    <div class="navbar" style="margin-top: 52px;">
        <form class="row">
        </form>
        <a class="navbar-brand" href="#" style="position: absolute; left: 45%;">
           	관리자 페이지
        </a>
        <div class="col-auto">
        
            <a class="btn" id="btn-modal" data-toggle="modal" href="#notificationModal"style="border: 0px; padding: 2px;" onclick="modal();">
            	<img src="./resource/images/icon/notification.png" width="28">
            </a>
            <a href="loginRegister.jsp"><img src="./resource/images/icon/person.png" width="52" style="background-color: #1682b0; border-radius: 40px; padding: 10px;"></a>
        </div>
    </div>
     
    <hr>
    <div id="recommend">
    <h2 style="margin: 40px;">상품 리스트</h2>
    </div>
    
    <header>
    <div>
    <div class="search">
    <form name="searchForm" action="${pageContext.request.contextPath}/admin/product/list.do" method="post">
    	<table class="searchbox" border="1" style="width: 1000px">
    		<tr>
    			<th>제품명</th>
    			<td>
    				<input type="text" name="productName"value="${productNameKwd}" id="tbox" class="form-control">
    			</td>
    		</tr>
    		<tr>
    			<th>가격</th>
    			<td>
    				<input type="checkbox" name="price" value="p1">&nbsp;1만원 미만&nbsp;&nbsp;
    				<input type="checkbox" name="price" value="p2">&nbsp;1만원 이상 ~ 3만원 미만&nbsp;&nbsp;
    				<input type="checkbox" name="price" value="p3">&nbsp;3만원 이상 ~ 5만원 미만&nbsp;&nbsp;
    				<input type="checkbox" name="price" value="p4">&nbsp;5만원 이상&nbsp;&nbsp;
    			</td>
    		</tr>
    		<tr>
    			<th>용량</th>
    			<td>
    				<input type="checkbox" name="volume" value="b1">&nbsp;200ml 미만&nbsp;&nbsp;
    				<input type="checkbox" name="volume" value="b2">&nbsp;200ml 이상 ~ 500ml 미만&nbsp;&nbsp;
    				<input type="checkbox" name="volume" value="b3">&nbsp;500ml 이상&nbsp;&nbsp;
    			</td>
    		</tr>
    		<tr>
    			<th>유통기한</th>
    			<td>
    				<input type="date" name="expirationDateStart" value="e1">~
    				<input type="date" name="expirationDateEnd" value="e2">
    			</td>
    		</tr>
    		<tr>
    			<th>주종</th>
    			<td>
    				<input type="checkbox" name="category" value="탁주">&nbsp;탁주&nbsp;&nbsp;
    				<input type="checkbox" name="category" value="약,청주">&nbsp;약,청주&nbsp;&nbsp;
    				<input type="checkbox" name="category" value="과실주">&nbsp;과실주&nbsp;&nbsp;
    				<input type="checkbox" name="category" value="증류주">&nbsp;증류주&nbsp;&nbsp;
    				<input type="checkbox" name="category" value="기타주류">&nbsp;기타주류&nbsp;&nbsp;
    			</td>
    		</tr>
    		<tr>
    			<th>도수</th>
    			<td>
    				<input type="checkbox" name="alcohol" value="alcohol1">&nbsp;10도 미만&nbsp;&nbsp;
    				<input type="checkbox" name="alcohol" value="alcohol2">&nbsp;10도 이상 ~ 30도 미만&nbsp;&nbsp;
    				<input type="checkbox" name="alcohol" value="alcohol3">&nbsp;30도 이상&nbsp;&nbsp;
    			</td>
    		</tr>
    		<tr>
    			<th>맛</th>
    			<td>
    				<input type="checkbox" name="taste" value="단맛">&nbsp;단맛&nbsp;&nbsp;
    				<input type="checkbox" name="taste" value="신맛">&nbsp;신맛&nbsp;&nbsp;
    				<input type="checkbox" name="taste" value="쓴맛">&nbsp;쓴맛&nbsp;&nbsp;
    				<input type="checkbox" name="taste" value="탄산">&nbsp;탄산&nbsp;&nbsp;
    			</td>
    		</tr>
    		<!-- 
    		<tr>
    			<th>대상</th>
    			<td>
    				<input type="checkbox" name="sms">웃어른
    				<input type="checkbox" name="sms">연인
    				<input type="checkbox" name="sms">친구
    				<input type="checkbox" name="sms">혼자
    				<input type="checkbox" name="sms">비즈니스
    			</td>
    		</tr>
    		 -->
    	</table>
    	</form>
    	</div>
    	<div>
    	<table class="searchbutton">
			<tr align="center">
				<td  width="100">
					<button type="button" class="btns" onclick="searchList();">검색</button>
				</td>
				<td width="100">
					<button type="button" class="btns" onclick="location.href='${pageContext.request.contextPath}/admin/product/list.do';">초기화</button>
				</td>
			</tr>    		
    	</table>
    </div>
    </div>
    </header>
    
    <main>
    <div>
			<form name="listForm">
			<table class="listbox">
				<thead>
					<tr>
						<th>
							<input type="checkbox" name="chkAll" id="chkAll" onclick="check();" >        
						</th>
						<th class="num">번호</th>
						<th class="code">제품코드</th>
						<th class="name">제품명</th>
						<th class="price">가격</th>
						<th class="subject">설명</th>
						<th class="exdate">유통기한</th>
						<th class="storage">저장방법</th>
						<th class="category">주종</th>
						<th class="hashtag">해쉬태그</th>
						<th class="alcohol">도수</th>
						<th class="taste">맛</th>
						<th class="recommended">대상</th>
						<th class="inventory">재고</th>
						<th class="img">사진</th>
						<th class="extinctornot">단종여부</th>
						<th class="oprice">원가</th>						
						<th class="volume">용량</th>
						<th class="breweryPage">양조장홈페이지</th>
						<th class="update">수정</th>
					</tr>
				</thead>
				
				<tbody >
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>
								<input type="checkbox" name="check" value="${dto.productCode}">
							</td>
							<td>${dataCount-(page-1)*size - status.index }</td>
							<td>${dto.productCode}</td>
							<td>${dto.productName}</td>
							<td>${dto.productPrice}</td>
							<td>${dto.productSubject}</td>
							<td>${dto.expirationDate}</td>
							<td>${dto.productStorage}</td>
							<td>${dto.productCategory}</td>
							<td>${dto.hashTag}</td>
							<td>${dto.alcoholPercent}</td>
							<td>${dto.productTaste}</td>
							<td>${dto.productPerson}</td>
							<td>${dto.inventory}</td>
							<td>${dto.image}</td>
							<td>${dto.extinctOrNot}</td>
							<td>${dto.price}</td>
							<td>${dto.volume}</td>
							<td>${dto.breweryPage}</td>
							<td>
								<button type="button" class="btns" onclick="location.href='${pageContext.request.contextPath}/admin/product/update.do?productCode=${dto.productCode}&page=${page}';">수정</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
			
			<table>
			<tr align="right">
				<td>
					<button type="button" class="btns" onclick="location.href='${pageContext.request.contextPath}/admin/product/write.do';">상품등록</button>
				</td>
				
				<td>
					<button type="button" class="btns" id="btnDeleteList">상품삭제</button>
				</td>
			</tr>
			</table>
			
		<div class="page-navigation">
			${dataCount == 0 ? "등록된 게시글이 없습니다." : paging }
		</div>
    </div>
    </main>
    
    </div>
    



</body>

</html>