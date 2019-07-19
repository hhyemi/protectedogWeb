<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  	

    </style>
    
   
	
</head>

<body>

<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container ">
	<input type="hidden" id="boardCode" value="${param.boardCode }">
	
		<div class="page-header text-info">
	       <h3 class="billing-heading mb-4"><strong>신청서 리스트</strong></h3>
	          각 행을 클릭하면 신청서를 확인할 수 있습니다.
	    </div>
	    

	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		</div>



      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th><p align="center">No</p></th>
            <th><p align="center">신청자 ID</p></th>
            <th><p align="center">신청일자</p></th>
<!-- 			<th align="right">신청서 번호</th> -->
<!--             <th align="right">신청자 아이디</th> -->
<!-- 		    <th align="right">신청일자</th> -->
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="apply" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr name="${ apply.applyNo }">
				<input type="hidden" name="applyNo" value="${ apply.applyNo }">
				<td align="left">${ i }</td>
<%-- 				<td align="left">${ apply.applyNo }</td> --%>
				<td align="left"  title="Click : 상품정보 확인">${apply.id}</td>
				<td align="left">${apply.regDate}
					<button class="btn btn-primary py-0 px-2">제외</button>
				</td>
			</tr>
			
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
          
		<button class="btn btn-primary py-3 px-4 col-md-3">돌아가기</button>
	    	
<%-- 	  <jsp:include page="/layout/footer.jsp"></jsp:include> --%>
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	<div id="dialog-getApply" title="">
		<p align="left" id="getJSON"></p>
	</div> 
<!--  	■■■■■■■■■■■■■■■■■■■■■■■■■■ dialog ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
 	<!-- PageNavigation Start... -->
