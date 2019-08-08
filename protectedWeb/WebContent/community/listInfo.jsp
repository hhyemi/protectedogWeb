<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html lang="ko">
<head>
<title>보호할개 · 정보공유</title>
<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<!--  ETC CDN -->
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> -->
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<!-- <link rel="stylesheet" href="/resources/newTemplate/css/neon.css"> -->
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
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<!--  CSS -->
<style>
#searchKeyword{height: 40px;width: 150px;border : 1px solid #D3D3D3;padding-left: 10px;}
#searchSubmmit{
	width : 60px;
	height : 40px;
	border-radius : 0px 15px 15px 0px;
	border : 1px solid #f04f23;
}
#searchCondition{height : 40px;border-radius : 15px 0px 0px 15px;border-right: 0px;}
#selectPageSize{height: 30px; width:76px;}
#newstd{min-width: 306px;max-width : 306px;}	
.postHotTitle:hover,.postTitle:hover{cursor:pointer;color:#fa714b}
.btn-default{height: 30px;color:white;}
th{background-color: #F0F0F0;}



</style>


<title>보호할개 · 정보공유</title>
<jsp:include page="/layout/toolbar.jsp" />
</head>

<body>

	<div class="hero-wrap hero-bread" style="padding-bottom: 60px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">Information</span> <span>Share</span></p>
            <font size="7">정보공유</font>
          </div>
        </div>
      </div>
    </div>

	<%-- 	<input type="hidden" id="menu" name="menu" value="${param.menu}"/> --%>

	<div class="container">

		<br/>
		
		<br/>
		
		<div> 전체 ${totalCount} 건 | 현재 ${search.currentPage} 페이지</div>
<!-- 	■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ TABLE AREA ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■	 -->
		<div class="row">
			<div class="col-md-9 col-sm-12 col-xs-12" style="padding-bottom : 5px;">
				<div style="float: left;">
					<button type="button" class="btn btn-default">전체보기</button>
					<button type="button" class="btn btn-default">조회수 ▼</button>
					<button type="button" class="btn btn-default">추천수 ▼</button>
					
					<select name="pageSize" id="selectPageSize"
						onchange="javascript:getPageSize()">
						<option value="8" ${ search.pageSize == 8 ? "selected" : "" }>8 개씩</option>
						<option value="15" ${ search.pageSize == 15 ? "selected" : "" }>15 개씩</option>
						<option value="30" ${ search.pageSize == 30 ? "selected" : "" }>30 개씩</option>
						<option value="50" ${ search.pageSize == 50 ? "selected" : "" }>50 개씩</option>
					</select>
				</div>
				<div style="float: right;">
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
							<input type="text" class=" searchKeyword" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력해주세요" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						</div>
						
						<button type="button" id="searchSubmmit" class="btn btn-default searchSubmmit" style="margin : 0px;">
							<span class="fas fa-search"></span>
						</button>

						<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
						<input type="hidden" id="currentPage" name="currentPage" value="" />
					</form>
				</div>
			</div>
		</div>
		
		
				<c:if test="${totalCount == 0}">
				<div class="row">
				<div class="col-md-9" align="center" style="height: 500px; padding-top: 150px;">
					
					<jsp:include page="/common/searchResult.jsp"></jsp:include>
				</div>
				</c:if>
		
		<c:if test="${totalCount != 0}">
		<div class="row">
			<div class="col-md-9 col-sm-12 col-xs-12" id="listTable">
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--4dp">
					<thead>
						<tr align="center" style="height: 54px;">
							<th width="10%" class="text-center" style="padding-bottom : 15px">번호</th>
							<th width="30%" align="center" class="text-center" style="padding-bottom : 15px">제목</th>
							<th width="10%" class="text-center" style="padding-bottom : 15px">작성자</th>
							<th width="10%" class="text-center" style="padding-bottom : 15px">작성일</th>
							<th width="5%"  style="padding-bottom : 15px">조회수</th>
							<th width="5%"  style="padding-bottom : 15px">추천수</th>					
						</tr>
					</thead>
					
					<tbody>
<%-- 					<c:if test="${param.pageNo == null }"> --%>
<%-- 						<c:set var="i" value="${totalCount}" /> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${param.pageNo != null }"> --%>
<%-- 						<c:set var="i" value="${param.pageNo}" /> --%>
<%-- 					</c:if> --%>
						<c:set var="i" value="${ totalCount - ( (search.currentPage - 1) * search.pageSize )  }" />
						<c:forEach var="board" items="${list}">
							<c:set var="i" value="${  i - 1  }" />
							<tr>
								<td align="center" class="text-center">${i + 1 }</td>
								<td align="center" class="postTitle mdl-data-table__cell--non-numeric">
									<input type="hidden" name="postNo" value="${board.postNo}">
									${board.postTitle} [${board.commentCount}]
								</td>
								<td align="center" class="text-center">${board.nickName}</td>
								<td align="center" class="text-center">${board.regDate}</td>
								<td align="center">${board.viewCount}</td>
								<td align="center">${board.recommendCount}</td>
							</tr>
						</c:forEach>	
					</tbody>
				</table>
				
				<div class="col-md-12" align="right">

					<br />

						<button type="button" class="btn btn-default">작성</button>
					
					<div align="center" style="padding-left: 33%">
					<jsp:include page="/common/pageNavigator_new.jsp" />
					</div>
					
					<div style="min-height: 40px">
					</div>
	
			</div>
			</div>

			</c:if>
<!-- 		■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ HOT AREA ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
			<div class="col-md-3 col-sm-6 col-xs-6">
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--4dp">

				<tbody>
					<tr align="center">
						<td colspan='2' class='text-center'style="background-color: #F0F0F0;min-width : 305px;" >
							<h4><b>HOT 개</b></h4>
						</td>
					</tr>
					<c:set var="i" value="0" />
					<c:forEach var="best" items="${listRanking}">
						<c:set var="i" value="${ i+1 }" />
						<tr>
							<td class="mdl-data-table__cell--non-numeric">
							<c:if test="${i == 1}">
								<img src="/resources/file/others/gold-medal.png"> ${i} 등</img>
							</c:if>
							<c:if test="${i == 2}">
								<img src="/resources/file/others/silver-medal.png"> ${i} 등</img>
							</c:if>
							<c:if test="${i >= 3}">
								<img src="/resources/file/others/bronze-medal.png"> ${i} 등</img>
							</c:if>
							</td>
							<td align="center" class="postHotTitle mdl-data-table__cell--non-numeric" width="200px"><input type="hidden" name="postNo" value="${best.postNo}">
								${fn:substring(best.postTitle,0,18)}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				
				<br/>
				
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--4dp">

					<tbody class="newstbody">
							
			 		</tbody>
					
				</table>
				
			</div>
			<br />
			</div>
			</div>
		
			<p />
			<br/>	
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
		data : JSON.stringify({searchKeyword : $(".searchKeyword").val()}),
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json;charset=UTF-8"
		},
		success : function(JSONData, status) {
			
			//console.log(JSON.stringify(JSONData));
			
			var list = JSONData.items;
			
			$(".newstbody").append("<tr><td class='text-center' style='background-color : #F0F0F0'><h4><b>뉴스</b></h4></td></tr>");
		
			$.each(list, function(index, items) {
				
				//console.log("index : " + index );
				//console.log("items : " + JSON.stringify(items) );
				var title = items.title;
				
				$(".newstbody").append(
						  "<tr>"
						+	 "<td id='newstd' class='mdl-data-table__cell--non-numeric'>"
								+ "<a href='javascript:void(0)' class='go'>"+title.substring(0,27)
								+ "<input type='hidden' name='link' value='"+items.link+"'>"
								+ "</a>"
						+	 "</td>"
						+ "</tr>"
				);
				
				
			});
		}
	});
}

	function fncGetList(currentPage) {
		
		$("#currentPage").val(currentPage);
				
		var pageNo = $("#listTable tr:last td:first").text();
		
		if(${param.order != null}){
			$("form").attr("method", "POST").attr("action","/info/listInfo?order=${param.order}&pageSize=${search.pageSize}").submit();
			return;
		}
		
		$("form").attr("method", "POST").attr("action","/info/listInfo?pageSize=${search.pageSize}").submit();
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

		$(".searchKeyword").on("keyup", function() {

			var search = {
				searchKeyword : $(".searchKeyword").val(),
				searchCondition : $(".searchCondition").val()
			};
			var convertSearch = JSON.stringify(search);

			$.ajax({
				url : "/product/json/listProduct/"+ menu + "/" + pageSize,
				method : "POST",
				dataType : "json",
				data : convertSearch,
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json;charset=UTF-8"
				},
				success : function(JSONData, status) {
					$(".searchKeyword").autocomplete({
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
			$(".searchKeyword").keydown(function(key){
				if(key.keyCode == 13){
					fncGetList(1);
				}
			});
		});
		
		$(".searchSubmmit").on("click", function() {
			fncGetList(1);
		});
		
		$("button:contains('작성')").on("click", function(){
			
			if(${empty user}){
				$("#login-modal").modal("show");
				return;
			}
			self.location = "/community/addInfo.jsp"
		});
	});
</script>

<script src="https://kit.fontawesome.com/e26616618e.js"></script>

</html>
