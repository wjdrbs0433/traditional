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
                <img src="${pageContext.request.contextPath}/resource/images/product/1.jpg">
                <p>요구르트</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/product/2.jpg">
                <p>단풍술</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/product/3.jpg">
                <p>사과술</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/product/4.jpg">
                <p>매실술</p>
            </a>
            <a href="#">
                <img src="${pageContext.request.contextPath}/resource/images/product/5.jpg">
                <p>나무술</p>
            </a>
            <a href="${pageContext.request.contextPath}/productdetail.jsp">
                <img src="${pageContext.request.contextPath}/resource/images/product/6.jpg">
                <p>담은[3병/6병/10병]</p>
            </a>
            <a href="${pageContext.request.contextPath}/product/product.do">
                <img src="${pageContext.request.contextPath}/resource/images/icon/add.png">
                <p>더보기</p>
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
            <a href="${pageContext.request.contextPath}/product/product.do">
                <img src="${pageContext.request.contextPath}/resource/images/icon/add.png">
                <p>더보기</p>
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
            <a href="${pageContext.request.contextPath}/product/product.do">
                <img src="${pageContext.request.contextPath}/resource/images/icon/add.png">
                <p>더보기</p>
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
            <a href="${pageContext.request.contextPath}/product/product.do">
                <img src="${pageContext.request.contextPath}/resource/images/icon/add.png">
                <p>더보기</p>
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