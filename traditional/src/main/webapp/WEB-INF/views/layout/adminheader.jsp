<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="l-navbar" id="navbar" style="z-index:99999;">
        <nav class="nav">
            <div>	
                <a class="btn btn-primary" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample" style="background:white; border:none; margin-bottom:5px;" >
				   <img src="${pageContext.request.contextPath}/resource/images/icon/more.png" name="menu-outline" style="width: 28px;">
				</a>
				
				<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
				    <div class="offcanvas-header" style="background-color: #1682b0; color:black;">
				        <h5 class="offcanvas-title" id="offcanvasExampleLabel">메뉴</h5>
				        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				    </div>
				    <div class="offcanvas-body">
				        
				         <c:choose>
			                 <c:when test="${empty sessionScope.member}">
			                    <a href="${pageContext.request.contextPath}/member/login.do" class="nav__link active">
			                    <img src="${pageContext.request.contextPath}/resource/images/icon/person.png" 
			                    	style="width: 28px; background-color: #cccccc; border-radius: 50%; padding: 5px;" name="menu1">
			                        	<span class="nav_name">로그인 / 회원가입</span>
			                         </a>
			                 </c:when> 
			                  <c:otherwise>
			                     <!--로그인 후-->
				                <a href="${pageContext.request.contextPath}/member/logout.do" title="로그아웃" class="nav__link active">
				                	<img src="${pageContext.request.contextPath}/resource/images/icon/play-button.png" width="30px" 
					            				style="background-color: #1682b0; border-radius: 40px; padding: 5px;" name="menu1">
					            				<span class="nav_name">로그아웃</span>
					            </a>
				            </c:otherwise> 
				         </c:choose>
				         
				         <a href="${pageContext.request.contextPath}/admin/main.do" class="nav__link">
						    <img src="${pageContext.request.contextPath}/resource/images/icon/home01.png" style="width: 28px;" name="menu2" 
						         onmouseover="this.src='${pageContext.request.contextPath}/resource/images/icon/home.png'" 
						         onmouseout="this.src='${pageContext.request.contextPath}/resource/images/icon/home01.png'">
						    <span class="nav_name">관리자 페이지</span>
						</a>
						
						<a href="${pageContext.request.contextPath}/admin/member/list.do" class="nav__link active">
                       		<i class="fa-regular fa-user" style="width: 28px; padding: 5px;"></i>
                        	<span class="nav_name">회원리스트</span>
                   		 </a>
						
						 <a href="${pageContext.request.contextPath}/admin/product/list.do" class="nav__link active">
	                    	<i class="fa-solid fa-bottle-droplet" style="width: 28px; padding: 5px;"></i>
	                    	<span class="nav_name">상품리스트</span>
	                    </a>
						
						<a href="${pageContext.request.contextPath}/admin/order/list.do" class="nav__link" >
	                        <i class="fa-solid fa-truck-fast" style="width: 28px; padding: 5px;" ></i> 
	                        <span class="nav_name">주문관리</span>
	                    </a>
	                    
	                    <a href="#" class="nav__link">
	                        <i class="fa-solid fa-headphones" style="width: 28px; padding: 5px;" > </i>
	                        <span class="nav_name">고객센터</span>
	                    </a>
	                    
	                    <a href="${pageContext.request.contextPath}/admin/statistic/statistic.do" class="nav__link" >
	                        <i class="fa-solid fa-chart-line"style="width: 28px; padding: 5px;" ></i>
	                        <span class="nav_name">통계</span>
	                    </a>
	                    <hr style="border:3px solid #cccccc;">
	                    
	                    <a href="${pageContext.request.contextPath}/" class="nav__link">
						    <img src="${pageContext.request.contextPath}/resource/images/icon/home01.png" style="width: 28px;" name="menu2" 
						         onmouseover="this.src='${pageContext.request.contextPath}/resource/images/icon/home.png'" 
						         onmouseout="this.src='${pageContext.request.contextPath}/resource/images/icon/home01.png'">
						    <span class="nav_name">사용자 페이지</span>
						</a>
	
	                    <a href="${pageContext.request.contextPath}/product/product.do" class="nav__link">
						    <img src="${pageContext.request.contextPath}/resource/images/icon/drink_1.png" style="width: 28px;" name="menu3" 
						         onmouseover="this.src='${pageContext.request.contextPath}/resource/images/icon/drink.png'" 
						         onmouseout="this.src='${pageContext.request.contextPath}/resource/images/icon/drink_1.png'">
						    <span class="nav_name">모든상품</span>
						</a>
	                    <a href="${pageContext.request.contextPath}/member/mypage.do" class="nav__link">
						    <img src="${pageContext.request.contextPath}/resource/images/icon/comment.png" style="width: 28px;" name="menu4" 
						         onmouseover="this.src='${pageContext.request.contextPath}/resource/images/icon/comment01.png'" 
						         onmouseout="this.src='${pageContext.request.contextPath}/resource/images/icon/comment.png'">
						    <span class="nav_name">마이페이지</span>
						</a>
	                   
	                    <a href="${pageContext.request.contextPath}/notice/list.do" class="nav__link">
						    <img src="${pageContext.request.contextPath}/resource/images/icon/messenger.png" style="width: 28px;" name="menu5" 
						         onmouseover="this.src='${pageContext.request.contextPath}/resource/images/icon/messenger_hover.png'" 
						         onmouseout="this.src='${pageContext.request.contextPath}/resource/images/icon/messenger.png'">
						    <span class="nav_name">고객센터</span>
						</a>
						
						<a href="${pageContext.request.contextPath}/review/list.do" class="nav__link">
							 <img src="${pageContext.request.contextPath}/resource/images/icon/messenger.png" style="width: 28px;" name="menu6" 
						         onmouseover="this.src='${pageContext.request.contextPath}/resource/images/icon/messenger_hover.png'" 
						         onmouseout="this.src='${pageContext.request.contextPath}/resource/images/icon/messenger.png'">
							<span class="nav_name">리뷰게시판</span>
						</a>
						
						<hr style="border:3px solid #cccccc;">
						
					        <a href="${pageContext.request.contextPath}/company.jsp" class="nav__link">회사소개</a>
					        <a href="${pageContext.request.contextPath}/person.jsp" class="nav__link">개인정보처리방침</a>
				        
				    </div>
				</div>
				
				
                <div class="nav__list">
                	<a href="${pageContext.request.contextPath}/admin/main.do" class="nav__link">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/home.png" style="width: 28px;" name="menu1">
                        <span class="nav_name" style="color: #1682b0;">홈</span>
                    </a>
                    
                    <a href="${pageContext.request.contextPath}/admin/member/list.do" class="nav__link active">
                       <i class="fa-regular fa-user" style="width: 28px; padding: 5px;"></i>
                        <span class="nav_name">회원리스트</span>
                    </a>
                    
                    <a href="${pageContext.request.contextPath}/admin/product/list.do" class="nav__link active">
                    	<i class="fa-solid fa-bottle-droplet" style="width: 28px; padding: 5px;"></i>
                    	<span class="nav_name">상품리스트</span>
                    </a>
                    
                    <a href="${pageContext.request.contextPath}/admin/order/list.do" class="nav__link" >
                        <i class="fa-solid fa-truck-fast" style="width: 28px; padding: 5px;" ></i> 
                        <span class="nav_name">주문관리</span>
                    </a>
                    
                    <a href="#" class="nav__link">
                        <i class="fa-solid fa-headphones" style="width: 28px; padding: 5px;" > </i>
                        <span class="nav_name">고객센터</span>
                    </a>
                    
                    <a href="${pageContext.request.contextPath}/admin/statistic/statistic.do" class="nav__link" >
                        <i class="fa-solid fa-chart-line"style="width: 28px; padding: 5px;" ></i>
                        <span class="nav_name">통계</span>
                    </a>
                    
                    
                    <!--  
                    <a href="#" class="nav__link" onmouseover="menu3.src='${pageContext.request.contextPath}/resource/images/icon/messenger_hover.png'" onmouseout="menu3.src='${pageContext.request.contextPath}/resource/images/icon/messenger.png'">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/messenger.png" style="width: 28px;" name="menu3">
                        <span class="nav_name">주문관리</span>
                    </a>
                    
                    -->
                </div>
                
            </div>
        </nav>
    </div>
