<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->

	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">신고글목록</h3>
	    </div>
		
		<table class="table table-hover table-striped">
		
			<thead>
				<tr>
					<th>
						<input type="hidden" value="히든">
					</th>
					<th align="left">신고자</th>
					<th align="left">신고대상</th>
					<th align="left">신고유형</th>
					<th align="left">신고일시</th>
					<th align="left">처리상태</th>
					<th align="left">더보기</th>
				</tr>
			</thead>
		
			<tbody>
			
				<c:set var="i" value="0"/>
				<c:forEach var="report" items="${ list }">
					<tr>
						<td>
							<input type="hidden" id="reportNo" name="reportNo" value="${ report.reportNo }">
						</td>
						<td align="left">${ report.reporterId }</td>
						<td align="left">${ report.reportedId }</td>
						<td align="left">${ report.reportCategory }</td>
						<td align="left">
							<fmt:formatDate value="${ report.reportDate }" pattern="yyyy년 MM월 dd일"/>
						</td>
						<c:if test="${ report.reportStatus == 0 }">
							<td align="left">(${ report.reportStatus })처리중</td>
						</c:if>
						<c:if test="${ report.reportStatus == 1 }">
							<td align="left">(${ report.reportStatus })처리완료</td>
						</c:if>
						<td align="right">상세보기</td>
					</tr>
				</c:forEach>
			
			</tbody>
		
		
		</table>
	


	
	</div>
	
		
		<jsp:include page="../common/pageNavigator_new.jsp"/>
		<jsp:include page="../layout/footer.jsp"></jsp:include>



	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		$(function(){
			$("td:nth-child(7)").on("click", function(){
				var reportNo=$(this).parent().children().children("#reportNo").val();
				self.location="/report/getReport?reportNo="+reportNo;
			})
		});
		
// 		$(function(){
// 			$("#couponManage").on("click", function(){
// 				self.location="/coupon/addCouponManage"
// 			})
// 		});
		
// 		$(function(){
// 			$(".removeCoupon").on("click", function(){
// 				var couponNo=$(this).parent().parent().children("#couponNo").val();
// 				alert(couponNo);
// 				self.location="/coupon/updateCoupon?couponNo="+couponNo+"&couponStatus=3";
// 			})
// 		})
		
	</script>

</body>

</html>