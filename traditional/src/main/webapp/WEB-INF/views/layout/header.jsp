<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
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
					            				style="background-color: #1682b0; border-radius: 40px; padding: 5px;" name="menu1">로그아웃</a>
				            </c:otherwise> 
				         </c:choose>
				        
				        <a href="${pageContext.request.contextPath}/" class="nav__link">
						    <img src="${pageContext.request.contextPath}/resource/images/icon/home01.png" style="width: 28px;" name="menu2" 
						         onmouseover="this.src='${pageContext.request.contextPath}/resource/images/icon/home.png'" 
						         onmouseout="this.src='${pageContext.request.contextPath}/resource/images/icon/home01.png'">
						    <span class="nav_name">홈</span>
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
		                    <i class="fa-regular fa-star"></i>
		                       <span class="nav_name">리뷰게시판</span>
		                </a>
						<hr style="border:3px solid #cccccc;">
						<c:if test="${sessionScope.member.mid == 'admin'}">
				            <!--관리자 모드-->
					        <a href="${pageContext.request.contextPath}/admin/main.do" class="nav__link">
							<img src="${pageContext.request.contextPath}/resource/images/icon/home01.png" style="width: 28px;" name="menu2" 
									onmouseover="this.src='${pageContext.request.contextPath}/resource/images/icon/home.png'" 
									onmouseout="this.src='${pageContext.request.contextPath}/resource/images/icon/home01.png'">
								<span class="nav_name">관리자 페이지</span>
							</a>
			            </c:if>
						
						
				    </div>
				</div>


                <div class="nav__list">
                
                <c:choose>
                 <c:when test="${empty sessionScope.member}">
                    <a href="${pageContext.request.contextPath}/member/login.do" class="nav__link active">
                        <img src="${pageContext.request.contextPath}/resource/images/icon/person.png" style="width: 28px; background-color: #cccccc; border-radius: 50%; padding: 5px;" name="menu1">
                        	<span class="nav_name">로그인 / 회원가입</span>
                         </a>
                 </c:when> 
                  <c:otherwise>
                     <!--로그인 후-->
	                <a href="${pageContext.request.contextPath}/member/logout.do" title="로그아웃" class="nav__link active">
	                	<img src="${pageContext.request.contextPath}/resource/images/icon/play-button.png" width="30px" 
		            				style="background-color: #1682b0; border-radius: 40px; padding: 5px;" name="menu1"></a>
	            </c:otherwise> 
	            </c:choose>      
	            
					<a href="${pageContext.request.contextPath}/" class="nav__link">
					    <img src="${pageContext.request.contextPath}/resource/images/icon/home01.png" style="width: 28px;" name="menu2" 
					         onmouseover="this.src='${pageContext.request.contextPath}/resource/images/icon/home.png'" 
					         onmouseout="this.src='${pageContext.request.contextPath}/resource/images/icon/home01.png'">
					    <span class="nav_name">홈</span>
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
					    <span class="nav_name">커뮤니티</span>
					</a>
					
					<a href="${pageContext.request.contextPath}/review/list.do" class="nav__link">
                    <i class="fa-regular fa-star"></i>
                       <span class="nav_name">리뷰게시판</span>
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
        <a class="navbar-brand" href="${pageContext.request.contextPath}/" style="position: absolute; left: 42%;">
            <img src = "${pageContext.request.contextPath}/resource/images/icon/logo.png" style="height:90px">
        </a>
        <div class="col-auto">
        
            <a class="btn" id="btn-modal" data-toggle="modal" href="${pageContext.request.contextPath}/notice/list.do" style="border: 0px; padding: 2px;" onclick="modal();">
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