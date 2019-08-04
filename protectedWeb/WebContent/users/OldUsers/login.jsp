<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>Bootstrap Admin Template </title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/pages/login.css">
</head>

<body> 

<!--====================================================
                        PAGE CONTENT
======================================================--> 

<%-- <jsp:include page="/layout/toolbar.jsp"></jsp:include> --%>


      <section class="hero-area">
        <div class="overlay"></div>
        <div class="container">
          <div class="row">
            <div class="col-md-12 ">
                <div class="contact-h-cont">
<!--                   <h3 class="text-center"><img src="img/logo.png" class="img-fluid" alt=""></h3><br> -->
                  <form id="login-form">
                    <div class="form-group">
                      <label for="username">아 이 디</label>
                      <input type="text" class="form-control" id="id" name="id" placeholder="Enter UserId"> 
                    </div>  
                    <div class="form-group">
                      <label for="exampleInputEmail1">비 밀 번 호</label>
                      <input class="form-control" type="password" id="pw" name="pw" placeholder="Enter Password"> 
                    </div>   
                    <button class="btn btn-general btn-blue" id="submit" role="button"><i fa fa-right-arrow></i>로 그 인</button>
                    <button class="btn btn-general btn-blue" id="regist" role="button"><i fa fa-right-arrow></i>회원가입</button>
                  </form>
                </div>
            </div>
          </div>  
        </div>
      </section>
      
    <!--Global Javascript -->
    <script src="/resources/newTemplate/admin/js/jquery.min.js"></script>
    <script src="/resources/newTemplate/admin/js/tether.min.js"></script>
<!--     <script src="/resources/newTemplate/admin/js/bootstrap.min.js"></script> -->
    
    	<script type="text/javascript">

		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#id").focus();
			$("#submit").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#id").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#pw").focus();
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
			
		});
		
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