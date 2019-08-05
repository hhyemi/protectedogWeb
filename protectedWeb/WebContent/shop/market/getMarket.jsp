
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

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<style>
@font-face {
	font-family: NanumSquare;
	src: url(http://ssl.pstatic.net/static/kin/fonts/NanumSquareR.woff2)
		format("woff2");
}

body {
	font-family: NanumSquare, sans-serif !important;
}

.form-group3 {
	padding-left: 465px;
	padding-right: 100px;
}

table, td {
	border: 1px
}

table {
	width: 60%;
	height: 100px;
	margin: auto;
	text-align: center;
	text-size: small;
}

.pricecolor {
	color: #f04f23;
}

.s_product_text {
	margin-top: 30px;
}
</style>


</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--================Single Product Area =================-->

	<div class="product_image_area">
		<form class="form-inline" name="detailForm">
			<div class="container">
				<div class="row s_product_inner">
					<div class="col-lg-6">

						<p />
						조회수 ${board.viewCount }&nbsp;|&nbsp;작성일 ${board.regDate}
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
											height="450px;" />
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
					<div class="col-lg-5 offset-lg-1">
						<div class="s_product_text">
							<div>
								<input type="hidden" value="${board.postNo}" /> <input
									type="hidden" value="${board.boardCode}" /> <font size="6">${board.postTitle}</font>&nbsp;&nbsp;&nbsp;<font
									size="3">${board.nickName}</font> <br /> <br />
								<h3>상품명 : ${board.prodName}</h3>
								<h2 class="pricecolor">
									<fmt:formatNumber value="${board.price}" pattern="#,###" />
									원
								</h2>

								<ul class="list">
								</ul>



								거래지역 : ${board.city}<br /> 판매자 연락처 :
									<c:if test="${user.role eq 'admin'||user.role eq 'user'}">
								${board.phone}
</c:if>
									<c:if test="${! user.role eq 'user'}">
								회원 연락처는 가입한 회원에게만 제공됩니다
</c:if>

								<hr>
								<br /> ${board.postContent}<br /> <br /> <br />
								<br />
								<br />


								<div class="form-group2" align="right">
									<div class="col-md-5">
										<c:if test="${user.id eq board.id || user.id eq 'admin'}">

											<button type="button" id="change" class="btn btn-default">수정하기</button>
											<button type="button" id="btnDelete" class="btn btn-default">삭제하기</button>
										</c:if>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- ■■■■■■■■■■■■■■■■■■■■■■■Comment■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<input type="hidden" name="postNo" value="${board.postNo}" />
	<input type="hidden" name="boardCode" value="MK" />
	<jsp:include page="/common/comment.jsp"></jsp:include>
	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

	<!--================ End footer Area  =================-->

	<!-- Optional JavaScript -->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/resources/get/js/jquery-3.2.1.min.js"></script>
	<script src="/resources/get/js/popper.js"></script>
	<script src="/resources/get/js/bootstrap.min.js"></script>
	<script src="/resources/get/js/stellar.js"></script>
	<script src="/resources/get/js/simpleLightbox.min.js"></script>
	<script src="/resources/get/js/jquery.nice-select.min.js"></script>
	<script src="/resources/get/js/imagesloaded.pkgd.min.js"></script>
	<script src="/resources/get/js/isotope-min.js"></script>
	<script src="/resources/get/js/owl.carousel.min.js"></script>
	<script src="/resources/get/js/jquery.ajaxchimp.min.js"></script>
	<script src="/resources/get/js/mail-script.js"></script>
	<script src="/resources/get/js/jquery-ui.js"></script>
	<script src="/resources/get/js/jquery.waypoints.min.js"></script>
	<script src="/resources/get/js/jquery.counterup.js"></script>
	<script src="/resources/get/js/theme.js"></script>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">


<!--  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■script■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script type="text/javascript">
	function fncGetList(currentPage) {
	   	
	   	$("#currentPage").val(currentPage)
	   	$("form").attr("method" , "POST").attr("action" , "/funding/getMarket").submit();
	 
	}   
		
		
		//============= 상품정보 GET/UPDATE Event  처리 =============
		
			//============= 수정하기 Event  처리 =============	
			 	$( "#change" ).on("click" , function() {
			 			swal("거래중인 게시글은 수정을 추천하지 않습니다.");   
			 		 self.location = "/market/updateMarket?postNo=${board.postNo}";
			 		}
				});   

		
		//============= 삭제하기 Event  처리 =============	
		 	$( "#btnDelete" ).on("click" , function() {
		 		swal({
		            title: "정말 삭제 하시겠습니까 ?",
		            icon: "warning",
		            buttons: true,
		            dangerMode: true,
		          })
		          .then((willDelete) => {
		            if (willDelete) {
		              swal("삭제가 완료되었습니다!", {
		                icon: "success",
		              }).then((value) => {
		            	  self.location = "/market/delMaket?postNo=${board.postNo}"
		              });
		            }
		          });	 		
			});  
		
	    });

		
		 //=============장바구니 이동========================================

	
		
		
		
		
		</script>
</body>
</html>
