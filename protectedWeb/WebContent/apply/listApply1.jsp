 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>LIST APPLY</title>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/resources/prodmenu/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/animate.css">
    
    <link rel="stylesheet" href="/resources/prodmenu/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/aos.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/jquery.timepicker.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/flaticon.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/icomoon.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/style.css">
    
    <style type="text/css">
	    html {
	 		scroll-behavior: smooth;
		}
		.table{
			max-width: wrap;
		}

	</style>
	
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
	      <a class="navbar-brand" href="/index.jsp">#protecteddog</a>
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
            <h1 class="mb-0 bread" id="h1">신청서 확인</h1>
          </div>
        </div>
      </div>
    </div>
    
    

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-8 ftco-animate">
			<form  action="#" class="billing-form">
	          	<div class="row align-items-end">
	          	
	          	
				<input type="hidden" name="id" value="user03" >
				<input type="hidden" name="statusCode" value="1" >
				<input type="hidden" name="adoptNo" value="${ apply.adoptNo }" >
				
				
				
				<div class="col-md-12">
				
	          		<div class="cart-detail bg-light p-3 p-md-4">
	          			
						<div class="form-group">
							<div class="col-md-12">
								<strong>
									각 행을 클릭하면 신청서의 상세 내용을 확인할 수 있으며,<br/>
									입양인을 결정했다면 직접 연락하셔야 합니다.
								</strong>
							</div>
						</div>

					</div>
				</div>
				
	          	
	          	<div class="col-md-12"><br/><hr/></div>
	          	
	          	<div class="col-md-12">
		          	<p><strong>
			    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
			    	</p></strong>
		    	</div>
	          	

	          	<div class="col-md-12"><br/></div>
	          	
	          	
	          	
	          	<!--  table Start /////////////////////////////////////-->
	          	<div class="col-md-12">
  				
  				
			      <table class="table table-hover table-striped" >

			        <thead>
			          <tr>
			            <th><p align="center">No</p></th>
			            <th><p align="center" style="min-width: 60%">신청자 ID</p></th>
			            <th><p align="center" style="min-width: 30%">신청일자</p></th>
			<!-- 			<th align="right">신청서 번호</th> -->
			<!--             <th align="right">신청자 아이디</th> -->
			<!-- 		    <th align="right">신청일자</th> -->
			          </tr>
			        </thead>
			      
			      
					<tbody>
					
					  <c:set var="i" value="0" />
					  <c:forEach var="apply" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<tr name="${ apply.applyNo }">
							<input type="hidden" name="applyNo" value="${ apply.applyNo }">
							<td align="left">${ i }</td>
			<%-- 				<td align="left">${ apply.applyNo }</td> --%>
							<td align="left"  title="Click : 상품정보 확인">${apply.id}</td>
							<td align="left">${apply.regDate}
								<button class="btn btn-primary py-0 px-2">제외</button>
							</td>
						</tr>
						
			          </c:forEach>
			        
			        </tbody>
			      
			      </table>
			      
			     </div> 

				  <!--  table End /////////////////////////////////////-->
				  
				  
			        <div class="col-md-12"><br/></div> 
		          	<div class="col-md-12"><br/></div>
	          	
               		<div class="w-100"></div>
		            <div class="w-100"></div>
               		<div class="w-100"></div>
                
	            </div>
	          </form>
	          
	          <!-- END -->


	          <div class="row mt-5 pt-3 d-flex">
	          	<div class="col-md-12">
					<p><button class="btn btn-primary py-3 px-4 col-md-2">돌아가기</button></p>
	          	</div>
	          </div>
	          
	          
 <!-- 	/////////////////////////////////////////       dialog       ///////////////////////////////////////////////////////////////////// -->

<!-- 			<div id="dialog-terms" title=""> -->
<!-- 			  <p align="center"><br/>약관에 모두 동의해야 신청할 수 있습니다.</p> -->
<!-- 			</div>        -->
<!-- 			<div id="dialog-job" title=""> -->
<!-- 			  <p align="center"><br/>직업을 선택하세요.</p> -->
<!-- 			</div>        -->
<!-- 			<div id="dialog-confirm" title=""> -->
<!-- 			  <p align="left" id="confirm" ></p> -->
<!-- 			</div>      -->
       
<!-- 	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->      
	          
	          
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

    <footer class="ftco-footer bg-light ftco-section">
      <div class="container">
      	<div class="row">
      		<div class="mouse">
						<a href="#" class="mouse-icon">
							<div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
						</a>
					</div>
      	</div>
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Winkel</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Menu</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Shop</a></li>
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Journal</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Help</h2>
              <div class="d-flex">
	              <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
	                <li><a href="#" class="py-2 d-block">Shipping Information</a></li>
	                <li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
	                <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
	                <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
	              </ul>
	              <ul class="list-unstyled">
	                <li><a href="#" class="py-2 d-block">FAQs</a></li>
	                <li><a href="#" class="py-2 d-block">Contact</a></li>
	              </ul>
	            </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

  <script src="/resources/prodmenu/js/jquery.min.js"></script>
  <script src="/resources/prodmenu/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/prodmenu/js/popper.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.easing.1.3.js"></script>
  <script src="/resources/prodmenu/js/jquery.waypoints.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.stellar.min.js"></script>
  <script src="/resources/prodmenu/js/owl.carousel.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/prodmenu/js/aos.js"></script>
  <script src="/resources/prodmenu/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap-datepicker.js"></script>
  <script src="/resources/prodmenu/js/scrollax.min.js"></script>
  <script src="/resources/prodmenu/js/main.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="/resources/events.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>

 	  

	
