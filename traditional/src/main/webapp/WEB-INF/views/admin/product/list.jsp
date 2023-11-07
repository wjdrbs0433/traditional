<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin main page</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">

<script src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>


<style>
.searchbox { margin: 5px auto; padding-bottom: 0;
box-shadow: 0 0 0 1px #999;
 width: 1100px;
}

.searchbox th { text-align: right;  padding:10px;}
.searchbox td { text-align: left;  padding:10px; }
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
 table-layout: auto; 
margin: 20px auto;
}
.listbox tr { border-bottom:1px solid #b4b4b4; }
.listbox th { text-align: center; font-size: 15px; margin: 5px; 

}
.listbox td { font-size: 15px; margin: 5px;}
.listbox thead tr th { white-space: nowrap;}

header { padding-bottom: 30px; }
header th { padding: 10px 10px 10px 5px; }
header td { padding: 10px 0px 10px 20px; }

main th, td{ padding: 10px; }

#body-pd{ overflow: auto;
  white-space: nowrap; }

.page-navigation {
		clear: both;
		padding: 20px 0;
		text-align: center;
	}
.paginate {
		clear: both;
		text-align: center;
		white-space: nowrap;
		font-size: 14px;	
	}
	.paginate a {
		border: 1px solid #cccccc;
		color: #000000;
		font-weight: 600;
		text-decoration: none;
		padding: 3px 7px;
		margin-left: 3px;
		vertical-align: middle;
	}
	.paginate a:hover, .paginate a:active {
		color: #6771ff;
	}
	.paginate span {
		border: 1px solid #e28d8d;
		color: #cb3536;
		font-weight: 600;
		padding: 3px 7px;
		margin-left: 3px;
		vertical-align: middle;
	}
	.paginate :first-child {
		margin-left: 0;
	}

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
	
	$("#btnDeleteList").click(function(){
		let cnt = $("input[name=check]:checked").length;
		if(cnt === 0) {
			alert("삭제할 상품을 먼저 선택하세요.");
			return false;
		}
		
		if(confirm("선택한 상품을 삭제 하시겠습니까 ?")) {
			const f = document.listForm;
			f.action="${pageContext.request.contextPath}/admin/product/updateList.do";
			f.submit();
		}
	});
});

</script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>

<body id="body-pd">
<jsp:include page="/WEB-INF/views/layout/adminheader.jsp"/>
    
    <div id="wrap" style="padding: 0px 20px;">
    <div class="navbar" style="margin-top: 52px;">
        
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/product/list.do" style="position: absolute; left: 45%;">
           	상품 리스트
        </a>
        
    </div>
    <hr>
    <div id="recommend">
    <h6 style="margin: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;상품관리 > 상품 리스트</h6>
    </div>
    
    <header>
    <div>
    <div class="search">
    <form name="searchForm" action="${pageContext.request.contextPath}/admin/product/list.do" method="post">
    	<table class="searchbox" >
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
			<!-- 
			<table class="table mytable2">
				<tr>
					<td width="50%">
						${dataCount}개(${page}/${total_page} 페이지)
					</td>
				</tr>
			</table>
			 -->
			 
			 <h6>${dataCount}개(${page}/${total_page} 페이지)</h6>
			 
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
					<c:if test="${dto.extinctOrNot==1 }">
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
							<td>
								<img src="${pageContext.request.contextPath }/resource/images/product/<c:out value="${dto.productCode}" />.jpg"
								 width="100px" height="100px">
							</td>
							<td>${dto.extinctOrNot}</td>
							<td>${dto.price}</td>
							<td>${dto.volume}</td>
							<td>${dto.breweryPage}</td>
							<td>
								<button type="button" class="btns" onclick="location.href='${pageContext.request.contextPath}/admin/product/update.do?productCode=${dto.productCode}&page=${page}';">수정</button>
							</td>
						</tr>
					</c:if>
					</c:forEach>
				</tbody>
			</table>
			</form>
			
			<table>
			<tr align="right" style="border: 0">
				<td>
					<button type="button" class="btns" onclick="location.href='${pageContext.request.contextPath}/admin/product/write.do';">상품등록</button>
				</td>
				
				<td>
					<button type="button" class="btns" id="btnDeleteList">상품삭제</button>
				</td>
			</tr>
			</table>
			
		<div class="page-navigation" style="text-align: center">
			${dataCount == 0 ? "등록된 게시글이 없습니다." : paging }
		</div>
    </div>
    </main>
    
    </div>
    



</body>

</html>