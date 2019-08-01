<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!-- /////// JSTL/////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<title>구매내역</title>
<meta charset="UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Core Stylesheets -->
<link rel="stylesheet" href="/resources/newTemplate/css/shop.css">

<script type="text/javascript">
	function fncGetList(currentPage) {
		$('#currentPage').val(currentPage);
		$('form').attr('method', 'post').attr('action',
				'/order/listOrder').submit();
		//원래 list는 get으로 해줘야겠지만.. controller에서 param받아서 다시 model로 돌려주는게 귀찮으니 post로 하는중
	}
	</script>
</head>

<body id="page-top">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--====================================================
                       HOME-P
======================================================-->
	<div id="home-p" class="home-p pages-head3 text-center">
		<div class="container">
			<h1 class="wow fadeInUp" data-wow-delay="0.1s">보호스토어 주문내역</h1>
		</div>
		<!--/end container-->
	</div>

	<!--====================================================
                        CART
======================================================-->
	<form name="listOrder">
		<section id="cart" class="cart">
			<input type="hidden" name="orderNo" id="orderNo" value="${order.orderNo}" />
			<div class="container">
				<table id="cart" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="width: 10%">No</th>
							<th style="width: 30%">상품정보</th>
							<th style="width: 10%">구매가격</th>
							<th style="width: 20%" class="text-center">결제수단</th>
							<th style="width: 20%">상태</th>
							<th style="width: 20%">주문일</th>
						</tr>
					</thead>

					<tbody>
						<c:set var="i" value="0" />
						<c:forEach var="order" items="${list}">
							<c:set var="i" value="${i+1}" />
							<tr class="ordernum">
							<td>${i}<input type="hidden" name="orderNo" id="orderNo" value="${order.orderNo}"/>
							<input type="hidden" name="id" name="id" value="${sessionScope.user.id }"/></td>
								<td align="center">
									<div class="row">

										<div class="col-sm-2 hidden-xs">
											<img src="http://placehold.it/100x100" alt="..."
												class="img-responsive" />
										</div>
										<div class="col-sm-10 prod-desc">
											<h6 class="nomargin">
												주문번호:${order.orderNo}  
												<input type="hidden" name="prodNo" value="${order.prodNo}" /> 
											</h6>
										</div>
									</div>
								</td>
								<td>${order.totalPrice}</td>

								<td class="text-center">${order.paymentCode}</td>
								<td class="actions">${order.orderCode}</td>
								<td class="actions">${order.orderDate}</td>
							</tr>
						</c:forEach>

					</tbody>

					<tfoot>
						<tr>
							<td><a href="#" class="btn btn-general btn-white"><i
									class="fa fa-angle-left"></i> 계속 쇼핑하기</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong></strong></td>
							<td><a href="#" class="btn btn-general btn-green">HOME <i
									class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</section>
	</form>

	<!-- Footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp" />
	<!-- Footer End /////////////////////////////////////-->
</body>

</html>



