<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/resources/prodmenu/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/animate.css">
    
    <link rel="stylesheet" href="/resources/prodmenu/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/aos.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/resources/prodmenu/css/flaticon.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/icomoon.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/style.css">
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.js"></script>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="848949930774-4ka6kl79kq1fv7h3q89leonj9ki1o6v7.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js"></script>
    <script type="text/javascript">
//     	$(function(){
//     		$("span:contains('Sign in')").on("click", function(){
//     			$(self.location).attr("href","/users/login");
//     		});
//     	});

		//=============  채팅방 Event  처리 =============	
	 $(function() {
		$( "a:contains('채팅방')" ).on("click" , function() {
	 		 window.open("/chatting/roomchat.jsp",
						"_blank",
						"left=500, top=100, width=500, height=700, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
				});	
	 });
    </script>
    
    <style type="text/css">
    	.py-1 bg-black{
    		min-height: 27px;
    	}
    </style>
  </head>
  <body class="goto-here">
      <div class="py-1 bg-black">
       <div class="container">
          <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
             <div class="col-lg-12 d-block">
                <div class="row d-flex">
                   <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center">
						    	<span class="icon-phone2">
						    		<span class="text">${ sessionScope.user.phone }</span>
						    	</span>
					    	</div>
						   	 	<c:if test="${ sessionScope.user == null }">
							   	 	<a id="custom-login-btn" href="javascript:loginWithKakao()">
	                        			<img src="/resources/img/kakao/kakaolink_btn_small.png" style="height:15px; width: 15px;"/>
	                        		</a>
                        		</c:if>
<%--                         		<c:if test="${ sessionScope.user.kakao != null }"> --%>
<!--                         			<a id="" href="javascript:logoutWithKakao()">카카오 로그아웃</a> -->
<%--                         		</c:if> --%>
<%-- 							<c:if test="${ sessionScope.user.google != null }"> --%>
<!-- 								<a id="googleLogout" href="#" onclick="signOut();">google 로그아웃</a> -->
<%-- 							</c:if> --%>
					    	</div>
					   		<div class="col-md pr-4 d-flex topper align-items-center">
					    		<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						   		<span class="text">${ sessionScope.user.email }</span>
					   		</div>
					   		
					   		
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
					    	<input type="hidden" id="id" name="id" value="${ sessionScope.user.id }">
						    <c:if test="${ sessionScope.user eq null }">
						    	<span id="login" class="text">Sign in</span>
						    	<span id="regist" class="text">Sign up</span>
						    </c:if>

<%-- 						    <c:if test="${sessionScope.user.role eq 'user' }"> --%>
<!-- 						    <div class="myInfo"> -->
<!-- 						    	<input type="button" id="myInfo" value="마이페이지"> -->
<!-- 						    </div> -->
<%-- 						    </c:if> --%>
						    <c:if test="${sessionScope.user.role eq 'admin' }">
						    <div class="manageMenu">
						    	<input type="button" id="manageMenu" value="관리자메뉴">
						    </div>
						    </c:if>
						    
						    <c:if test="${ sessionScope.user != null }">
							    <div class="userInfo">
							    	<span class="text">${sessionScope.user.nickname } 님</span>
							    </div>
							    <div class="logout" style="float:right">
							    	<span class="text">
							    		<a href="/users/logout">logout</a>
							    	</span>
	                            </div>
                            </c:if>
                            
					    </div>
                </div>
             </div>
          </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
       <div class="container">
         <a class="navbar-brand" href="/index.jsp">#PROTECTEDOG</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
           <span class="oi oi-menu"></span> Menu
         </button>

         <div class="collapse navbar-collapse" id="ftco-nav">
           <ul class="navbar-nav ml-auto">
             <li class="nav-item active"><a href="/index.jsp" class="nav-link">Home</a></li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">분양</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="/adopt/listAdopt?boardCode=AD">분양리스트</a>
<!--                 <a class="dropdown-item" href="/adopt/listAdopt?boardCode=MS">실종리스트</a> -->
                <a class="dropdown-item" href="/adoptReview/listAdoptReview">후기</a>
                <a class="dropdown-item" href="../adopt/thumnail.jsp">테스트</a>
<!--                 <a class="dropdown-item" href="/adoptReview/REALaddAdoptReview.jsp">후기</a> -->

              </div>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스토리펀딩</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/funding/listVoting">투표게시판</a>
                <a class="dropdown-item" href="/funding/listFunding">후원게시판</a>
                 <a class="dropdown-item" href="#">채팅방</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">병원</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                 <a class="dropdown-item" href="/hospital/getHospital.jsp">병원</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">PEDIA</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                 <a class="dropdown-item" href="/community/getBreedPedia.jsp">PEDIA</a>
              </div>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">COMMUNITY</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/info/listInfo">정보공유</a>
                <a class="dropdown-item" href="/community/getDogSense.jsp">애견상식</a>
                <a class="dropdown-item" href="/community/listNews.jsp">뉴스</a>
              </div>
            </li>
            <c:if test="${ sessionScope.user != null }">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">USERS</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/users/getUsers?id=${ sessionScope.user.id }">내정보보기</a>
              	<a class="dropdown-item" href="/message/listReceiveMessage">받은쪽지함</a>
                <a class="dropdown-item" href="/message/listSendMessage">보낸쪽지함</a>
                <a class="dropdown-item" href="/message/addMessage">쪽지쓰기</a>
                <c:if test="${ sessionScope.user.role eq 'admin' }">
                	<a class="dropdown-item" href="/coupon/addCoupon">쿠폰생성</a>
                </c:if>
                <a class="dropdown-item" href="/coupon/listCoupon">쿠폰받기</a>
                <a class="dropdown-item" href="/report/addReportView.jsp">신고하기</a>
                <c:if test="${ sessionScope.user.role eq 'admin' }">
                <a class="dropdown-item" href="/report/listReport">신고글목록</a>
                </c:if>
              </div>
            </li>
            </c:if>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MARKET</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
               <a class="dropdown-item" href="/prodQna/listProdQna?order=1">상품Q&a</a>
                <a class="dropdown-item" href="/market/listMarket?order=1">보호마켓</a>
                <a class="dropdown-item" href="/product/listProduct">상품리스트</a>
                <c:if test="${ sessionScope.user.role eq 'admin' }">
                	<a class="dropdown-item" href="/product/listAdminProduct">관리자상품리스트</a>
                </c:if>
              </div>
            </li>
             <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>

           </ul>
         </div>
       </div>
     </nav>
    <!-- END nav -->


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#94BFCA"/></svg></div>


  <script src="/resources/prodmenu/js/jquery.min.js"></script>
  <script src="/resources/prodmenu/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/prodmenu/js/popper.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.easing.1.3.js"></script>
  <script src="/resources/prodmenu/js/jquery.waypoints.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.stellar.min.js"></script>
  <script src="/resources/prodmenu/js/owl.carousel.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/prodmenu/js/aos.js"></script>
  <script src="/resources/prodmenu/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap-datepicker.js"></script>
  <script src="/resources/prodmenu/js/scrollax.min.js"></script>
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!--   <script src="/resources/prodmenu/js/google-map.js"></script> -->
  <script src="/resources/prodmenu/js/main.js"></script>
  
  	<script type="text/javascript">
		Kakao.init('3eef0ec25dbea51f4703e0c90c3ebb54');
		function loginWithKakao() {
			Kakao.Auth.login({
				success : function(authObj) {
					Kakao.API.request({
						url : "/v2/user/me",
						success : function(result) {
							var info = JSON.stringify(result);
							$(location).attr('href',
									'/users/kakao?kakao=' + result.id);
						}
					});
					Kakao.Auth.getAccessToken();
				},
				fail : function(err) {
					alert(JSON.stringify(err));
					alert("로그인 실패")
				}
			})
		}

		function logoutWithKakao() {
			Kakao.Auth.logout();
			location.href = 'https://accounts.kakao.com/logout?continue=https://pf.kakao.com/logged_out';
		}

		$(function() {
			$("#myInfo").on(
					"click",
					function() {
						$(self.location).attr('href',
								"/users/getUsers?id=${sessionScope.user.id}");
					})
		});

		$(function() {
			$("#login").on("click", function() {
				$(self.location).attr("href", "/users/login");
			});
		});

		$(function() {
			$("#regist").on("click", function() {
				$(self.location).attr("href", "/users/addUsersBase");
			});
		});rms
		
		
		
// 		$(function(){
// 			$("#googleLogout").on("click", function(){
// 				var auth2=gapi.auth2.getAuthInstance();
// 				auth2.setToken(null);
// 				auth2.signOut();
// 			});
// 		})

	</script>
	
  </body>
</html>
    
    