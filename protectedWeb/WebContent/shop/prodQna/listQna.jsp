<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============

	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();	
		$("form").attr("method", "POST").attr("action", "/prodQna/listProdQna?order=${param.order}").submit();
	}


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


	<!--/////////////////////// form start /////////////////////////////////-->
	<form class="form-inline" name="detailForm">

		<div class="container">
			<h1 align="center">
				상품<small>Q&nbap;&&nas;A
					<button class="mdl-button mdl-js-button mdl-button--primary">
						문의하기</button>
				</small>
			</h1>
		</div>
		<BR />

		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
<!-- 		<div class="row"> -->

<!-- 			<div class="col-md-6 text-left"> -->
<%-- 				<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재 --%>
<%-- 					${resultPage.currentPage} 페이지</p> --%>
<!-- 			</div> -->
<!-- 			<div class="col-md-6 text-right"> -->

<!-- 				<div class="form-group"> -->
<!-- 					<select class="form-control" name="searchCondition"> -->
<!-- 						<option value="0" -->
<%-- 							${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option> --%>
<!-- 						<option value="1" -->
<%-- 							${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option> --%>
<!-- 						<option value="2" -->
<%-- 							${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option> --%>

<!-- 					</select> -->
<!-- 				</div> -->

<!-- 				<div class="form-group"> -->
<!-- 					<label class="sr-only" for="searchKeyword">검색어</label> -->
<!-- 						    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" > -->
<!-- 						    <button type="button" class="btn btn-default">검색</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			</div> -->
<!-- 			<!-- table 위쪽 검색 Start /////////////////////////////////////--> -->


			<!--  table Start /////////////////////////////////////-->

			<div class="container" align="center">
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--4dp">
					<thead>
						<tr>
					<thead>
						<tr>
							<th class="mdl-data-table__cell--non-numeric" align="center"
								id="no">글번호</th>
							<th align="left">질문유형</th>
							<th align="left">제목</th>
							<th align="left" id="postTitle">내용</th>
							<th align="left" id="id">등록일</th>

						</tr>
					</thead>

					<c:set var="i" value="0" />
					<c:forEach var="product" items="${list}">
						<c:set var="i" value="${i+1}" />
						<td class="mdl-data-table__cell--non-numeric" align="center"></td>
						<td align="center">${ i }</td>
						<td align="left">${board.postNo}<input type="hidden" name="postNo" value="${board.prodNo}"/></td>
						<td align="left">${board.boardCode}<input type="hidden" name="boardCode" value="${board.boardCode}" /></td>
						<td align="left">${board.qnaCode}</td>
						<td align="left">${board.postTitle}</td>
						<td align="left">${board.postContent}</td>
						<td align="lefr">${board.regDate}</td>
					</c:forEach>
				</table>
				<!--  table end /////////////////////////////////////-->
		
			<input type="hidden" id="currentPage" name="currentPage" value="0" /> 
			<jsp:include page="../../common/pageNavigator.jsp" />
			
			</div>
	</form>
	<!--///////////////////////////////// form end /////////////////////////////////////-->
</body>
</html>