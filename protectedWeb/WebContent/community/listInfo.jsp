<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
<head>

<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery CSS -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery JS -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  CSS -->
<style>
h7 {
	color: red;
}
/*     .row.display-flex { display: flex; flex-wrap: wrap; } */
/* 	.thumbnail { */
/* 		width: auto; */
/* 		height: 250px; */
/* 	} */
/* 	.thumbnail img{ */
/* 		position : relative; */
/* 		width : auto; */
/* 		height : 242px; */
/* 		object-fit: cover; */
/* 	} */
</style>

<title>상품 목록조회</title>

<!-- JavaScript -->
<script type="text/javascript">
	function fncGetUserList(currentPage) {

		$("#currentPage").val(currentPage)

		$("form").attr("method", "POST").attr(
				"action",
				"/product/listProduct?&menu=" + $("#menu").val() + "&pageSize="
						+ $("#selectPageSize").val()).submit();

	}

	function getPageSize() {
		$(self.location).attr(
				"href",
				"/product/listProduct?menu=" + $("#menu").val() + "&pageSize="
						+ $("#selectPageSize").val());
	}

	$(function() {

		var pageSize = $("#selectPageSize").val();
		var menu = $("#menu").val();

		$("#searchKeyword")
				.on(
						"keyup",
						function() {

							var search = {
								searchKeyword : $("#searchKeyword").val(),
								searchCondition : $("#searchCondition").val()
							};
							var convertSearch = JSON.stringify(search);

							$
									.ajax({
										url : "/product/json/listProduct/"
												+ menu + "/" + pageSize,
										method : "POST",
										dataType : "json",
										data : convertSearch,
										contentType : "application/x-www-form-urlencoded; charset=euc-kr",
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json;charset=euc_kr"
										},
										success : function(JSONData, status) {
											$("#searchKeyword").autocomplete({
												source : JSONData
											});
										}
									});
						});

		$("#tranState").on(
				"click",
				function() {

					alert($(this).children("input").val()+" "+$("#menu").val())
					$(self.location).attr(
							"href",
							"/purchase/updateTranCode?prodNo="
									+ $(this).children("input").val()
									+ "&menu=" + $("#menu").val());
					alert('배송이 완료되었습니다.');
				});

		$(".thumbnail").on(
				"click",
				function() {

					self.location = "/product/getProduct?prodNo="
							+ $(this).children("input").val() + "&menu="
							+ $("#menu").val();
				});

		//		배송하기 (구현예정) 

		// 		페이지 처리를 위한 스크립트
		$("button.btn.btn-default").on("click", function() {
			fncGetUserList(1);
		});

		$(".table-hover th td:nth-child(1)").css("color", "red").css(
				"font-weight", "bolder");
		$("h7").css("color", "red").css("font-weight", "bolder");
		//$(".table-hover.table-striped:nth-child(2n+1)" ).css("background-color" , "whitesmoke");

		//  		$("#thumnail").on("mouseover", function(){
		//  			$(this).css("background-color","red");
		//  		});
		
		$("button:contains('글 쓰기')").on("click", function(){
			self.location = "/community/addInfo.jsp"
		});
	});
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<%-- 	<input type="hidden" id="menu" name="menu" value="${param.menu}"/> --%>

	<div class="container">

		<div class="page-header text-info">
			보호할개 정보공유
		</div>

		<div class="row">
			<div class="col-md-12 text-left">
				<p class="text-primary">
					<%-- 	    			전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지 --%>
				</p>
			</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-md-6 col-sm-5 col-xm-12">

				<table>
					<tr>
						<td><span>표시개수</span></td>
						<td><span> <select name="pageSize" id="selectPageSize"
								onchange="javascript:getPageSize()">
									<%-- 									<option value="6" ${ search.pageSize == 6 ? "selected" : "" }>6</option> --%>
									<%-- 									<option value="9" ${ search.pageSize == 9 ? "selected" : "" }>9</option> --%>
									<%-- 									<option value="12" ${ search.pageSize == 12 ? "selected" : "" } >12</option> --%>
									<%-- 									<option value="15" ${ search.pageSize == 15 ? "selected" : "" } >15</option> --%>
							</select>
						</span></td>
						<!-- 						<td> -->
						<%-- 	    					<span><a href="/product/listProduct?menu=${param.menu}&order=1&pageSize=${search.pageSize}">▲ 높은가격순</a></span> --%>
						<!-- 	    				</td> -->
						<!-- 	    				<td> -->
						<%-- 							<span><a href="/product/listProduct?menu=${param.menu}&order=2&pageSize=${search.pageSize}">▼ 낮은가격순</a></span> --%>
						<!-- 						</td>						 -->
					</tr>
				</table>

			</div>
			<div class="col-md-6 col-md-6 col-sm-7 col-xm-12 text-right">
				<form class="form-inline" name="detailForm">
					<div class="form-group">
						<select class="form-control" id="searchCondition"
							name="searchCondition">
											    		<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
														<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
														<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label>
										    	<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
						<button type="button" class="btn btn-default">검색</button>
					</div>



					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />
				</form>
			</div>
		</div>

		<hr />

		<h5 align="center">HOT 개</h5>

		<p>
		<table class="table table-hover table-striped">

			<thead>
				<tr align="center">
					<th width="10%">번호</th>
					<th width="30%">제목</th>
					<th width="10%">글쓴이</th>
					<th width="10%">작성일</th>
					<th width="5%">조회수</th>
					<th width="5%">추천수</th>					
				</tr>
			</thead>

			<tbody>
<%-- 				<c:set var="i" value="0" /> --%>
<%-- 				<c:forEach var="user" items="${list}"> --%>
<%-- 					<c:set var="i" value="${ i+1 }" /> --%>
					<tr>
						<td align="center">1</td>
						<td align="center">★ 보신탕좀 먹어보자[0]</td>
						<td align="center">스캇 V (User01)</td>
						<td align="center">2019년07월12일</td>
						<td align="center">1</td>
						<td align="center">0</td>
					</tr>
<%-- 				</c:forEach> --%>

			</tbody>
		</table>
		
		<br/>
		
		<button>전체보기</button>
		<button>관심등록</button>
		<button>추천수순</button>
		
		<br/>
		
		<table class="table table-striped">

			<thead>
				<tr align="center">
					<th width="10%">번호</th>
					<th width="30%">제목</th>
					<th width="10%">글쓴이</th>
					<th width="10%">작성일</th>
					<th width="5%">조회수</th>
					<th width="5%">추천수</th>					
				</tr>
			</thead>

			<tbody>

<%-- 				<c:set var="i" value="0" /> --%>
<%-- 				<c:forEach var="user" items="${list}"> --%>
<%-- 					<c:set var="i" value="${ i+1 }" /> --%>
					<tr>
						<td align="center">2</td>
						<td align="center">프로텍티도그조 화이팅하자 아자아자 작은타우렌 만세만세 만만세[9]</td>
						<td align="center">작은타우렌 S (User02)</td>
						<td align="center">2019년07월12일</td>
						<td align="center">100</td>
						<td align="center">999</td>
					</tr>
					
					<tr>
						<td align="center">1</td>
						<td align="center">★ 보신탕좀 먹어보자[0]</td>
						<td align="center">스캇 V (User01)</td>
						<td align="center">2019년07월12일</td>
						<td align="center">1</td>
						<td align="center">0</td>
					</tr>
<%-- 				</c:forEach> --%>

			</tbody>
		</table>

	<button>글 쓰기</button>
	<jsp:include page="../common/pageNavigator_new.jsp" />
	</div>
</body>
</html>
