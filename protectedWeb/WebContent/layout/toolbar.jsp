<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<link rel="shortcut icon" href="/resources/file/others/favicon.png">
	<link rel="icon" href="/resources/file/others/favicon.png">  
	
    <!-- Global Stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
    <link href="/resources/newTemplate/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/animate/animate.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/style.css">
    
	
  	<style type="text/css">
 		@font-face {
    		font-family: 'YouandiModernTR';
   		 	font-style: normal;
    		font-weight: normal;
    		src: url(/resources/font/Youandi_Modern_TextRegular.woff) format('woff');
		}
    	#mainNav, body, .nav-link, .dropdown-item, .navbar-brand{
    		font-family: 'YouandiModernTR', sans-serif !important;
    	} 	

  	</style>
  </head>
  
<body id="page-top">

<!--====================================================
                         HEADER
======================================================--> 

    <header>

      <!-- Top Navbar  -->
      <div class="top-menubar">
        <div class="topmenu">
          <div class="container">
            <div class="row">
              <div class="col-md-7">
<!--                 <ul class="list-inline top-contacts"> -->
<!--                   <li> -->
<!--                     <i class="fa fa-envelope"></i> Email: <a href="mailto:info@themeborn.com">info@themeborn.com</a> -->
<!--                   </li> -->
<!--                   <li> -->
<!--                     <i class="fa fa-phone"></i> Hotline: (1) 111 222 33 -->
<!--                   </li> -->
<!--                 </ul> -->
              </div> 
              <div class="col-md-5">
                <ul class="list-inline top-data">
                  <li><a href="#" target="_empty"><i class="fa top-social fa-facebook"></i></a></li>
                  <li><a href="#" target="_empty"><i class="fa top-social fa-twitter"></i></a></li>
                  <li><a href="#" target="_empty"><i class="fa top-social fa-google-plus"></i></a></li> 
                  <li><a href="#" class="log-top" data-toggle="modal" data-target="#login-modal">Login</a></li>  
                </ul>
              </div>
            </div>
          </div>
        </div> 
      </div> 
      
      <!-- Navbar -->
      <div class="navbar navbar-expand-lg navbar-light" id="mainNav" data-toggle="affix">
        <div class="container">
         <b> <a class="navbar-brand smooth-scroll" href="index.html">
            <img src="/resources/file/others/favicon.png" alt="logo" height="40px" width="40px">&ensp;보호할개
          </a></b> 
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> 
                <span class="navbar-toggler-icon"></span>
          </button>  
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="index.html">집</a></li>
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">분양 · 실종
                 </a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	              	<a class="dropdown-item" href="/adopt/listAdopt?boardCode=AD">분양리스트</a>
	<!--                 <a class="dropdown-item" href="/adopt/listAdopt?boardCode=MS">실종리스트</a> -->
	                <a class="dropdown-item" href="/adoptReview/listAdoptReview">후기</a>
	<!--                 <a class="dropdown-item" href="/adoptReview/REALaddAdoptReview.jsp">후기</a> -->
                  </div>
                </li>
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스토리펀딩</a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	              	<a class="dropdown-item" href="/funding/listVoting">투표게시판</a>
	                <a class="dropdown-item" href="/funding/listFunding">후원게시판</a>
                  </div>
                </li>
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	                <a class="dropdown-item" href="/info/listInfo">정보공유</a>
	                <a class="dropdown-item" href="/community/getDogSense.jsp">애견상식</a>
                  </div>
                </li>
              <c:if test="${ sessionScope.user != null }">
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
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
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스토어</a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	               <a class="dropdown-item" href="/prodQna/listProdQna?order=1">상품Q&a</a>
	                <a class="dropdown-item" href="/market/listMarket?order=1">보호마켓</a>
	                <a class="dropdown-item" href="/product/listProduct">상품리스트</a>
	                <c:if test="${ sessionScope.user.role eq 'admin' }">
	                	<a class="dropdown-item" href="/product/listAdminProduct">관리자상품리스트</a>
	                </c:if>
                  </div>
                </li>
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="/community/getBreedPedia.jsp">견종백과</a></li>
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="/hospital/getHospital.jsp">동물병원</a></li>
                <li>
                  <div class="top-menubar-nav">
                    <div class="topmenu ">
                      <div class="container">
                        <div class="row">
                          <div class="col-md-9">
                            <ul class="list-inline top-contacts">
                              <li>
                                <i class="fa fa-envelope"></i> Email: <a href="mailto:info@htmlstream.com">info@htmlstream.com</a>
                              </li>
                              <li>
                                <i class="fa fa-phone"></i> Hotline: (1) 396 4587 99
                              </li>
                            </ul>
                          </div> 
                          <div class="col-md-3">
                            <ul class="list-inline top-data">
                              <li><a href="#" target="_empty"><i class="fa top-social fa-facebook"></i></a></li>
                              <li><a href="#" target="_empty"><i class="fa top-social fa-twitter"></i></a></li>
                              <li><a href="#" target="_empty"><i class="fa top-social fa-google-plus"></i></a></li> 
                              <li><a href="#" class="log-top" data-toggle="modal" data-target="#login-modal">Login</a></li>  
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div> 
                  </div>
                </li>
            </ul>  
          </div>
        </div>
      </div>
    </header> 

    <!--Global JavaScript -->
    <script src="/resources/newTemplate/js/jquery/jquery.min.js"></script>
    <script src="/resources/newTemplate/js/popper/popper.min.js"></script>
    <script src="/resources/newTemplate/js/bootstrap/bootstrap.min.js"></script>
    <script src="/resources/newTemplate/js/wow/wow.min.js"></script>
    <script src="/resources/newTemplate/js/owl-carousel/owl.carousel.min.js"></script>


             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">분양</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="/adopt/listAdopt?boardCode=AD">분양리스트</a>
