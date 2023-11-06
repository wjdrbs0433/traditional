<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/index.css">

<script src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>

<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" /> 

<script type="text/javascript">
function modal() {
    alert("공지사항입니다.");
}

</script>
</head>

<body id="body-pd">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<h2 style="margin: 40px 0px; text-align:center;">[ Company introduction ]</h2>
    
    <div id="recommend">
  <h3 style="margin: 5px 0px; text-align: center;">회사 위치</h3>
  <div id="map" style="height: 400px; margin-top: 20px; border: 1px solid #ccc; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
    <script>
      var map = L.map('map').setView([37.556530, 126.919512], 15);
      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(map);
      var marker = L.marker([37.556530, 126.919512]).addTo(map);
      marker.bindPopup("서울, 대한민국, 쌍용강북교육센터").openPopup();
    </script>
  </div>
</div>
    
    
    <div class="accordion" id="accordionExample" style="margin-top:50px">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        청춘을 느끼고 싶은 날
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>가장 쉬운 방법	</strong> 
        <!-- 바로바로바로 <code>지금부터</code> 홀짜악 -->
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        바로
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>2000종이 넘는 다채로운 전통주	</strong>
        <!-- <code>홀짜악</code>청춘 --> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        지금부터
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>4도부터 53도까지 다양하게 갖춰진 전통주 쇼핑몰 청바지를 이용해보세요</strong>
        <!-- 맛있겠다 <code>전통주</code>헤헤헤헿  -->
      </div>
    </div>
  </div>
</div>
    
    <br>
    <h3>1. 인사말</h3>
   
 <div class="card" style="width: 14rem; float:left; margin-right:7px; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/1.jpg" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">김태현<span style="float:right;"><a href="#" class="btn btn-primary">회장</a></span></h5>
        <br>
    <p class="card-text"><strong>나가자</strong> : 나라와 가정과 자신의 발전을 위하여</p>
  </div>
</div>

 <div class="card" style="width: 14rem; float:left; margin-right:7px; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/5.png" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">전태희<span style="float:right;"><a href="#" class="btn btn-primary">부회장</a></span></h5>
    <br>
    
    <p class="card-text"><strong>재건축</strong> : 재미있고, 건강하게, 축복하며 살자</p>
    
  </div>
</div>

 <div class="card" style="width: 14rem; float:left; margin-right:7px; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/3.jpg" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">김수연<span style="float:right;"><a href="#" class="btn btn-primary">사장</a></span></h5>
        <br>
    <p class="card-text"><strong>모바일</strong> : 모든것이 바라는대로 일어나길</p>
    
  </div>
</div>

 <div class="card" style="width: 14rem; float:left; margin-right:7px; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/4.png" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">이상은<span style="float:right;"><a href="#" class="btn btn-primary">부사장</a></span></h5>
        <br>
    <p class="card-text"><strong>흥청망청</strong> : 흥해도 청춘 망해도 청춘</p>
    
  </div>
</div>


 <div class="card" style="width: 14rem; float:left; margin-right:7px; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/2.png" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">박진영<span style="float:right;"><a href="#" class="btn btn-primary">전무</a></span></h5>
        <br>
    <p class="card-text"><strong>뚝배기</strong> : 뚝심있고, 배짱있게, 기운차게</p>
    
  </div>
</div>

 <div class="card" style="width: 14rem; float:right; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/6.png" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">김정균<span style="float:right;"><a href="#" class="btn btn-primary">인턴</a></span></h5>
        <br>
    <p class="card-text"><strong>고진감래</strong> : 고객을 진심으로 대하면 감동으로 돌아온다</p>
    
  </div>
</div>


    
    


</body>
</html>