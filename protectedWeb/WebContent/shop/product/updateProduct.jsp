 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="../../resources/prodmenu/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../../resources/prodmenu/css/animate.css">
    
    <link rel="stylesheet" href="../../resources/prodmenu/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../../resources/prodmenu/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../../resources/prodmenu/css/magnific-popup.css">

    <link rel="stylesheet" href="../../resources/prodmenu/css/aos.css">

    <link rel="stylesheet" href="../../resources/prodmenu/css/ionicons.min.css">

    <link rel="stylesheet" href="../../resources/prodmenu/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../../resources/prodmenu/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../../resources/prodmenu/css/flaticon.css">
    <link rel="stylesheet" href="../../resources/prodmenu/css/icomoon.css">
    <link rel="stylesheet" href="../../resources/prodmenu/css/style.css">
    <!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//============= "등록"  Event 연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "#addProduct" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
			fncAddProduct();
		});
	});	

	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "a[href='#' ]" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
				$("form")[0].reset();
		});
	});	

	function fncAddProduct(){
		//Form 유효성 검증
		
		var prodName=$("input[name='prodName']").val();
	 	//var name = document.detailForm.prodName.value;
	 	var detail=$("input[name='prodDetail']").val();
		//var detail = document.detailForm.prodDetail.value;
		var manuDate=$("input[name='manuDate']").val();
		//var manuDate = document.detailForm.manuDate.value;
		var price=$("input[name='price']").val();
		//var price = document.detailForm.price.value;
	
		if(name == null || name.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		
		$("form").attr("method", "POST").attr("action" , "/product/addProduct").submit();
	}
	
	$(function() {
		$( "#manuDate" ).datepicker({
				dateFormat: "yy-mm-dd"
		});
	});




</script>
</head>

  <body class="goto-here">
		<div class="py-1 bg-black">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ 1235 2355 98</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">youremail@email.com</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						    <span class="text">3-5 Business days delivery &amp; Free Returns</span>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">#PROTECTEDDOG</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li>
	          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">분양</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="shop.html">분양</a>
                <a class="dropdown-item" href="product-single.html">실종</a>

              </div>
            </li>
	          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스토리펀딩</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="shop.html">스토리펀딩</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">병원</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="shop.html">병원</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">PEDIA</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="shop.html">PEDIA</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">COMMUNITY</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="shop.html">COMMUNITY</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MARKET</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="shop.html">MARKET</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
	          <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>

	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->


    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">admin</a></span> <span>page</span></p>
            <h1 class="mb-0 bread">DOG|SHOP 상품등록</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-8 ftco-animate">
						<form action="#" class="billing-form">
							<h3 class="mb-4 billing-heading">상품정보를 등록해주세요</h3>
	          	<div class="row align-items-end">
	          		<div class="col-md-6">
	                <div class="form-group">
	                	<label for="firstname">상품명</label>
	                  <input type="text" class="form-control" name="prodName" id="prodName" placeholder="상품명을 입력해주세요">
	                </div>
	              </div>
	              <div class="w-100"></div>
	              <div class="col-md-6">
	                <div class="form-group">
	                	<label for="lastname">가 격</label>
	                  <input type="text" class="form-control" name="price" id="price" placeholder="가격을 입력해주세요">
	                </div>
                </div>
                <div class="col-md-6">
	                <div class="form-group">
	                	<label for="firstname">원산지</label>
	                  <input type="text" class="form-control" name="country" id="country" placeholder="원산지를 입력해주세요">
	                </div>
	              </div>
		            
		            <div class="col-md-6">
		            	<div class="form-group">
	                	<label for="streetaddress">제조사</label>
	                  <input type="text" class="form-control" name="company" id="company" placeholder="제조사를 입력해주세요">
	                </div>
		            </div>
		           <div class="col-md-6">
		            	<div class="form-group">
	                	<label for="streetaddress">제조일</label>
	                  <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자를 입력해주세요">
	                </div>
		            </div>
		            <div class="w-100"></div>
		            <div class="col-md-6">
		            	<div class="form-group">
	                	<label for="towncity">할인액</label>
	                  <input type="text" class="form-control" id="discoutPridce" name="discountPridce" placeholder="상품의 할인가를 입력해주세요">
	                </div>
		            </div>
		            <div class="col-md-6">
		            	<div class="form-group">
		            		<label for="postcodezip">재고수량</label>
	                  <input type="text" class="form-control" id="quantity" name="quantity" placeholder="상품의 입고수량을 입력해주세요">
	                </div>
		            </div>
		            <div class="w-100"></div>
		            <div class="col-md-12">
	                <div class="form-group">
	                	<label for="phone">상세정보</label>
	                  <textarea class="form-control" id="prodDetail" name="prodDetail" rows="6" placeholder="상품의 상세정보를 입력해주세요"></textarea>
	                </div>
	              <div class="col-md-6">
		            	<div class="form-group">
		            		<label for="postcodezip">상품이미지</label>
	                  <input type="file" class="form-control" placeholder="">
	                </div>
	                
	                <p class="align-items-center"><a href ="#"class="btn btn-primary py-3 px-4" id="addproduct">등록하기</a> &nbsp;<a href="#"class="btn btn-primary py-3 px-4">취소하기</a></p>
	                </div>
	                </div>
	              
               




   
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../../resources/prodmenu/js/google-map.js"></script>
  <script src="../../resources/prodmenu/js/main.js"></script>
  </body>
</html>