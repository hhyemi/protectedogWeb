<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>보호할개 · 분양실종</title>
	<meta charset="utf-8">
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		
		
 	  	html { 
 	 		scroll-behavior: smooth; 
 		} 

 		h3{ 
 			padding-bottom: 0px; 
 			padding-top: 10px !important;
 		} 

		.getAR {
			padding-top: 10px;
			padding-left: 10px;
			padding-right: 10px;
			background-color: white;
		}
		
 		.listImg {
 			max-height: 300px;  
 			min-height: 300px;  
 			min-width: wrap; 
 			max-width: wrap; 
 			display: block; 
 		} 
 		#image-box img {
 			max-width: 330px;
 			min-width: 330px;
 			max-height: 300px;
 			min-height: 300px;
 		}

		form {
			text-align: left;
		}
		
		.form-group {
			display: inline-block;
			right: 0%;
			text-align: right;
		}
		
		select, #searchKeyword {
			height: 33px;
		}
		
		#searchKeyword {
			height: 40px;
			width: 160px;
			border : 1px solid #D3D3D3;
			padding-left: 5px;
		}
		
		#searchSubmmit {
			width : 60px;
			height : 40px;
			
			border-radius : 0px 15px 15px 0px;
			border : 1px solid #f04f23;
		}
		
		#searchCondition {
			height : 40px;
			border-radius : 15px 0px 0px 15px;
			padding-left: 10px;
			border-color: #D3D3D3;
			border-right: 0px;
		}
		
		.col-md-6 {
			padding-left: 30px !important;
			padding-right: 30px !important;
		}



    </style>
<jsp:include page="/layout/toolbar.jsp"></jsp:include>
</head>

<body class="goto-here">
   	
    <div class="hero-wrap hero-bread" style="padding-bottom: 60px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">Adopt Missing</span> <span>Review</span></p>
            <font size="7">후기게시판</font>
          </div>
        </div>
      </div>
    </div>

	<div class="sectionContainer ">	
    <section class="ftco-section bg-light" style="padding-bottom: 0px; padding-top : 20px;">   
	
    
	<div class="container">
	
		<input type="hidden" id="userId" value="${sessionScope.user.id}">
		<input type="hidden" id="adoptConfirm" value="">
		<input type="hidden" id="applyConfirm" value="">
		<input type="hidden" id="boardCode" value="AR">
		<input type="hidden" id="totalCount" value="${resultPage.totalCount }">
	
		<div class="row">
	    
		    <div class="col-md-12 text-left">
		    	<p style="padding-left: 15px;font-weight: bold;">
		    		전체  ${resultPage.totalCount } 건
		    	</p>
		    </div>
		    
		    
		    <div class="col-md-6" id="justify" align="left">
<%-- 			    <c:if test="${sessionScope.user.id ne null}"> --%>
			    	<button type="button" class="btn btn-default" style="height: 40px;"><font size="3px">작성</font></button>
<%-- 			    </c:if> --%>
		    </div>
		    
		    
		    
		    
			<div class="col-md-6" align="right">
				<form class="form-inline" name="detailForm" style="float: right;">

			    	<div class="form-group">
						<select name="searchCondition" id="searchCondition">
							<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
							<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>내용</option>
							<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label>
						<input type="text" id="searchKeyword" name="searchKeyword"  placeholder="검색어를 입력하세요."
						    	value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					</div>

					<button type="button" id="searchSubmmit" class="btn btn-default searchSubmmit"  style="padding-bottom: 6px;margin-left: 0px;">
						<span class="fas fa-search"></span>
					</button>
					
			    </form>
		    </div>
		    
		    
		</div>
		
	  <div class="row"><div class="col-md-12"></div><br/></div>


      <div class="col-md-12"></div>
      <div class="col-md-12" >
      
      <div class="col-md-12"  style="padding-left: 0px;">
      
	
	  <div class="row"  id="listARJSON">
      <c:set var="i" value="0" />

		  <c:forEach var="board" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			
			<div class="col-md-4" >
			
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

			<div class="desc-comp-offer-cont">
			<figure class="getAR">
				<input type="hidden" name="postNo" value="${board.postNo}"/>
				
				<p align="left" style="padding-left: 0px;padding-bottom: 0px;margin-bottom: 5px;">조회수 ${board.viewCount}</p>
				<span id="image-box">
					<img class="listImg" style="width:100%;background:url('${board.thumnail}') no-repeat center center;background-size:cover; "   onerror="this.src='http://placehold.it/400x400'"/>
				</span>
				
			    <span id="textList"><h3 align="center" style="padding-right: 0px;padding-left: 0px;"><b>${board.postTitle}</b></h3>
					<p align="right" style="padding-bottom: 10px;padding-right: 0px;">${board.nickName} ${board.regDate}</p>
			   	</span>
			</figure>
			</div>
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
			
			</div>	
		
       </c:forEach>
       </div>
       
       </div>
       </div>
       
       <div class="col-md-12"><br/><br/></div>
       
         
       
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	
 	
 	<c:if test="${resultPage.totalCount eq 0 }">
 		<jsp:include page="/common/searchResult.jsp"></jsp:include>
 	</c:if>
 	
 	</section></div>
 	
 	
 	
 	
 	<jsp:include page="/layout/footer.jsp"></jsp:include>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	

