<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="848949930774-4ka6kl79kq1fv7h3q89leonj9ki1o6v7.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js"></script>
	
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
            margin-top: 10px;
        }
    </style>
	
</head>

<body>
	
	<jsp:include page="/layout/loginToolbar.jsp"></jsp:include>
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
	   	 	
	 	 	<div class="col-md-12">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">로 &nbsp;&nbsp;그 &nbsp;&nbsp;인</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="id" class="col-sm-4 control-label">아 이 디</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="id" id="id"  placeholder="아이디" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="pw" class="col-sm-4 control-label">패 스 워 드</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="pw" id="pw" placeholder="패스워드" >
					    </div>
					  </div>

					  
					  <div class="form-group">
					  
					  	<div class="col-sm-offset-4 col-sm-6 text-center">
					      <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
					    </div>
					    
					    <div id="naver_id_login"></div>
					  
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					        <a id="kakao-login-btn"></a>
						    <a href="http://developers.kakao.com/logout"></a>
						    <script type='text/javascript'>
						    Kakao.init('3eef0ec25dbea51f4703e0c90c3ebb54');

					        Kakao.Auth.createLoginButton({
					          container: '#kakao-login-btn',
					          size : 'small',
					          success: function(authObj) {
					        	  Kakao.API.request({
					                  url : "/v2/user/me",
					                  success : function(result){
					                     var info=JSON.stringify(result);
					                     $(location).attr('href', '/users/kakao?kakao='+result.id);
					                  }
					               })
					          },
					          fail: function(err) {
					             alert(JSON.stringify(err));
					          }
					        });

						    </script>
						    
					      <button type="button" class="btn btn-primary"  >로 &nbsp;그 &nbsp;인</button>
					      <a class="btn btn-primary btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a>
					    </div>
					  </div>
			
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  화면구성 div end /////////////////////////////////////-->
 	
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script type="text/javascript">

		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#id").focus();
			$("button").on("click" , function() {
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
						if(response.pw == pw && response.id == id){
// 							alert("들어와서 : "+response.pw);
							alert(response.nickname+" 님 환영합니다!");
							$('form').attr('method', 'POST').attr('action', '/users/login').submit();
						}
						if(response.pw != pw || response.id != id){
// 							alert(response.pw);
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
		
		$(function(){
			$(".g-signin2").on("click", function(){
				onSignIn(googleUser);
			})
		});
			
		function onSignIn(googleUser) {
			// Useful data for your client-side scripts:
			var profile = googleUser.getBasicProfile();
			alert("ID: " + profile.getId()); // Don't send this directly to your server!
			
			// The ID token you need to pass to your backend:
			var id_token = googleUser.getAuthResponse().id_token;
			alert("ID Token: " + id_token);
			        
			$(location).attr('href', '/users/google?google='+profile.getId()+"&idToken="+id_token);
		}

		var naver_id_login = new naver_id_login("qhgCBZA6iuY4bImpUhhX", "http://localhost:8080/users/callback.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 2,40);
	  	naver_id_login.setDomain("http://localhost:8080/");
	  	naver_id_login.setState(state);
// 	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
		      


		//============= 회원원가입화면이동 =============
		$( function() {
			$("a[href='#' ]").on("click" , function() {
				self.location = "/users/addUsersBase"
			});
		});
		
	</script>	

</body>

</html>