<%-- 	<jsp:include page="../common/pageNavigator_new.jsp"/> --%>
	<!-- PageNavigation End... -->
	
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	  <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		$(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
// 			var ccc = $( '#boardCode' ).val();
// 			$("#currentPage").val(currentPage)
// 			$("form").attr("method" , "POST").attr("action" , "/adopt/listAdopt?boardCode="+ccc).submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)

			 $( "figure" ).on("click" , function() {
// 				 self.location ="/adopt/getAdopt?postNo="+$(this).children( $('input')).val().trim();
			});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(3)" ).on("click" , function() {
// 				alert("글번호 : "+$(this).children().val().trim());
// 				 self.location ="/adopt/getAdopt?postNo="+$(this).children().val().trim();
			});
			
			$( $( "tbody tr" ) ).on("click" , function() {
				var applyNo =    parseInt( $( this).children( $('input') ).val().trim()  );
// 				var userAjax =  $(   $(  "td:nth-child(3) " ).children()[  $(  "td:nth-child(3) " ).index(this)   ]    );
				console.log("확인ok : "+applyNo);
				getApply(applyNo);
			});

			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$( function() {
	  	    $( "#dialog-getApply" ).dialog({
	  	    	autoOpen: false,
	  		      width: 450,
	  		      height: 400,
	  		      modal: true,
	  		      buttons: {
	  		        	닫기: function() {
	  		          		$( this ).dialog( "close" );
	  		        	}
	  		      }
	  	    });
	      });
	      
	      
		function getApply(applyNo){
			$.ajax( 
			 		{
						url : "/apply/json/getApply/"+applyNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								  },
						success : function(JSONData , status) {
// 							alert(status);
							var displayValue;
				
							if( JSONData.mate == "있음" && JSONData.raise == "있음" ){
								displayValue = 	 '<h3 class="billing-heading mb-4"><strong>'+JSONData.id+'님의 신청서</strong></h3>'
												+'<br\/><strong>[연락처]<\/strong> : '+JSONData.phone
												+'<br\/><strong>[직업]<\/strong> : '+JSONData.job
												+'<br\/><strong>[거주지 유형]<\/strong> : '+JSONData.addr
												+'<br\/><strong>[동거인 여부]<\/strong> : '+JSONData.mate
												+'<br\/><strong>[동의 여부]<\/strong> : '+JSONData.mateAgree
												+'<br\/><strong>[양육경험]<\/strong> : '+JSONData.raise
												+'<br\/><strong>[현재 양육 여부]<\/strong> : '+JSONData.currently
												+'<br\/><strong>[앞으로의 계획]<\/strong> : '+JSONData.plan
												+'<br\/><strong>[1년 예상비용]<\/strong> : '+JSONData.pay
												+'<br\/><strong>[입양신청 이유]<\/strong> : '+JSONData.reason
												+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+JSONData.situation ;
								
							}else if( JSONData.mate == "있음" && JSONData.raise == "없음" ){
								displayValue = 	 '<h3 class="billing-heading mb-4"><strong>'+JSONData.id+'님의 신청서</strong></h3>'
												+'<br\/><strong>[연락처]<\/strong> : '+JSONData.phone
												+'<br\/><strong>[직업]<\/strong> : '+JSONData.job
												+'<br\/><strong>[거주지 유형]<\/strong> : '+JSONData.addr
												+'<br\/><strong>[동거인 여부]<\/strong> : '+JSONData.mate
												+'<br\/><strong>[동의 여부]<\/strong> : '+JSONData.mateAgree
												+'<br\/><strong>[양육경험]<\/strong> : '+JSONData.raise
												+'<br\/><strong>[앞으로의 계획]<\/strong> : '+JSONData.plan
												+'<br\/><strong>[1년 예상비용]<\/strong> : '+JSONData.pay
												+'<br\/><strong>[입양신청 이유]<\/strong> : '+JSONData.reason
												+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+JSONData.situation ;
								
							}else if( JSONData.mate == "없음" && JSONData.raise == "있음" ){
								displayValue = 	 '<h3 class="billing-heading mb-4"><strong>'+JSONData.id+'님의 신청서</strong></h3>'
												+'<br\/><strong>[연락처]<\/strong> : '+JSONData.phone
												+'<br\/><strong>[직업]<\/strong> : '+JSONData.job
												+'<br\/><strong>[거주지 유형]<\/strong> : '+JSONData.addr
												+'<br\/><strong>[동거인 여부]<\/strong> : '+JSONData.mate
												+'<br\/><strong>[양육경험]<\/strong> : '+JSONData.raise
												+'<br\/><strong>[현재 양육 여부]<\/strong> : '+JSONData.currently
												+'<br\/><strong>[앞으로의 계획]<\/strong> : '+JSONData.plan
												+'<br\/><strong>[1년 예상비용]<\/strong> : '+JSONData.pay
												+'<br\/><strong>[입양신청 이유]<\/strong> : '+JSONData.reason
												+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+JSONData.situation;
								
							}else{
								displayValue = 	 '<h3 class="billing-heading mb-4"><strong>'+JSONData.id+'님의 신청서</strong></h3>'
												+'<br\/><strong>[연락처]<\/strong> : '+JSONData.phone
												+'<br\/><strong>[직업]<\/strong> : '+JSONData.job
												+'<br\/><strong>[거주지 유형]<\/strong> : '+JSONData.addr
												+'<br\/><strong>[동거인 여부]<\/strong> : '+JSONData.mate
												+'<br\/><strong>[양육경험]<\/strong> : '+JSONData.raise
												+'<br\/><strong>[앞으로의 계획]<\/strong> : '+JSONData.plan
												+'<br\/><strong>[1년 예상비용]<\/strong> : '+JSONData.pay
												+'<br\/><strong>[입양신청 이유]<\/strong> : '+JSONData.reason
												+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+JSONData.situation ;
							}
														
							$( "#getJSON" ).html(displayValue);
							$('#dialog-getApply').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
							$( "#dialog-getApply" ).dialog( "open" );
							
					},
					error: function(request, status, error){ 
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
// 						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
			        }
					
					
			});
		}
		
		
		
	
	</script>
</body>

</html>