<!-- 	<script src="https://code.jquery.com/jquery-1.10.2.js"></script> -->

<!-- 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
	
<!-- 	<script src="https://code.jquery.com/jquery-1.10.2.js"></script> -->
	
	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	

		var postNo;
		var postSize = 1;
		var str = '';
		
		$(function(){
	        $(window).scroll(function(){
	            
	//             if( $(this).scrollTop() == $(document).height() -  $(this).height() ){
	            if( $(this).scrollTop() +  $(this).height() + 484 > $(document).height() ){
	            	postSize++;
	            	listAR(postSize,"");
	            }
	        })//스크롤 
	    })
	
	
	
		function listAR(postSize, str){

	  		$.ajax( 
			 		{
						url : "/adoptReview/json/listAdoptReview",
						method : "POST" ,
						data : JSON.stringify({
							searchCondition : $("#searchCondition").val(),
							searchKeyword : $("#searchKeyword").val(),
							boardCode : $("#boardCode").val(),
							pazeSize : postSize,
						}) ,
						dataType : "json" ,
						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								  },
						success : function(data , status) {
	// 							console.log(JSON.stringify(data));
	
								var displayValue = '';
								
								for( i=0; i<data.list.length; i++ ){
	
									displayValue += '<div class="col-md-4" ><div class="desc-comp-offer-cont">'
														+'<figure class="getAR">'
														+'<input type="hidden" name="postNo" value="'+data.list[i].postNo+'"/>'
															+'<p align="left" style="padding-left: 0px;padding-bottom: 0px;margin-bottom: 5px;">조회수 '+data.list[i].viewCount+'</p>'
														    +'<span id="image-box">'+data.list[i].thumnail+'</span>'
														    +'<span id="textList"><h3 align="center" style="padding-right: 0px;padding-left: 0px;"><b>'
														   		+data.list[i].postTitle
															   	+'</b></h3>'
															   	+'<p align="right" style="padding-bottom: 10px;padding-right: 0px;">'+data.list[i].nickName+' '+data.list[i].regDate+'</p>'
														   	+'</span>'
														+'</figure>'
													+'</div></div>'	;
										
						            
								}
								if(str!=""){
									$('#listARJSON').children().remove();
									$('.text-primary').text('전체 '+data.totalCount+' 건');
								}
								if( postSize == 1 && data.list.length == 0 ){
									console.log('결과없음');
									if ( $('#searchKeyword').val()==''){
										$('#searchEmpty').remove();
										displayValue =   '<div class="col-md-12" id="searchEmpty" align="center" style="height: 400px; padding-top: 150px;">'
														+'<b><font size="5px">검색결과가 없습니다.</font></b>'
								                    	+'</div>';
									}
								}
								$('#listARJSON').append(displayValue);
								
								
				
							
						},
						error: function(request, status, error){ 
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				        }
				
			});

 		}
		
		
		
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  작성 권한체크   ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■	
		

	
		var adoptConfirm;
		var applyConfirm;
		var id = $('#userId').val().trim();

		
		// 후기글 등록 가능한지 확인
		function confirmAdopt(){
			console.log(id);
			if (id == ''){
				$("#login-modal").modal('show'); 
				return;
			}
			// 분양글 등록+ 그 글이 완료상태
			$.ajax( 
			 		{
						url : "/adopt/json/listAdopt2/"+id,
						method : "GET" ,
						dataType : "json" ,
						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								  },
						success : function(data , status) {
	 							console.log("adopt "+JSON.stringify(data));
								
	 							if ( data.list.length > 0 ) {
									console.log("ajax에서 adopt 결과 있음 "+data.list.length);
									self.location = "/adoptReview/addAdoptReview";
	 							} else {
	 								confirmApply();
	 							}

						},
						error: function(request, status, error){ 
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				        }
					
			});
		}//adopt 
		
		function confirmApply(){
			
			// 신청서 등록+ 그 글이 완료상태
	  		$.ajax( 
			 		{
						url : "/apply/json/listApply2/"+id,
						method : "GET" ,
						dataType : "json" ,
// 						async: false,
						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								  },
						success : function(data , status) {
								console.log("apply "+JSON.stringify(data));
								
								if ( data.list.length > 0 ){
									console.log("ajax에서 apply 결과 있음 "+ data.list.length);
									self.location = "/adoptReview/addAdoptReview";
								} else {
									
									swal({
								           text: "후기를 등록하려면 등록한 분양글이 완료상태이거나, \n입양 신청한 분양글이 완료상태여야 합니다.",
								           dangerMode: true,
								           buttons: {
													 catch: {
													 	text: "확인"
													 }
										   },
										   
								    });
								}
						},
						error: function(request, status, error){ 
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				     	}
			});
 		}//apply
 		
 		$(document).ready(function() {
			//엔터검색
			$('#searchKeyword').keydown( function(e) {
				if(e.keyCode == 13) {
					fncGetList(1);
				
// 					console.log("엔터 "+$( '#searchKeyword').val());
//  					return;
// 					if ( $( '#searchKeyword').val().trim() == '' || $( '#searchKeyword').val().trim() == null ){
// 						$("#searchKeyword").focus();
// 						return;
// 					}else {
// 						fncGetList(1); 
// 					}
				}
			});
        });
	
		
		
		$(function() {
			$( "#searchSubmmit" ).on("click" , function() {
// 			$( "button:contains('검색')" ).on("click" , function() {
				if ( $( '#searchKeyword').val() == '' ){
					$("#searchKeyword").focus();
					return;
				}
				fncGetList(1);
			});
			//엔터검색
			$('#searchKeyword').keydown( function(e) {
				if(e.keyCode == 13) {
					postSize = 1;
					listAR(postSize,"dd");
				
// 					alert("엔터 "+$( '#searchKeyword').val());
// // 					return;
// 					if ( $( '#searchKeyword').val().trim() == '' || $( '#searchKeyword').val().trim() == null ){
// 						$("#searchKeyword").focus();
// 						return;
// 					}else {
// 						fncGetList(1); 
// 					}
				}
			});
			
			// 상세조회
			$(document).on("click")
			$( "#listARJSON" ).on("click", ".getAR" , function() {
				self.location ="/adoptReview/getAdoptReview?postNo="+$(this).children( $('input')).val().trim();
			});
			
			// 글 등록하기
			$( "button:contains('작성')" ).on("click" , function() {
				confirmAdopt();
			});
			
			$( "font:contains('후기게시판')" ).on("click" , function() {
				self.location = "/adoptReview/listAdoptReview";
			});

// 			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	
// 		$('select[name=areaCondition]').change( function(){
// 			postSize = 1;
// 			listAR(postSize,"dd");
// 		});
		
		
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/adoptReview/listAdoptReview").submit();
		}
		
// 		if ( $('#totalCount').val() == 0){
// 			$('#searchEmpty').html( 
// // 					'<div class="col-md-12"><div class="block text-center"><b><font size="5px" color="#f04f23"> \''+$('#searchKeyword').val()+'\'</font>'+'에 대한 검색 결과가 없습니다.</b>'
// 					'<div align="center" style="display: flex;justify-content: center;align-items: center;"><div id="item">'
// 					+'<div class="block text-left"><b><font size="5px"><font color="#f04f23"> \''+$('#searchKeyword').val()+'\'</font>'+'에 대한 검색 결과가 없습니다.</font></b></div>'
//             		+'<p align="left"><br/>단어의 철자가 정확한지 확인해 주세요.<br/>'
//             		+'검색어의 단어 수를 줄이거나, 다른 검색어로 검색해 보세요.<br/>'
//             		+'보다 일반적인 검색어로 검색해 주세요.</p></div></div></div>'			
// 			);
// 		}
		
	
	</script>
	
	
	
</body>

</html>