// 	$( function() {
// 	    $( "#dialog-terms" ).dialog({
// 	    	  autoOpen: false,
// 		      width: 350,
// 		      height: 180,
// 		      modal: true,
// 		      buttons: {
// 		    	  닫기: function(){
// 		    		  $( this ).dialog( "close" );
// 		    		  $("input[name=terms]:checkbox").prop('checked', false).focus();
// 		    	  }
// 		      }
// 	    });
// 	});


//////////////////////    ↑  dialog        ////////////////////////////////////////////////	
	


	// 등록버튼 누르고
	function fncdelApply(){
	
		
// 		if( $("input[name=reason]").val() == '' || $("input[name=reason]").val().length > 300 ){
// 			$("input[name=reason]").focus();
// 			return;
// 		}
// 		if( $("input[name=situation]").val() == '' || $("input[name=situation]").val().length > 300 ){
// 			$("input[name=situation]").focus();
// 			return;
// 		}


    	
    	var job = $("input[name=job]:checked").val();
    	var addr = $("input[name=addr]:checked").val();
    	var mate = $("input[name=mate]:checked").val();
    	var mateAgree = $("input[name=mateAgree]:checked").val();
    	var raise = $("input[name=raise]:checked").val();
    	var currently = $("input[name=currently]:checked").val();
    	var plan = $("input[name=plan]").val();
    	var pay = $("input[name=pay]").val();
    	var reason = $("input[name=reason]").val();
    	var situation = $("input[name=situation]").val();
    	var confirmHTML;
    	
    	
    	if( $("input[name=mate]:checked").val() == "없음" && $("input[name=raise]:checked").val() == "있음" ){
    		confirmHTML = '<strong>[직업]<\/strong> : '+job
						+'<br\/><strong>[거주지 유형]<\/strong> : '+addr
						+'<br\/><strong>[동거인 여부]<\/strong> : '+mate
						+'<br\/><strong>[양육경험]<\/strong> : '+raise
						+'<br\/><strong>[현재 양육 여부]<\/strong> : '+currently
						+'<br\/><strong>[앞으로의 계획]<\/strong> : '+plan
						+'<br\/><strong>[1년 예상비용]<\/strong> : '+pay
						+'<br\/><strong>[입양신청 이유]<\/strong> : '+reason
						+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+situation 
						+'<br\/><br\/><br\/><strong>신청 후 <u>조회, 수정, 삭제<\/u>는 불가능합니다. 신청하시겠습니까?<\/strong>';
    		
    	}else if($("input[name=mate]:checked").val() == "없음" &&  $("input[name=raise]:checked").val() == "없음"  ) {
    		confirmHTML = '<strong>[직업]<\/strong> : '+job
						+'<br\/><strong>[거주지 유형]<\/strong> : '+addr
						+'<br\/><strong>[동거인 여부]<\/strong> : '+mate
						+'<br\/><strong>[양육경험]<\/strong> : '+raise
						+'<br\/><strong>[앞으로의 계획]<\/strong> : '+plan
						+'<br\/><strong>[1년 예상비용]<\/strong> : '+pay
						+'<br\/><strong>[입양신청 이유]<\/strong> : '+reason
						+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+situation 
						+'<br\/><br\/><br\/><strong>신청 후 <u>조회, 수정, 삭제<\/u>는 불가능합니다. 신청하시겠습니까?<\/strong>';
    	}else if($("input[name=mate]:checked").val() == "있음" &&  $("input[name=raise]:checked").val() == "없음"  ) {
    		confirmHTML = '<strong>[직업]<\/strong> : '+job
						+'<br\/><strong>[거주지 유형]<\/strong> : '+addr
						+'<br\/><strong>[동거인 여부]<\/strong> : '+mate
						+'<br\/><strong>[동의 여부]<\/strong> : '+mateAgree
						+'<br\/><strong>[양육경험]<\/strong> : '+raise
						+'<br\/><strong>[앞으로의 계획]<\/strong> : '+plan
						+'<br\/><strong>[1년 예상비용]<\/strong> : '+pay
						+'<br\/><strong>[입양신청 이유]<\/strong> : '+reason
						+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+situation 
						+'<br\/><br\/><br\/><strong>신청 후 <u>조회, 수정, 삭제<\/u>는 불가능합니다. 신청하시겠습니까?<\/strong>';
    	}else{
    		confirmHTML = '<strong>[직업]<\/strong> : '+job
						+'<br\/><strong>[거주지 유형]<\/strong> : '+addr
						+'<br\/><strong>[동거인 여부]<\/strong> : '+mate
						+'<br\/><strong>[동의 여부]<\/strong> : '+mateAgree
						+'<br\/><strong>[양육경험]<\/strong> : '+raise
						+'<br\/><strong>[현재 양육 여부]<\/strong> : '+currently
						+'<br\/><strong>[앞으로의 계획]<\/strong> : '+plan
						+'<br\/><strong>[1년 예상비용]<\/strong> : '+pay
						+'<br\/><strong>[입양신청 이유]<\/strong> : '+reason
						+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+situation 
						+'<br\/><br\/><br\/><strong>신청 후 <u>조회, 수정, 삭제<\/u>는 불가능합니다. 신청하시겠습니까?<\/strong>';
    	}
    	
    	if( mateAgree == '' ){
    		$("input[name=mateAgree]:checked").val('X');
    	}
    	if( currently == '' ){
    		$("input[name=currently]:checked").val('X');
    	}
    	
		$('#cfHTML').remove();
		$('#confirm').html( confirmHTML );
		$('#dialog-confirm').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
		$('#dialog-confirm').dialog( "open" );
				
	}
	
    
    $(function() {
		$( "button:contains('제외')" ).on("click" , function() {
// 			fncdelApply();
		});
	 });	
      
      
    </script>
  
  
  </body>
</html>