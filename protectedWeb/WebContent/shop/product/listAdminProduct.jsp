<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- //////////////////////  DAY FORMAT ///////////////////////// -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>




<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style>
body {
	border: 0px;
	border-spacing: 0px;
}

#postTitle {
	padding-left: 120px;
	padding-right: 120px;
}

#id {
	padding-left: 80px;
	padding-right: 80px;
}

#no {
	padding-left: 50px;
	padding-right: 50px;
	font-size: x-small;
}

#countfont {
	font-size: x-small;
}

#boardfont {
	font-size: x-small;
	padding-left: 50px;
	padding-right: 50px;
}

table {
	width: 1000px;
}

<
style>#searchKeyword {
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

.btn-default {
	height: 30px;
	color: white;
}
</style>
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============

	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();	
		$("form").attr("method", "POST").attr("action",
				"/product/listAdminProduct").submit();
	}

	//============= Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$("#button").on("click", function() {
			self.location = "/shop/product/addProduct.jsp";
		});

		// 	$(function() {

		// 		$("td.ct_btn01:contains('검색')").on("click", function() {
		// 			fncGetList(1);
		// 		});

		// 		$("#change2").on(
		// 				"click",
		// 				function() {
		// 					var prodNo = $(this).data('param1');
		// 					self.location = "/purchase/updateTranCodeByProd?prodNo="
		// 							+ prodNo + "&tranCode=2";
		// 				})
		// 		$("#prod").on(
		// 				"click",
		// 				function() {
		// 					self.location = "/product/getProduct?prodNo="
		// 							+ $(this).text().trim();
		// 				});

	});
</script>
</head>

<body>

	<!-- //////////////////////ToolBar Start ///////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!--/////////////////////// ToolBar End ////////////////////////////////-->
<body class="goto-here">
	<div class="hero-wrap hero-bread"
		style="padding-bottom: 30px; padding-top: 60px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p>
						<span class="mr-2">protected dog</span> <span>Store</span>
					</p>
					<font size="7">관리자 상품 관리</font><a href="#" id="button">
					<button type="button" class="btn btn-default">상품등록</button>
				</a>
				</div>
			</div>
		</div>
	</div>
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
				style="height: 500px; padding-top: 250px;">
				검색결과 없음
				<p />
				<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				<input type="hidden" id="currentPage" name="currentPage" value="" />
			</div>
		</div>
	</c:if>
	<!-- table 위쪽 검색 Start /////////////////////////////////////-->


	<!--  table Start /////////////////////////////////////-->

	<div class="container" align="left">
		<table class="mdl-data-table mdl-js-data-table mdl-shadow--4dp"
			align="center">
			<thead>
				<tr>
					<td colspan="11" id="countfont">기본 내역 조회 : 전체
						${resultPage.totalCount} 건, 현재 ${resultPage.currentPage} 페이지</td>
				</tr>
			<thead>
				<tr>
					<th class="mdl-data-table__cell--non-numeric" align="center"
						id="no">상품번호</th>
					<th align="center" id="boardfont" width="">상품명</th>
					<th align="center" id="boardfont" width="" >상품가격</th>
					<th align="center" id="boardfont" width="">할인액</th>
					<th align="center" id="boardfont" width="">원산지</th>
					<th align="center" id="boardfont" width="">제조사</th>

				</tr>
			</thead>

			<c:set var="i" value="0" />
			<c:forEach var="product" items="${list}">
				<c:set var="i" value="${i+1}" />
				<tbody>
					<tr>
						<td class="mdl-data-table__cell--non-numeric" align="center">${product.prodNo }</td>
						<td align="center">${product.prodName}<input type="hidden"
							name="prodNo" value="${product.prodNo}" />
						</td>
						<td align="center" width="5%">${product.price}</td>
						<td align="center">${product.discountPrice}</td>
						<td align="center">${product.country}</td>
						<td align="center">${product.company}</td>

					</tr>
				</tbody>
			</c:forEach>
		</table>
		<!--  table end /////////////////////////////////////-->
		<br>
		<hr>
		<br>

		<!--  table Start /////////////////////////////////////-->

		<div class="container" align="left">
			<table class="mdl-data-table mdl-js-data-table mdl-shadow--4dp"
				align="center">
				<thead>
					<tr>
						<td colspan="11" id="countfont">상세 내역 조회 : 전체
							${resultPage.totalCount} 건, 현재 ${resultPage.currentPage} 페이지</td>
					</tr>
				<thead>
					<tr>
						<th class="mdl-data-table__cell--non-numeric" align="center"
							id="no">상품번호</th>
						<th align="center" id="boardfont">상품명</th>
						<th align="center" id="boardfont">제조일</th>
						<th align="center" id="boardfont">등록일</th>
						<th align="center" id="boardfont">재고수량</th>

					</tr>
				</thead>

				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${i+1}" />
					<tbody>
						<tr>
							<td class="mdl-data-table__cell--non-numeric" align="center">${product.prodNo }</td>
							<td align="center">${product.prodName}<input type="hidden"
								name="prodNo" value="${product.prodNo}" />
							</td>
							<td align="center"><fmt:formatDate pattern="yyyy-MM-dd"
									value="${product.manuDate}" /></td>
							<td align="center"><fmt:formatDate pattern="yyyy-MM-dd"
									value="${product.regDate}" /></td>
							<td align="center">${product.quantity}</td>

						</tr>
					</tbody>
				</c:forEach>
			</table>
			<br> <br> <br>
			<div class="col-md-12" align="right">

				<br />

				<div align="center">
					<jsp:include page="/common/pageNavigator.jsp" />
				</div>

				<div style="min-height: 40px"></div>

			</div>
		</div>
		</div>


		<!--///////////////////////////////// form end /////////////////////////////////////-->
		<!--================ start footer Area  =================-->
		<!-- footer Start /////////////////////////////////////-->
		<jsp:include page="/layout/footer.jsp"></jsp:include>
		<!-- footer End /////////////////////////////////////-->
		<!--================ End footer Area  =================-->
</body>
</html>