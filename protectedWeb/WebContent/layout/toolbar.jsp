<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="848949930774-4ka6kl79kq1fv7h3q89leonj9ki1o6v7.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js"></script>
    
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

    	#mainNav, body, .nav-link, .dropdown-item, .navbar-brand, h2, h3, h4, h5, h6, p, b, a, th, td {
    		font-family: 'YouandiModernTR', sans-serif !important;
    	} 	
		
		.navbar-brand{
			font-weight: bold;
			font-size: 20px;
		}
		
		.swal-button {
		  background-color: #f04f23;
		  border: 1px  #f04f23;
		}
		
		.swal-button:hover {
		  background-color: #f04f23;
		  border: 1px  #f04f23;
		}
		
		.swal-button--cancel {
		    color: white;
		    background-color: #f04f23;
		}
		
		html {
	 		scroll-behavior: smooth;
		}
		#fixedbtn{position:fixed;right:10px;bottom:70px;z-index:1000}		
		i:hover{
			opacity: 0.5;
			cursor:pointer
		}
		
  	</style>
  </head>
  
<body id="page-top">

<!--====================================================
                         HEADER
======================================================--> 

    <header>
		<i style="background-image: url('/resources/file/others/chatting.png'); height: 64px;width: 64px; overflow: hidden;" id="fixedbtn"></i>

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
                  <c:if test="${ sessionScope.user == null }">
                  <li><a href="#" class="log-top login-modal" data-toggle="modal" data-target="#login-modal">Login</a></li>
                  <li><a href="/users/addUsersBase" class="log-top regist">Regist</a></li>
                  </c:if>
                  <c:if test="${ sessionScope.user != null }">
                  <li><a href="/users/getUsers?id=${ sessionScope.user.id }" class="log-top profile">${ sessionScope.user.nickname } 님</a></li>
                  <li><a href="/users/logout" class="log-top logOut">LogOut</a>
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
         <b><a class="navbar-brand smooth-scroll" href="/index.jsp">
            <img src="/resources/file/others/favicon.png" alt="logo" height="40px" width="40px">&ensp;<span style="font-size:20px;">보호할개</span>
          </a></b> 
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> 
                <span class="navbar-toggler-icon"></span>
          </button>  
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-top:0;">분양 · 실종
                 </a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	              	<a class="dropdown-item" href="/adopt/listAdopt?boardCode=AD">분양게시판</a>
	                <a class="dropdown-item" href="/adopt/listMissing">실종캘린더</a>
	                <a class="dropdown-item" href="/adoptReview/listAdoptReview">후기게시판</a>
                  </div>
                </li>
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-top:0;">스토리펀딩</a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	              	<a class="dropdown-item" href="/funding/listVoting">투표게시판</a>
	                <a class="dropdown-item" href="/funding/listFunding">후원게시판</a>
                  </div>
                </li>
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-top:0;">커뮤니티</a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	                <a class="dropdown-item" href="/info/listInfo">정보공유</a>
	                <a class="dropdown-item" href="/community/getDogSense.jsp">애견상식</a>
<!-- 	                <a class="dropdown-item" id="chatbot" href="#" data-toggle="modal" data-target="#chatbot-modal">챗봇</a> -->
	                
                  </div>
                </li>
<%--               <c:if test="${ sessionScope.user != null }"> --%>
<!--                 <li class="nav-item dropdown" > -->
<!--                   <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-top:0;">마이페이지</a>  -->
<!--                   <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink"> -->
<%-- 		            <a class="dropdown-item" href="/users/getUsers?id=${ sessionScope.user.id }">내정보보기</a> --%>
<!-- 		              	<a class="dropdown-item" href="/message/listMessage?searchCondition=all">쪽지함</a> -->
<%-- 		                <c:if test="${ sessionScope.user.role eq 'admin' }"> --%>
<!-- 		                	<a class="dropdown-item" href="/coupon/addCouponManage">쿠폰생성</a> -->
<%-- 		                </c:if> --%>
<!-- 		                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#report-modal">쿠폰받기</a> -->
<%-- 		                <c:if test="${ sessionScope.user.role eq 'admin' }"> --%>
<!-- 		                <a class="dropdown-item" href="/report/listReport">신고글목록</a> -->
<%-- 		                </c:if> --%>
<!--                   </div> -->
<!--                 </li> -->
<%--                  </c:if> --%>
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-top:0;">스토어</a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	                <a class="dropdown-item" href="/market/listMarket">보호마켓</a>
	                <a class="dropdown-item" href="/product/listProduct">스토어</a>
                  </div>
                </li>
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="/community/getBreedPedia.jsp" style="padding-top:0;">견종백과</a></li>
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="/hospital/getHospital.jsp" style="padding-top:0;">동물병원</a></li>
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
    
    <jsp:include page="/common/modal/modalLogin.jsp"></jsp:include>
    <jsp:include page="/chatting/inquiryRoom.jsp"></jsp:include>
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
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

    
    <!-- fontawesome key -->
    <script src="https://kit.fontawesome.com/e26616618e.js"></script>
    
    <!-- sweetalter CDN -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
