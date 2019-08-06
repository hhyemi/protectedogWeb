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
<title>보호할개 · 구매내역 상세조회</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!--  Google MDL -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<!--  JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>


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

#countfont {
	font-size: x-small;
}

#boardfont {
	font-size: x-small;
	padding-left: 50px;
	padding-right: 50px;
}


#order{
	align: center;
	width: 700px;
}

th {
	background-color: #F0F0F0;
}

#list{margin-left: 340px;
	margin-bottom: 100px;
	margin-top:10px;}



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
				"/prodQna/listProdQna?order={param.order}").submit();
	}

	//============= Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$("#qna").on("click", function() {
			self.location = "/shop/prodQna/addProdQna.jsp";
		});
		
		$("#list").on("click", function() {
			self.location = "/order/listOrder";
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
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->


	<!-- table 위쪽 검색 Start /////////////////////////////////////-->
<body class="goto-here">
    <div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">protected</span> <span>Store</span></p>
            <font size="7">상품 상세내역 조회</font>
          </div>
        </div>
      </div>
    </div>
	<br/><p/>

	<!--  table Start /////////////////////////////////////-->

	<div class="container" align="center">
		<table id="order" class="mdl-data-table mdl-js-data-table mdl-shadow--4dp">
			<thead>
				<tr>
					<th width="10%">주문번호</th>
					<th width="10%">주문상품 정보</th>
					<th width="10%">결제금액</th>
					<th width="10%">상태</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td scope="row">${order.orderNo}</th>
					<td><input type="hidden" value="${order.prodNo}"/>${order.orderProd.prodName}</td>
					<td><fmt:formatNumber value="${order.totalPrice}" pattern="#,###" />원
					
					</td>
					<td>
					<c:if test="${order.orderCode =='1'}">
								결제완료</c:if>
								<c:if test="${order.orderCode =='2'}">
								배송중</c:if>
								<c:if test="${order.orderCode =='3'}">
								배송완료</c:if>
								<c:if test="${order.orderCode =='4'}">
								취소</c:if>
								<c:if test="${order.orderCode =='5'}">
								구매후기 수정</c:if>
					
					</td>
				</tr>
			</tbody>
		</table>
<!-- 		<hr width="700px"> -->
		<br /> <br />
		<table id="order">
			<tbody>
				<tr>
					<td align="center">
						상품금액&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${order.orderProd.discountPrice}" pattern="#,###" />원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="/resources/file/fileShop/gop.png" width="20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구매수량&nbsp;&nbsp;&nbsp;&nbsp;
						${order.orderQuantity}개
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><fmt:formatNumber value="${order.totalPrice}" pattern="#,###" />원</b>

					</td>
				</tr>
			</tbody>
		</table>
		<hr width="700px">
		<br /> <br />
		<table id="order" class="mdl-data-table mdl-js-data-table mdl-shadow--4dp">
			<thead>
				<tr>
					<th width="10%">주문자 정보</th>
					<th width="10%">연락처</th>
					<th width="10%">주문일자</th>

				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td scope="row">${order.id}</th>
					<td>${order.phone}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${order.orderDate}" /></td>

				</tr>
			</tbody>
		</table>
		<hr width="700px">
		<div class="container" align="center">
			<table id="order" class="mdl-data-table mdl-js-data-table mdl-shadow--4dp">
				<thead>
					<tr>
						<th width="10%">수령자이름</th>
						<th width="10%">연락처</th>
						<th width="10%">주소</th>
						<th width="10%">배송요청사항</th>
						<th width="10%">결제수단</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td scope="row">${order.receiverName }</th>
						<td>${order.receiverPhone}</td>
						<td>${order.receiverAddr}</td>
						<td>${order.orderRequest}</td>
						<td><c:if test="${order.paymentCode == 1 }">
	무통장</c:if> <c:if test="${order.paymentCode == 2}"> 
 신용카드</c:if></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<button type="button" class="btn btn-default" id="list">목록</button>
	
<br/><br/><br/>
		<jsp:include page="/layout/footer.jsp"/>
	<!--///////////////////////////////// form end /////////////////////////////////////-->
	




</body>
</html>