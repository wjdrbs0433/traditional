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
<style type="text/css">
.table {  width: 1000px; margin: 20px auto;}

.tablebutton { margin: 20px auto; }

#tbox { width: 500px;  }

.btn {
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

</style>


<script src="${pageContext.request.contextPath}/resource	/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>

<script type="text/javascript">
function modal() {
	alert("공지사항입니다.")
}

function sendOk() {
    
	const f = document.writeForm;
	/*
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
*/
    f.action = "${pageContext.request.contextPath}/admin/product/${mode}_ok.do";
    f.submit();
}


</script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
</head>
<body id="body-pd">
<jsp:include page="/WEB-INF/views/layout/adminheader.jsp"/>
    
    
    <div id="wrap" style="padding: 0px 100px;">
    <div class="navbar" style="margin-top: 52px;">
        
        <a class="navbar-brand" href="#" style="position: absolute; left: 45%;">
           	${mode=='update'?'상품수정':'상품등록'}
        </a>
    </div>
     
    <hr>
    <div id="recommend">
    <h6 style="margin: 10px;">
    상품관리 > 상품 리스트 > ${mode=='update'?'상품수정':'상품등록'}</h6>
    </div>
    
	
	<form name="writeForm" method="post" enctype="multipart/form-data">
	<table class="table table-form">
	<!-- 
		<tr>
			<td>제품코드</td>
			<td>
				<input type="text" name="productCode" class="form-control">
			</td>
		</tr>
		 -->
		<tr>
			<td>제품명</td>
			<td>
				<input type="text" name="productName" class="form-control" id="tbox" value="${dto.productName}">
				
			</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>
				<input type="text" name="productPrice" class="form-control" id="tbox" value="${dto.productPrice}">
			</td>
		</tr>
		<tr>
			<td>설명</td>
			<td>
				<input type="text" name="productSubject" class="form-control" id="tbox" value="${dto.productSubject}">
			</td>
		</tr>
		<tr>
			<td>유통기한</td>
			<td>
				<input type="text" name="expirationDate" class="form-control" id="tbox" value="${dto.expirationDate}">
			</td>
		</tr>
		<tr>
			<td>저장방법</td>
			<td>
				<input type="text" name="productStorage" class="form-control" id="tbox" value="${dto.productStorage}">
			</td>
		</tr>
		<tr>
			<td>주종</td>
			<td>
				<input type="radio" name="productCategory" value="탁주"  checked>탁주&nbsp;
				<input type="radio" name="productCategory" value="약주,청주">약주,청주&nbsp;
				<input type="radio" name="productCategory" value="과실주">과실주&nbsp;
				<input type="radio" name="productCategory" value="증류주">증류주&nbsp;
				<input type="radio" name="productCategory" value="기타주류">기타주류&nbsp;
			</td>
		</tr>
		<tr>
			<td>해쉬태그</td>
			<td>
				<input type="text" name="hashTag" class="form-control" id="tbox" value="${dto.hashTag}">
			</td>
		</tr>
		<tr>
			<td>도수</td>
			<td>
				<input type="text" name="alcoholPercent" class="form-control" id="tbox" value="${dto.alcoholPercent}">
			</td>
		</tr>
		<tr>
			<td>맛</td>
			<td>
				<input type="radio" name="productTaste" value="단맛" checked>단맛&nbsp;
				<input type="radio" name="productTaste" value="신맛">신맛&nbsp;
				<input type="radio" name="productTaste" value="쓴맛">쓴맛&nbsp;
				<input type="radio" name="productTaste" value="탄산">탄산&nbsp;
			</td>
		</tr>
		<tr>
			<td>대상</td>
			<td>
				<input type="radio" name="productPerson" value="웃어른" checked>웃어른&nbsp;
				<input type="radio" name="productPerson" value="연인">연인&nbsp;
				<input type="radio" name="productPerson" value="친구">친구&nbsp;
				<input type="radio" name="productPerson" value="혼자">혼자&nbsp;
				<input type="radio" name="productPerson" value="비즈니스">비즈니스&nbsp;
			</td>
		</tr>
		<tr>
			<td>재고</td>
			<td>
				<input type="text" name="inventory" class="form-control" id="tbox" value="${dto.inventory}">
			</td>
		</tr>
		<tr>
			<td>사진</td>
			<td>
				<input type="text" name="image" class="form-control" id="tbox" value="${dto.image}">
				 
			</td>
		</tr>
		<tr>
			<td>단종여부</td>
			<td>
				<input type="text" name="extinctOrNot" class="form-control" id="tbox" value="${dto.extinctOrNot}">
			</td>
		</tr>
		<tr>
			<td>원가</td>
			<td>
				<input type="text" name="price" class="form-control" id="tbox" value="${dto.price}">
			</td>
		</tr>
		<tr>
			<td>용량</td>
			<td>
				<input type="text" name="volume" class="form-control" id="tbox" value="${dto.volume}">
			</td>
		</tr>
		<tr>
			<td>양조장홈페이지</td>
			<td>
				<input type="text" name="breweryPage" class="form-control" id="tbox" value="${dto.breweryPage}">
			</td>
		</tr>
		
	</table>
	
	<table class="tablebutton">
		<tr align="center">
			<td>
				<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
				<button type="reset" class="btn">다시입력</button>
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/product/list.do?page=${page}';">${mode=='update'?'수정취소':'등록취소'}</button>
				<c:if test="${mode=='update'}">
					<input type="hidden" name="productCode" value="${dto.productCode}">
					<input type="hidden" name="page" value="${page}">
				</c:if>
			</td>
		</tr>
	</table>
	</form>
</div>
    
    


    


</body>

</html>