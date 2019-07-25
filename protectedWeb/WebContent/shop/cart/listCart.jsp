
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
</head>



<div class="hero-wrap hero-bread"
	style="background-image: url('images/bg_6.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">my</a></span> <span>Cart</span>
				</p>
				<h1 class="mb-0 bread">DOG|Shop 장바구니</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>상품명</th>
								<th>상품가격</th>
								<th>수량</th>
								<th>구매가격</th>
							</tr>
						</thead>
						<tbody>
							<tbody>

							<c:set var="i" value="0" />
							<c:forEach var="cart" items="${list}">
  							<c:set var="i" value="${ i+1 }" />
						      <tr class="text-center">
								<td class="product-remove"><a href="#"><span
										class="ion-ios-close"></span></a></td>

								<td class="image-prod"><div class="img"
										style="background-image: url(../../resources/prodmenu/images/product-3.jpg);"></div></td>

								<td class="product-name"><input type="hidden"
									value="${product.prodNo}" />
									<h3>${product.prodName}</h3></td>

								<td class="price">${product.price}</td>

								<td class="quantity">
									<div class="input-group mb-3">
										<input type="text" name="quantity"
											class="quantity form-control input-number" value="1" min="1"
											max="100">
									</div>
								</td>

								<td class="total">${cart.totalPrice}</td>
							</tr>
							<!-- END TR-->

						</c:forEach>
						</tbody>
						
						  
					</table>
					  </div>
    			</div>
    		</div>
    		<div class="row justify-content-center">
    			<div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>TOTAL PRICE</h3>
    					<p class="d-flex">
    						<span>상품가격</span>
    						<span>$0.00</span>
    					</p>
    					<p class="d-flex">
    						<span>할인액</span>
    						<span>$0.00</span>
    					</p>
    					<p class="d-flex">
    						<span>수량</span>
    						<span>0</span>
    					</p>
    					<hr>
    					<p class="d-flex total-price">
    						<span>총 가격</span>
    						<span>$17.60</span>
    					</p>
    				</div>
    				<p class="text-center">
					<a href="checkout.html" class="btn btn-primary py-3 px-4">구매하기</a>
				</p>
    			</div>
    		</div>
			</div>
		</section>

  
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>


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
	src="../../https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../../resources/prodmenu/js/google-map.js"></script>
  <script src="../../resources/prodmenu/js/main.js"></script>

  <script>
			$(document).ready(function() {

				var quantitiy = 0;
				$('.quantity-right-plus').click(function(e) {

					// Stop acting like a button
					e.preventDefault();
					// Get the field name
					var quantity = parseInt($('#quantity').val());

					// If is not undefined

					$('#quantity').val(quantity + 1);

					// Increment

				});

				$('.quantity-left-minus').click(function(e) {
					// Stop acting like a button
					e.preventDefault();
					// Get the field name
					var quantity = parseInt($('#quantity').val());

					// If is not undefined

					// Increment
					if (quantity > 0) {
						$('#quantity').val(quantity - 1);
					}
				});

			});
		</script>
    
  </body>
</html>