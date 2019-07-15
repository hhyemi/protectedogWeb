<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->



<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--  ///////////////////////// google MDL ////////////////////////// -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
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
	      <a class="navbar-brand" href="index.html">Winkel</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
	          <li class="nav-item dropdown active">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="shop.html">Shop</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
	          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
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
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">my</a></span> <span>Cart</span></p>
            <h1 class="mb-0 bread">DOG|Shop 구매 목록조회</h1>
          </div>
        </div>
      </div>
    </div>

	
		<!--  table Start /////////////////////////////////////-->
      <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" align="center">
   
      <thead>
    <tr>
      <th class ="mdl-data-table__cell--non-numeric" align="center">No</th>
            <th align="left">회원ID</th>
            <th align="left">회원명 </th>
            <th align="left">전화번호</th>
            <th align="left">배송현황</th>
             <th align="left">정보수정</th>
    </tr>
        </thead>
			
	<!-- 	<c:set var="i" value="0"/>
		<c:forEach var = "purchase" items="${list}">
		<c:set var="i" value="${i+1}" />-->
	
	<tbody>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Acrylic (Transparent)</td>
      <td>25</td>
      <td>$2.90</td>
      <td>25</td>
      <td>23</td>
      <td>24</td>
    </tr>
     <tr>
      <td class="mdl-data-table__cell--non-numeric">Acrylic (Transparent)</td>
      <td>25</td>
      <td>$2.90</td>
      <td>25</td>
      <td>23</td>
      <td>24</td>
    </tr>
     <tr>
      <td class="mdl-data-table__cell--non-numeric">Acrylic (Transparent)</td>
      <td>25</td>
      <td>$2.90</td>
      <td>25</td>
      <td>23</td>
      <td>24</td>
    </tr>
     <tr>
      <td class="mdl-data-table__cell--non-numeric">Acrylic (Transparent)</td>
      <td>25</td>
      <td>$2.90</td>
      <td>25</td>
      <td>23</td>
      <td>24</td>
    </tr>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Plywood (Birch)</td>
      <td>25</td>
      <td>$2.90</td>
      <td>25</td>
      <td>23</td>
      <td>24</td>
    </tr>
    <tr>
      <td class="mdl-data-table__cell--non-numeric">Laminate (Gold on Blue)</td>
      <td>25</td>
      <td>$2.90</td>
      <td>25</td>
      <td>23</td>
      <td>24</td>
    </tr>
  </tbody>

	<!--</c:forEach>-->
	</table>
	
</body>
</html>