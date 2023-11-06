<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
.body-main {
	max-width: 700px;
	padding-top: 15px;
}

.table-form td { padding: 7px 0; }
.table-form p { line-height: 200%; }
.table-form tr:first-child { border-top: 2px solid #212529; }
.table-form tr > td:first-child { width: 110px; text-align: center; background: #f8f8f8; }
.table-form tr > td:nth-child(2) { padding-left: 10px; }

.table-form input[type=text], .table-form input[type=file], .table-form textarea {
	width: 96%; }

.btn{
	background-color: gray;
    color: white;
    border: none;
    border-radius: 18px;
    padding: 10px 15px;
    cursor: pointer;
}	
	
/*별점*/	
.star-bundle {
	display: grid;
	width: 190px;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
	grid-auto-rows: 40px;
	justify-content: center;
	align-items: center;
	text-align: center;
	font-size: 30px;
}

	
	
.rate:hover {
	cursor: pointer;
	scale: 108%;
}
.rate {
	color: #fbd117 ;
}
	
	
	
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">


<script type="text/javascript">
function sendOk() {
    const f = document.boardForm;
	let str;
	
    str = f.reviewContent.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.reviewContent.focus();
        return;
    }
    

    f.action = "${pageContext.request.contextPath}/review/${mode}_ok.do";
    f.submit();
}


window.addEventListener("load", function(){
	const STAR_COLOR_DEFAULT = '#fbd117';
	const STAR_COLOR_HOVER = '#fbd117';
	
	const starBundle = document.getElementsByClassName('star-bundle')[0];
    const stars = starBundle.getElementsByTagName('i');
	
	let rateValue = 0;
	let rating = -1;
    let lastStarIsFull = true;
    
    for (let i = 0; i < 5; i++) {
    	stars[i].addEventListener('mousemove', function (e) {
            resetStar(stars);

            for (let j = 0; j <= i; j++) {
            	stars[j].classList.replace('fa-regular', 'fa-solid')
                stars[j].style.color = STAR_COLOR_HOVER;
            }

            // getBoundingClientRect() : 엘리먼트의 크기와 뷰포트에 상대적인 위치 정보를 제공하는 DOMRect 객체를 반환
            let rect = stars[i].getBoundingClientRect();
            // 클릭한 x좌표
            let x = e.clientX - rect.left;

            if (x < rect.width / 2) {
                // 왼쪽 클릭한 경우
                stars[i].classList.replace('fa-star', 'fa-star-half-stroke');
            } else {
                // 오른쪽 클릭한 경우
                stars[i].classList.replace('fa-regular', 'fa-solid');
            }
        });

        // 마우스가 별을 벗어날 때 별을 이전상태로 복귀
        stars[i].addEventListener('mouseout', function (e) {
            resetStar(stars);

            if (rating === -1) return;

            for (let j = 0; j <= rating; j++) {
            	stars[j].classList.replace('fa-regular', 'fa-solid');
            }

            if (!lastStarIsFull) {
            	stars[rating].classList.replace('fa-star', 'fa-star-half-stroke');
            }
        });

        // 별을 클릭한 경우 점수 계산
        stars[i].addEventListener('click', function (e) {
            // i가 눌렸다면 i+1점
            // i-1 까지 꽉찬 별, i번째 별이 반별인지 꽉찬 별인지 적용
            rating = i;
            lastStarIsFull = true;
            lastStarIsFull = !stars[i].classList.contains('fa-star-half-stroke');

            getRating();
        });
    }

    function getRating() {
        rateValue = rating + (lastStarIsFull ? 1 : 0.5);
        document.querySelector('#rating').value = rateValue;
    }

    function resetStar(stars) {
        // 별 원상 복구
        for (const star of stars) {
            star.classList.replace('fa-solid', 'fa-regular')
            star.classList.replace('fa-star-half-stroke', 'fa-star');
            star.style.color = STAR_COLOR_DEFAULT;
        }
    }
    
}, false);

</script>
</head>
<body>

	
<main>

	<div class="container body-container">
	    <div class="body-title">
			<h2>리뷰작성 </h2>
	    </div>
	    
	    <div class="body-main mx-auto">
			<form name="boardForm" method="post">
				<table class="table table-border table-form">
					<tr> 
						<td>상품명</td>
						<td> 
							<p>${dto.productName}</p>
						</td>
					</tr>
					
					<tr> 
						<td>작성자</td>
						<td> 
							<p>${dto.mName}</p>
						</td>
					</tr>
					
					<tr> 
						<td>별점</td>
						<td>
							<div style="margin: 20px auto; width: 500px;"> 
								<div class="star-bundle">
									<i class="fa-regular fa-star rate"></i>
								    <i class="fa-regular fa-star rate"></i>
								    <i class="fa-regular fa-star rate"></i>
								    <i class="fa-regular fa-star rate"></i>
								    <i class="fa-regular fa-star rate"></i>
								</div>
								<div style="margin: 10px;">
									<input type="hidden" name="rating" id="rating" value="0" readonly="readonly" >
	  							</div>
	  						</div>
						</td>
					</tr>
					
					<tr> 
						<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
						<td> 
							<textarea name="reviewContent" class="form-control"></textarea>
						</td>
					</tr>
				</table>
					
				<table class="table">
					<tr> 
						<td align="center">
							<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
							<button type="reset" class="btn">다시입력</button>
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/review/myList.do';">${mode=='update'?'수정취소':'등록취소'}</button>
							<input type="hidden" name="productCode" value="${dto.productCode}">
							<input type="hidden" name="orderDetailNum" value="${orderDetailNum}">
							
						</td>
					</tr>
				</table>
		
			</form>

	    </div>
	</div>

</main>

</body>
</html>