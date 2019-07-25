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
  	   #btn-add{
		background: #fff;
        border:2px solid #29304d;
		color:#29304d;
		height:40px;
		width:150px;
		} 
		.right-box {
		  float: right;
		}	
		#checkPostTitle{
	      width:300px;
	      padding:0 5px;
	      overflow:hidden;
	      text-overflow:ellipsis;
	      white-space:nowrap;
	  } 			     
       @font-face{
          font-family: NanumSquare;
          src : url(http://ssl.pstatic.net/static/kin/fonts/NanumSquareR.woff2) format("woff2");
       }
       body{
          font-family: NanumSquare, sans-serif !important;
       }
    </style>
    
    
  </head>
  <body class="goto-here">
 	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->  
   	
    <div class="hero-wrap hero-bread" style="padding-bottom: 0px; padding-top : 10px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">support</a></span> <span>post</span></p>
            <h1 class="mb-0 bread">후원게시</h1>
          </div>
        </div>
      </div>
    </div>
	<br/><p/>
    <section class="ftco-section bg-light" style="padding-bottom: 0px; padding-top : 30px;">      
    
		 <form class="form-inline" name="detailForm">
		    	<div class="container" >
		    	
				<!--검색 부터 -->		    	
		    		<div class="row">  
				    	<div class="right-box">

						    <select class="form-control" id="voteCondition" name="voteCondition" >
								<option value="0" ${ ! empty search.voteCondition && search.voteCondition==0 ? "selected" : "" }>전체보기</option>
								<option value="3" ${ ! empty search.voteCondition && search.voteCondition==3 ? "selected" : "" } >후원중</option>
								<option value="4" ${ ! empty search.voteCondition && search.voteCondition==4 ? "selected" : "" } >후원완료</option>
							</select>   
						    &emsp;
						    <select class="form-control" name="searchCondition" id="searchCondition" >
								<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" } >제목</option>
								<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
							</select>
							&emsp;
						    <label class="sr-only" for="searchKeyword">검색어</label>
						    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
						    <button type="button" class="btn btn-default">검색</button>

						</div>
			    	</div>    
    		    	<p/>
				<!-- 썸네일 부터 -->
		    		<div class="row">
		    			<div class="col-md-8 col-lg-12 order-md-last">
		    				<div class="row">
			    			<c:set var="i" value="0" />
							  <c:forEach var="funding" items="${list}">
				    			<div class="col-sm-6 col-md-6 col-lg-4 ftco-animate">
				    				<div class="product">
				    				
										 <!-- 후원종료 -->
										 <c:if test ="${!(funding.statusCode eq 3) }">		
										 조회 ${funding.fundViewCount }										 		    											 				    		
					    					<a href="#" class="img-prod"><img src="/resources/file/fileSF/end.png" style=" min-height:210px; max-height:210px; min-width:300px; width:100%;background:url('/resources/file/fileSF/${funding.mainFile}') no-repeat center center;background-size:cover;" onerror="this.src='http://placehold.it/400x400'" />
					    					<input type="hidden" value="${funding.postNo }" />		    					
					    					</a>
										 </c:if>
										 
										 <!-- 후원중 -->
										 <c:if test ="${funding.statusCode eq 3 }">		
										 조회 ${funding.fundViewCount }													 											 				    		
				    					<a href="#" class="img-prod"><img class="img-fluid" src="/resources/file/fileSF/${funding.mainFile}" alt="Colorlib Template" style="min-height:210px; max-height:210px; min-width:300px;" >
				    					<input type="hidden" value="${funding.postNo }" />		    					
				    					</a>
				    					</c:if>
				    					
				    					<div class="text py-3 px-3">
					    					<div id="checkPostTitle">
					    					<font size="5">${funding.postTitle}</font>
					    					</div>
										<div class="row" style="position:relative;height:35px;">
										         <div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" > <h3>${funding.nickname}</h3></div>
										         <div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " ><h3><b><strong style="color:#4E8092">${funding.fundRate}%</strong></b></h3></div>
										 </div>
										 <!-- 후원종료 -->
										 <c:if test ="${!(funding.statusCode eq 3) }">
									   <div class="progress">												 
										   <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="50" style="width:  ${funding.fundRate}%; background-color:#C9BFB0!important;"></div>
										   </div>											 
										 <div align="right">	    						
										<h4 class="media-heading" style="color:#8c8479">종료</h4> 	
										</div>
										 </c:if>
										 <!-- 후원중 -->
										 <c:if test ="${funding.statusCode eq 3 }">										 
										   <div class="progress">												 
										   <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="50" style="width:  ${funding.fundRate}%; background-color:#4E8092!important;" ></div>
										   </div>					
										 <div align="right">	    						
										<h4 class="media-heading">D- ${funding.fundRemainDate }</h4> 	
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
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"/>
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"> </script> 
 	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	//=============    검색 / page 두가지 경우 모두  Event  처리 =============
	function fncGetList(currentPage) {
	   	
	   	$("#currentPage").val(currentPage)
	   	$("form").attr("method" , "POST").attr("action" , "/funding/listFunding").submit();
	 
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
			$(self.location).attr("href","/funding/getFunding?postNo="+$(this).children("input").val());
		});   
	
        
		//============= autocomplete Event  처리 =============			
	      $("#searchKeyword").on("keyup", function(){
	          
	          var search = {searchKeyword : $("#searchKeyword").val(), searchCondition : $("#searchCondition").val(), voteCondition : 1 };
	          var convertSearch = JSON.stringify(search);
	          
	          $.ajax({
	             url : "/funding/json/autocomplete/",
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