<!--                 <a class="dropdown-item" href="/adopt/listAdopt?boardCode=MS">실종리스트</a> -->
                <a class="dropdown-item" href="/adoptReview/listAdoptReview">후기</a>
<!--                 <a class="dropdown-item" href="/adoptReview/REALaddAdoptReview.jsp">후기</a> -->

              </div>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스토리펀딩</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/funding/listVoting">투표게시판</a>
                <a class="dropdown-item" href="/funding/listFunding">후원게시판</a>
              </div>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/info/listInfo">정보공유</a>
                <a class="dropdown-item" href="/community/getDogSense.jsp">애견상식</a>
              </div>
            </li>
            <c:if test="${ sessionScope.user != null }">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="/users/getUsers?id=${ sessionScope.user.id }">내정보보기</a>
              	<a class="dropdown-item" href="/message/listReceiveMessage">받은쪽지함</a>
                <a class="dropdown-item" href="/message/listSendMessage">보낸쪽지함</a>
                <a class="dropdown-item" href="/message/addMessage">쪽지쓰기</a>
                <c:if test="${ sessionScope.user.role eq 'admin' }">
                	<a class="dropdown-item" href="/coupon/addCouponManage">쿠폰생성</a>
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
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스토어</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
               <a class="dropdown-item" href="/prodQna/listProdQna?order=1">상품Q&a</a>
                <a class="dropdown-item" href="/market/listMarket?order=1">보호마켓</a>
                <a class="dropdown-item" href="/product/listProduct">상품리스트</a>
                <c:if test="${ sessionScope.user.role eq 'admin' }">
                	<a class="dropdown-item" href="/product/listAdminProduct">관리자상품리스트</a>
                </c:if>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/community/getBreedPedia.jsp">견종백과</a>
            </li>
			<li class="nav-item">
              <a class="nav-link" href="/hospital/getHospital.jsp">동물병원</a>
            </li>
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
							$(location).attr('href','/users/kakao?kakao=' + result.id);
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
			
			$("#myInfo").on("click",function() {
				$(self.location).attr('href',"/users/getUsers?id=${sessionScope.user.id}");
			});
			
			$("#login").on("click", function() {
				$(self.location).attr("href", "/users/login");
			});
			
			$("#regist").on("click", function() {
				$(self.location).attr("href", "/users/addUsersBase");
			});
		});

		
// 		Kakao.init('3eef0ec25dbea51f4703e0c90c3ebb54');
// 		function loginWithKakao() {
// 			Kakao.Auth.login({
// 				success : function(authObj) {
// 					Kakao.API.request({
// 						url : "/v2/user/me",
// 						success : function(result) {
// 							var info = JSON.stringify(result);
// 							$(location).attr('href',
// 									'/users/kakao?kakao=' + result.id);
// 						}
// 					});
// 					Kakao.Auth.getAccessToken();
// 				},
// 				fail : function(err) {
// 					alert(JSON.stringify(err));
// 					alert("로그인 실패")
// 				}
// 			})
// 		}
		

		$(function() {

			$(document).ready(function(){
		
				var id=$("#registId").val();
				var msgId=JSON.stringify({id:id});
// 				alert(id);
// 				alert(msgId);
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/message/json/getUnreadMessage",
					data : msgId,
					datatype : "json",
					success : function(response){
						if(id!=null && $.trim(response.result)==0){
// 							alert($.trim(response.result));
							$(".msg").hide();
						}
						if(id!=null && $.trim(response.result)==1){
// 							alert($.trim(response.result));
							$(".msg").show();
						}
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
	
				});
				
			});

		});

		
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
    
    

    <!-- Plugin JavaScript -->
    <script src="/resources/newTemplate/js/jquery-easing/jquery.easing.min.js"></script> 
    <script src="/resources/newTemplate/js/custom.js"></script> 
    <script src="/resources/prodmenu/js/jquery.animateNumber.min.js"></script>
  
  
</body>
</html>
>>>>>>> refs/heads/master
