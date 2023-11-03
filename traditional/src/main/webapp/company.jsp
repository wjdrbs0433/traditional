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
        청춘은
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>청춘청춘청춘</strong> 
        바로바로바로 <code>지금부터</code> 홀짜악
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
        <strong>지금부터 지금부터</strong>
         <code>홀짜악</code>청춘
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
        <strong>좋다좋다</strong> 맛있겠다 <code>전통주</code>헤헤헤헿
      </div>
    </div>
  </div>
</div>
    
   
 <div class="card" style="width: 14rem; float:left; margin-right:7px; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/1.jpg" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">김태현</h5>
    <p class="card-text">인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사</p>
    <a href="#" class="btn btn-primary">회장</a>
  </div>
</div>

 <div class="card" style="width: 14rem; float:left; margin-right:7px; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/5.png" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">전태희</h5>
    <p class="card-text">인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사</p>
    <a href="#" class="btn btn-primary">부회장</a>
  </div>
</div>

 <div class="card" style="width: 14rem; float:left; margin-right:7px; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/3.jpg" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">김수연</h5>
    <p class="card-text">인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사</p>
    <a href="#" class="btn btn-primary">사장</a>
  </div>
</div>

 <div class="card" style="width: 14rem; float:left; margin-right:7px; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/4.png" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">이상은</h5>
    <p class="card-text">인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사</p>
    <a href="#" class="btn btn-primary">부사장</a>
  </div>
</div>

 <div class="card" style="width: 14rem; float:left; margin-right:7px; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/2.png" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">박진영</h5>
    <p class="card-text">인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사</p>
    <a href="#" class="btn btn-primary">전무</a>
  </div>
</div>

 <div class="card" style="width: 14rem; float:right; margin-top:40px;">
  <img src="${pageContext.request.contextPath}/resource/images/company/6.png" class="card-img-top" height="270px" width="220px">
  <div class="card-body">
    <h5 class="card-title">김정균</h5>
    <p class="card-text">인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사말인사</p>
    <a href="#" class="btn btn-primary">인턴</a>
  </div>
</div>


    
    


</body>
</html>