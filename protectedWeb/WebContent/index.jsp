 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>보호할개</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/css/others/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- Favicon -->
    <link rel="icon" href="../resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="../resources/css/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="../resources/css/responsive/responsive.css" rel="stylesheet">

<style type="text/css">

#pattern-switcher {
	width : 60px;
	top : 92%;
	height : 50px;
	
	margin-right : 10px;
	
	font-weight: bold;
}

#patter-close > i{
	top:91.5%;
	left :93.5%;
}

.yummy-load{
}
</style>
</head>

<body>
    <!-- Preloader Start -->
    <div id="preloader">
        <div class="yummy-load"></div>
    </div>

    <!-- Background Pattern Swither -->
    <div id="pattern-switcher">
        Chat
    </div>
    <div id="patter-close">
        <i class="fa fa-times" aria-hidden="true"></i>
    </div>

    <!-- ****** Top Header Area Start ****** -->
    <div class="top_header_area">
        <div class="container">
            <div class="row">
                <div class="col-5 col-sm-6">
                    <!--  Top Social bar start -->
                    <div class="top_social_bar">
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                        <a id="custom-login-btn" href="javascript:loginWithKakao()">
                        	<img src="../resources/img/kakao/kakaolink_btn_small.png" width="15"/>
                        </a>
                        <a id="" href="javascript:logoutWithKakao()">카카오 로그아웃</a>
                        <c:if test="${ sessionScope.user.role != null }">
                        	<div class="logout">
                                <a href="/users/logout">logout</a>
                            </div>
                        </c:if>
                        <a href="#"><i class="fa fa-naver" aria-hidden="true"></i></a>
                    </div>
                </div>
                <!--  Login Register Area -->
                
                <div class="col-7 col-sm-6">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <c:if test="${ sessionScope.user.role eq null }">
                        <div class="login_register_area d-flex">
                            <div class="login">
                                <a href="/users/login">Sign in</a>
                            </div>
                            <div class="register">
                                <a href="/users/addUsersBase">Sign up</a>
                            </div>
                         </div>
                         </c:if>
                         <c:if test="${ sessionScope.user.role != null }">
                         <div class="login_area d-flex">
                            <div class="login">
                                <a href="#">${ sessionScope.user.nickname }</a>
                            </div>
                            <div class="mypage">
                                <a href="#">Mypage</a>
                            </div>
                         </div>
                         </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Top Header Area End ****** -->

    <!-- ****** Header Area Start ****** -->
    <header class="header_area">
        <div class="container">
            <div class="row">
                <!-- Logo Area Start -->
                <div class="col-12">
                    <div class="logo_area text-center">
                        <a href="/index.jsp" class="yummy-logo">#protectedog</a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#yummyfood-nav" aria-controls="yummyfood-nav" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i> Menu</button>
                        <!-- Menu Area Start -->
                        <div class="collapse navbar-collapse justify-content-center" id="yummyfood-nav">
                            <ul class="navbar-nav" id="yummy-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">adopt</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="/adopt/listAdopt?boardCode=AD">분양글리스트</a>
                                        <a class="dropdown-item" href="/adopt/listAdoptReview?boardCode=AD">입양후기</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">missing</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="/adopt/listAdopt?boardCode=MS">실종글리스트</a>
                                        <a class="dropdown-item" href="/adopt/listAdoptReview?boardCode=MS">찾은 후기</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">storyfunding</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="/funding/addFunding.jsp">후원신청</a>
                                        <a class="dropdown-item" href="index.html">후원게시</a>
                                    </div>
                                </li>
                                 <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">hospital</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="/common/comment.jsp">댓글</a>
                                    </div>
                                </li>
                                 <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">pedia</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="/community/addInfo.jsp">견종백과</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">community</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="index.html">1</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">market</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="index.html">1</a>
                                    </div>
                                </li>
<!--                                 <li class="nav-item"> -->
<!--                                     <a class="nav-link" href="contact.html">MANAGER</a> -->
<!--                                 </li> -->
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ****** Header Area End ****** -->
	
<!-- 	<div class="temp" style="width: 100%; height: 3000px;"> -->
	
	
	
	</div>

    <!-- Jquery-2.2.4 js -->
    <script src="../resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="../resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap-4 js -->
    <script src="../resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins JS -->
    <script src="../resources/js/others/plugins.js"></script>
    <!-- Active JS -->
    <script src="../resources/js/active.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    
    <script type="text/javascript">
    	Kakao.init('3eef0ec25dbea51f4703e0c90c3ebb54');
    	function loginWithKakao(){
    		Kakao.Auth.login({
    			success:function(authObj){
    				Kakao.API.request({
    					url:"/v2/user/me",
    					success:function(result){
    						var info=JSON.stringify(result);
		                    $(location).attr('href', '/users/kakao?kakao='+result.id);
    					}
    				});
    				Kakao.Auth.getAccessToken();
    				alert(Kakao.Auth.getAccessToken());
    			},
    				fail:function(err){
    				alert(JSON.stringify(err));
    				alert("로그인 실패")
    			}
    		})
    	}
    	
    	function logoutWithKakao(){
    		Kakao.Auth.logout();
    		alert("카카오 로그아웃");
    		location.href='https://accounts.kakao.com/logout?continue=https://pf.kakao.com/logged_out';
    		//goMain();
    	}
    	
//     	function goMain(){
//     		location.href="/index.jsp";
//     	}
    </script>

</body>
</html>