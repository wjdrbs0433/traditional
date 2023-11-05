<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>	
                <a class="btn btn-primary" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample" style="background:white; border:none; margin-bottom:5px;" >
				   <img src="${pageContext.request.contextPath}/resource/images/icon/more.png" name="menu-outline" style="width: 28px;">
				</a>
				
				<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
				    <div class="offcanvas-header">
				        <h5 class="offcanvas-title" id="offcanvasExampleLabel">메뉴</h5>
				        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				    </div>
				    <div class="offcanvas-body">
				        <a href="${pageContext.request.contextPath}/member/login.do" class="nav-link">로그인 / 회원가입</a>
				        <a href="${pageContext.request.contextPath}/"class="nav-link">홈</a>
				        <a href="${pageContext.request.contextPath}/product/product.do" class="nav-link">모든상품</a>
				        <a href="${pageContext.request.contextPath}/member/mypage.do" class="nav-link">사용가이드</a>
				        <a href="${pageContext.request.contextPath}/notice/list.do" class="nav-link">커뮤니티</a>
				    </div>
				</div>
                <div class="nav__list">
                	<a href="${pageContext.request.contextPath}/admin/main.do" class="nav__link">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/home.png" style="width: 28px;" name="menu2">
                        <span class="nav_name" style="color: #1682b0;">홈</span>
                    </a>
                    
                    <a href="${pageContext.request.contextPath}/admin/member/list.do" class="nav__link active">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/person.png" style="width: 28px; background-color: #cccccc; border-radius: 50%; padding: 5px;" name="menu1">
                        	<span class="nav_name">회원리스트</span>
                    </a>
                    
                    <a href="#" class="nav__link" onmouseover="menu3.src='${pageContext.request.contextPath}/resource/images/icon/messenger_hover.png'" onmouseout="menu3.src='${pageContext.request.contextPath}/resource/images/icon/messenger.png'">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/messenger.png" style="width: 28px;" name="menu3">
                        <span class="nav_name">주문관리</span>
                    </a>
                    <a href="#" class="nav__link" onmouseover="menu4.src='${pageContext.request.contextPath}/resource/images/icon/comment01.png'" onmouseout="menu4.src='${pageContext.request.contextPath}/resource/images/icon/comment.png'">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/comment.png" style="width: 28px;" name="menu4">
                        <span class="nav_name">사용가이드</span>
                    </a>
                </div>
                
            </div>
        </nav>
    </div>