<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8
">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>보호할개 · 스토어</title>


<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" > -->
<!--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->


<!--  ///////////////////////// CSS ////////////////////////// -->

<!-- Core Stylesheets -->
<link rel="stylesheet" href="/resources/newTemplate/css/shop.css">


<!--  ///////////////////////// JavaScript ////////////////////////// -->
<style>
		#checkPostTitle{

	      padding:0 5px;
	      overflow:hidden;
	      text-overflow:ellipsis;
	      white-space:nowrap;
	  } 
.img-fluid {
	padding-left:8%;
	padding-top: 10%;
	min-height: 240px;
	max-height: 240px;
	overflow: auto;
	max-width: 200px;
	min-width: 200px;
}
.card {
	min-height: 470px;
	max-height: 470px;
	
}
.detailtext {
	min-height: 80px;
	max-height: 80px;
}
		#searchKeyword {
			height: 40px;
			width: 150px;
			border : 1px solid #D3D3D3;
			padding-left: 5px;
			border-right: 0px;
		}
#searchSubmmit {
	width: 60px;
	height: 40px;
	border-radius: 0px 15px 15px 0px;
	border: 1px solid #D3D3D3;
	margin-left: 0;
}
#searchCondition {
	height: 40px;
	border-radius: 15px 0px 0px 15px;
	border-right:0;
}
#selectPageSize {
	height: 30px;
}

</style>



	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->


</head>

<body id="page-top">

	<!--====================================================
                         HEADER
======================================================-->



	<!-- ///////////////////////////////////////////////////////////////////////////////////////////////// -->
<body class="goto-here">
	<div class="hero-wrap hero-bread"
		style="padding-bottom: 30px; padding-top: 60px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p>
						<span class="mr-2">Protectedog</span> <span>Store</span>
					</p>
					<font size="7">보호할개 스토어</font>
				</div>
			</div>
			
		</div>
	</div>
	<br />
	<p />

	<!--====================================================
                        SHOP-P1
======================================================-->
	<section id="shop-p1" class="shop-p1">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="shop-p1-title">
						<h3>카테고리</h3>
						<div class="heading-border-light"></div>
					</div>
					<div class="list-group">
						<a class="list-group-item" id="total"${ search.prodCondition==0 || empty search.prodCondition ? " style='background: #f04f23;color:#ffffff'" : "" }>> 전체 </a> <a
							class="list-group-item" id="four" ${ search.prodCondition==4 ? " style='background: #f04f23;color:#ffffff'" : "" }>베스트상품</a> <a
							class="list-group-item" id="one" ${ search.prodCondition==1 ? " style='background: #f04f23;color:#ffffff'" : "" }>사료</a> <a
							class="list-group-item" id="two" ${ search.prodCondition==2 ? " style='background: #f04f23;color:#ffffff'" : "" }>간식</a> <a
							class="list-group-item" id="three" ${ search.prodCondition==3 ? " style='background: #f04f23;color:#ffffff'" : "" }>의류</a>
						<c:if test="${ sessionScope.user.role eq 'admin' }">
							<a class="list-group-item" id="three" style="background-color: #dbd9d7">> 관리자 메뉴 </a>
						</c:if>
						<c:if test="${ sessionScope.user.role eq 'admin' }">
							<a class="list-group-item" id="admin">상품등록관리</a>
						</c:if>
						<c:if test="${ sessionScope.user.role eq 'admin' }">
							<a class="list-group-item" id="adminOrder">구매상태관리</a>
						</c:if>
						<c:if test="${ sessionScope.user.role eq 'admin' }">
							<a class="list-group-item" id="cancleOrder">취소주문관리</a>
						</c:if>
					</div>


					<br /> &nbsp;&nbsp;&nbsp;&nbsp;<a class="orderhistory"> <c:if
							test="${ sessionScope.user.role eq 'user' }">
					주문상품
						조회&nbsp;&nbsp;
					<img src="/resources/file/fileShop/order.png" width="20px">
						</c:if>
					</a>


				</div>

