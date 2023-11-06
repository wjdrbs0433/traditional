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
		width: 75%; /* 너비를 70%로 설정합니다. */
        margin: 0 auto; /* 왼쪽과 오른쪽에 10px의 공백을 추가합니다. */
        padding: 20px; /* 내부 여백 (옵션) */
	}
    .size {
    	
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .count {
        order: 2;
    }

    .select {
        order: 1; 
    }
    
	main {
	    margin: 30px auto; /* 가운데 정렬 및 상단과 하단에 30px의 여백 설정 */
	    width: 100%; /* 전체 너비 활용 */
	    min-height: 700px; /* 최소 높이 500px로 설정 */
	}
	
	/* .item-container 클래스의 스타일 */
	.item-container {
	    width: 100%; /* 전체 너비 활용 */
	    display: grid; /* 그리드 레이아웃 사용 */
	    grid-template-rows: repeat(4, 1fr); /* 3개의 행 생성, 동일한 비율로 분배 */
	    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); /* 자동으로 열을 생성하고, 각 열의 최소 너비는 270px, 남은 공간은 동일하게 분배 */
	    gap: 10px; /* 아이템 사이의 간격 10px 설정 */
	}
	
	/* .item 클래스의 스타일 */
	.item {
	    cursor: pointer; /* 포인터 커서로 변경 */
	    /* border: 1px solid #eee; 1px 너비의 회색 테두리 설정 */
	    height: 550px; /* 아이템의 높이 280px로 설정 */
	    display: flex; /* 플렉스 박스로 설정 */
	    flex-direction: column; /* 세로 방향으로 아이템 요소 배치 */
	    justify-content: space-between; /* 아이템 요소 간의 공간을 위아래로 분배 */
	}
	
	
	.item:hover {
	    /* border: 1px solid #ccc; */
	}
	
	/* .item-thumb 클래스의 이미지 스타일 */
	.item-thumb img {
	    /* 이미지 크기를 부모 크기에 맞게 조절 */
	    display: block; /* 인라인 요소가 아닌 블록 요소로 설정 */
	    width: 100%; /* 너비 100%로 설정 */
	    height: 350px; /* 높이 179px로 설정 */
	    border-radius: 20px;
	}
	
	/* .item-thumb 클래스의 이미지 호버 상태 스타일 */
	.item-thumb img:hover {
	    scale: 105%; /* 해당 요소를 지정한 크기만큼 확대 또는 축소 */
	}
	
	/* .item-desc 클래스의 스타일 */
	.item-desc {
	    margin: 10px; /* 상하좌우에 10px의 여백 설정 */
	}
	
	.item-desc .price{
	    font-size: 17px;
	    font-weight: 700; /* 글꼴 두껍게 설정 */
	    letter-spacing: -1px; /* 글자 간격을 -1px로 설정 */
	    height: 10px;
	}
	
	/* .item-desc 클래스의 제목 스타일 */
	.item-desc .title {
	    font-size: 17px; /* 글꼴 크기 17px로 설정 */
	    font-weight: 700; /* 글꼴 두껍게 설정 */
	    letter-spacing: -1px; /* 글자 간격을 -1px로 설정 */
	    height: 50px; /* 높이 45px로 설정 */
	}
	
	/* .item-desc 클래스의 날짜 스타일 */
	.item-desc .date {
	    font-size: 12px; /* 글꼴 크기 12px로 설정 */
	    font-weight: 500; /* 글꼴 중간 두껍게 설정 */
	}
	
	.item-star {
		display: flex;
        align-items: center;
        font-size: 12px;
	}
	
	.item-star img {
	    /* 이미지 크기를 부모 크기에 맞게 조절 */
	    display: block; /* 인라인 요소가 아닌 블록 요소로 설정 */
	    width: 12px; /* 너비 100%로 설정 */
	    height: 12px; /* 높이 179px로 설정 */
	}
	
	.icon {
		background: rgb(240, 240, 240);
		display: flex;
        justify-content: space-between;
        align-items: center;
        border-radius: 20px;
	}
	
	.content {
        order: 1;
        margin : 10px 40px;
        
    }

    .iconimg {
        order: 2; 
        width : 120px;
        height : 120px;
        margin : 10px 40px;
    }
    
    .jemok {
    	font-size : 20px;
    	font-weight: bold;
    }
</style>
</head>
<body>

<div class="main">
	<div class="icon">
		<div class="content">
			<p class="jemok">전체상품</p>
			<p>담화마켓의 모든 술을 만나보세요!</p>
		</div>
		<img class="iconimg" src="${pageContext.request.contextPath}/resource/images/product/icon.png">
	</div>
	<br>
	<hr>
	<br>
	
	<div class="size">
	    <div class="count">${dataCount}건의 결과가 있어요</div>
	    <form action="product.do" method="post">
	        <select class="select" name="sortOption" onchange="this.form.submit()">
			    <option value="recommend">추천순</option>
			    <option value="released_at">최신순</option>
			    <option value="rating">평점순</option>
			    <option value="star_count">리뷰 많은 순</option>
			    <option value="selling_count">판매순</option>
			    <option value="price_high">높은 가격순</option>
			    <option value="price_low">낮은 가격순</option>
			</select>
			<script>
			    var sortOption = "${param.sortOption}";
			    var select = document.querySelector('select[name="sortOption"]');
			    for (var i = 0; i < select.options.length; i++) {
			        if (select.options[i].value === sortOption) {
			            select.options[i].selected = true;
			        }
			    }
			</script>
			
			<!-- 
			<select class="select">
			    <option value="categori">카테고리</option>
			    <option value="takju">탁주</option>
			    <option value="chungju">청주</option>
			    <option value="apple">과실주</option>
			    <option value="alcol">증류주</option>
			</select>
			 -->
	    </form>
	</div>
    
    <div>
        <main>
            <div class="item-container">
            <c:choose>
			   <c:when test="${empty productList}">
			       <p>상품이 없습니다.</p>
			   </c:when>
			   <c:otherwise>
			       <!-- 상품 목록 표시 -->
			       <c:forEach var="product" items="${productList}">
	                    <div class="item">
	                        <div class="item-thumb">
							    <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=${product.productCode}">
							        <img src="${pageContext.request.contextPath }/resource/images/product/<c:out value="${product.productCode}" />.jpg">
							    </a>        
							</div>
	                        <div class="item-desc">
	                            <p class="title"><c:out value="${product.productName}" /></p>
	                            <p class="price"><fmt:formatNumber type="number" value="${product.productPrice}" pattern="#,###" />원</p>
	                            <div class="item-star">
	                                <img src="${pageContext.request.contextPath}/resource/images//product/star.png">&nbsp;${product.star}<c:out value="" /> | 리뷰 ${dataCountreview}<c:out value="" />
	                            </div>
	                            <hr>
	                            <p class="date"># <c:out value="${product.hashtag}" /></p>
	                            
	                        </div>
	                    </div>
                	</c:forEach>
			   </c:otherwise>
			</c:choose>
                
            </div>
        </main>
    </div>
</div>
	
</body>
</html>
