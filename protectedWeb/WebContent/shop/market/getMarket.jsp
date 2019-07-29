
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/get/css/bootstrap.css" />
<link rel="stylesheet" href="/resources/get/css/icon/style.css" />
<link rel="stylesheet" href="/resources/get/css/font-awesome.min.css" />
<link rel="stylesheet" href="/resources/get/css/themify-icons.css" />
<link rel="stylesheet" href="/resources/get/css/owl.carousel.min.css" />
<link rel="stylesheet" href="/resources/get/css/simpleLightbox.css" />
<link rel="stylesheet" href="/resources/get/css/nice-select.css" />
<link rel="stylesheet" href="/resources/get/css/animate.css" />
<link rel="stylesheet" href="/resources/get/css/jquery-ui.css" />
<!-- main css -->
<link rel="stylesheet" href="/resources/get/css/style.css" />
<link rel="stylesheet" href="/resources/get/css/responsive.css" />
<!-- Google Mdl -->

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>


<style>
.form-group2 {
	padding-left: 420px;
	padding-right: 100px;
}

.form-group3 {
	padding-left: 465px;
	padding-right: 100px;
}

table, td{
border: 1px 
}
table{
width:60%;
height: 100px;
margin: auto;
text-align: center;
text-size: small;
}
</
</style>


</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->
	<!--================Header Menu Area =================-->

	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">

					<p />
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">

							<c:forEach var="i" begin="0" end="${fn:length(file)-1}" step="1">
								<c:if test="${i eq 0}">
									<li data-target="#carouselExampleIndicators"
										data-slide-to="${i}" class="active">
								</c:if>
								<c:if test="${!(i eq 0)}">
									<li data-target="#carouselExampleIndicators"
										data-slide-to="${i}">
								</c:if>
							</c:forEach>

						</ol>
						<div class="carousel-inner">


							<c:forEach var="name" items="${file}" varStatus="status">
								<c:if test="${status.first}">
									<c:set var="className" value="carousel-item active" />
								</c:if>
								<c:if test="${!(status.first)}">
									<c:set var="className" value="carousel-item" />
								</c:if>
								<div class="${className}">
									<img class="d-block w-100"
										src="../../resources/file/fileMarket/${name.fileName}"
										width="450px;" height="450px;" />
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<div>
							<input type="hidden" value="${board.postNo}" /> <input
								type="hidden" value="${board.boardCode}" />
							<h3>${board.postTitle}</h3>${board.id}
							<h3>${board.prodName}</h3>
							<h2>
								<fmt:formatNumber value="${board.price}" pattern="#,###" />
								원
							</h2>

							<ul class="list">
							</ul>
							<p>
							<br>
							${board.postContent}
								
							</p>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<p align="right"><button class="mdl-button mdl-js-button mdl-button--primary">
 수정하기
</button><!-- Accent-colored flat button -->
<button class="mdl-button mdl-js-button mdl-button--accent">
  삭제하기
</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</P>
<p>
		<!--================End Product Description Area =================-->
	<input type="hidden" name="postNo" value="${board.postNo}" />
<input type="hidden" name="boardCode" value="IS" />	
<jsp:include page="/common/comment.jsp"></jsp:include>
</p>
		<!--================ End footer Area  =================-->

		<!-- Optional JavaScript -->
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="../../resources/get/js/jquery-3.2.1.min.js"></script>
		<script src="../../resources/get/js/popper.js"></script>
		<script src="../../resources/get/js/bootstrap.min.js"></script>
		<script src="../../resources/get/js/stellar.js"></script>
		<script src="../../resources/get/js/simpleLightbox.min.js"></script>
		<script src="../../resources/get/js/jquery.nice-select.min.js"></script>
		<script src="../../resources/get/js/imagesloaded.pkgd.min.js"></script>
		<script src="../../resources/get/js/isotope-min.js"></script>
		<script src="../../resources/get/js/owl.carousel.min.js"></script>
		<script src="../../resources/get/js/jquery.ajaxchimp.min.js"></script>
		<script src="../../resources/get/js/mail-script.js"></script>
		<script src="../../resources/get/js/jquery-ui.js"></script>
		<script src="../../resources/get/js/jquery.waypoints.min.js"></script>
		<script src="../../resources/get/js/jquery.counterup.js"></script>
		<script src="../../resources/get/js/theme.js"></script>

		<script type="text/javascript">
		
		//============= 상품정보 GET/UPDATE Event  처리 =============
		 $(function() {
			 
			/// SCRIPT
			 var commentData =  
			 {
			    commentContent       : $("input[name=commentContent]").val(),
			    postNo         : $("input[name=postNo]").val(),
			    boardCode       : $("input[name=boardCode]").val()
			 } ;
			 
			
			 //manage//====================================================
			 $( "button:contains('확인')" ).on("click" , function() {
				//Debug..
				console.log($( "td.ct_btn01:contains('확인')" ).html());
				/* self.location = "/product/listProduct/manage" */
				self.location = "/product/listProduct"
			});
				console.log($( "button:contains('수정')" ).html());
				$("#re").bind("click", function() {
					self.location = "/product/updateProduct?prodNo=${product.prodNo}"
				});
			});
			 

			
			 $( "button:contains('뒤로')" ).on("click" , function() {
				//Debug..
				console.log($( "button:contains('뒤로')" ).html());
				self.location = "/product/listProduct"
			});
		});

		
		 //=============장바구니 이동========================================

	
		
		
		
		
		</script>
</body>
</html>
