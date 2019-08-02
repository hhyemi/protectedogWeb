<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
/* 		body{ */
/* 			background-color : grey; */
/* 		} */
        
        .container{
        	width : 400px;
        	height : 400px;
        }
        
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
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->

	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
<%-- 	<jsp:include page="/layout/toolbar.jsp" /> --%>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div id="dialog" class="row" style="padding-top: 50px; padding-left: 20px;">
			<div style="padding-left: 80px; padding-bottom: 50px; font-size: 20px;">
				<span>New Coupon Arrived!</span>
			</div>
			<div style="float:left;" class="col-md-4">
				<div class="col-xs-12 col-md-4">
					<img src="../resources/file/fileCoupon/${ coupon.couponImage }" align="middle" width="300px" height="150px">
				</div>
			</div>
			<div style="float:right; min-width:65%" class="col-md-8"> 
				<input type="hidden" id="couponNo" name="couponNo" value="${ coupon.couponNo }">
				<input type="hidden" id="couponNo" name="couponNo" value="${ coupon.couponCode }">
				<input type="hidden" id="couponNo" name="couponNo" value="${ coupon.couponName }">
				<input type="hidden" id="couponNo" name="couponNo" value="${ coupon.discount }">
				<input type="hidden" id="couponNo" name="couponNo" value="${ coupon.makeDate }">
				<input type="hidden" id="couponNo" name="couponNo" value="${ coupon.limitDate }">
			
				<br/>
				<br/>
				<br/>
					

					<div class="row" style="float:center">
						<input type="button" id="receiveCoupon" class="receiveCoupon" value="쿠폰받기">
					</div>

			
			</div>
		</div>
	</div>
	
		
		
		
	
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
		
		$(function(){
			$("#couponManage").on("click", function(){
				self.location="/coupon/addCouponManage"
			})
		});
		
		$(function(){
			$(".removeCoupon").on("click", function(){
				var couponNo=$(this).parent().parent().children("input").val();
// 				alert(couponNo);
				self.location="/coupon/updateCoupon?couponNo="+couponNo+"&couponStatus=3";
			})
		})
		
		$(function (){
		
			$(".receiveCoupon").on("click", function(){
				var couponCode=$(this).parent().parent().children("div").find("#couponCode").html();
				var receiverId=$("#receiverId").val();
				var checkCoupon = { couponCode:couponCode , receiverId:receiverId }
				var couponNo=$(this).parent().parent().children("input").val();
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
							alert("쿠폰을 받았습니다");
// 							alert(couponNo);
// 							alert(receiverId);
							self.location="/coupon/addCoupon?couponNo="+couponNo+"&receiverId="+receiverId+"&couponStatus=1";
							window.close();
						}else{
							alert("이미 받은 쿠폰입니다");
							return;
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