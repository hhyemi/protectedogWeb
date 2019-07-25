
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/get/css/bootstrap.css" />
<link rel="stylesheet" href="/resources/get/css/icon/style.css" />
<link rel="stylesheet" href="/resources/get/css/font-awesome.min.css" />
<link rel="stylesheet" href="/resources/get/css/themify-icons.css" />
<link rel="stylesheet" href="/resources/get/css/owl.carousel.min.css" />
<link rel="stylesheet" href="/resources/get/css/simpleLightbox.css" />
<link rel="stylesheet" href="/resources/get/css/nice-select.css" />
<link rel="stylesheet" href="/resources/get/css/animate.css" />
<link rel="stylesheet" href="/resources/get/css/jquery-ui.css" />
<!-- main css -->
<link rel="stylesheet" href="/resources/get/css/style.css" />
<link rel="stylesheet" href="/resources/get/css/responsive.css" />
<!-- KAKAO -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
.form-group2 {
	padding-left: 420px;
	padding-right: 100px;
}

.form-group3 {
	padding-left: 465px;
	padding-right: 100px;
}
</style>


</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->
	<!--================Header Menu Area =================-->

	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">

					<p />
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">

							<c:forEach var="i" begin="0" end="${fn:length(file)-1}" step="1">
								<c:if test="${i eq 0}">
									<li data-target="#carouselExampleIndicators"
										data-slide-to="${i}" class="active">
								</c:if>
								<c:if test="${!(i eq 0)}">
									<li data-target="#carouselExampleIndicators"
										data-slide-to="${i}">
								</c:if>
							</c:forEach>

						</ol>
						<div class="carousel-inner">


							<c:forEach var="name" items="${file}" varStatus="status">
								<c:if test="${status.first}">
									<c:set var="className" value="carousel-item active" />
								</c:if>
								<c:if test="${!(status.first)}">
									<c:set var="className" value="carousel-item" />
								</c:if>
								<div class="${className}">
									<img class="d-block w-100"
										src="../../resources/file/fileMarket/${name.fileName}"
										height="300px;" />
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<div>
							<input type="hidden" value="${board.postNo}" /> <input
								type="hidden" value="${board.boardCode}" />
							<h3>${board.postTitle}</h3>${board.id}
							<h3>${board.prodName}</h3>
							<h2>
								<fmt:formatNumber value="${board.price}" pattern="#,###" />
								원
							</h2>

							<h2>
								<fmt:formatNumber value="" pattern="#,###" />
								원
							</h2>

							<ul class="list">
							</ul>
							<p>
								원산지 : <br /> 제조사 : <br /> 기본 적립 포인트 : <br />
							</p>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		<!--================End Single Product Area =================-->

		<!--================Product Description Area =================-->
		<section class="product_description_area">
			<div class="container"></div>
			<hr>
			
			물건 팝니다 사주세요
		</section>
		<!--================End Product Description Area =================-->


		<!--================ End footer Area  =================-->

		<!-- Optional JavaScript -->
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="../../resources/get/js/jquery-3.2.1.min.js"></script>
		<script src="../../resources/get/js/popper.js"></script>
		<script src="../../resources/get/js/bootstrap.min.js"></script>
		<script src="../../resources/get/js/stellar.js"></script>
		<script src="../../resources/get/js/simpleLightbox.min.js"></script>
		<script src="../../resources/get/js/jquery.nice-select.min.js"></script>
		<script src="../../resources/get/js/imagesloaded.pkgd.min.js"></script>
		<script src="../../resources/get/js/isotope-min.js"></script>
		<script src="../../resources/get/js/owl.carousel.min.js"></script>
		<script src="../../resources/get/js/jquery.ajaxchimp.min.js"></script>
		<script src="../../resources/get/js/mail-script.js"></script>
		<script src="../../resources/get/js/jquery-ui.js"></script>
		<script src="../../resources/get/js/jquery.waypoints.min.js"></script>
		<script src="../../resources/get/js/jquery.counterup.js"></script>
		<script src="../../resources/get/js/theme.js"></script>

		<script type="text/javascript">
		
		//============= 상품정보 GET/UPDATE Event  처리 =============
		 $(function() {
			
			 //manage//====================================================
			 $( "button:contains('확인')" ).on("click" , function() {
				//Debug..
				console.log($( "td.ct_btn01:contains('확인')" ).html());
				/* self.location = "/product/listProduct/manage" */
				self.location = "/product/listProduct"
			});
			
			 $( "button:contains('수정')" ).on("click" , function() {
				//Debug..
				console.log($( "button:contains('수정')" ).html());
				history.go(-1);
			});
			 
			 //==================장바구니 추가 ===============================
				 
				 $( ".icon-shopping_cart" ).on("click" , function() {	
					//Debug..
					alert(  $( "form[name='addCart']" ).html() );
					$("form[name='addCart']").attr("method", "POST").attr("action", "/cart/addCart").submit();
					//fncAddProduct();
				});

			//구매하기//====================================================
			$( ".main_btn" ).on("click" , function() {
				//Debug..
				self.location = "/order/addOrder?prodNo=${product.prodNo}"
			});
			
			 $( "button:contains('뒤로')" ).on("click" , function() {
				//Debug..
				console.log($( "button:contains('뒤로')" ).html());
				self.location = "/product/listProduct"
			});
		});
		
		 //=============장바구니 이동========================================
			 
	
		
		
		
		
		</script>
</body>
</html>
