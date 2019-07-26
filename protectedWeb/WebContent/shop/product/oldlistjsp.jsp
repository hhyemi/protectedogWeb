<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">
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
#prolist {
	white-space: nowrap;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->


<script type="text/javascript">
	//=============    검색 / page 두가지 경우 모두  Event  처리	 =============	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action",
				"/product/listProduct").submit();
	}

	//=============    상품상세조회(썸네일)  Event  처리 		=============
	//============= 썸네일 사진 클릭 Event  처리 =============	
	 	$(function() {
		$(".img-prod").on("click",function() {
			//alert($(this).children("input").val())
					$(self.location).attr("href","/product/getProduct?prodNo="+ $(this).children("input").val());
				});
		
		$("#getproduct").on("click",function() {
			//alert($(this).children("input").val())
					$(self.location).attr("href","/product/getProduct?prodNo="+ $(this).children("input").val());
				});
	 	});	 
	
	 	 $(function() {
				
			 
			 $( "td.ct_btn01:contains('장바구니로 이동')" ).on("click" , function() {
				 //alert("");
				 self.location ="/shop/addCart?prodNo=${param.prodNo}"
		
					
			 });
			 
		
		});
	

</script>


</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	<!--//////////////////////////// Sub Toolbar Start/////////////////////////////-->
	<div class="hero-wrap hero-bread">
		<a style="background-image: url('/resources/file/fileShop/${product.mainFile}');">
		<input type="hidden" value="${product.prodNo}"/></a>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span>
					</p>
					<h1 class="mb-0 bread">protected shop#보호샵</h1>
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
							<div class="col-md-8 col-lg-10 order-md-last" id="prolist">
								<div class="row" align="center">
									<c:set var="i" value="0" />
									<c:forEach var="product" items="${list}">
										<c:set var="i" value="${i+1}" />
										<div class="col-sm-6 col-md-6 col-lg-4 ftco-animate">
											<div align="center">
												<div class="product">
													<a class="img-prod">
													<input type="hidden" value="${product.prodNo}"/>
													<img class="img-fluid"
														src="../../resources/file/fileShop/${product.mainFile}"
														alt="Colorlib Template"> <span class="status">
															<!-- 30% -->
													</span>
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


														</div>
														<p class="bottom-area d-flex px-3">
															<a class="add-to-cart text-center py-2 mr-1"><input type="hidden" value="${product.prodNo}"/>
															<span>장바구니에
																	담기&nbsp;&nbsp;<i class="ion-ios-add ml-1"></i>
															</span></a> <a class="buy-now text-center py-2" id="getproduct"><input type="hidden" value="${product.prodNo}"/>상세정보&nbsp;&nbsp;&nbsp;<span><i
																	class="ion-ios-cart ml-1"></i></span></a>
														</p>
													</div>
												</div>
											</div>

										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- thumbnail -->
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
							<li><a href="#">전연령용</a></li>
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

						</ul>
						<br>
						<div class="sidebar-box-2">
							<h2 class="heading mb-4">
								<a href="#">중고마켓</a>
							</h2>

						</div>

						<div class="sidebar-box-2">
							<h2 class="heading mb-4">
								<a href="#">장바구니</a>
							</h2>

						</div>

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