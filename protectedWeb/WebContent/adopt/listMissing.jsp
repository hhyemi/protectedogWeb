<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="utf-8">
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" > -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
	
	

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		
		
 	  	html { 
 	 		scroll-behavior: smooth; 
 		} 



    </style>
<jsp:include page="/layout/toolbar.jsp"></jsp:include>
</head>

<body class="goto-here">
   	
    <div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2" style="color: #f04f23;">List</span> <span>Adopt</span></p>
            <font size="7">분양리스트</font>
          </div>
        </div>
      </div>
    </div>



<!--       <div class="col-md-10" align="center"> -->
	  
	  <jsp:include page="calendar.jsp"></jsp:include>
<!-- 	  </div> -->
<%--       <c:set var="i" value="0" /> --%>

<%-- 		  <c:forEach var="adopt" items="${list}"> --%>
<%-- 			<c:set var="i" value="${ i+1 }" /> --%>
			
<!-- 			<div class="col-md-4" > -->
			
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

<!-- 			<div class="desc-comp-offer-cont"> -->
<!-- 			<figure class="getadopt"> -->
<%-- 			<input type="hidden" name="postNo" value="${adopt.postNo}"/> --%>
<!-- 				<span id="image-box"> -->
<%-- 					<c:if test="${adopt.statusCode ne 3}"> --%>
<%-- 					  <img class="listImg" style="width:100%;background:url('../resources/file/fileAdopt/${adopt.mainFile}') no-repeat center center;background-size:cover; "   onerror="this.src='http://placehold.it/400x400'"/> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${adopt.statusCode eq 3}"> --%>
<%-- 					  <img class="listImg" src="../resources/file/fileAdopt/complete.png" style="width:100%;background:url('../resources/file/fileAdopt/${adopt.mainFile}') no-repeat center center;background-size:cover;" onerror="this.src='http://placehold.it/400x400'" /> --%>
<%-- 					</c:if> --%>
<!-- 				</span> -->
<%-- 			    <span id="textList"><h3 align="center" style="padding-right: 0px;padding-left: 0px;"><b>${adopt.postTitle}</b></h3> --%>
<%-- 				    <c:if test="${param.boardCode eq 'AD' }"> --%>
<%-- 				   	 	<p align="right" style="padding-bottom: 10px;">${fn:substring( adopt.areaKr , 0, fn:indexOf(adopt.areaKr,'시')+1 ) }</p> --%>
<%-- 				   	</c:if> --%>
<%-- 				    <c:if test="${param.boardCode eq 'MS' }"> --%>
<%-- 				   	 	<p align="right"><fmt:formatNumber value="${ adopt.dogPay }" pattern="#,###" />원</p> --%>
<%-- 				   	</c:if> --%>
<!-- 			   	</span> -->
<!-- 			</figure> -->
<!-- 			</div> -->
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
			
<!-- 			</div>	 -->
		
<%--        </c:forEach> --%>
       </div>
       
       </div>
       </div>
       
       <div class="col-md-12"><br/><br/></div>
       
       
       
	  <!--  table End /////////////////////////////////////-->
	  

 	
 	
 	
 	
 	<jsp:include page="/layout/footer.jsp"></jsp:include>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	

</body>

</html>