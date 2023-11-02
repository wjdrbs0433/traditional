<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>	
                <div class="nav__brand">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/more.png" name="menu-outline" class="nav__toggle" id="nav-toggle" style="width: 28px;" onclick="langHide()">
                </div>
                <div class="nav__list">
                
                   <c:choose>
					    <c:when test="${empty sessionScope.member}">
					        <!--로그인 전-->
					        <a href="${pageContext.request.contextPath}/member/login.do" class="nav__link active">
					            <img src="${pageContext.request.contextPath}/resource/images/icon/person.png" 
					                 style="width: 28px; background-color: #cccccc; border-radius: 50%; padding: 5px;" name="menu1">
					            <span class="nav_name">로그인 / 회원가입</span>
					        </a>
					    </c:when>

					    <c:otherwise>
					        <!--로그인 후-->
					        <a href="${pageContext.request.contextPath}/member/logout.do" title="로그아웃">
					            <img src="${pageContext.request.contextPath}/resource/images/icon/play-button.png" width="52" 
					                    style="margin-left:10px; margin-bottom:15px; width: 28px; background-color: #1682b0; border-radius: 50%; padding: 5px;" name="menu1"></a>
					    </c:otherwise>
					</c:choose>

                    <a href="${pageContext.request.contextPath}/" class="nav__link">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/home.png" style="width: 28px;" name="menu2">
                        <span class="nav_name" style="color: #1682b0;">홈</span>
                    </a>



                    <a href="${pageContext.request.contextPath}/product/product.do" class="nav__link" onmouseover="menu3.src='${pageContext.request.contextPath}/resource/images/icon/drink.png'" 
                    							  onmouseout="menu3.src='${pageContext.request.contextPath}/resource/images/icon/drink_1.png'">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/drink_1.png" style="width: 28px;" name="menu3">
                        <span class="nav_name">모든상품</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/member/mypage.do" class="nav__link" onmouseover="menu4.src='${pageContext.request.contextPath}/resource/images/icon/comment01.png'" 
                    							  onmouseout="menu4.src='${pageContext.request.contextPath}/resource/images/icon/comment.png'">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/comment.png" style="width: 28px;" name="menu4">
                        <span class="nav_name">사용가이드</span>
                    </a>
                     
                    <a href="'${pageContext.request.contextPath}/noticeBoard/noticeBoard.do" class="nav__link" onmouseover="menu5.src='${pageContext.request.contextPath}/resource/images/icon/messenger_hover.png'" onmouseout="menu5.src='${pageContext.request.contextPath}/resource/images/icon/messenger.png'">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/messenger.png" style="width: 28px;" name="menu5">
                        <span class="nav_name">커뮤니티</span>
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
        <a class="navbar-brand" href="${pageContext.request.contextPath}/	" style="position: absolute; left: 42%;">
            <img src = "${pageContext.request.contextPath}/resource/images/icon/logo.png" style="height:90px">
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
	        
	        <c:when test="${sessionScope.member.mid == 'admin'}">
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