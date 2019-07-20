 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="EUC-KR">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    

    <!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

		.right-box {
		  float: right;
		}		     
    </style>
    
    
  </head>
  <body class="goto-here">
 	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->  
   	
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">support</a></span> <span>apply</span></p>
            <h1 class="mb-0 bread">후원신청</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section bg-light">    
    
		 <form class="form-inline" name="detailForm">
		    	<div class="container" >
		    	
				<!--검색 부터 -->		    	
		    		<div class="row">  
				    	<div class="right-box">

						    <select class="form-control" id="voteCondition" name="voteCondition" >
								<option value="0" ${ ! empty search.voteCondition && search.voteCondition==0 ? "selected" : "" }>전체보기</option>
								<option value="1" ${ ! empty search.voteCondition && search.voteCondition==1 ? "selected" : "" } >투표중</option>
								<option value="2" ${ ! empty search.voteCondition && search.voteCondition==2 ? "selected" : "" } >투표완료</option>
							</select>   
						    &emsp;
						    <select class="form-control" name="searchCondition" id="searchCondition" >
								<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" } >제목</option>
								<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
							</select>
							&emsp;
						    <label class="sr-only" for="searchKeyword">검색어</label>
						    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" >
						    <button type="button" class="btn btn-default">검색</button>

						</div>
			    	</div>    
    		    	<br/>
				<!-- 썸네일 부터 -->
		    		<div class="row">
		    			<div class="col-md-10 col-lg-12 order-md-last">
		    				<div class="row">
			    			<c:set var="i" value="0" />
							  <c:forEach var="funding" items="${list}">
				    			<div class="col-sm-6 col-md-6 col-lg-4 ftco-animate">
				    				<div class="product">
				    				
				    					 <!-- 투표종료 -->
										 <c:if test ="${!(funding.statusCode eq 1) }">
										 조회 ${funding.voteViewCount }
				                        <a href="#" class="img-prod"><img src="/resources/file/fileSF/end.png" style=" min-height:210px; max-height:210px; min-width:300px; width:100%;background:url('/resources/file/fileSF/${funding.mainFile}') no-repeat center center;background-size:cover;" onerror="this.src='http://placehold.it/400x400'" />
				    					<input type="hidden" value="${funding.postNo }" />		    					
				    					</a>
				    					</c:if>
				    					
										 <!-- 투표중 -->
										 <c:if test ="${funding.statusCode eq 1 }">		
										 조회 ${funding.voteViewCount }
										<a href="#" class="img-prod"><img class="img-fluid" src="/resources/file/fileSF/${funding.mainFile}" alt="Colorlib Template" style="min-height:210px; max-height:210px; min-width:300px;" >
				    					<input type="hidden" value="${funding.postNo }" />		    					
				    					</a>
				    					</c:if>		
				    						    					
				    					<div class="text py-3 px-3">
				    					
				    					<font size="5">${funding.postTitle}</font>
				    						
										<div class="row" style="position:relative;height:35px;">
										         <div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" > <h3>${funding.nickname}</h3></div>
										         <div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " ><h3><b><strong style="color:#225cba">${funding.voteRate}%</strong></b></h3></div>
										 </div>										   				
										 <!-- 투표종료 -->
										 <c:if test ="${!(funding.statusCode eq 1) }">
										   <div class="progress">												 
										   <div class="progress-bar bg-danger" role="progressbar" style="width:${funding.voteRate}%;"></div>
										   </div>	
											 <div align="right">    						
											<h4 class="media-heading"  style="color:#e33941">종료</h4> 	
											</div>
										 </c:if>
										 
										 <!-- 투표중 -->
										 <c:if test ="${funding.statusCode eq 1 }">										 
										   <div class="progress">												 
										   <div class="progress-bar " role="progressbar" style="width:${funding.voteRate}%;"></div>
										   </div>											 
											 <div align="right">						
											<h4 class="media-heading">D- ${funding.voteRemainDate }</h4> 	
											</div>
										</c:if>
										
				    					</div>
				    				</div>
				    			</div>
				    			</c:forEach>    
				    		</div>	
				    	</div>
		    		</div>	
		    	</div>
		    <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->		    	
		    <input type="hidden" id="currentPage" name="currentPage" value=""/>	  
		    <input type="hidden" id="statusConde" name="statusConde" value="${funding.statusConde}"/>	  
		 </form>
  		  <div class="form-group text-center">
	  			<button id="btn-add" class="btn btn-primary py-3 px-4 col-md-3">작성하기</button>
		  </div>  
    </section>
    <!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
    
    <!--================ start footer Area  =================-->
    <!-- footer Start /////////////////////////////////////-->
	 <jsp:include page="/layout/footer.jsp"></jsp:include>
   	<!-- footer End /////////////////////////////////////-->  
    <!--================ End footer Area  =================-->
  

  <!-- loader -->

  <script src="../../resources/prodmenu/js/main.js"></script>
 
 	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	//=============    검색 / page 두가지 경우 모두  Event  처리 =============
	function fncGetList(currentPage) {
	   	
	   	$("#currentPage").val(currentPage)
	   	$("form").attr("method" , "POST").attr("action" , "/funding/listVoting").submit();
	 
	}
    $(function(){
    	
		//============= "검색"  Event  처리 =============	
		 $( "button.btn.btn-default" ).on("click" , function() {
			    fncGetList(1);
		});
		//============= "투표중/투표완료"  Event   처리 =============
		$( "#voteCondition" ).change(function(){
				fncGetList('1');
		});    
		//============= 썸네일 사진 클릭 Event  처리 =============	
	 	$( ".img-prod" ).on("click" , function() {
			$(self.location).attr("href","/funding/getVoting?postNo="+$(this).children("input").val());
		});   
	
        //============= 작성 Event  처리 =============   
        $( "#btn-add" ).on("click" , function() {
        	$(self.location).attr("href","/funding/getTerms?termsTitle=SFPost&postNo=0");

           });
        
		//============= autocomplete Event  처리 =============			
	      $("#searchKeyword").on("keyup", function(){
	          
	          var search = {searchKeyword : $("#searchKeyword").val(), searchCondition : $("#searchCondition").val()};
	          var convertSearch = JSON.stringify(search);
	          
	          $.ajax({
	             url : "/funding/json/listVoting/",
	             method : "POST",
	             dataType : "json",
	             data :  convertSearch ,
	             contentType: "application/x-www-form-urlencoded; charset=euc-kr",
	             headers : {
	                "Accept" : "application/json",
	                "Content-Type" : "application/json;charset=euc_kr"
	             },
	             success : function(JSONData, status){
	            	 //alert(JSONData)
	                $("#searchKeyword").autocomplete({
	                   source : JSONData
	                });
	             }
	          });		
	      });	
  	});	        
        
    </script>
  </body>
  </html>