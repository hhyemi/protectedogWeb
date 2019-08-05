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
<title>보호마켓</title>


<!-- Global Stylesheets -->



<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->

<!-- Core Stylesheets -->
<link rel="stylesheet" href="/resources/newTemplate/css/shop.css">


<!--  ///////////////////////// JavaScript ////////////////////////// -->
<style>
.view {
	font-size: small;
}

#get {
	padding-left: 10px;
	padding-right: 10px;
	max-width: 300px;
	min-width: 300px;
	min-height: 550px;
	max-height: 550px;
}

.img-fluid {
	min-height: 350px;
	max-height: 350px;
	max-width: 280px;
	min-width: 280px;
	padding-left: 10px;
	padding-right: 10px;
	padding-bottom: 10px;
	padding-top: 10px;
}

.card {
	min-height: 550px;
	max-height: 550px;
	max-width: 350px;
	min-width: 350px;
}

#searchKeyword {
	height: 40px;
	width: 150px;
}

#searchSubmmit {
	width: 60px;
	height: 40px;
	border-radius: 0px 15px 15px 0px;
	border: 1px solid #D3D3D3;
}

#searchCondition {
	height: 40px;
	border-radius: 15px 0px 0px 15px;
}

#selectPageSize {
	height: 30px;
}

#newstd {
	min-width: 251px;
	max-width: 251px;
}

.btn-default {
	height: 30px;
	color: white;
}
</style>

</head>

<!--====================================================
                         HEADER
======================================================-->

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp"></jsp:include>
<!-- ToolBar End /////////////////////////////////////-->

<!--====================================================
                    LOGIN OR REGISTER
======================================================-->
<!--====================================================
                         HOME STA
======================================================-->
<body class="goto-here">
	<div class="hero-wrap hero-bread"
		style="padding-bottom: 30px; padding-top: 60px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p>
						<span class="mr-2">protected dog</span> <span>Market</span>
					</p>
					<font size="7">보호 마켓</font>
				</div>
			</div>
		</div>
	</div>
	<br />
	<p />

	<!--====================================================
                        SHOP-P1
======================================================-->


	<div class="container"></div>
	<input type="hidden" value="${board.postNo}" />
	<input type="hidden" value="${board.boardCode}" />




	<div class="container">
		<button type="button" class="btn btn-default" id="createtext">작성</button>

		<section class="ftco-section bg-light"
			style="padding-bottom: 0px; padding-top: 30px;">

			<br />
			<p />
			<!--/////////////////////// form start /////////////////////////////////-->

			<div style="float: right;">
				<form class="form-inline" name="detailForm">
					<div class="form-group">
						<select class="form-control" id="searchCondition"
							name="searchCondition">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>작성자</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>글내용</option>
						</select>
					</div>


					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control searchKeyword" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						<button type="button" id="searchSubmmit"
							class="btn btn-default searchSubmmit">
							<span class="fas fa-search"></span>
						</button>
					</div>

					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />
				</form>
			</div>

			<c:if test="${totalCount == 0}">
				<div class="row">
					<div class="col-md-9" align="center"
						style="height: 500px; padding-top: 150px;">

						<jsp:include page="/common/searchResult.jsp"></jsp:include>
					</div>
				</div>


			</c:if>
		</section>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->


		<!-- table 위쪽 검색 Start /////////////////////////////////////-->


		<!-- 썸네일 Start //////////////////////////////////////////////////////////////////-->

		<div class="row">
			<div class="col-md-10 col-lg-12 order-md-last">
				<input type="hidden" id="currentPageList" name="currentPageList"
					value="${resultPage.currentPage}" />
				<div class="row">
					<c:set var="i" value="0" />
					<c:forEach var="board" items="${list}">
						<c:set var="i" value="${i+1}" />
						<figure id="get">
							<div class="card">
								<img class="img-fluid" id="clickplease"
									src="../../resources/file/fileMarket/${board.thumnail}">
								<input type="hidden" value="${board.postNo}" />
								<div class="card-body text-center">
									<div class="card-title">
										<a><b>${board.postTitle}</b> </a> <input type="hidden"
											value="${board.postNo}" />
									</div>
									${board.prodName} <strong>&nbsp;&nbsp;<fmt:formatNumber
											value="${board.price}" pattern="#,###" />원
									</strong>
									<hr>
									<p class="view">${board.id}(&nbsp;${board.city}&nbsp;)
										&nbsp;&nbsp;&nbsp;<br />조회수 : ${board.viewCount}<br />
									</p>
								</div>
							</div>
						</figure>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<div align="center" style="padding-left: 45%">
		<jsp:include page="/common/pageNavigator_new.jsp" />
	</div>

	<div style="min-height: 40px"></div>



	<!--====================================================
                      FOOTER
======================================================-->
	<!--================ start footer Area  =================-->
	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!-- footer End /////////////////////////////////////-->
	<!--================ End footer Area  =================-->

	<script type="text/javascript">
		//=============    검색 / page 두가지 경우 모두  Event  처리	 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method", "POST").attr("action",
					"/market/listMarket?order=1").submit();
		}
		//=============    상품상세조회(썸네일)  Event  처리 		=============
		//============= 썸네일 사진 클릭 Event  처리 =============	
		$(function() {
			$(".card").on(
					"click",
					function() {
						//alert($(this).children("input").val())
						$(self.location).attr(
								"href",
								"/market/getMarket?postNo="
										+ $(this).children("input").val());
					});

			$(".card-title").on(
					"click",
					function() {
						//alert($(this).children("input").val())
						$(self.location).attr(
								"href",
								"/market/getMarket?postNo="
										+ $(this).children("input").val());
					});
		});

		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			$("#createtext").on("click", function() {
				self.location = "/shop/market/addMarket.jsp";
			});

		});

		//============= Event 처리 및  연결 =============
		$(function() {

			$("#searchSubmmit").on("click", function() {
				fncGetList(1);
			});

		});
	</script>
</body>
</html>
