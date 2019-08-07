<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8
">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>보호할개 · 보호마켓</title>


<!-- Global Stylesheets -->



<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->

<!-- Core Stylesheets -->
<link rel="stylesheet" href="/resources/newTemplate/css/shop.css">


<!--  ///////////////////////// JavaScript ////////////////////////// -->
<style>
		#checkPostTitle{
	      width:300px;
	      padding:0 5px;
	      overflow:hidden;
	      text-overflow:ellipsis;
	      white-space:nowrap;
	  } 


#get {
	padding-left: 10px;
	padding-right: 10px;
	max-width: 350px;
	min-width: 350px;
	min-height: 550px;
	max-height: 550px;
}

.img-fluid {
	min-height: 250px;
	max-height: 250px;
	max-width: 345px;
	min-width: 345px;
	padding-left: 12px;
	padding-right: 9px;
	padding-bottom: 10px;
}

.card {
	min-height: 400px;
	max-height: 400px;
	max-width: 350px;
	min-width: 350px;
}

		#searchKeyword {
			height: 40px;
			width: 150px;
			border : 1px solid #D3D3D3;
			padding-left: 5px;
			border-right: 0px;
		}

#searchSubmmit {
	width: 60px;
	height: 40px;
	border-radius: 0px 15px 15px 0px;
	border: 1px solid #D3D3D3;
}

#searchCondition {
			height : 40px;
			border-radius : 15px 0px 0px 15px;
			padding-left: 10px;
			border-color: #D3D3D3;
			border-right: 0px;
}

#selectPageSize {
	height: 30px;
}

#newstd {
	min-width: 251px;
	max-width: 251px;
}

.btn-default {
	height: 30px;
	color: white;
}
#bottom{
margin-top: 80px;
margin-right:200px;}

</style>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp"></jsp:include>
<!-- ToolBar End /////////////////////////////////////-->

</head>

<!--====================================================
                         HEADER
======================================================-->


<!--====================================================
                    LOGIN OR REGISTER
======================================================-->
<!--====================================================
                         HOME STA
======================================================-->
<body class="goto-here">
	<div class="hero-wrap hero-bread"
		style="padding-bottom: 30px; padding-top: 60px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p>
						<span class="mr-2">Protectedog</span> <span>Market</span>
					</p>
					<font size="7">보호 마켓</font>
				</div>
			</div>
		</div>
	</div>
	<br />
	<p />

	<!--====================================================
                        SHOP-P1
======================================================-->


	<div class="sectionContainer ">
    <section class="ftco-section bg-light" style="padding-bottom: 0px; padding-top : 20px;">   

		 <form class="form-inline" name="detailForm">
		    	<div class ="container">

				<!--검색 부터 -->		    	
		    		<div class="row" > 
					    <div class="col-md-12 text-left">
					    	<p style="font-weight: bold;">
					    		전체  ${resultPage.totalCount } 건 | 현재 ${resultPage.currentPage} 페이지
					    	</p>
					    </div>
					<div class="col-md-6" id="justify" align="left">
		    		<button type="button" class="btn btn-default"  id="createtext" style="float: left" >작성</button>
			 		</div>					    
					    
			 		 	<div class="col-md-6" align="right">
						<div class="form-group" style="padding-left:250px"> 

						    <select  name="searchCondition" id="searchCondition" >
								<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>작성자</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>글내용</option>
							</select>
	
						    <label class="sr-only" for="searchKeyword"> 검색어</label>
						    <input type="text"  id="searchKeyword" name="searchKeyword"  placeholder="검색어를 입력하세요." value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
								<button type="button" id="searchSubmmit" class="btn btn-default searchSubmmit" style="padding-bottom: 6px;margin-left: 0px;">
							<span class="fas fa-search"></span>
						</button>
						</div>
					</div>
					</div>    
					<br/>
    		    	
    		    	
    		    <c:if test="${resultPage.totalCount eq 0 }">
			 		<jsp:include page="/common/searchResult.jsp"></jsp:include>
			 	</c:if>
					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />
<%-- 				    <input type="hidden" value="${board.postNo}" /> --%>
<%-- 		        	<input type="hidden" value="${board.boardCode}" /> --%>
					<input type="hidden" id="currentPageList" name="currentPageList" value="${resultPage.currentPage}" />
			
				</form>

			<!-- 썸네일 Start //////////////////////////////////////////////////////////////////-->

			<div class="row" >
				<div class="col-md-10 col-lg-12 order-md-last">
					<div class="row" id="thumbnailRow">
						<c:set var="i" value="0" />
						<c:forEach var="board" items="${list}">
							<c:set var="i" value="${i+1}" />
							
							<div class="col-sm-6 col-md-6 col-lg-4 ftco-animate" >
								<div class="desc-comp-offer-cont"  style="padding-top:10px; background-color: white">
								  <input type="hidden" id="postNo" value="${board.postNo}"/>
					  
									&emsp;조회수 ${board.viewCount }
									<img class="img-fluid" id="clickplease"
										src="../../resources/file/fileMarket/${board.thumnail}">
										<div id="checkPostTitle" >
											<font size="5"><b>&emsp;${board.postTitle}</b></font> 
										</div>
										&emsp;&emsp;${board.prodName} <strong>&nbsp;&nbsp;<fmt:formatNumber
												value="${board.price}" pattern="#,###" />원
										</strong>
										<hr>
										<div align="right" style="margin-right:10px">
										${board.nickName}(&nbsp;${board.city}&nbsp;)
											</div>
								
								
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			</section>
		</div>
	<br/><br/>
	<div align="center" style="padding-left: 45%">
		<jsp:include page="/common/pageNavigator_new.jsp" />
	</div>
	
	<br/><br/>
<br/><br/>



<!--====================================================
                      FOOTER
======================================================-->
	<!--================ start footer Area  =================-->
	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!-- footer End /////////////////////////////////////-->
	<!--================ End footer Area  =================-->

	<script type="text/javascript">
		//=============    검색 / page 두가지 경우 모두  Event  처리	 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method", "POST").attr("action",
					"/market/listMarket").submit();
		}
		//=============    상품상세조회(썸네일)  Event  처리 		=============
		//============= 썸네일 사진 클릭 Event  처리 =============	
		$(function() {
			$(".desc-comp-offer-cont").on(
					"click",
					function() {
						$(self.location).attr(
								"href","/market/getMarket?postNo="+ $(this).children("#postNo").val());
					});
		});

		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			$("#createtext").on("click", function() {
				self.location = "/shop/market/addMarket.jsp";
			});

		});

		//============= Event 처리 및  연결 =============
		$(function() {

			$("#searchSubmmit").on("click", function() {
				fncGetList(1);
			});

		});
	</script>
</body>
</html>
