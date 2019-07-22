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
	       <h3 class="billing-heading mb-4"><strong>리뷰 리스트</strong></h3>
<!-- 	          각 행을 클릭하면 신청서를 확인할 수 있습니다. -->
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
            <th><p align="center">제목</p></th>
            <th><p align="center">닉네임</p></th>
            <th><p align="center">조회수</p></th>
            <th><p align="center">신청일자</p></th>
<!-- 			<th align="right">신청서 번호</th> -->
<!--             <th align="right">신청자 아이디</th> -->
<!-- 		    <th align="right">신청일자</th> -->
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="board" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr name="${ board.postNo }">
<%-- 				<input type="hidden" name="applyNo" value="${ apply.applyNo }"> --%>
				<td align="left">${ i }</td>
<%-- 				<td align="left">${ apply.applyNo }</td> --%>
				<td align="left"  title="Click : 상품정보 확인">${board.postTitle}</td>
				<td align="left"  title="Click : 상품정보 확인">${board.nickName}</td>
				<td align="left"  title="Click : 상품정보 확인">${board.viewCount}</td>
				<td align="left">${board.regDate}
<!-- 					<button class="btn btn-primary py-0 px-2">제외</button> -->
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
		
	 
		
		
		
	
	</script>
</body>

</html>