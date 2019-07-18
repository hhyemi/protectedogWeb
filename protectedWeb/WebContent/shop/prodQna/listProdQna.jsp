<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=width, initial-scale=1">

<script type="text/javascript">
 function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "action","/purchase/listPurchase").submit();
	}
	
	
	$( function(){
	
		$("td:nth-child(1)").on("click", function(){
			var tranNo = $(this).data("param0")
			self.location = "/purchase/getPurchase?tranNo="+tranNo
		});
		
		$("td:nth-child(2)").on("click", function(){
			var userId = $(this).data("param1")
			self.location = "/user/getUser?userId="+userId
		});
		
		 $(".ct_list_pop td:nth-child(11)").on("click", function(){
				var index = $($(".ct_list_pop td:nth-child(11)")).index(this);
				console.log(index)
				var tranNo = $($("input[name=tranNo]")[index]).val();
				
				console.log(tranNo) 
				self.location = "/purchase/deletePurchase?tranNo="+tranNo
						
			 })
		
		$("#change3").on("click", function(){
			var tranNo = $(this).data("param0")
			self.location = "/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=3"
		});
		
	
});
	
</script> 
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">구매 목록조회</h3>
	   	</div>
	

		<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		</div>
		
		<!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      <!-- 배너 -->
	
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">회원ID</th>
            <th align="left">회원명 </th>
            <th align="left">전화번호</th>
            <th align="left">배송현황</th>
             <th align="left">정보수정</th>
          </tr>
        </thead>
			
		<c:set var="i" value="0"/>
		<c:forEach var = "board" items="${list}">
		<c:set var="i" value="${i+1}" />	
	
	<tr>
		<td align="center"  data-param0="${order.orderNo}">${i}</td>
		<td align="left" data-param1="${order.id}">${purchase.buyer.userId}</td>
		<td align="left">${order.receiverName}</td>
		<td align="left">${order.receiverPhone}</td>
	
		<td align="left">
			<c:if test="${order.orderCode.trim() == '1'}">
			 <a href="/purchase/deletePurchase?tranNo=${purchase.tranNo}">주문취소</a>
			<input type="hidden" name="tranNo" value="${purchase.tranNo }"/>
			</c:if>
		<c:if test="${order.order.trim() == '2'}"> 배송중 </c:if>
		<c:if test="${order.order.trim() == '2'}"><br/>
			<a id="change3" data-param1="${order.tranNo}" data-param2="${user.userId}">
			물건도착
			</a>
		</c:if>
		</td>
		</tr>
	</c:forEach>
	</table>
	<!-- PageNavigation Start... -->
	
		<!-- PageNavigation End... -->

	<!--  페이지 Navigator 끝 -->

</div>

</body>
</html>