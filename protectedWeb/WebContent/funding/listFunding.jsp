 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  	   #btn-add{
		background: #fff;
        border:2px solid #29304d;
		color:#29304d;
		height:40px;
		width:150px;
		}      
    </style>
    
    
  </head>
  <body class="goto-here">
 	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->  
   	
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">support</a></span> <span>apply</span></p>
            <h1 class="mb-0 bread">후원신청</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section bg-light">
    	<div class="container" >
    		<div class="row">
    			<div class="col-md-8 col-lg-10 order-md-last">
    				<div class="row">
	    			<c:set var="i" value="0" />
					  <c:forEach var="funding" items="${list}">
		    			<div class="col-sm-6 col-md-6 col-lg-4 ftco-animate">
		    				<div class="product">
		    					<a href="#" class="img-prod"><img class="img-fluid" src="/resources/file/fileSF/${funding.mainFile}" alt="Colorlib Template" style="min-height:210px;" >
		    					<input type="hidden" value="${funding.postNo }" />
		    					</a>
		    					<div class="text py-3 px-3">
		    						<h2><a href="#">${funding.postTitle}</a></h2>
		    						<h3><a href="#">닉네임&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b><strong style="color:#225cba">${30-funding.voteRemainDate}%</strong></b></a></h3>
								 <div class="progress">
								  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="50" style="width: ${30-funding.voteRemainDate}%;"></div>
								 </div>	
								 <div align="right">	    						
								<h4 class="media-heading">D- ${funding.voteRemainDate }</h4> 	
								</div>
		    					</div>
		    				</div>
		    			</div>
		    			</c:forEach>    
		    		</div>	
		    	</div>
    		</div>	
    	</div>
  		  <div class="form-group text-center">
	  			<button type="button" id="btn-add">작성하기</button>
		  </div>  
    </section>
    <!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
    
    <!--================ start footer Area  =================-->
    <!-- footer Start /////////////////////////////////////-->
	 <jsp:include page="/layout/footer.jsp"></jsp:include>
   	<!-- footer End /////////////////////////////////////-->  
    <!--================ End footer Area  =================-->
  

  <!-- loader -->

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
 
 	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
    $(function(){
	    
		//============= 썸네일 사진 클릭 Event  처리 =============	
	 	$( ".img-prod" ).on("click" , function() {
			$(self.location).attr("href","/funding/getFunding?postNo="+$(this).children("input").val());
		});   
	
        //============= 작성 Event  처리 =============   
        $( "#btn-add" ).on("click" , function() {
        	$(self.location).attr("href","/funding/getTerms?termsTitle=SFPost");

           });
        
    });
	
    </script>
  </body>
</html>