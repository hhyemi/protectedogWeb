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
<title>Business Bootstrap Responsive Template</title>


<!-- Global Stylesheets -->
<title>상품 등록</title>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	
	<!-- Google Mdl -->

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>


<!--  ///////////////////////// CSS ////////////////////////// -->

<!-- Core Stylesheets -->
<link rel="stylesheet" href="/resources/newTemplate/css/shop.css">


<!--  ///////////////////////// JavaScript ////////////////////////// -->
<style>

.view { font-size: x-small; }
.img-fluid  { min-height: 200px; 
			  max-height: 200px; overflow: auto;
			  max-width: 250px;
			  min-width: 250px; 
			  }
			 
.card			  { min-height: 400px; 
			  max-height: 400px; overflow: auto;}


</style>

</head>

<body id="page-top">

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


	<!--====================================================
                        SHOP-P1
======================================================-->
	<section id="shop-p1" class="shop-p1">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="shop-p1-title">
						<h3>보호마켓</h3><a href="#" id="button">
						<button id="btnFund" class="btn btn-default">작성</button>
							
						</a>
						<div class="heading-border-light"></div>
						<input type="hidden" value="${board.postNo}" /> <input
							type="hidden" value="${board.boardCode}" />
					</div>



					<!-- 베스트 상품 //////////////////////////////////////////////////////////-->


				</div>

				<!-- 썸네일 Start //////////////////////////////////////////////////////////////////-->
				<div class="col-lg-9">
					<div class="row">
						<input type="hidden" id="currentPageList" name="currentPageList"
							value="${resultPage.currentPage}" />
						<c:set var="i" value="0" />
						<c:forEach var="board" items="${list}">
							<c:set var="i" value="${i+1}" />
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="card">
									<img class="img-fluid" id="clickplease"
										src="../../resources/file/fileMarket/${board.thumnail}"
										height="500px;" > 
										<input type="hidden" value="${board.postNo}"/>
									<div class="card-body text-center">
										<div class="card-title">
											<a><b>${board.postTitle}</b> </a> <input type="hidden"
												value="${board.postNo}" />
										</div>
										${board.prodName} <strong>&nbsp;&nbsp;<fmt:formatNumber
												value="${board.price}" pattern="#,###" />원
										</strong>
										<hr><p class="view">${board.id}(&nbsp;${board.city}&nbsp;) &nbsp;&nbsp;&nbsp;조회수 : ${board.viewCount}<br/></p>

									</div>
								</div>
							</div>
						</c:forEach>

						
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- <div class="row my-4">-->


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
					"/market/listProduct").submit();
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
			$("#button").on("click", function() {
				self.location = "/shop/market/addMarket.jsp";
			});

		});
	</script>

</body>

</html>
