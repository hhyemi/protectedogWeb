<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<!--  meta  -->
<!-- <meta charset="UTF-8"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
<!--  bootstrap CDN  -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!--  bootstrap Dropdown CSS & JS  -->
<!-- <link href="/resources/css/others/animate.css" rel="stylesheet"> -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>보호할개 : 메시지함 </title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/apps/email.css">
    
    <jsp:include page="/layout/toolbar.jsp"></jsp:include>

<style type="text/css">

body {
	position: relative;
}
.container {
	font-size: 14px;
}

.content {
	text-align: left;
	width: 720px;
	min-height: 400px;
}

.button {
	position: relative;
}

.goto-here {
	padding: 0px;
}
</style>
</head>

<body>

	
	
		
	<div class="container">
		<jsp:include page="/users/mypage/userSideBar.jsp"></jsp:include>
		<form name="info">
			<input type="hidden" name="messageNo" value="${message.messageNo}" />

			<div class="row" style="position: relative; height: 25px;">
				<div class="col-md-8"
					style="position: absolute; left: 0px; bottom: 0px;">보낸사람 | ${ message.senderId }</div>
							
				<div class="col-md-4" align="right"
					style="position: absolute; right: 0px; bottom: 0px;">받은사람 | ${ message.receiverId }</div>
			</div>
			<p />
			
			<hr />
			
			<div class="row" style="position: relative; height: 25px;">
				<div class="col-md-8"
					style="position: absolute; left: 0px; bottom: 0px;">제목 | ${ message.messageTitle }</div>
							
				<div class="col-md-4" align="right"
					style="position: absolute; right: 0px; bottom: 0px;">
					보낸일시 | <fmt:formatDate value="${ message.sendDate }" pattern="yyyy년 MM월 dd일"/>
				</div>
			</div>
			<p />
					
			<hr />

			<div class="content">${message.messageContent}</div>
			<hr />
			<hr />

		</form>

		<div class="button" align="right">
			<button>답장</button>
			<button>목록</button>
			<button>삭제</button>
		</div>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
	</div>
		
		<jsp:include page="/layout/footer.jsp"></jsp:include>
		
	<script src="/resources/newTemplate/admin/js/jquery.min.js"></script>
    <script src="/resources/newTemplate/admin/js/popper/popper.min.js"></script>
    <script src="/resources/newTemplate/admin/js/tether.min.js"></script>
    <script src="/resources/newTemplate/admin/js/bootstrap.min.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.cookie.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.validate.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/chart.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/front.js"></script> 
		
<script type="text/javascript">
	$(function() {

		$("button:contains('답장')").on("click", function() {
			self.location = "/message/addMessage?receiverId="+${ message.senderId }
		});
		
		$("button:contains('목록')").on("click", function() {
			if(${ message.receiverId == sessionScope.user.id }){
				self.location='/message/listReceiveMessage?receiverId=${sessionScope.user.id}';
			}
			if(${ message.receiverId != sessionScope.user.id }){
				self.location='/message/listSendMessage?senderId=${sessionScope.user.id}';
			}
		});

// 		$("button:contains('삭제')").on(
// 				"click",
// 				function() {

// 					var result = confirm("정말 삭제 하시겠습니까?");

// 					if (result) {
// 						$("form[name='info']").attr("method", "POST").attr(
// 								"action", "/info/delInfo").attr("enctype",
// 								"multipart/form-data").submit();
// 					}

// 				});
	});
</script>
</body>
</html>