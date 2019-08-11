<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!-- /////// JSTL/////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- //////////////////////  DAY FORMAT ///////////////////////// -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<title>보호할개 · 스토어</title>
<meta charset="UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Core Stylesheets -->
<link rel="stylesheet" href="/resources/newTemplate/css/shop.css">


<style>
/* .navigation{ */
/* 	margin-left:500px; */
/* } */


</style>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
</head>

<body id="page-top">


	<!--====================================================
                       HOME-P
======================================================-->
<body class="goto-here">
   	
    <div class="hero-wrap hero-bread" style="padding-bottom: 60px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">Protectedog</span> <span>Store</span></p>
            <font size="7">관리자 구매관리</font>
          </div>
        </div>
      </div>
    </div>

	<!--====================================================
                        CART
======================================================-->

<div style="float: right;">
			<form class="form-inline" name="detailForm">
				<div class="form-group">
				</div>

				<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
<!-- 				<input type="hidden" id="currentPage" name="currentPage" value="" /> -->
			</form>
		</div>

<%-- 	<c:if test="${totalCount == 0}"> --%>
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-9" align="center" -->
<!-- 				style="height: 500px; padding-top: 150px;"> -->

<%-- 				<jsp:include page="/common/searchResult.jsp"></jsp:include> --%>
<!-- 			</div> -->
<!-- 			</div> -->
			
<%-- 	</c:if> --%>
	<!-- table 위쪽 검색 Start /////////////////////////////////////-->
	
	
	
	<form name="listOrder">
		<section >
			<input type="hidden" name="orderNo" id="orderNo" value="${order.orderNo}" />
			<input type="hidden" name="id" id="id" value="${ sessionScope.user.phone }"/>
			<input type="hidden" name="currentPage" id="currentPage" value=""/>
			<div class="container">
			<b>전체 ${resultPage.totalCount} 건, 현재 ${resultPage.currentPage} 페이지</b><br/>
			※ 상세정보는 상품명을 조회해 주세요
				<table id="cart" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="width: 10%" class="text-center">No | 회원아이디</th>
							<th style="width: 30%" class="text-center">상품정보</th>
							<th style="width: 10%" class="text-center">구매가격</th>
							<th style="width: 20%" class="text-center">결제수단</th>
							<th style="width: 10%" class="text-center">상태</th>
							<th style="width: 40%" class="text-center">주문일</th>
						</tr>
					</thead>

					<tbody>
						<c:set var="i" value="0" />
						<c:forEach var="order" items="${list}">
							<c:set var="i" value="${i+1}" />
							<tr class="ordernum">
							<td>&nbsp;${i}&nbsp;|&nbsp;${order.id}<input type="hidden" name="orderNo" id="orderNo" value="${order.orderNo}"/>
							<input type="hidden" name="id" name="id" value="${user.id }"/></td>
								<td align="center">
									<div class="row">

										<div class="col-sm-2 hidden-xs">
											<img src="../../resources/file/fileShop/${order.orderProd.mainFile}" width="70px" alt="..."
												class="img-responsive" />
										</div>
										<div class="col-sm-10 prod-desc">
											<h6 class="nomargin">
												<a class="number">  </a>
												<a class="detailOrder"><br/><b>${order.orderProd.prodName}</b><br/>
												<input type="hidden" value="${order.orderNo}" /> </a>
												
											</h6>
										</div>
									</div>
								</td>
								<td><fmt:formatNumber value="${order.totalPrice}" pattern="#,###"/>원</td>

								<td class="text-center">
								<c:if test="${order.paymentCode =='1'}">
								무통장결제</c:if>
								<c:if test="${order.paymentCode =='2'}">
								카드결제</c:if>
								
								</td>
								<td class="actions">
								<input type="hidden" name="orderNo" class="orderNo" value="${order.orderNo}"/>
								
								<c:if test="${order.orderCode =='1'}">
								<span style="cursor:pointer"><font color="#f04f23">배송하기</font></span></c:if>
								<c:if test="${order.orderCode =='2'}">
								<font color="#38b00c">배송중</font></span></c:if>
								<c:if test="${order.orderCode =='3'}">
								<b>배송완료</b></span></c:if>
								<c:if test="${order.orderCode =='4'}">
								<b>배송완료</b></c:if>
								<td class="actions"><fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderDate}" /></td>
								
							</tr>
						</c:forEach>

					</tbody>
					<tfoot>
						<tr>
							<td ><a href="/product/listProduct" style="margin-top: 20px" class="btn btn-general btn-white"><i
									class="fa fa-angle-left"></i>상품리스트로</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong></strong></td>
							<td></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</section>
	</form>

	<div style="padding-left:780px">
		<jsp:include page="../../common/pageNavigator_new.jsp" /></div>
		<br/><br/>
	<!-- PageNavigation End... -->

	<!-- Footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp" />
	<!-- Footer End /////////////////////////////////////-->
	
	
	<script type="text/javascript">
//=============    상품상세조회(썸네일)  Event  처리 		=============
//============= 썸네일 사진 클릭 Event  처리 =============	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
// 		alert($("#currentPage").val());
		$("form").attr("method", "POST").attr("action", "/order/listAdminOrder").submit();
	}
	
	
 		$( ".number" ).on("click" , function() {
				 self.location ="/order/getOrder?orderNo="+$(this).text().trim();
			});
	
	$(function() {
	$(".detailOrder").on("click",function() {
		//alert($(this).children("input").val())
				$(self.location).attr("href","/order/getOrder?orderNo="+ $(this).children("input").val());
			});
	
 	});	 
	
	// 배송상태 CHANGE
	$( function(){
		$("select[name='searchCode']").on("change", function(){
			fncGetList(1);
		});
		
		$("td:nth-child(1)").on("click", function(){
			self.location = "/purchase/getPurchase?tranNo="+$("input:hidden[name='tranNo']").val();
		});
		
		
		$("#orderRemove").on("click", function(){
			fncGetList(1);
		});
		
		$("td:nth-child(5) span:contains('배송하기')").on("click", function(){
			swal({
				title : "배송하시겠습니까?",
				text:"배송하기를 원하시면 확인을 눌러주세요.",
	            buttons: ["취소","확인"],
				dangerMode: true,

			})		          
			.then((willDelete) => {
	            if (willDelete) {
		              swal("배송하기가 시작되었습니다!", {
		                icon: "success",
		                button : "확인",
		              }).then((value) => {
		            	  self.location = "/order/updateOrderCode?orderNo="+$(this).parent().find($("input:hidden[name='orderNo']")).val()+"&orderCode=2";
		              });
		            
		          }
		       });	 
			//self.location = "/order/updateOrderCode?orderNo="+$(this).parent().find($("input:hidden[name='orderNo']")).val()+"&orderCode=2";
		});
		
// 		$("td:nth-child(5) span:contains('배송중')").on("click", function(){
// 			swal({
// 				title : "배송상태가 배송완료로 변경됩니다",
// 				dangerMode: true,
// 				buttons :{
// 					catch : {
// 						text : "확인"
// 					}
// 				}
// 			})
// 			self.location = "/order/updateOrderCode?orderNo="+$(this).parent().find($("input:hidden[name='orderNo']")).val()+"&orderCode=3";
// 		});
		
// 		$("td:nth-child(5) span:contains('배송완료')").on("click", function(){
// 			self.location = "/order/updateOrderCode?orderNo="+$(this).parent().find($("input:hidden[name='orderNo']")).val()+"&&orderCode=4";
// 		});
		
	});


	</script>
</body>

</html>



