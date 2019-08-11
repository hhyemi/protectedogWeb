
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>보호할개 · 마이페이지</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="/resources/newTemplate/css/style.css">
    
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
  		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
      	<style type="text/css">
 		
 		@font-face {
    		font-family: 'YouandiModernTR';
   		 	font-style: normal;
    		font-weight: normal;
    		src: url(/resources/font/Youandi_Modern_TextRegular.woff) format('woff');
		}
    	
    	#mainNav, body, .nav-link, .dropdown-item, .navbar-brand, h2, h3, h4, p, a, th, td {
    		font-family: 'YouandiModernTR', sans-serif !important;
    	} 	
		
		.navbar-brand{
			font-weight: bold;
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
	
  	</style>
	
	    <jsp:include page="/layout/toolbar.jsp" />
	
</head>

<body>
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="hero-wrap hero-bread" style="padding-bottom: 60px; padding-top : 60px;">
			<input type="hidden" id="receiverId" name="receiverId" value="${ sessionScope.user.id }">
			<div class="container">
				<div class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-9 ftco-animate text-center">
						<p class="breadcrumbs">
							<span class="mr-2">Coupon</span><span> List</span>
						</p>
						<h1 class="mb-0 bread">이달의 쿠폰</h1>
					</div>
				</div>
			</div>
		</div>
		
		<div class="page-content d-flex align-items-stretch col-md-12" style="padding-top: 60px; ">
			<jsp:include page="/users/mypage/userSideBar.jsp"></jsp:include>
			<div class="col-md-12">

				<div class="row">
					
					<div style="padding-left:50px;" class="col-md-12"> 
						<form class="form-horizontal" name="formal" enctype="multipart/form-data">		
						<div class="row">
					  		<div class="col-xs-4 col-md-6"><strong>쿠폰이미지</strong></div>
							<div class="col-xs-8 col-md-6">
								<input type="file" class="form-control" id="couponImg" name="couponImg" style="width: 300px; height: 40px" maxLength="13"/>
							</div>
						</div>

						<br/>
						
						<div class="row">
					  		<div class="col-xs-4 col-md-6"><strong>쿠폰코드</strong></div>
							<div class="col-xs-8 col-md-6">
								<input type="text" id="couponCode" style="width: 300px; height: 40px" name="couponCode" placeholder="쿠폰코드입력">
							</div>
						</div>
						
						<br/>
						
						<div class="row">
					  		<div class="col-xs-4 col-md-6"><strong>쿠폰이름</strong></div>
							<div class="col-xs-8 col-md-6">
								<input type="text" id="couponName" style="width: 300px; height: 40px" name="couponName" placeholder="쿠폰이름입력">
							</div>
						</div>
						
						<br/>
						
						<div class="row">
					  		<div class="col-xs-4 col-md-6"><strong>할인금액</strong></div>
							<div class="col-xs-8 col-md-6">
								<input type="text" id="discount" style="width: 300px; height: 40px" name="discount" placeholder="할인가격입력">
							</div>
						</div>
						
						<br/>
						
						<div class="row">
					  		<div class="col-xs-4 col-md-6"><strong>등록일자</strong></div>
							<div class="col-xs-8 col-md-6">
								<input type="text" readonly="readonly" style="width: 300px; height: 40px" id="datepicker1" name="makeDate" placeholder="등록일자입력">
							</div>
						</div>
						
						<br/>
						
						<div class="row">
					  		<div class="col-xs-4 col-md-6"><strong>사용기한</strong></div>
							<div class="col-xs-8 col-md-6">
								<input type="text" readonly="readonly" style="width: 300px; height: 40px" id="datepicker2" name="limitDate" placeholder="사용기한입력">
							</div>
						</div>
						
						<br/>
						
						<input type="hidden" id="couponStatus" name="couponStatus" value="0">
						</form>					
					</div>
					<div class="col-md-12" style="display:inline-block;">
						<div class="col-md-3" style="float:right;">
							<button type="button" class="btn btn-default" id="submit">등록</button>
						</div>
					</div>
				</div>
			
				<br/>

		</div>
		</div>
	</div>
	
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<!--Global Javascript -->
<!--     <script src="/resources/newTemplate/admin/js/jquery.min.js"></script> -->
<!--     <script src="/resources/newTemplate/admin/js/popper/popper.min.js"></script> -->
<!--     <script src="/resources/newTemplate/admin/js/tether.min.js"></script> -->
<!--     <script src="/resources/newTemplate/admin/js/bootstrap.min.js"></script> -->
<!--     <script src="/resources/newTemplate/admin/js/jquery.cookie.js"></script> -->
<!--     <script src="/resources/newTemplate/admin/js/jquery.validate.min.js"></script>  -->
<!--     <script src="/resources/newTemplate/admin/js/chart.min.js"></script>  -->
<!--     <script src="/resources/newTemplate/admin/js/front.js"></script> -->
    
    <!--   <script src="./jquery-ui-1.12.1/datepicker-ko.js"></script> -->
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!--   <script type="text/javascript" src="/resources/events.js"></script> -->
<!--   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
  <script>

	
// 		$(function(){
// 			$("#datepicker1").datepicker({
// 				dateFormat: "yy-mm-dd",
// 				minDate: '-100y',
// 				yearRange: 'c-100:c+10',
// 				changeMonth: true,
// 				changeYear: true
// 			});
// 		});
		
// 		$(function(){
// 			$("#datepicker2").datepicker({
// 				dateFormat: "yy-mm-dd",
// 				minDate: '-100y',
// 				yearRange: 'c-100:c+10',
// 				changeMonth: true,
// 				changeYear: true
// 			});
// 		});
		
		$( "input[id=datepicker1]" ).datepicker({
			showOn: "button",
			buttonImage: "/resources/file/others/calendar.png",
			buttonImageOnly: true,
			buttonText: "Select date",
			dateFormat: "yy-mm-dd",
			prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
		});
		
		$( "input[id=datepicker2]" ).datepicker({
			showOn: "button",
			buttonImage: "/resources/file/others/calendar.png",
			buttonImageOnly: true,
			buttonText: "Select date",
			dateFormat: "yy-mm-dd",
			prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
		});
		
		 $(function() {
			 $( "#submit" ).on("click" , function() {
// 				 debugger;
					swal({
						text : "쿠폰이 등록되었습니다!",
						buttons : {
							catch : {
								text : "확인"
							}
						}
					})
					.then((A) => {
						if(A) {
							$("form[name=formal]").attr("method" , "POST").attr("action" , "/coupon/addCouponManage").submit();
						}
					})
				});
		});
		
	</script>

</body>

</html>