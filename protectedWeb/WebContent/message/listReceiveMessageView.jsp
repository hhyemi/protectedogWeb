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
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">받은쪽지함</h3>
	    </div>
		
		<table class="table table-hover table-striped">
		
			<thead>
				<tr>
					<th>
						<input type="hidden" value="히든">
					</th>
					<th align="left">보낸사람</th>
					<th align="left">제목</th>
					<th align="left">보낸일시</th>
					<th align="left">받은일시</th>
					<th align="left">더보기</th>
				</tr>
			</thead>
		
			<tbody>
			
				<c:set var="i" value="0"/>
				<c:forEach var="message" items="${ list }">
					<tr>
						<td>
							<input type="hidden" id="messageNo" name="messageNo" value="${ message.messageNo }">
						</td>
						<td align="left">${ message.senderId }</td>
						<td align="left">${ message.messageTitle }</td>
						<td align="left">
							<fmt:formatDate value="${ message.sendDate }" pattern="yyyy년 MM월 dd일"/>
						</td>
						<td align="left">
							<c:if test="${ message.messageStatus eq '0' }">
								<p>읽지 않음</p>
							</c:if>
							<c:if test="${ message.messageStatus eq '1' }">
								<fmt:formatDate value="${ message.receiveDate }" pattern="yyyy년 MM월 dd일"/>
							</c:if>
						</td>
						<td id="moreView" align="left">더보기</td>

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
			$("td:nth-child(6)").on("click", function(){
				var messageNo=$(this).parent().children().children("#messageNo").val();
				self.location="/message/getMessage?messageNo="+messageNo;
			})
		});
		
		
	</script>
	
	
</body>

</html>