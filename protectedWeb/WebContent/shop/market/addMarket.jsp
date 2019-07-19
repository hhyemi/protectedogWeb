<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
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
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//============= "등록"  Event 연결 =============
	$(function() {

		$("#addproduct").on(
				"click",
				function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
					$("form[name='addForm']").attr("method", "POST").attr("action", "/market/addMarket").submit();
					//fncAddProduct();
				});
	});

	//  	$(function() {

	// 		$("#addproduct").on("click", function() {
	// 			self.location = "/shop/product/addProduct"
	// 		});

	// 	});

	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$("a[href='#' ]").on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			$("form")[0].reset();
		});
	});

	function fncAddProduct() {
		//Form 유효성 검증

		// 		var prodName=$("input[name='prodName']").val();
		// 	 	//var name = document.detailForm.prodName.value;
		// 	 	var prodDetail=$("input[name='prodDetail']").val();
		// 		//var detail = document.detailForm.prodDetail.value;
		// 		var manuDate=$("input[name='manuDate']").val();
		// 		//var manuDate = document.detailForm.manuDate.value;
		// 		var price=$("input[name='price']").val();
		// 		//var price = document.detailForm.price.value;

		// 		if(prodName == null || prodName.length<1){
		// 			alert("상품명은 반드시 입력하여야 합니다.");
		// 			return;
		// 		}

		// 		if(manuDate == null || manuDate.length<1){
		// 			alert("제조일자는 반드시 입력하셔야 합니다.");
		// 			return;
		// 		}
		// 		if(price == null || price.length<1){
		// 			alert("가격은 반드시 입력하셔야 합니다.");
		// 			return;
		// 		}

		//$("form[name='addForm']").attr("method", "POST").attr("action","/product/addProduct").submit;
	}

	//============= 달력  =============
	$(function() {
		$("input[name='manuDate']").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--//////////////////////////// Sub Toolbar Start/////////////////////////////-->
	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">중고</a></span> <span>장터</span>
					</p>
					<h1 class="mb-0 bread">DOG|SHOP 보호마켓</h1>
				</div>
			</div>
		</div>
	</div>
	<!--//////////////////////////// Sub Toolbar end/////////////////////////////-->

	<!-- ///////////////////////////body navigation tag/////////////////////////// -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-8 ftco-animate">

					<!-- ///////////////////////////body navigation tag/////////////////////////// -->

					<!--////////////////////////// form tag Start /////////////////////////////////-->
					<form class="billing-form" name="addForm">
						<h3 class="mb-4 billing-heading">등록정보를 입력해주세요</h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">판매자</label> <input type="text"
										class="form-control" name="id" id="id"
										placeholder="상품명을 입력해주세요" value="테스트">
								</div>
							</div>

<!-- 							<div class="col-md-6"> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label for="firstname">연락처</label> <input type="text" -->
<!-- 										class="form-control" name="phone" id="phone" -->
<!-- 										placeholder="상품명을 입력해주세요" value="테스트"> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">상품명</label> <input type="text"
										class="form-control" name="prodName" id="prodName"
										placeholder="상품명을 입력해주세요" value="테스트">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">판매가격</label> <input type="text"
										class="form-control" name="price" id="price"
										placeholder="판매가격을 입력해주세요">
								</div>
							</div>
							<hr />
							<div class="col-md-12">
								<div class="form-group">
									<label for="firstname"></label> <input type="text"
										class="form-control" name="postTitle" id="postTitle"
										placeholder="제목을 입력해주세요">
								</div>
								<div class="w-100"></div>

								<div class="col-md-13">
									<div class="form-group">
										<label for="streetaddress"></label>
										<textarea class="form-control" rows="6" name="postContent"
											placeholder="내용을 입력해주세요"></textarea>
									</div>
								</div>
							</div>
							</div>
							<div class="w-100"></div>
						
						<p align="center">
							<a class="btn btn-primary py-3 px-4" id="addproduct">등록하기</a>
							&nbsp;<a href="#" class="btn btn-primary py-3 px-4">취소하기</a>
						</p>
					</form>
					<!-- ////////////////////////////form tag end //////////////////////////////-->
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