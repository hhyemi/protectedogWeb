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

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>


<!--  ///////////////////////// CSS ////////////////////////// -->

<!-- Core Stylesheets -->
<link rel="stylesheet" href="/resources/newTemplate/css/shop.css">


<!--  ///////////////////////// JavaScript ////////////////////////// -->
<style>
.view {
	font-size: small;
}

.img-fluid {
	min-height: 300px;
	max-height: 300px;
	overflow: auto;
	max-width: 300px;
	min-width: 300px;
}

.card {
	min-height: 500px;
	max-height: 500px;
	overflow: auto;
	max-width: 400px;
	min-width: 400px;
}

<
style>#checkPostTitle {
	width: 300px;
	padding: 0 5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

select, #searchKeyword {
	height: 33px;
}

#searchKeyword {
	height: 40px;
	width: 150px;
	border: 1px solid #D3D3D3;
}

#searchSubmmit {
	width: 60px;
	height: 40px;
	border-radius: 0px 15px 15px 0px;
	border: 1px solid #f04f23;
}

#write {
	width: 40px;
	height: 40px;
	border-radius: 15px;
	border: 1px solid #f04f23;
}

#voteCondition {
	height: 40px;
	border-radius: 15px 0px 0px 15px;
	padding-left: 10px;
	border-color: #D3D3D3;
	border-right: 0px;
}

#searchCondition {
	height: 40px;
	padding-left: 5px;
	border-color: #D3D3D3;
	border-right: 0px;
}
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


	<div class="heading-border-light"></div>
	<input type="hidden" value="${board.postNo}" />
	<input type="hidden" value="${board.boardCode}" />




	<section class="ftco-section bg-light"
		style="padding-bottom: 0px; padding-top: 30px;">

		<form class="form-inline" name="detailForm">
			<div class="container">

				<!--검색 부터 -->
				<div class="row">
					<div class="col-md-6" align="left">

						<p style="font-weight: bold;">전체 ${resultPage.totalCount } 건</p>
					</div>

					<div class="form-group" style="padding-left: 160px">
						<select id="voteCondition" name="voteCondition">
							<option value="0"
								${ ! empty search.voteCondition && search.voteCondition==0 ? "selected" : "" }>전체</option>
							<option value="3"
								${ ! empty search.voteCondition && search.voteCondition==3 ? "selected" : "" }>후원중</option>
							<option value="4"
								${ ! empty search.voteCondition && search.voteCondition==4 ? "selected" : "" }>후원완료</option>
						</select> <select name="searchCondition" id="searchCondition">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
						</select> <label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" id="searchKeyword" name="searchKeyword"
							placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						<!-- 						    <button type="button" class="btn btn-default">검색</button> -->
						<button type="button" id="searchSubmmit"
							class="btn btn-default searchSubmmit"
							style="padding-bottom: 6px; margin-left: 0px;">
							<span class="fas fa-search"></span>
						</button>
					</div>
				</div>
				<br /> <br />
				<!-- 베스트 상품 //////////////////////////////////////////////////////////-->
				<c:if test="${resultPage.totalCount eq 0 }">
					<div align="center" style="height: 300px; padding-top: 100px;">
						<font size="4px">검색결과가 없습니다.</font>
					</div>
				</c:if>

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
										height="500px;"> <input type="hidden"
										value="${board.postNo}" />
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
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</form>
	</section>
	


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
