<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
</style>

<title>정보공유</title>

<!-- JavaScript -->
<script type="text/javascript">

	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)

		$("form").attr("method", "POST").attr("action","/info/listInfo").submit();
	}

	function getPageSize() {
		$(self.location).attr("href","/info/listInfo?&pageSize="+ $("#selectPageSize").val());
	}
	
	
	$(function(){
		
		$("button:contains('전체보기')").on("click", function(){
			$(self.location).attr("href","/info/listInfo?order=1&pageSize=${search.pageSize}");
		});
		
		$("button:contains('조회수')").on("click", function(){
			$(self.location).attr("href","/info/listInfo?order=2&pageSize=${search.pageSize}");
		});
		
		$("button:contains('추천수')").on("click", function(){
			$(self.location).attr("href","/info/listInfo?order=3&pageSize=${search.pageSize}");
		});
		
	});
	$(function() {

		var pageSize = $("#selectPageSize").val();
		var menu = $("#menu").val();

		$("#searchKeyword")
				.on(
						"keyup",
						function() {

							var search = {
								searchKeyword : $("#searchKeyword").val(),
								searchCondition : $("#searchCondition").val()
							};
							var convertSearch = JSON.stringify(search);

							$
									.ajax({
										url : "/product/json/listProduct/"
												+ menu + "/" + pageSize,
										method : "POST",
										dataType : "json",
										data : convertSearch,
										contentType : "application/x-www-form-urlencoded; charset=euc-kr",
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json;charset=euc_kr"
										},
										success : function(JSONData, status) {
											$("#searchKeyword").autocomplete({
												source : JSONData
											});
										}
									});
						});

		$("td:nth-child(2)").on("click",function() {

					//alert($(this).children("input").val())
					var postNo = $(this).children("input").val();
					if(postNo == undefined){
						return;
					}
					$(self.location).attr("href","/info/getInfo?postNo="+postNo);
				});

		// 		페이지 처리를 위한 스크립트
		
		$("td:nth-child(1)").on("click",function(){
				
			var postNo = $(this).children("input").val();
			if(postNo == undefined){
				return;
			}
			$(self.location).attr("href","/info/getInfo?postNo="+postNo);
		});
		$(document).ready(function(){
			$("#searchKeyword").keydown(function(key){
				if(key.keyCode == 13){
					fncGetList(1);
				}
			});
		});
		$("#searchSubmmit").on("click", function() {
			fncGetList(1);
		});
		
		$("button:contains('글 쓰기')").on("click", function(){
			self.location = "/community/addInfo.jsp"
		});
	});
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<%-- 	<input type="hidden" id="menu" name="menu" value="${param.menu}"/> --%>

	<div class="container">

		

		<br/>


		
		<br/>

		<div class="row">
			<div class="col-md-9" style="">
				<div style="float: left;">
					<button type="button" class="btn btn-default">전체보기</button>
					<button type="button" class="btn btn-default">조회수 ▼</button>
					<button type="button" class="btn btn-default">추천수 ▼</button>
				</div>
				<div style="float: right;">
					<select name="pageSize" id="selectPageSize"
						onchange="javascript:getPageSize()">
						<option value="8" ${ search.pageSize == 8 ? "selected" : "" }>8 개씩</option>
						<option value="15" ${ search.pageSize == 15 ? "selected" : "" }>15 개씩</option>
						<option value="30" ${ search.pageSize == 30 ? "selected" : "" }>30 개씩</option>
						<option value="50" ${ search.pageSize == 50 ? "selected" : "" }>50 개씩</option>
					</select>
				</div>
			</div>
			
			<div class="col-md-9">
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--4dp">
					<thead>
						<tr align="center">
							<th width="10%" class="text-center">번호</th>
							<th width="30%" align="center" class="text-center">제목</th>
							<th width="10%">글쓴이</th>
							<th width="10%">작성일</th>
							<th width="5%">조회수</th>
							<th width="5%">추천수</th>					
						</tr>
					</thead>
					
					<tbody>
					<c:set var="i" value="0" />
						<c:forEach var="board" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<tr>
								<td align="center" class="text-center">${i}</td>
								<td align="center" class="mdl-data-table__cell--non-numeric">
									<input type="hidden" name="postNo" value="${board.postNo}">
									${board.postTitle} [${board.commentCount}]
								</td>
								<td align="center">${board.nickName}</td>
								<td align="center">${board.regDate}</td>
								<td align="center">${board.viewCount}</td>
								<td align="center">${board.recommendCount}</td>
							</tr>
						</c:forEach>	
					</tbody>
				</table>
			</div>
			

			<div class="col-md-3" style="border: 1px solid #4E8092;">
				<h3 align="center">
					<b>HOT 개</b>
				</h3>
				<p>
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--4dp">

					<thead>
						<tr align="center">
<!-- 							<th class="mdl-data-table__cell--non-numeric" width="10%">번호</th> -->
<!-- 							<th width="30%" class="text-center">제목</th> -->
<!-- 							<th width="10%">작성자</th> -->
<!-- 							<th width="10%">작성일</th> -->
<!-- 							<th width="5%">조회수</th> -->
<!-- 							<th width="5%">추천수</th> -->
						</tr>
					</thead>

					<tbody>
						<c:set var="i" value="0" />
						<c:forEach var="best" items="${listRanking}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<td class="mdl-data-table__cell--non-numeric"> <span style="padding: 1px solid black">${i}</span></td>
									<td align="center" class="mdl-data-table__cell--non-numeric" width="200px"><input type="hidden" name="postNo"
										value="${best.postNo}"> ${best.postTitle}</td>
<%-- 									<td align="center">${best.nickName}</td> --%>
<%-- 									<td align="center">${best.regDate}</td> --%>
<%-- 									<td align="center">${best.viewCount}</td> --%>
<%-- 									<td align="center">${best.recommendCount}</td> --%>
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br />
		</div>

		
	<div class="col-md-9" align="right">
	
	<br/>
	
	<button>글 쓰기</button>
	</div>
	
	<br/>
	<p/>
	<div class="col-md-9" align="center">
	<jsp:include page="/common/pageNavigator.jsp" />
	</div>

	<br/>
		<div class="container">
			<div class="col-md-9 col-sm-9 col-xm-9" style="padding-left: 200px">
				<form class="form-inline" name="detailForm">
					<div class="form-group">
						<select class="form-control" id="searchCondition" name="searchCondition">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>작성자</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>글내용</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						<button type="button" id="searchSubmmit" class="btn btn-default">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>

					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />
				</form>
			</div>
		</div>
	</div>
	
	<div class="empty" style="min-height: 100px">
		
	</div>
	<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
