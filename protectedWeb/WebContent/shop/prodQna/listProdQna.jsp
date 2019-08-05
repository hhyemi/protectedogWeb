<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
body {
	border: 0px;
	border-spacing: 0px;
}

/* #postTitle { */
/* 	padding-left: 120px; */
/* 	padding-right: 120px; */
/* } */

/* #id { */
/* 	padding-left: 80px; */
/* 	padding-right: 80px; */
/* } */

/* #no { */
/* 	padding-left: 50px; */
/* 	padding-right: 50px; */
/* 	font-size: x-small; */
	
/* } */

/* #countfont{ */
/* 	font-size: x-small; */
/* 	} */
/* #boardfont{ */
/* 	font-size: x-small; */
/* 	padding-left: 50px; */
/* 	padding-right: 50px; */
/* 	} */

</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============

	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();	
		$("form").attr("method", "POST").attr("action","/prodQna/listProdQna?order={param.order}").submit();
	}

	//============= Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$("#qna").on("click", function() {
			window.open("/shop/prodQna/addProdQna.jsp", "new","width=800, height=600, top=100, left=100, toolbar=no, menubar=no, location=no, channelmode=yes");
			
			
			
		});
		
		$(function() {
			$("#getgetget").on(
					"click",
					function() {
						//alert($(this).children("input").val())
						$(self.location).attr(
								"href",
								"/prodQna/getProdQna?postNo="
										+ $(this).children("input").val());
					});
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





	<div class="container">
		<h1 align="right">
						<button class="btn btn-default" id="qna">문의하기</button>

						

		</h1>
	</div>
	<BR />
<!-- 	<!--/////////////////////// form start /////////////////////////////////-->
<!-- 	<form class="form-inline" name="detailForm"> -->
<!-- 		<!-- table 위쪽 검색 Start /////////////////////////////////////--> 
<!-- 	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;"> -->
<!-- 	<tr> -->

<!-- 		<td align="right"> -->
			
<!-- 			<select name="searchCondition" class="ct_input_g" style="width:80px"> -->
<%-- 				<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option> --%>
<%-- 				<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option> --%>
<%-- 				<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option> --%>
<!-- 			</select> -->

<%-- 			<input type="text" name="searchKeyword" value="${search.searchKeyword}" class="ct_input_g" style="width:200px; height:19px" /> --%>
		
<!-- 		</td> -->
		
<!-- 		<td align="right" width="70"> -->
<!-- 			<table border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<td width="17" height="23"> -->
<!-- 						<img src="/images/ct_btnbg01.gif" width="17" height="23"> -->
<!-- 					</td> -->
<!-- 					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;"> -->
<!-- 						<a href="javascript:fncGetList('1');">검색</a> -->
<!-- 						검색 -->
<!-- 					</td> -->
<!-- 					<td width="14" height="23"> -->
<!-- 						<img src="/images/ct_btnbg03.gif" width="14" height="23"> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->

	
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->

		<div class="container" align="center">
			<table class="table table-hover table-striped">
				<thead>
					<tr align="center">
					<td colspan="11" id="countfont">전체 ${resultPage.totalCount} 건, 현재 ${resultPage.currentPage} 페이지</td></tr>
				<thead>
					<tr>
						<th>글번호</th>
						<th id="boardfont">제목</th>
						<th id="boardfont">질문유형</th>
						<th id="boardfont">등록일</th>

					</tr>
				</thead>

				<c:set var="i" value="0" />
				<c:forEach var="board" items="${list}">
					<c:set var="i" value="${i+1}" />
					<tbody>
					<tr>
					<td class="mdl-data-table__cell--non-numeric">${ i }</td>
					<td id="getgetget">${board.postTitle}
					<input type="hidden" name="postNo" value="${board.postNo}" /> 
					<input type="hidden" name="boardCode" value="${board.boardCode}" /></td>
					<td><c:if test="${board.qnaCode == '1'}">배송</c:if>
					<c:if test="${board.qnaCode == '2'}">상품</c:if>
					<c:if test="${board.qnaCode == '3'}">교환</c:if>
					<c:if test="${board.qnaCode == '4'}">반품</c:if>
					<c:if test="${board.qnaCode == '5'}">기타</c:if></td>
					<td>${board.regDate}</td>
					</tr>
					</tbody>
				</c:forEach>
				
				
			</table>
			<br/>
			<!--  table end /////////////////////////////////////-->
<p align="center">
			<input type="hidden" id="currentPage" name="currentPage" value="0" />
			<jsp:include page="../../common/pageNavigator_new.jsp"/></p>

		</div>
		
	<script type="text/javascript">
	
// 	$(function(){
		
// 		$("#getgetget").on("click",".go",function(){
			
// 			window.open($(this).children("input").val(),"new","width=800, height=600, top=100, left=100, toolbar=no, menubar=no, location=no, channelmode=yes");
// 		});
// 	});
	
	</script>
	<!--///////////////////////////////// form end /////////////////////////////////////-->
</body>
</html>