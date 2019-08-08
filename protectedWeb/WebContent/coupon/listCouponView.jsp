<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>

<html lang="ko">
	
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>보호할개 : 마이페이지</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="/resources/newTemplate/css/style.css">
    
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
	
<!-- 		<div class="page-header"> -->
<%-- 			<input type="hidden" id="receiverId" name="receiverId" value="${ sessionScope.user.id }"> --%>
<!-- 	       <h3 class=" text-info">쿠폰받아가셈</h3> -->
<%-- 	       	<c:if test="${ sessionScope.user.role eq 'admin' }"> --%>
<!-- 	       		<input type="button" id="couponManage" value="쿠폰등록/수정"> -->
<%-- 	       	</c:if> --%>
<!-- 	    </div> -->
		<div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 60px;">
			<input type="hidden" id="receiverId" name="receiverId" value="${ sessionScope.user.id }">
			<div class="container">
				<div class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-9 ftco-animate text-center">
						<p class="breadcrumbs">
							<span class="mr-2">Coupon </span><span>List</span>
						</p>
						<h1 class="mb-0 bread">이달의 쿠폰</h1>
					</div>
				</div>
			</div>
		</div>
	
		<div class="page-content d-flex align-items-stretch col-md-12" style="padding-top: 60px; ">
			<jsp:include page="/users/mypage/userSideBar.jsp"></jsp:include>
			<div id="dialog" class="row">
				<c:set var="i" value="0"/>
				<c:forEach var="coupon" items="${ list }">		
				<div style="float:left" class="col-md-4">
					<div class="col-xs-12 col-md-4">
						<img src="../resources/file/fileCoupon/${ coupon.couponImage }" align="middle" width="240px" height="135px">
					</div>
	
				</div>
					
					<div style="float:right; min-width:65%" class="col-md-8"> 
				
						<input type="hidden" id="couponNo" name="couponNo" value="${ coupon.couponNo }">
						<input type="hidden" id="couponCode" name="couponCode" value="${ coupon.couponCode }">
				
<!-- 						<div class="row"> -->
<!-- 					  		<div class="col-xs-4 col-md-6"><strong>쿠폰코드</strong></div> -->
<%-- 							<div class="col-xs-8 col-md-6" id="couponCode">${ coupon.couponCode }</div> --%>
<!-- 						</div> -->
						
						<hr/>
						
						<div class="row">
					  		<div class="col-xs-4 col-md-6"><strong>쿠폰이름</strong></div>
							<div class="col-xs-8 col-md-6">${ coupon.couponName }</div>
						</div>
						
						<hr/>
						
						<div class="row">
					  		<div class="col-xs-4 col-md-6"><strong>할인금액</strong></div>
							<div class="col-xs-8 col-md-6">${ coupon.discount }원</div>
						</div>
						
						<hr/>
						
						<div class="row">
					  		<div class="col-xs-4 col-md-6"><strong>등록일자</strong></div>
							<div class="col-xs-8 col-md-6">
								<fmt:formatDate value="${ coupon.makeDate }" pattern="yyyy년 MM월 dd일"/>
							</div>
						</div>
						
						<hr/>
						
						<div class="row">
					  		<div class="col-xs-4 col-md-6"><strong>사용기한</strong></div>
							<div class="col-xs-8 col-md-6">
								<fmt:formatDate value="${ coupon.limitDate }" pattern="yyyy년 MM월 dd일"/>
							</div>
						</div>
						
						<hr/>
						
						<c:if test="${ sessionScope.user.role eq 'user' }">
						<div class="row" style="float:right">
							<button type="button" class="btn btn-default receiveCoupon" id="receiveCoupon">쿠폰받기</button>
						</div>
						</c:if>
						<c:if test="${ sessionScope.user.role eq 'admin' }">
						<div class="row" style="float:right">
							<button type="button" class="btn btn-default removeCoupon" id="removeCoupon">쿠폰삭제</button>
						</div>
						</c:if>
	
						<br/>
						<br/>
						<br/>
						<br/>
					
					
					</div>
					</c:forEach>
				
			
				
			</div>
			</div>
		
		<hr/>
	
	</div>
	
    <jsp:include page="/layout/footer.jsp"></jsp:include>

    <!--Global Javascript -->
    <script src="/resources/newTemplate/admin/js/jquery.min.js"></script>
    <script src="/resources/newTemplate/admin/js/popper/popper.min.js"></script>
    <script src="/resources/newTemplate/admin/js/tether.min.js"></script>
    <script src="/resources/newTemplate/admin/js/bootstrap.min.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.cookie.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.validate.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/chart.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/front.js"></script> 		
		
		
	
 	<!--  화면구성 div Start /////////////////////////////////////-->

	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
// 		function fncAddCoupon(couponNo, receiverId) {
// 			alert("addcoupon펑션 쿠폰번호 : "+couponNo);
// 			alert("addcoupon펑션 받는사람 : "+receiverId);
//			self.location="/coupon/addCoupon?couponNo="+couponNo+"&receiverId="+receiverId+"&couponStatus=1";
// 		}
		
// 		$(function(){
// 			$(".receiveCoupon").on("click", function({
// 				fncAddCoupon();
// 			}))
// 		})
		
// 		$(function(){
// 			$("#couponManage").on("click", function(){
// 				self.location="/coupon/addCouponManage"
// 			})
// 		});
		
		$(function(){
			$(".removeCoupon").on("click", function(){
// 				debugger;
				var couponNo=$(this).parent().parent().children("input[name=couponNo]").val();
				var couponCode=$(this).parent().parent().children("input[name=couponCode]").val();
// 				alert(couponNo+", "+couponCode);
// 				self.location="/coupon/updateCoupon?couponNo="+couponNo+"&couponStatus=3";
				swal({
					text : "쿠폰을 삭제하시겠습니까?",
					icon : "warning",
					buttons : ["취소","확인"],
					dangerMode: true,
				})
				.then((A) => {
					if(A) {
						self.location="/coupon/updateCoupon?couponNo="+couponNo+"&couponStatus=3";
					}
				    swal("삭제완료 !", {
				      	icon: "success"
				    });
				})
			})
		})
		
		$(function (){
		
			$(".receiveCoupon").on("click", function(){
				var couponCode=$(this).parent().parent().children("input[name=couponCode]").val();
				var receiverId=$("#receiverId").val();
				var checkCoupon = { couponCode:couponCode , receiverId:receiverId }
				var couponNo=$(this).parent().parent().children("input[name=couponNo]").val();
// 				alert("ajax통신 쿠폰코드 : "+couponCode);
// 				alert("ajax통신 받는사람 : "+receiverId);
// 				alert("ajax통신 체크쿠폰 : "+JSON.stringify(checkCoupon));
// 				alert("ajax통신 쿠폰번호 : "+couponNo)
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/coupon/json/checkCoupon",
					data : JSON.stringify(checkCoupon),
					datatype : "json",
					success : function(response){
						if($.trim(response.result)==0){
// 							alert("쿠폰을 받았습니다");
// 							alert(couponNo+", "+couponCode+", "+receiverId);
							self.location="/coupon/addCoupon?couponNo="+couponNo+"&receiverId="+receiverId+"&couponStatus=1";
						}else{
// 							alert("이미 받은 쿠폰입니다");
// 							return;
						}
					},
					error : function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})

			});
		});
		
		
	</script>

</body>

</html>