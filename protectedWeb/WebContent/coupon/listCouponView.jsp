<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



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
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->

	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
			<input type="hidden" id="receiverId" name="receiverId" value="${ sessionScope.user.id }">
	       <h3 class=" text-info">쿠폰받아가셈</h3>
	       	<c:if test="${ sessionScope.user.role eq 'admin' }">
	       		<input type="button" id="couponManage" value="쿠폰등록/수정">
	       	</c:if>
	    </div>
	
	

		<div id="dialog" class="row">
			
			<c:set var="i" value="0"/>
			<c:forEach var="coupon" items="${ list }">		
			<div style="float:left" class="col-md-4">
				<c:if test="${ coupon.discount le 3000 }">
				<div class="col-xs-12 col-md-4">
					<img src="/resources/file/others/facebook.png">
				</div>
				</c:if>
				<c:if test="${ coupon.discount le 5000 && coupon.discount gt 3000}">
				<div class="col-xs-12 col-md-4">
					<img src="/resources/file/others/kakao.png">
				</div>
				</c:if>
				<c:if test="${ coupon.discount le 10000 && coupon.discount gt 5000 }">
				<div class="col-xs-12 col-md-4">
					<img src="/resources/file/others/naver.png">
				</div>
				</c:if>
				<c:if test="${ coupon.discount gt 10000 }">
				<div class="col-xs-12 col-md-4">
					<img src="/resources/file/others/twitter.png">
				</div>
				</c:if>
			</div>
				
				<div style="float:right; min-width:65%" class="col-md-8"> 
			
					<input type="hidden" id="couponNo" name="couponNo" value="${ coupon.couponNo }">
			
					<div class="row">
				  		<div class="col-xs-4 col-md-6"><strong>쿠폰코드</strong></div>
						<div class="col-xs-8 col-md-6">${ coupon.couponCode }</div>
					</div>
					
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
						<input type="button" id="receiveCoupon" class="receiveCoupon" value="쿠폰받기">
					</div>
					</c:if>
					<c:if test="${ sessionScope.user.role eq 'admin' }">
					<div class="row" style="float:right">
						<input type="button" id="removeCoupon" class="removeCoupon" value="삭제">
					</div>
					</c:if>
<%-- 					<c:set var="flag" value="false"/> --%>
<%-- 					<c:forEach var="myCoupon" items="${ sList }">	 --%>
<%-- 						<c:if test="${ flag == false }"> --%>
<%-- 							<c:if test="${ myCoupon.couponCode != coupon.couponCode }"> --%>
<!-- 								<p>수령가능</p> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${ myCoupon.couponCode eq coupon.couponCode }"> --%>
<%-- 								<c:set var="flag" value="true"/> --%>
<!-- 								<p>수령불가</p> -->
<%-- 							</c:if> --%>
<%-- 						</c:if> --%>
<%-- 					</c:forEach> --%>
					<br/>
					<br/>
					<br/>
					<br/>
				
				
				</div>
				</c:forEach>
			
		
			
		</div>
		
		<hr/>
	
	</div>
	
		
		
		
	
 	<!--  화면구성 div Start /////////////////////////////////////-->

	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		$(function(){
			$(".receiveCoupon").on("click", function(){
				alert($(this).parent().parent().children("#couponNo").val());
				alert($("#receiverId").val());
				var couponNo=$(this).parent().parent().children("#couponNo").val();
				var receiverId=$("#receiverId").val();
				debugger;
				self.location="/coupon/addCoupon?couponNo="+couponNo+"&receiverId="+receiverId+"&couponStatus=1";
			})
		});
		
		$(function(){
			$("#couponManage").on("click", function(){
				self.location="/coupon/addCouponManage"
			})
		});
		
		$(function(){
			$(".removeCoupon").on("click", function(){
				var couponNo=$(this).parent().parent().children("#couponNo").val();
				alert(couponNo);
				self.location="/coupon/updateCoupon?couponNo="+couponNo+"&couponStatus=3";
			})
		})
		
	</script>

</body>

</html>