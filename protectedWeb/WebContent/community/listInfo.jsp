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
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- jQuery CSS -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- jQuery JS -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  CSS -->
<style>
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
</style>


<title>보호할개.정보공유</title>
<jsp:include page="/layout/toolbar.jsp" />
</head>

<body>

	<div class="hero-wrap hero-bread" style="padding-bottom: 0px; padding-top : 10px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/index.jsp">정보공유</a></span>
					</p>
					<h1 class="mb-0 bread">견종백과</h1>
				</div>
			</div>
		</div>
	</div>

	<%-- 	<input type="hidden" id="menu" name="menu" value="${param.menu}"/> --%>

	<div class="container">

		<br/>
		
		<br/>
		
		
<!-- 	■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ TABLE AREA ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■	 -->
		<div class="row">
			<div class="col-md-9" style="">
				<div style="float: left;">
					<button type="button" class="btn btn-default"><h5>전체보기</h5></button>
					<button type="button" class="btn btn-default"><h5>조회수 ▼</h5></button>
					<button type="button" class="btn btn-default"><h5>추천수 ▼</h5></button>
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
		</div>
		
				<c:if test="${totalCount == 0}">
				<div class="col-md-9" align="center" style="height: 500px; padding-top: 250px;">
					검색결과 없음
					<form class="form-inline" name="detailForm">
						<div class="form-group">
							<select class="form-control" id="searchCondition"
								name="searchCondition">
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
				</c:if>
		
		<div class="row">
			<div class="col-md-9" id="listTable">
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
				
				<div class="col-md-12" align="right">

					<br />

					<c:if test="${ ! empty sessionScope.user }">
						<button>글 쓰기</button>
					</c:if>
					
					<div align="center">
					<jsp:include page="/common/pageNavigator.jsp" />
					</div>
					
					<div style="min-height: 40px">
					</div>
					
					<div align="center">
					<div class="col-md-12 col-sm-12 col-xm-12" style="padding-left: 28%;">
					<form class="form-inline" name="detailForm">
						<div class="form-group">
							<select class="form-control" id="searchCondition"
								name="searchCondition">
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
			</div>
<!-- 		■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ HOT AREA ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
			<div class="col-md-3">
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

					<tbody class="newstbody">
								<tr align="center">
									<td colspan='2' class='text-center'><h4><b>HOT 개</b></h4>
									</td>
								</tr>
						<c:set var="i" value="0" />
						<c:forEach var="best" items="${listRanking}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<td class="mdl-data-table__cell--non-numeric">${i}</td>
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
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ NEWS AREA ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  -->
			
			<div class="row">
				
				
<!-- 				<div class="col-md-3"> -->
<!-- 					<h3 align="center"> -->
<!-- 						<b>뉴스</b> -->
<!-- 					</h3> -->
<!-- 					<p> -->
<!-- 					<table class="mdl-data-table mdl-js-data-table mdl-shadow--4dp"> -->
<!-- 						<tbody class="newstbody"> -->
<!-- 						</tbody> -->
<!-- 					</table> -->
<!-- 				</div> -->
				
				<br />
				<p />
				<br/>
			</div>	
	</div>
	
	<div class="empty" style="min-height: 100px">
		
	</div>
	<jsp:include page="/layout/footer.jsp"/>
	
</body>
	
	<!-- JavaScript -->
<script type="text/javascript">
	
$(function(){
	
	$(document).ready(function(){
		listNews();
		
		if(${totalCount == 0}){
 			$("#listTable").hide(); 
		}
	});
	
	$(document).on("click",".go",function(){
		
		window.open($(this).children("input").val(),"new","width=800, height=600, top=100, left=100, toolbar=no, menubar=no, location=no, channelmode=yes");
	});
});

function listNews(){
		
	$.ajax({
		url : "/News/json/listNews/",
		method : "POST",
		data : JSON.stringify({searchKeyword : $("#searchKeyword").val()}),
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=euc-kr",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json;charset=euc_kr"
		},
		success : function(JSONData, status) {
			
			console.log(JSON.stringify(JSONData));
			
			var list = JSONData.items;
			
			$(".newstbody").append("<tr><td colspan='2' class='text-center'><h4><b>뉴스</b></h4></td></tr>");
		
			$.each(list, function(index, items) {
				
				console.log("index : " + index );
				console.log("items : " + JSON.stringify(items) );
				var title = items.title;
				
				$(".newstbody").append(
						  "<tr>"
						+	 "<td colspan='2'  class='mdl-data-table__cell--non-numeric' style='max-width:200px;'>"
								+ "<a href='javascript:void(0)' class='go'>"+title.substring(0,20)
								+ "<input type='hidden' name='link' value='"+items.link+"'>"
								+ "</a>"
						+	 "</td>"
						+ "</tr>"
				);
				
				
			});
				
			//alert("success");
			
		},
		error : function(request, status, error){	
		
			alert("error");

			
		}
	});
}

	function fncGetList(currentPage) {
		
		$("#currentPage").val(currentPage);
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

		$("#searchKeyword").on("keyup", function() {

			var search = {
				searchKeyword : $("#searchKeyword").val(),
				searchCondition : $("#searchCondition").val()
			};
			var convertSearch = JSON.stringify(search);

			$.ajax({
				url : "/product/json/listProduct/"+ menu + "/" + pageSize,
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

					var postNo = $(this).children("input").val();
					if(postNo == undefined){
						return;
					}
					$(self.location).attr("href","/info/getInfo?postNo="+postNo);
				});

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
</html>
