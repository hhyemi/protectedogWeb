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
<%-- 	<input type="hidden" id="boardCode" value="${param.boardCode }"> --%>
	
		<div class="page-header text-info">
		
			<div class="row" style="position:relative;height:35px;">
	        	<div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" >
	        		<font size="5px">리뷰 리스트</font>
	        	</div>
	        	<div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " ><font size="5px">
		        	<c:if test="${ !(empty sessionScope.user) && sessionScope.user.levels ne '미인증회원' }">
		       		 	<button type="button" class="btn btn-primary">글쓰기</button>
		        	</c:if>
	        	</font></div>
	        </div>
		
	    </div>

	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    
		</div>



      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th style="width: 10%"><p align="center"><strong>No</strong></p></th>
            <th style="width: 60%"><p align="center"><strong>제목</strong></p></th>
            <th style="width: 10%"><p align="center"><strong>닉네임</strong></p></th>
            <th style="width: 10%"><p align="center"><strong>조회수</strong></p></th>
            <th style="width: 10%"><p align="center"><strong>신청일자</strong></p></th>
          </tr>
        </thead>
       
		<tbody>
		  <c:set var="i" value="0" />
		  <c:forEach var="board" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			
			<tr name="${ board.postNo }">
				<input type="hidden" name="postNo" value="${ board.postNo }">
				<td align="center">${ i }</td>
				<td align="left"><strong>${board.postTitle}</strong></td>
				<td align="center">${board.nickName}</td>
				<td align="center">${board.viewCount}</td>
				<td align="center">${board.regDate}</td>
			</tr>
			
          </c:forEach>
        </tbody>
      
      </table>
      
	  <!--  table End /////////////////////////////////////-->
          
	    	

 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 
<!--  	■■■■■■■■■■■■■■■■■■■■■■■■■■ dialog ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
 		  <jsp:include page="/layout/footer.jsp"></jsp:include>
	
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
	
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
// 			var ccc = $( '#boardCode' ).val();
// 			$("#currentPage").val(currentPage)
// 			$("form").attr("method" , "POST").attr("action" , "/adopt/listAdopt?boardCode="+ccc).submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		$(function() {
			 
			$( "button:contains('글쓰기')" ).on("click" , function() {
				self.location = "/adoptReview/addAdoptReview";
			});
			 
			$( "tr" ).on("click" , function() {
				self.location ="/adoptReview/getAdoptReview?postNo="+$(this).children( $('input')).val().trim();
			});
 
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");

			$( "td:nth-child(3)" ).css("color" , "#326B79");
			
		});	
		
// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		
	 
		
		
		
	
	</script>
</body>

</html>