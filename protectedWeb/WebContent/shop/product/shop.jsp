<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- ////////////	Bootsrap, css ///////////////////////// -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">

<link rel="stylesheet"
	href="../../resources/prodmenu/css/open-iconic-bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

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

<!-- <link rel="stylesheet" -->
<!-- 	href="../../resources/prodmenu/css/bootstrap-datepicker.css"> -->



<link rel="stylesheet" href="../../resources/prodmenu/css/flaticon.css">
<link rel="stylesheet" href="../../resources/prodmenu/css/icomoon.css">
<link rel="stylesheet" href="../../resources/prodmenu/css/style.css">
<!-- <script src="./../resources/prodmenu/js/jquery.min.js"></script> -->
<!-- jQuery UI toolTip 사용 CSS-->
<!-- <link rel="stylesheet" -->
<!-- 	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<script src="../../resources/prodmenu/js/jquery-migrate-3.0.1.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	
</script>


</head>
<div class="hero-wrap hero-bread"
	style="background-image: url('images/bg_6.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span>
				</p>
				<h1 class="mb-0 bread">Collection Products</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section bg-light">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-10 order-md-last">
				<div class="container">
					<div class="row">
						<input type="hidden" id="currentPageList" name="currentPageList"
							value="${resultPage.currentPage}" />
						<div class="col-md-8 col-lg-10 order-md-last">
							<c:set var="i" value="0" />
							<c:forEach var="product" items="${list}">
								<c:set var="i" value="${i+1}" />
								<div class="col-sm-6 col-md-6 col-lg-4 ftco-animate">
									<div class="product">
										<a href="#" class="img-prod"><img class="img-fluid"
											src="images/product-1.jpg" alt="Colorlib Template"> <span
											class="status">30%</span>
											<div class="overlay"></div> </a>
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
												<a href="#" class="add-to-cart text-center py-2 mr-1"><span>장바구니에 담기 <i class="ion-ios-add ml-1"></i>
												</span></a> <a href="#" class="buy-now text-center py-2">구매하기<span><i
														class="ion-ios-cart ml-1"></i></span></a>
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
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

			<div class="col-md-4 col-lg-2 sidebar">
				<div class="sidebar-box-2">
					<h2 class="heading mb-4">
						<a href="#">Clothing</a>
					</h2>
					<ul>
						<li><a href="#">Shirts &amp; Tops</a></li>
						<li><a href="#">Dresses</a></li>
						<li><a href="#">Shorts &amp; Skirts</a></li>
						<li><a href="#">Jackets</a></li>
						<li><a href="#">Coats</a></li>
						<li><a href="#">Sleeveless</a></li>
						<li><a href="#">Trousers</a></li>
						<li><a href="#">Winter Coats</a></li>
						<li><a href="#">Jumpsuits</a></li>
					</ul>
				</div>
				<div class="sidebar-box-2">
					<h2 class="heading mb-4">
						<a href="#">Jeans</a>
					</h2>
					<ul>
						<li><a href="#">Shirts &amp; Tops</a></li>
						<li><a href="#">Dresses</a></li>
						<li><a href="#">Shorts &amp; Skirts</a></li>
						<li><a href="#">Jackets</a></li>
						<li><a href="#">Coats</a></li>
						<li><a href="#">Jeans</a></li>
						<li><a href="#">Sleeveless</a></li>
						<li><a href="#">Trousers</a></li>
						<li><a href="#">Winter Coats</a></li>
						<li><a href="#">Jumpsuits</a></li>
					</ul>
				</div>
				<div class="sidebar-box-2">
					<h2 class="heading mb-2">
						<a href="#">Bags</a>
					</h2>
					<h2 class="heading mb-2">
						<a href="#">Accessories</a>
					</h2>
				</div>
				<div class="sidebar-box-2">
					<h2 class="heading mb-4">
						<a href="#">Shoes</a>
					</h2>
					<ul>
						<li><a href="#">Nike</a></li>
						<li><a href="#">Addidas</a></li>
						<li><a href="#">Skechers</a></li>
						<li><a href="#">Jackets</a></li>
						<li><a href="#">Coats</a></li>
						<li><a href="#">Jeans</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>




<script src="../../resources/prodmenu/js/popper.min.js"></script>
<script src="../../resources/prodmenu/js/bootstrap.min.js"></script>
<script src="../../resources/prodmenu/js/jquery.easing.1.3.js"></script>
<script src="../../resources/prodmenu/js/jquery.waypoints.min.js"></script>
<script src="../../resources/prodmenu/js/jquery.stellar.min.js"></script>
<script src="../../resources/prodmenu/js/owl.carousel.min.js"></script>
<script src="../../resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
<script src="../../resources/prodmenu/js/aos.js"></script>
<script src="../../resources/prodmenu/js/jquery.animateNumber.min.js"></script>
<!-- 	<script src="./../resources/prodmenu/js/bootstrap-datepicker.js"></script> -->
<script src="../../resources/prodmenu/js/scrollax.min.js"></script>
<script src="../../resources/prodmenu/js/main.js"></script>
<!-- ////////////////////달력 /////////////////////////////-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>
</html>