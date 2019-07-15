 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
	
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/get/css/bootstrap.css" />
    <link rel="stylesheet" href="/resources/get/css/icon/style.css" />
    <link rel="stylesheet" href="/resources/get/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/resources/get/css/themify-icons.css" />
    <link rel="stylesheet" href="/resources/get/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="/resources/get/css/simpleLightbox.css" />
    <link rel="stylesheet" href="/resources/get/css/nice-select.css" />
    <link rel="stylesheet" href="/resources/get/css/animate.css" />
    <link rel="stylesheet" href="/resources/get/css/jquery-ui.css" />
    <!-- main css -->
    <link rel="stylesheet" href="/resources/get/css/style.css" />
    <link rel="stylesheet" href="/resources/get/css/responsive.css" />

	<style>
		#voteDate{
		width:340px;
		float:left;
		}
	</style> 
 
 
  </head>
  <body>
 	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->   
    <!--================Header Menu Area =================--> 

    <!--================Single Product Area =================-->
    <div class="product_image_area">
      <div class="container">
        <div class="row s_product_inner">
          <div class="col-lg-6">
            <div class="s_product_img">
              <div
                id="carouselExampleIndicators"
                class="carousel slide"
                data-ride="carousel"
              >
                <ol class="carousel-indicators">
                       
 				<c:forEach var="i" begin="0" end="${fn:length(file)-1}" step="1">			
					<c:if test="${i eq 0}">	
	                  <li
	                    data-target="#carouselExampleIndicators"
	                    data-slide-to="${i}"
	                    class="active"
	                  >
	                </c:if>
					<c:if test="${!(i eq 0)}">	
	                  <li
	                    data-target="#carouselExampleIndicators"
	                    data-slide-to="${i}"
	                  >
	                </c:if>	                
                  </c:forEach>               
                     
                </ol>
                <div class="carousel-inner">

                  
				<c:forEach var="name" items="${file}" varStatus="status">
					<c:if test="${status.first}">	
					<c:set var ="className" value="carousel-item active"/>
	                </c:if>
					<c:if test="${!(status.first)}">	
					<c:set var ="className" value="carousel-item"/>
	                </c:if>	                
                    <div class="${className}">	                
                    <img
                      class="d-block w-100"
                      src="/resources/file/fileSF/${name.fileName}" height="450px;" 
                    />
                  </div>			
                  </c:forEach>
          
                </div>
              </div>
            </div>
          </div>
 			 <div class="col-lg-5 offset-lg-1">
             <div class="s_product_text">			 
            <div>
             <font size=6 ><b>${funding.postTitle}</b></font> <b>&emsp;${funding.id}</b> 
			<h3>${funding.fundPay }표</h3>
			<h4 class="media-heading">남은기간 ${funding.voteRemainDate }일</h4> 			    
			 <div class="progress">
			  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="50" style="width: ${30-funding.voteRemainDate}%;"></div>
			 </div>
		      <div  id="voteDate" >${funding.voteStartDate}</div>  <div >${funding.voteEndDate}</div> 
		     <br/>
			 <div><h3>투표율&ensp;<strong style="color:#225cba">${funding.voteRate}%</strong></h3></div>
			 <div><h3>현재투표인원&ensp;${funding.voterCount}명</h3></div>		 	 
               <br/>  
              <div class="card_area">
                <a class="main_btn" href="#">투표하기</a> 
                <a class="icon_btn" href="#">
                  <i class="lnr lnr lnr-heart"></i>
                </a>
              </div>
              <br/>
			  <div class="card_area">
	  			<a class="main_btn" href="#">문의하기</a> 
	  			<br/>
		 	 </div>	
            </div>
          </div></div>
        </div>
      </div>
    </div>
   <br><br><br/>
    <!--================End Single Product Area =================-->

   <jsp:include page="getUnderFunding.jsp" />
    <!--================End Product Description Area =================-->

    <!--================ start footer Area  =================-->
    <!-- footer Start /////////////////////////////////////-->
	 <jsp:include page="/layout/footer.jsp"></jsp:include>
   	<!-- footer End /////////////////////////////////////-->  
    <!--================ End footer Area  =================-->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/resources/get/js/jquery-3.2.1.min.js"></script>
    <script src="/resources/get/js/popper.js"></script>
    <script src="/resources/get/js/bootstrap.min.js"></script>
    <script src="/resources/get/js/stellar.js"></script>
    <script src="/resources/get/js/simpleLightbox.min.js"></script>
    <script src="/resources/get/js/jquery.nice-select.min.js"></script>
    <script src="/resources/get/js/imagesloaded.pkgd.min.js"></script>
    <script src="/resources/get/js/isotope-min.js"></script>
    <script src="/resources/get/js/owl.carousel.min.js"></script>
    <script src="/resources/get/js/jquery.ajaxchimp.min.js"></script>
    <script src="/resources/get/js/mail-script.js"></script>
    <script src="/resources/get/js/jquery-ui.js"></script>
    <script src="/resources/get/js/jquery.waypoints.min.js"></script>
    <script src="/resources/get/js/jquery.counterup.js"></script>
    <script src="/resources/get/js/theme.js"></script>
    
 	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
    $(function(){
    
	//============= 투표하기 Event  처리 =============	
 	$( "a:contains('투표하기')" ).on("click" , function() {
 		alert("투표")
		//$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
	});   
    
	//============= 문의하기 Event  처리 =============	
 	$( "a:contains('문의하기')" ).on("click" , function() {
		$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
	});   
    });
    </script>
    
  </body>
</html>
