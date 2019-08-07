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
.navigation{
	margin-left:500px;
}


</style>
</head>

<body id="page-top">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--====================================================
                       HOME-P
======================================================-->
<body class="goto-here">
   	
    <div class="hero-wrap hero-bread" style="padding-bottom: 60px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">List</span> <span>Admin Order</span></p>
            <font size="7">구매 취소 리스트</font>
          </div>
        </div>
      </div>
    </div>

	<!--====================================================
                        CART
======================================================-->
	<form name="listOrder">
		<section>
			<input type="hidden" name="orderNo" id="orderNo" value="${order.orderNo}" />
			<input type="hidden" name="id" id="id" value="${ sessionScope.user.phone }"/>
			<div class="container">
			※ 상세정보는 상품명을 조회해 주세요
				<table id="cart" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="width: 10%">No | 회원아이디</th>
							<th style="width: 30%">상품정보</th>
							<th style="width: 10%">구매가격</th>
							<th style="width: 20%" class="text-center">결제수단</th>
							<th style="width: 10%">상태</th>
							<th style="width: 40%">주문일</th>
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
								<span style="cursor:pointer"><font color="#38b00c">배송하기</font></span></c:if>
								<c:if test="${order.orderCode =='2'}">
								<span style="cursor:pointer"><font color="#38b00c">배송중</font></span></c:if>
								<c:if test="${order.orderCode =='3'}">
								<span style="cursor:pointer"><b>배송완료</b></span></c:if>
								<c:if test="${order.orderCode =='4'}">
								주문취소</c:if>
								<td class="actions"><fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderDate}" /></td>
								
							</tr>
						</c:forEach>

					</tbody>

					<tfoot>
						<tr>
							<td><a href="/product/listProduct" class="btn btn-general btn-white"><i
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
			self.location = "/order/updateOrderCode?orderNo="+$(this).parent().find($("input:hidden[name='orderNo']")).val()+"&orderCode=2";
		});
		
		$("td:nth-child(5) span:contains('배송중')").on("click", function(){
			self.location = "/order/updateOrderCode?orderNo="+$(this).parent().find($("input:hidden[name='orderNo']")).val()+"&orderCode=3";
		});
		
		$("td:nth-child(5) span:contains('배송완료')").on("click", function(){
			self.location = "/order/updateOrderCode?orderNo="+$(this).parent().find($("input:hidden[name='orderNo']")).val()+"&&orderCode=4";
		});
		
	});


	</script>
</body>

</html>