<!--      Chat Bot -->
<%-- 	<jsp:include page="/chatbot/chatbot.jsp"></jsp:include> --%>
	
  	<script type="text/javascript">

		//============= "로그인"  Event 처리 =============
		$("#submitLogin").on("click", function() {
			
// 			alert("ㅎㅇ");
			fncLogin();

// 			alert("ㅎㅇ");
			
		});
		
		$(".login-modal").on("click", function(){
			
			fncLogin();
			
		})
		
		
		
		$("#fixedbtn").on("click",function(){
			
        	if(${user == null}){       		
        		$("#login-modal").modal('show');  		
        	}else{
        		$("#chatting-modal").modal('show');
// 			 window.open("/chatting/addChattingUser?postId=${funding.id}",
// 						"_blank",
// 						"left=500, top=100, width=462, height=550, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
        	}
		});
		
		function fncLogin(){
			$(".id").focus();
			$("#submitLogin").on("click" , function() {
				var id=$("input:text[name='id']").val();
				var pw=$("input:password[name='pw']").val();
// 				alert(id);
// 				alert(pw);
				if(id == null || id.length <1) {
// 					alert('ID를 입력하십시오.');
// 					$("#login_username").focus();
// 					return;
					swal({
						title : "ID를 입력하세요",
						dangerMode: true,
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					.then((A) => {
						if(A){
							$("#login_username").focus();
							return false;
						}
					});
				}
				
				if(pw == null || pw.length <1) {
// 					alert('비밀번호를 입력하십시오.');
// 					$("#login_password").focus();
// 					return;
					swal({
						title : "비밀번호를 입력하세요",
						dangerMode: true,
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					.then((A) => {
						if(A){
							$("#login_password").focus();
							return false;
						}
					});
				}
				
				var chkLogin={id:id, pw:pw};
// 				alert("ajax id : "+id);
// 				alert("ajax pw : "+pw);
				$.ajax({
					
					type : "POST",
					contentType : "application/json",
					url : "/users/json/login",
					data : JSON.stringify(chkLogin),
					datatype : "json",
					success : function(response){
// 						alert("pw : "+JSON.stringify(response))

						
						var URI = response.returnURI;
																										
						var response = response.user;
						
						if(response.pw == pw && response.id == id && response.levelPoint >= 0){
// 							alert("로그인 성공 pw : "+response.pw+" && "+response.levelPoint);

							swal({
								title : response.nickname+"님 환영합니다!",
								buttons :{
									catch : {
										text : "확인"
									}
								}
							})
							.then((A) => {
								if(A){
									self.location=URI;	
								}
							});
// 							self.location="/index.jsp";
// 							$('#login-form').attr('method', 'POST').attr('action', '/users/login').submit();
						}
						if(response.pw != pw || response.id != id){
// 							alert(response.pw);
// 							alert("아이디 혹은 비밀번호가 맞지 않습니다.");
// 							$("#login_password").val('');
// 							return;
// 							$("#id").focus();
							swal({
								title : "아이디 혹은 비밀번호가 일치하지 않습니다.",
								dangerMode: true,
								buttons :{
									catch : {
										text : "확인"
									}
								}
							})
							.then((A) => {
								if(A){
									$("#login_password").val('');
									return;
									$("#id").focus();
								}
							});
						}
						if(response.levelPoint < 0) {
// 							alert("블랙리스트 처리된 회원입니다.");
// 							return;
// 							$("#id").focus();
							swal({
								title : "블랙리스트 처리된 회원입니다.",
								dangerMode: true,
								buttons :{
									catch : {
										text : "확인"
									}
								}
							})
							.then((A) => {
								if(A){
									return;
									$("#id").focus();
								}
							});
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
		
		Kakao.init('153d14a106a978cdc7a42f3f236934a6')
		$(".kakaoLogin").on("click", function(){
			Kakao.Auth.login({
				success : function(authObj){
					Kakao.API.request({
						url : "/v2/user/me",
						success : function(result){
							var info = JSON.stringify(result);
							$(location).attr('href', '/users/kakao?kakao='+result.id);
						}
					});
					Kakao.Auth.getAccessToken();
				},
				fail : function(err) {
// 					alert(JSON.stringify(err));
					swal({
						title : "로그인 실패!",
						dangerMode: true,
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
				}
			})
		})
		

		var naver_id_login = new naver_id_login("qhgCBZA6iuY4bImpUhhX", "http://192.168.0.33:8080/users/callback.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 2 , 30);
	  	naver_id_login.setDomain("http://192.168.0.33:8080/");
	  	naver_id_login.setState(state);
// 	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
	  	
	  	
	  	

// 			  	var naverLogin=new naver.LoginWithNaverId({
			  		
// 			  		clientId : "qhgCBZA6iuY4bImpUhhX",
// 			  		callbackUrl : "http://localhost:8080/users/callback.jsp",
// 			  		isPopup : false,
// 			  		loginButton: {color: "green", type: 3, height: 30},
// 			  		callbackHandle : false
			  		
// 			  	});
// 			  	naverLogin.init();
			  	
// 			  	naverLogin.getLoginStatus(function(status){
// 			  		if(status){
// 						var email = naverLogin.user.getEmail();
// 						var name = naverLogin.user.getNickName();
// 						var profileImage = naverLogin.user.getProfileImage();
// 						var birthday = naverLogin.user.getBirthday();			
// 						var uniqId = naverLogin.user.getId();
// 						var age = naverLogin.user.getAge();
// 			  		} else {
// 			  			alert("AccessToken 확인이요");
// 			  		}
// 			  	});

	  	
		      


		//============= 회원가입 Event처리 =============
		$( function() {
			$("#regist").on("click" , function() {
				self.location = "/users/addUsersBase"
			});
		});
		
		
		//============= 맨위로  =============
		$( function() {

			$("#back-to-top").on("click" , function() {
				$('html').scrollTop(0);
			});
			
		});
		

		

// 			$(document).ready(function(){
// 				var url="/index.jsp"
// 				window.open(url,"","width=400,height=400,left=600");
// 			})


		
		
	</script>	  

</body>
</html>