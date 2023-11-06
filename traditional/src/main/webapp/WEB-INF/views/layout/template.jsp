<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                       빗소리를 들으며<br>
                        술 한 잔
                    </h2>
                    <p>&nbsp;</p>
                    <img src="${pageContext.request.contextPath}/resource/images/icon/play.png" style="width: 70px;">
                </div>
            </a>
            <a href="#">
                <div class="carousel-item" id="keyimage-wind">
                    <h2>
                        술은<br>
                        하늘의 미덕
                    </h2>
                    <p>&nbsp;</p>
                    <img src="${pageContext.request.contextPath}/resource/images/icon/play.png" style="width: 70px;">
                </div>
            </a>
            <a href="#">
                <div class="carousel-item" id="keyimage-piano">
                    <h2>
                       피아노는<br>
                        내가 아니라 술을 마셨다.
                    </h2>
                    <p>&nbsp;</p>
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
        
        
    
        <div id="genre" style="margin-top: 30px;">
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=7">
                <img src="${pageContext.request.contextPath}/resource/images/product/7.jpg">
                <p>붉은 원숭이</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=12">
                <img src="${pageContext.request.contextPath}/resource/images/product/12.jpg">
                <p>복순도가 손 막걸리</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=14">
                <img src="${pageContext.request.contextPath}/resource/images/product/14.jpg">
                <p>백련 미스티 살균 막걸리</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=17">
                <img src="${pageContext.request.contextPath}/resource/images/product/17.jpg">
                <p>잣 진주</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=24">
                <img src="${pageContext.request.contextPath}/resource/images/product/24.jpg">
                <p>삼양춘 청주</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=6">
                <img src="${pageContext.request.contextPath}/resource/images/product/6.jpg">
                <p>담은[3병/6병/10병]</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/product.do">
                <img src="${pageContext.request.contextPath}/resource/images/icon/add.png">
                <p>더보기</p>
            </a>
        </div>
    
        <div id="situation" style="margin-top: 30px; display: none;">
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=33">
                <img src="${pageContext.request.contextPath}/resource/images/product/33.jpg">
                <p>겨울 소주25%</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=34">
                <img src="${pageContext.request.contextPath}/resource/images/product/34.jpg">
                <p>감 보드카</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=21">
                <img src="${pageContext.request.contextPath}/resource/images/product/21.jpg">
                <p>우렁이쌀 청주</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=15">
                <img src="${pageContext.request.contextPath}/resource/images/product/15.jpg">
                <p>고흥 유자주 8%</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=16">
                <img src="${pageContext.request.contextPath}/resource/images/product/16.jpg">
                <p>토박이 한산 소곡주</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=22">
                <img src="${pageContext.request.contextPath}/resource/images/product/22.jpg">
                <p>서설</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/product.do">
                <img src="${pageContext.request.contextPath}/resource/images/icon/add.png">
                <p>더보기</p>
            </a>
        </div>
    
        <div id="mood" style="margin-top: 30px; display: none;">
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=25">
                <img src="${pageContext.request.contextPath}/resource/images/product/25.jpg">
                <p>혼디주</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=26">
                <img src="${pageContext.request.contextPath}/resource/images/product/26.jpg">
                <p>샤인머스켓 와인</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=27">
                <img src="${pageContext.request.contextPath}/resource/images/product/27.jpg">
                <p>복숭아 와인</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=28">
                <img src="${pageContext.request.contextPath}/resource/images/product/28.jpg">
                <p>무주 산머루주</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=30">
                <img src="${pageContext.request.contextPath}/resource/images/product/30.jpg">
                <p>매실 원주</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=20">
                <img src="${pageContext.request.contextPath}/resource/images/product/20.jpg">
                <p>동학1957</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/product.do">
                <img src="${pageContext.request.contextPath}/resource/images/icon/add.png">
                <p>더보기</p>
            </a>
        </div>
        
        <div id="a" style="margin-top: 30px; display: none;">
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=31">
                <img src="${pageContext.request.contextPath}/resource/images/product/31.jpg">
                <p>추사 40%</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=32">
                <img src="${pageContext.request.contextPath}/resource/images/product/32.jpg">
                <p>서울의 밤</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=23">
                <img src="${pageContext.request.contextPath}/resource/images/product/23.jpg">
                <p>한청</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=19">
                <img src="${pageContext.request.contextPath}/resource/images/product/19.jpg">
                <p>단상지교</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=18">
                <img src="${pageContext.request.contextPath}/resource/images/product/18.jpg">
                <p>솔송주 8%</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/productdetail.do?productCode=13">
                <img src="${pageContext.request.contextPath}/resource/images/product/13.jpg">
                <p>일주142</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/product.do">
                <img src="${pageContext.request.contextPath}/resource/images/icon/add.png">
                <p>더보기</p>
            </a>
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