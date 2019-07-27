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
                    LOGIN OR REGISTER
======================================================-->
    <section id="login">
      <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
          <div class="modal-dialog">
              <div class="modal-content loginSection">
                  <div class="modal-header" align="center">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span class="fa fa-times" aria-hidden="true"></span>
                      </button>
                  </div>
                  <div id="div-forms">
                      <form id="login-form">
                          <h3 class="text-center">Login</h3>
                          <div class="modal-body">
                              <label for="username">Username</label> 
                              <input id="login_username" name="id" class="form-control id" type="text" placeholder="Enter username " required>
                              <label for="username">Password</label> 
                              <input id="login_password" name="pw" class="form-control pw" type="password" placeholder="Enter password" required>
<!--                               <div class="checkbox"> -->
<!--                                   <label> -->
<!--                                       <input type="checkbox"> Remember me -->
<!--                                   </label> -->
<!--                               </div> -->
                          </div>
                          <div class="modal-footer text-center">
                              <div>
                                  <button type="submit" id="submitLogin" class="btn btn-general btn-white">Login</button>
                              </div>
                              <div>
                                  <button id="login_register_btn" id="regist" type="button" class="btn btn-link">Register</button>
                              </div>
                          </div>
                      </form>
                      <form id="register-form" style="display:none;">
                          <h3 class="text-center">Register</h3>
                          <div class="modal-body"> 
                              <label for="username">Username</label> 
                              <input id="register_username" class="form-control" type="text" placeholder="Enter username" required>
                              <label for="register_email">E-mailId</label> 
                              <input id="register_email" class="form-control" type="text" placeholder="Enter eMail" required>
                              <label for="register_password">Password</label> 
                              <input id="register_password" class="form-control" type="password" placeholder="Password" required>
                          </div>
                          <div class="modal-footer">
                              <div>
                                  <button type="submit" class="btn btn-general btn-white">Register</button>
                              </div>
                              <div>
                                  <button id="register_login_btn" type="button" class="btn btn-link">Log In</button>
                              </div>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>
    </section>      

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
                  <c:if test="${ sessionScope.user == null }">
                  <li><a href="#" class="log-top login-modal" data-toggle="modal" data-target="#login-modal">Login</a></li>
                  </c:if>
                  <c:if test="${ sessionScope.user != null }">
                  <li><a href="#" class="log-top profile">${ sessionScope.user.nickname } 님</a></li>
                  </c:if>
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

    <!-- Plugin JavaScript -->
    <script src="/resources/newTemplate/js/jquery-easing/jquery.easing.min.js"></script> 
    <script src="/resources/newTemplate/js/custom.js"></script> 
    <script src="/resources/prodmenu/js/jquery.animateNumber.min.js"></script>
    
        	<script type="text/javascript">

		//============= "로그인"  Event 연결 =============
		$(".login-modal").on("click", function() {
			
			alert("ㅎㅇ");
			fncLogin();
			alert("ㅎㅇ");
			
		});
		
		function fncLogin(){
			$(".id").focus();
			$("#submitLogin").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				alert(id);
				alert(pw);
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#login_username").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#login_password").focus();
					return;
				}
				
				var chkLogin={id:id, pw:pw};
				alert("ajax id : "+id);
				alert("ajax pw : "+pw);
				$.ajax({
					
					type : "POST",
					contentType : "application/json",
					url : "/users/json/login",
					data : JSON.stringify(chkLogin),
					datatype : "json",
					success : function(response){
						alert("pw : "+JSON.stringify(response))
						if(response.pw == pw && response.id == id){
							alert("들어와서 : "+response.pw);
							alert(response.nickname+" 님 환영합니다!");
// 							$('#login-form').attr('method', 'POST').attr('action', '/users/login').submit();
							self.location="/index.jsp";
						}
						if(response.pw != pw || response.id != id){
							alert(response.pw);
							alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
							$("form")[0].reset();
							return;
							$("#id").focus();
						}
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});

			});
		}
		
		$(document).ready(function(){
			$("#pw").keyup(function(key){
				if(key.keyCode==13){
					$("#login").click();
				}
			})
		})
		
// 		$(function(){
// 			$(".g-signin2").on("click", function(){
// 				onSignIn(googleUser);
// 			})
// 		});
			
// 		function onSignIn(googleUser) {
// 			// Useful data for your client-side scripts:
// 			var profile = googleUser.getBasicProfile();
// 			alert("ID: " + profile.getId()); // Don't send this directly to your server!
			
// 			// The ID token you need to pass to your backend:
// 			var id_token = googleUser.getAuthResponse().id_token;
// 			alert("ID Token: " + id_token);
			        
// 			$(location).attr('href', '/users/google?google='+profile.getId()+"&idToken="+id_token);
// 		}

// 		var naver_id_login = new naver_id_login("qhgCBZA6iuY4bImpUhhX", "http://localhost:8080/users/callback.jsp");
// 	  	var state = naver_id_login.getUniqState();
// 	  	naver_id_login.setButton("white", 2,40);
// 	  	naver_id_login.setDomain("http://localhost:8080/");
// 	  	naver_id_login.setState(state);
// // 	  	naver_id_login.setPopup();
// 	  	naver_id_login.init_naver_id_login();
		      


		//============= 회원원가입화면이동 =============
		$( function() {
			$("#regist").on("click" , function() {
				self.location = "/users/addUsersBase"
			});
		});
		
	</script>	
  
  
</body>
</html>