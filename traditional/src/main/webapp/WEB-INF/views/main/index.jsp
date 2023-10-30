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

<script type="text/javascript">
function modal() {
	alert("공지사항입니다.")
}

</script>

</head>
<body id="body-pd">
    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>	
                <div class="nav__brand">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/more.png" name="menu-outline" class="nav__toggle" id="nav-toggle" style="width: 28px;" onclick="langHide()">
                </div>
                <div class="nav__list">
                    <a href="${pageContext.request.contextPath}/member/login.do" class="nav__link active">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/person.png" style="width: 28px; background-color: #cccccc; border-radius: 50%; padding: 5px;" name="menu1">
                        	<span class="nav_name">로그인 / 회원가입</span>
                         </a>
                    <a href="#" class="nav__link">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/home.png" style="width: 28px;" name="menu2">
                        <span class="nav_name" style="color: #1682b0;">홈</span>
                    </a>
                    <a href="#" class="nav__link" onmouseover="menu3.src='${pageContext.request.contextPath}/resource/images/icon/messenger_hover.png'" 
                    							  onmouseout="menu3.src='${pageContext.request.contextPath}/resource/images/icon/messenger.png'">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/messenger.png" style="width: 28px;" name="menu3">
                        <span class="nav_name">커뮤니티</span>
                    </a>
                    <a href="#" class="nav__link" onmouseover="menu4.src='${pageContext.request.contextPath}/resource/images/icon/comment01.png'" 
                    							  onmouseout="menu4.src='${pageContext.request.contextPath}/resource/images/icon/comment.png'">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/comment.png" style="width: 28px;" name="menu4">
                        <span class="nav_name">사용가이드</span>
                    </a>
                </div>
                
            </div>
        </nav>
    </div>
    
    <div id="wrap" style="padding: 0px 100px;">
    <div class="navbar" style="margin-top: 52px;">
        <form class="row">
            <div class="col-auto" style="position: relative; width: 300px;">
                <button class="btn" type="submit" style="position: absolute; bottom: -3px;">
                    <img src="${pageContext.request.contextPath}/resource/images/icon/search.png" width="28">
                </button>
                <input id="search" class="form-control" type="search" placeholder="검색어를 입력하세요." aria-label="Search" style="width: 100%; padding-left: 50px;">
            </div>
        </form>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/product/product.do" style="position: absolute; left: 45%;">
            청 바 지
        </a>
        <div class="col-auto">
        
            <a class="btn" id="btn-modal" data-toggle="modal" href="#notificationModal"style="border: 0px; padding: 2px;" onclick="modal();">
            	<img src="${pageContext.request.contextPath}/resource/images/icon/notification.png" width="28">
            </a>
            
            <c:choose>
                  <c:when test="${empty sessionScope.member}">
                     <!--로그인 전-->
                <a href="${pageContext.request.contextPath}/member/login.do" title="로그인">     
	            	<img src="${pageContext.request.contextPath}/resource/images/icon/person.png" width="52" 
	            				style="background-color: #1682b0; border-radius: 40px; padding: 10px;">
	            </a>
	        </c:when>
	        
	        <c:when test="${sessionScope.member.mid == 'han'}">
                     <!--관리자 모드-->
                <a href="${pageContext.request.contextPath}/member/logout.do" title="로그아웃">
                	<img src="${pageContext.request.contextPath}/resource/images/icon/play-button.png" width="52" 
	            				style="background-color: #1682b0; border-radius: 40px; padding: 10px;"></a>
            </c:when>
            
            <c:otherwise>
                     <!--로그인 후-->
                <a href="${pageContext.request.contextPath}/member/logout.do" title="로그아웃">
                	<img src="${pageContext.request.contextPath}/resource/images/icon/play-button.png" width="52" 
	            				style="background-color: #1682b0; border-radius: 40px; padding: 10px;"></a>
            </c:otherwise>
            </c:choose>
            

                 
                  
               
                     
                     
                     
				
            
          
            
            
        </div>
    </div>
    <hr>
    <div id="recommend">
    <h2 style="margin: 40px 0px;">Best Product</h2>
    <div id="keyimage" class="carousel slide carousel-fade" data-bs-ride="carousel">
      <div class="carousel-indicators">
            <button type="button" data-bs-target="#keyimage" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#keyimage" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#keyimage" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <a href="#">
                <div class="carousel-item active" id="keyimage-rain">
                    <h2>
                       샘플1<br>
                        샘플2
                    </h2>
                    <p>샘플</p>
                    <img src="${pageContext.request.contextPath}/resource/images/icon/play.png" style="width: 70px;">
                </div>
            </a>
            <a href="#">
                <div class="carousel-item" id="keyimage-wind">
                    <h2>
                        샘플<br>
                        샘플
                    </h2>
                    <p>샘플</p>
                    <img src="${pageContext.request.contextPath}/resource/images/icon/play.png" style="width: 70px;">
                </div>
            </a>
            <a href="#">
                <div class="carousel-item" id="keyimage-piano">
                    <h2>
                       샘플<br>
                        샘플
                    </h2>
                    <p>샘플</p>
                    <img src="${pageContext.request.contextPath}/resource/images/icon/play.png" style="width: 70px;">
                </div>
            </a>
        </div>
    </div>
    </div>
    
    <div id="playList" style="margin-top: 100px;" name="playlist">
        <h2 style="display: inline; margin-right: 52px;">전통주</h2>
        <input type="radio" class="btn" id="playlist-btn1" name="playlist-radio" style="display: none;" checked value="genre">
        <label for="playlist-btn1" onClick="genreClick()">탁주</label>
        <input type="radio" class="btn" id="playlist-btn2" name="playlist-radio" style="display: none;" value="situation">
        <label for="playlist-btn2" onClick="situationClick()">약·청주</label>
        <input type="radio" class="btn" id="playlist-btn3" name="playlist-radio" style="display: none;" value="mood">
        <label for="playlist-btn3" onClick="moodClick()">과실주</label>
        <input type="radio" class="btn" id="playlist-btn4" name="playlist-radio" style="display: none;" value="a">
        <label for="playlist-btn4" onClick="aClick()">증류주</label>
        <input type="radio" class="btn" id="playlist-btn5" name="playlist-radio" style="display: none;" value="b">
        <label for="playlist-btn5" onClick="bClick()">선물세트</label>
        
        
    
        <div id="genre" style="margin-top: 30px;">
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/nature.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/animal.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/white noise.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/irina.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/universe.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/ware.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/cosmetics.jpg">
                <p>샘플</p>
            </a>
        </div>
    
        <div id="situation" style="margin-top: 30px; display: none;">
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/Exercise.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/study.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/study.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/food.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/hayley.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/work.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/driving.jpg">
                <p>샘플</p>
            </a>
        </div>
    
        <div id="mood" style="margin-top: 30px; display: none;">
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/mood/jeremy.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/mood/ian.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/mood/maxime.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/mood/jene.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/mood/mae.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/mood/pawel.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/mood/hudson.jpg">
                <p>샘플</p>
            </a>
        </div>
        
        <div id="a" style="margin-top: 30px; display: none;">
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/nature.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/animal.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/white noise.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/irina.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/universe.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/ware.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/genre/cosmetics.jpg">
                <p>샘플</p>
            </a>
        </div>
        
        <div id="b" style="margin-top: 30px; display: none;">
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/Exercise.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/study.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/sleep.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/food.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/hayley.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/work.jpg">
                <p>샘플</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/playlist/situation/driving.jpg">
                <p>샘플</p>
            </a>
        </div>
        
    </div>
    <div id="preference" style="margin-top: 70px;">
        <h2>베스트 리뷰</h2>
    </div>
</div>
    
    
    <div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="notificationModalLabel">샘플</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
			
        </div>
      </div>
    </div>


<hr style="1px solid #ccc; position: absolute; width: 100%; left: 0px;">
<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</footer>

</body>

</html>