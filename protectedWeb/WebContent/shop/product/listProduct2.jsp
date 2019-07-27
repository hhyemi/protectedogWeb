<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8
">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Business Bootstrap Responsive Template</title>


<!-- Global Stylesheets -->


<!-- Core Stylesheets -->
<link rel="stylesheet" href="/resources/newTemplate/css/shop.css">


<!--  ///////////////////////// JavaScript ////////////////////////// -->


<script type="text/javascript">
	//=============    검색 / page 두가지 경우 모두  Event  처리	 =============	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/product/listProduct")
				.submit();
	}

	//=============    상품상세조회(썸네일)  Event  처리 		=============
	//============= 썸네일 사진 클릭 Event  처리 =============	
	$(function() {
		$(".img-prod").on(
				"click",
				function() {
					//alert($(this).children("input").val())
					$(self.location).attr(
							"href",
							"/product/getProduct?prodNo="
									+ $(this).children("input").val());
				});

		$("#getproduct").on(
				"click",
				function() {
					//alert($(this).children("input").val())
					$(self.location).attr(
							"href",
							"/product/getProduct?prodNo="
									+ $(this).children("input").val());
				});
	});

	$(function() {

		$("td.ct_btn01:contains('장바구니로 이동')").on("click", function() {
			//alert("");
			self.location = "/shop/addCart?prodNo=${param.prodNo}"

		});

	});
</script>

</head>

<body id="page-top">

	<!--====================================================
                         HEADER
======================================================-->

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--====================================================
                    LOGIN OR REGISTER
======================================================-->
	<!--====================================================
                         HOME STA
======================================================-->
	<section id="home-shop">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('https://s1.best-wallpaper.net/wallpaper/m/1812/Furry-puppy-front-view-basket-meadow_m.webp')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Sale Box</h3>

					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('/resources/newTemplate/img/shop/shop-banner-2.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Cool Shop</h3>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</section>

	<!--====================================================
                        SHOP-P1
======================================================-->
	<section id="shop-p1" class="shop-p1">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="shop-p1-title">
						<h3>보호마켓</h3>
						<div class="heading-border-light"></div>
					</div>
				</div>

				<!-- 썸네일 Start //////////////////////////////////////////////////////////////////-->
				<div class="col-lg-9">
					<div class="row">
						<c:set var="i" value="0" />
						<c:forEach var="product" items="${list}">
							<c:set var="i" value="${i+1}" />
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="card ">
									<a><input type="hidden" value="${product.prodNo}" /> <img
										class="img-fluid"
										src="../../resources/file/fileShop/${product.mainFile}" alt=""></a>
									<div class="card-body text-center">
										<div class="card-title">
											<a href="#">${product.prodName} <input type="hidden"
												value="${product.prodNo}">
											</a>
										</div>
										<del>
											<strong>${product.price}</strong>
										</del>
										<br /> <strong>${product.discountPrice}</strong>
										<div class="cart-icon text-center">
											<a href="#"><i class="fa fa-cart-plus"></i> 구매하기</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- <div class="row my-4">-->


	<!--====================================================
                      FOOTER
======================================================-->
	<!--================ start footer Area  =================-->
	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!-- footer End /////////////////////////////////////-->
	<!--================ End footer Area  =================-->
</body>

</html>
