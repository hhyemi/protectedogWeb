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
          	<p ><span class="mr-2">Protectedog</span> <span>Order</span></p>
            <font size="7">스토어 주문내역</font>
          </div>
        </div>
      </div>
    </div>

	<!--====================================================
                        CART
======================================================-->
	<form name="listOrder">
		<section id="cart" class="cart" style="padding-top: 0;">
			<input type="hidden" name="orderNo" id="orderNo" value="${order.orderNo}" />
			<input type="hidden" value="${user.id}"/>
			<input type="hidden" name="currentPage" id="currentPage" value=""/>
			<div class="container">
			※ 상세정보는 상품명을 조회해 주세요
				<table id="cart" class="table table-hover table-condensed">
					<thead>
						<tr>
							<th style="width: 2%" class="text-center">No</th>
							<th style="width: 45%" class="text-center">상품정보</th>
							<th style="width: 15%" class="text-center">구매가격</th>
							<th style="width: 10%" class="text-center">결제수단</th>
							<th style="width: 10%" class="text-center">상태</th>
							<th style="width: 15%" class="text-center">주문일</th>
						</tr>
					</thead>

					<tbody>
						<c:set var="i" value="0" />
						<c:forEach var="order" items="${list}">
							<c:set var="i" value="${i+1}" />
							<tr class="ordernum">
							<td  class="text-center">${i}<input type="hidden" name="orderNo" id="orderNo" value="${order.orderNo}"/>
							<input type="hidden" name="id" name="id" value="${sessionScope.user.id }"/></td>
								<td align="center  text-center">
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
								<td class="text-center"><fmt:formatNumber value="${order.totalPrice}" pattern="#,###"/>원</td>

								<td class="text-center">
								<c:if test="${order.paymentCode =='1'}">
								무통장결제</c:if>
								<c:if test="${order.paymentCode =='2'}">
								카드결제</c:if>
								
								</td>
								<td class="actions text-center" >
								<input type="hidden" name="orderNo" class="orderNo" value="${order.orderNo}"/>
								<c:if test="${order.orderCode =='1'}">
								<font color="#38b00c">결제완료</font><br/>
								<span style="cursor:pointer"><font color="red">주문취소</font></span></c:if>
								
								<c:if test="${order.orderCode =='2'}">
								<font color="#62ab4d">배송중</font><br/>
								<span style="cursor:pointer"><font color="red">배송도착</font></span></c:if>
								
								<c:if test="${order.orderCode =='3'}">
								<b>배송완료</b></c:if>
								
								<c:if test="${order.orderCode =='4'}">
								<b>취소완료</b></c:if></td>
								<td class="actions text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderDate}" /></td>
								
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
<!-- 					<tfoot> -->
<!-- 						<tr> -->
<!-- <!-- 							<td><a class="btn btn-general btn-white"><i --> 
<!-- <!-- 									class="fa fa-angle-left"></i> 계속 쇼핑하기</a></td> --> 
<!-- 							<td colspan="2" class="hidden-xs"></td> -->
<!-- 							<td class="hidden-xs text-center"><strong></strong></td> -->
<!-- 							<td></td> -->
<!-- 						</tr> -->
<!-- 					</tfoot> -->
				</table>
			</div>
		</section>
	</form>
	<div style="padding-left: 750px">
		<jsp:include page="../../common/pageNavigator_new.jsp" />
	</div><br/><br/>
	<!-- PageNavigation End... -->

	<!-- Footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp" />
	<!-- Footer End /////////////////////////////////////-->
	
	
	<script type="text/javascript">
//=============    상품상세조회(썸네일)  Event  처리 		=============
//============= 썸네일 사진 클릭 Event  처리 =============	
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();	
		$("form").attr("method", "POST").attr("action",
				"/order/listOrder").submit();
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
		
		$( function(){
			
			$("td:nth-child(5) span:contains('주문취소')").on("click", function(){
				self.location = "/order/updateOrderCode?orderNo="+$(this).parent().find($("input:hidden[name='orderNo']")).val()+"&orderCode=4";
			});
			
			$("td:nth-child(5) span:contains('배송도착')").on("click", function(){
				swal({
					title : "배송확인 안내입니다.",
					text:"배송이 도착했으면 확인을 눌러주세요.",
		            buttons: ["취소","확인"],
					dangerMode: true,

				})		          
				.then((willDelete) => {
		            if (willDelete) {
			              swal("배송확인이 완료되었습니다!", {
			                icon: "success",
			                button : "확인",
			              }).then((value) => {
								self.location = "/order/updateOrderCode?orderNo="+$(this).parent().find($("input:hidden[name='orderNo']")).val()+"&orderCode=3";
			              });
			            
			          }
			       });	 
			});
			
		});

	
	


	</script>
</body>

</html>