<%--     		    <c:if test="${resultPage.totalCount eq 0 }"> --%>
<%-- 			 		<jsp:include page="/common/searchResult.jsp"></jsp:include> --%>
<%-- 			 	</c:if> --%>
				<!-- 썸네일 Start //////////////////////////////////////////////////////////////////-->
 				<div class="col-lg-9">
					<div class="row" style="padding-top: 0px;">
					
					<div class="col-md-12" style="padding-bottom: 18px">
						<!--서치 -->
						전체 ${resultPage.totalCount} 건 | 현재 ${resultPage.currentPage} 페이지
						<div style="float: right;">
							<form class="form-inline" name="detailForm">
								<div class="form-group">
									<select class="form-control" id="searchCondition"
										name="searchCondition">
										<option value="0"
											${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품명</option>
										<option value="1"
											${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품가격</option>
									</select>
								</div>


								<div class="form-group">
									<label class="sr-only" for="searchKeyword">검색어</label> 
									<input type="text" class="form-control searchKeyword"id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력해주세요" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
<%-- 									<input type="text" class="form-control searchCondition"id="searchCondition" name="searchCondition" placeholder="검색어" value="${! empty search.searchCondition ? search.searchCondition : '' }"> --%>
									<button type="button" id="searchSubmmit"
										class="btn btn-default searchSubmmit">
										<span class="fas fa-search"></span>
									</button>
								</div>
<!-- 								PageNavigation 선택 페이지 값을 보내는 부분  -->
								<input type="hidden" id="currentPage" name="currentPage" value="" />
							</form>
<%-- 								<input type="hidden" name="searchCondition" value="${searchCondition}"/> --%>
						</div>
					</div>
		    <c:if test="${resultPage.totalCount eq 0 }">
		    <div style="padding-left: 200px">
			 		<jsp:include page="/common/searchResult.jsp"></jsp:include>
			</div> 	
			 	</c:if>
					<c:set var="i" value="0" />
						<c:forEach var="product" items="${list}">
							<c:set var="i" value="${i+1}" />
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="card ">
									<a> <img class="img-fluid"
										src="../../resources/file/fileShop/${product.mainFile}" alt="">
										<input type="hidden" value="${product.prodNo}" /></a>
									<div class="card-body text-center">
										<div id="checkPostTitle" >
													<font size="5"> ${product.prodName}</font> 		
										</div><br/>
										<strong>&nbsp;&nbsp;<fmt:formatNumber
												value="${product.discountPrice}" pattern="#,###" />원
										<del><c:if test="${product.price > product.discountPrice}">
											<font size="2" color="gray">
											<fmt:formatNumber value="${product.price}" pattern="#,###" />원</font>
										</c:if></del>
										</strong>&nbsp; <a class="detailprod"><br><hr>
										
										
										<button class="btn btn-default" id="detailprod">
										<c:if test="${product.quantity ne 0 }">상세보기</c:if>
										<c:if test="${product.quantity eq 0 }">품절</c:if>
										</button> 
										<input type="hidden" value="${product.prodNo}" /></a>
										

									</div>
								</div>
							</div>
						</c:forEach>
						
					<br> <br> <br>

					</div>
				</div>
			</div>
			</div>
	</section>
	<br/>

			<div class="navigation" style="padding-left:930px">
				<jsp:include page="/common/pageNavigator_new.jsp" />
			</div>
<br/><br/><br/>


	<!--====================================================
                      FOOTER
======================================================-->
	<!--================ start footer Area  =================-->
	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!-- footer End /////////////////////////////////////-->
	<!--================ End footer Area  =================-->



	<script type="text/javascript">
	
		//=============    상품상세조회(썸네일)  Event  처리 		=============
		//============= 썸네일 사진 클릭 Event  처리 =============	
		$(function() {
			$(".img-prod").on(
					"click",
					function() {
						//alert($(this).children("input").val())
						$(self.location).attr(
								"href",
								"/product/getProduct?prodNo="
										+ $(this).children("input").val());
					});
			$(".detailprod").on(
					"click",
					function() {
						//alert($(this).children("input").val())
						$(self.location).attr(
								"href",
								"/product/getProduct?prodNo="
										+ $(this).children("input").val());
					});
		});
		// 카테고리 bind
		$(function() {
			//>전체 PROD_NO DESC
			$("#total").on("click", function() {
				//alert("");
				self.location = "/product/listProduct?prodCondition=0"
			});
			//사료
			$("#one").on("click", function() {
				//alert("");
				self.location = "/product/listProduct?prodCondition=1"
			});
			//간식
			$("#two").on("click", function() {
				//alert("");
				self.location = "/product/listProduct?prodCondition=2"
			});
			//의류
			$("#three").on("click", function() {
				//alert("");
				self.location = "/product/listProduct?prodCondition=3"
			});
			//베스트상품
			$("#four").on("click", function() {
				//alert("");
				self.location = "/product/listProduct?prodCondition=4"
			});
			//관리자 상품조회
			$("#admin").on("click", function() {
				//alert("");
				self.location = "/product/listAdminProduct"
			});
			//관리자 구매관리
			$("#adminOrder").on("click", function() {
				//alert("");
				self.location = "/order/listAdminOrder"
			});
			$(".orderhistory").on("click", function() {
				//alert("");
				self.location = "/order/listOrder"
			});
			//취소주문내역
			$("#cancleOrder").on("click", function() {
				//alert("");
				self.location = "/order/listCancleOrder"
			});
		});
	</script>
	<script>
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();	
		
		$("form").attr("method", "POST").attr("action","/product/listProduct").submit();
	}
	//============= Event 처리 및  연결 =============
	$(function() {
		$("#searchSubmmit").on("click", function() {
			fncGetList(1);
		});
		
	});
</script>
</body>

</html>