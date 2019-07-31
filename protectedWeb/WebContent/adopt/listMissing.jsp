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
            <font size="7">실종</font>
          </div>
        </div>
      </div>
    </div>


<div class="row justify-content-center">
      <div class="col-md-10"  >
	  
	  <jsp:include page="calendar.jsp"></jsp:include>
	  </div></div>

       </div>
       
       </div>
       </div>
       
       <div class="col-md-12"><br/><br/></div>
       
       

 	
 	
 	<jsp:include page="/layout/footer.jsp"></jsp:include>
 	

</body>
</html>