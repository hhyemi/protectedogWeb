
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
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
	href="../../resources/prodmenu/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../../resources/prodmenu/css/animate.css">

<link rel="stylesheet"
	href="../../resources/prodmenu/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="../../resources/prodmenu/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="../../resources/prodmenu/css/magnific-popup.css">

<link rel="stylesheet" href="../../resources/prodmenu/css/aos.css">

<link rel="stylesheet"
	href="../../resources/prodmenu/css/ionicons.min.css">

<link rel="stylesheet"
	href="../../resources/prodmenu/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="../../resources/prodmenu/css/jquery.timepicker.css">


<link rel="stylesheet" href="../../resources/prodmenu/css/flaticon.css">
<link rel="stylesheet" href="../../resources/prodmenu/css/icomoon.css">
<link rel="stylesheet" href="../../resources/prodmenu/css/style.css">

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}

.dogshop {
	width: 300px;
	height: 250px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->


<script type="text/javascript">
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action",
				"/shop/product/listProduct?menu=${param.menu}").submit();
	}

	$(function() {

		$("#change2").on(
				"click",
				function() {
					var prodNo = $(this).data('param1');
					self.location = "/purchase/updateTranCodeByProd?prodNo="
							+ prodNo + "&tranCode=2";
				})
		$(".prodName").on(
				"click",
				function() {
					self.location = "/product/getProduct?prodNo="
							+ $(this).text().trim();
				});

	});
</script>

</head>
<body class="goto-here">

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">all in</a></span> <span>one</span>
					</p>
					<h1 class="mb-0 bread">Dog|shop</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-10 order-md-last">
					<div class="row">
						<c:set var="i" value="0" />
						<c:forEach var="product" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<div class="col-sm-6 col-md-6 col-lg-4 ftco-animate">
								<div class="product">
									<a href="#" class="img-prod"><img class="img-fluid"
										src="http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/18/4/5/4/3/5/8/GKLhE/2049454358_B.jpg"
										alt="Colorlib Template"> <span class="status">30%</span>
<!-- 										<div class="overlay"></div>--> </a> 
									<div class="text py-3 px-3">
										<h3>
											<a href="#">${product.prodName}</a>
										</h3>
										<div class="d-flex">
											<div class="pricing">
												<p class="price">
													<span class="mr-2 price-dc">${product.price}</span><span
														class="price-sale">${product.discountPrice }</span>
												</p>
											</div>
											<div class="rating">
												<p class="text-right">
													<a href="#"><span class="ion-ios-star-outline"></span></a>
													<a href="#"><span class="ion-ios-star-outline"></span></a>
													<a href="#"><span class="ion-ios-star-outline"></span></a>
													<a href="#"><span class="ion-ios-star-outline"></span></a>
													<a href="#"><span class="ion-ios-star-outline"></span></a>
												</p>
											</div>
										</div>
										<p class="bottom-area d-flex px-3">
											<a href="#" class="add-to-cart text-center py-2 mr-1"><span>장바구니에
													담기 <i class="ion-ios-add ml-1"></i>
											</span></a> <a href="#" class="buy-now text-center py-2">구매하기<span><i
													class="ion-ios-cart ml-1"></i></span></a>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
									<li><a href="#">&lt;</a></li>
									<li class="active"><span>1</span></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&gt;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- ////////////카테고리 고정바 Start//////////////-->
				<div class="col-md-4 col-lg-2 sidebar">
					<div class="sidebar-box-2">
						<h2 class="heading mb-2">
							<a href="#"></a>
						</h2>
						<h2 class="heading mb-2">
							<a href="#">BEST</a>
						</h2>
					</div>
					<div class="sidebar-box-2">
						<h2 class="heading mb-4">
							<a href="#">TIMESALE</a>
						</h2>

					</div>
					<div class="sidebar-box-2">
						<h2 class="heading mb-4">
							<a href="#">사료</a>
						</h2>
						<ul>
							<li><a href="/product/listAdminProduct.jsp">전연령용</a></li>
							<li><a href="#">시니어(노견용)</a></li>
							<li><a href="#">어덜트(성견용)</a></li>
							<li><a href="#">퍼피(자견용)</a></li>

						</ul>
					</div>
					<div class="sidebar-box-2">
						<h2 class="heading mb-4">
							<a href="#">간식</a>
						</h2>
						<ul>
							<li><a href="#">소시지</a></li>
							<li><a href="#">육포</a></li>
							<li><a href="#">껌</a></li>
						</ul>
					</div>
					<div class="sidebar-box-2">
						<h2 class="heading mb-4">
							<a href="#">의류</a>
						</h2>
						<ul>
							<li><a href="#">올인원</a></li>
							<li><a href="#">기타</a></li>
							<BR />

						</ul>
						<div class="sidebar-box-2">
							<h2 class="heading mb-4">
								<a href="#">중고마켓</a>
							</h2>

						</div>
						<div class="sidebar-box-2">
							<h2 class="heading mb-4">
								<a href="#">: 관리자</a>
							</h2>

						</div>

					</div>

				</div>
			</div>

		</div>
	</section>







	<script src="../../resources/prodmenu/js/jquery.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../../resources/prodmenu/js/popper.min.js"></script>
	<script src="../../resources/prodmenu/js/bootstrap.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.easing.1.3.js"></script>
	<script src="../../resources/prodmenu/js/jquery.waypoints.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.stellar.min.js"></script>
	<script src="../../resources/prodmenu/js/owl.carousel.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
	<script src="../../resources/prodmenu/js/aos.js"></script>
	<script src="../../resources/prodmenu/js/jquery.animateNumber.min.js"></script>
	<script src="../../resources/prodmenu/js/bootstrap-datepicker.js"></script>
	<script src="../../resources/prodmenu/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="../../resources/prodmenu/js/google-map.js"></script>
	<script src="../../resources/prodmenu/js/main.js"></script>

</body>
</html>