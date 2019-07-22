
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">

<link rel="stylesheet"
	href="resources/prodmenu/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/prodmenu/css/animate.css">

<link rel="stylesheet"
	href="resources/prodmenu/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/prodmenu/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/prodmenu/css/magnific-popup.css">

<link rel="stylesheet" href="resources/prodmenu/css/aos.css">

<link rel="stylesheet" href="resources/prodmenu/css/ionicons.min.css">

<link rel="stylesheet"
	href="resources/prodmenu/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="resources/prodmenu/css/jquery.timepicker.css">


<link rel="stylesheet" href="resources/prodmenu/css/flaticon.css">
<link rel="stylesheet" href="resources/prodmenu/css/icomoon.css">
<link rel="stylesheet" href="resources/prodmenu/css/style.css">

<script src="https://code.jquery.com/jquery-3.4.1.slim.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/api:client.js"></script>

<style type="text/css">
</style>
</head>
<body class="goto-here">

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>

	<div style="min-height: 500px"></div>

	<jsp:include page="/layout/footer.jsp"></jsp:include>

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