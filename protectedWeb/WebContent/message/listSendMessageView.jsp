<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
<head>

<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  ETC CDN -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
<!--  bootstrap CDN  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery JS -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  CSS -->
<style>
h7 {
	color: red;
}
#searchSubmmit{
	width : 60px;
	height : 52px;
	
	border-radius : 0px 15px 15px 0px;
	border : 1px solid #D3D3D3;
}

#searchCondition{
	height :30px;
	border-radius : 15px 0px 0px 15px;
}

.glyphicon-search{
	font-size : 15px;
}

td:hover{
	color : #3E6B79;
}

.go{
	color : #808080;
}
.go:hover{
	color : #3E6B79;
}
.btn.btn-default{
	width: 100px;
	height :30px;
	border-radius: 0px;
}
</style>

<title>정보공유</title>

</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<%-- 	<input type="hidden" id="menu" name="menu" value="${param.menu}"/> --%>

	<div class="container">

		<div class="page-header">
	       <h3 class=" text-info">받은쪽지함</h3>
	    </div>

		
<!-- 	■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ TABLE AREA ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■	 -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-9" style=""> -->
<!-- 				<div style="float: left;"> -->
<!-- 					<button type="button" class="btn btn-default"><h5>전체보기</h5></button> -->
<!-- 					<button type="button" class="btn btn-default"><h5>처리중</h5></button> -->
<!-- 					<button type="button" class="btn btn-default"><h5>처리완료</h5></button> -->
<!-- 				</div> -->
<!-- 				<div style="float: right;"> -->
<!-- 					<select name="pageSize" id="selectPageSize" -->
<!-- 						onchange="javascript:getPageSize()"> -->
<%-- 						<option value="8" ${ search.pageSize == 8 ? "selected" : "" }>8 개씩</option> --%>
<%-- 						<option value="15" ${ search.pageSize == 15 ? "selected" : "" }>15 개씩</option> --%>
<%-- 						<option value="30" ${ search.pageSize == 30 ? "selected" : "" }>30 개씩</option> --%>
<%-- 						<option value="50" ${ search.pageSize == 50 ? "selected" : "" }>50 개씩</option> --%>
<!-- 					</select> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
		<div class="row">
			<div class="col-md-12">
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--4dp">
					<thead>
						<tr align="center">
							<th width="10%">받은사람</th>
							<th width="40%" class="text-center">제목</th>
							<th width="20%" align="center" class="text-center">보낸일시</th>
							<th width="20%" align="center" class="text-center">받은일시</th>
							<th width="10%">더보기</th>				
						</tr>
					</thead>
					
					<tbody>
					<c:set var="i" value="0" />
						<c:forEach var="message" items="${list}">
							<tr>
								<td align="center">${ message.receiverId }</td>
								<td align="center" class="text-center">${ message.messageTitle }</td>
								<td align="center">
									<fmt:formatDate value="${ message.sendDate }" pattern="yyyy년 MM월 dd일"/>
								</td>
								<td align="center">
									<c:if test="${ message.messageStatus eq '0' }">
									<p>읽지 않음</p>
									</c:if>
									<c:if test="${ message.messageStatus eq '1' }">
										<fmt:formatDate value="${ message.receiveDate }" pattern="yyyy년 MM월 dd일"/>
									</c:if>
								</td>
								<td align="center">
									<input type="hidden" id="messageNo" name="messageNo" value="${ message.messageNo }">
								상세보기
								</td>
							</tr>
						</c:forEach>	
					</tbody>
				</table>
				
				<div class="col-md-12" align="right">

					<br />

<%-- 					<c:if test="${ ! empty sessionScope.user }"> --%>
<!-- 						<button>글 쓰기</button> -->
<%-- 					</c:if> --%>
					
					<div align="center">
					<jsp:include page="/common/pageNavigator.jsp" />
					</div>
					
					<div style="min-height: 40px">
					</div>
					
<!-- 					<div align="center"> -->
<!-- 					<div class="col-md-12 col-sm-12 col-xm-12" style="padding-left: 28%;"> -->
<!-- 					<form class="form-inline" name="detailForm"> -->
<!-- 						<div class="form-group"> -->
<!-- 							<select class="form-control" id="searchCondition" -->
<!-- 								name="searchCondition"> -->
<!-- 								<option value="0" -->
<%-- 									${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>신고자</option> --%>
<!-- 								<option value="1" -->
<%-- 									${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>신고대상</option> --%>
<!-- 								<option value="2" -->
<%-- 									${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>신고유형</option> --%>
<!-- 							</select> -->
<!-- 						</div> -->


<!-- 						<div class="form-group"> -->
<!-- 							<label class="sr-only" for="searchKeyword">검색어</label> <input -->
<!-- 								type="text" class="form-control" id="searchKeyword" -->
<!-- 								name="searchKeyword" placeholder="검색어" -->
<%-- 								value="${! empty search.searchKeyword ? search.searchKeyword : '' }"> --%>
<!-- 							<button type="button" id="searchSubmmit" class="btn btn-default"> -->
<!-- 								<span class="glyphicon glyphicon-search"></span> -->
<!-- 							</button> -->
<!-- 						</div> -->

						<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
						<input type="hidden" id="currentPage" name="currentPage" value="" />
					</form>
				</div>
				</div>
			</div>
			</div>

		</div>

	</div>
	
	<div class="empty" style="min-height: 100px">
		
	</div>
	<jsp:include page="/layout/footer.jsp"/>
	
	<!-- JavaScript -->
	<script type="text/javascript">
	

	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)

		$("form").attr("method", "POST").attr("action","/message/listSendMessage").submit();
	}
	
	$(function(){
		$("td:nth-child(5)").on("click", function(){
			var messageNo=$(this).children("input").val();
			alert(messageNo);
			self.location="/message/getMessage?messageNo="+messageNo;
		})
	});

	</script>
	
</body>
</html>
