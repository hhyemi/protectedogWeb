<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>GET ADOPT</title>
	<meta charset="EUC-KR">
	
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
    
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    
    
    <style>
    	figure {
    		width: wrap;
    	}
	
      
    </style>
 
  </head>
  
  <body>
    
    <!--================Header Menu Area =================-->

    <jsp:include page="/layout/toolbar.jsp"></jsp:include>

    <!--================Single Product Area =================-->
    
      <div class="container" align="center">
<!--       <div class="row justify-content-center"> -->
<!--           <div class="col-xl-8 ftco-animate"> -->

          <div class="col-lg-8" align="left" >
<!--           <div class="col-lg-5 offset-lg-1"> -->
            <div class="s_product_text">
            
<%--              <span style="text-align: justify;"> <font size="5px">${adopt.postTitle}</font> &nbsp;&nbsp;${adopt.id}&nbsp;&nbsp; ${ adopt.regDate }</span><hr/> --%>
              
              <div class="col-md-12 "><br/><br/></div>
              <ul class="list col-md-12">
              	
              	<input type="hidden" name="postNo" value="${board.postNo }">
              	<input type="hidden" name="postNo" value="${board.id }">
              	
                <li>
                   	<div class="row" style="position:relative;height:30px;">
			        	<div class="col-xs-12 col-md-12" style="position:absolute; left:0px; bottom:0px;" ><font size="5px">${board.postTitle}</font></div>
			        </div>
                </li>
                
                <hr/>
                
                <li >
                   	<div class="row" style="position:relative;height:30px;">
			        	<div class="col-xs-4 col-md-4" style="position:absolute; left:0px; bottom:0px;" >작성자 ${board.nickName}</div>
			        	<div class="col-xs-8 col-md8" align="right" style="position:absolute; right:0px; bottom:0px; " >조회수 ${board.viewCount}&nbsp;&nbsp;&nbsp;&nbsp;작성일자 ${board.regDate}</div>
			        </div>
                </li>
                
<!--                 <hr/> -->
<!--                  <div class="col-md-12 "><br/><br/></div> -->
<!--                  <div class="col-md-12 "><br/><br/></div> -->
                 
                 
<!--                 <li > -->
                   	<div class="row" style="position:relative;height:500px;">
			        	<div class="col-xs-12 col-md-12" style="position:absolute; left:0px; " > ${board.postContent}</div>
			        </div>
<!--                 </li> -->
              	

                


                
<!--                 <li> -->
<!--                 	<div class="row"> -->
<!-- 				  		<div class="col-md-2  "><strong>성격</strong></div> -->
<%-- 						<div class="col-md-10 ">${board.postContent}</div> --%>
<!-- 					</div> -->
<!--                 </li> -->
                

         
<!--                	<div class="row"> -->
<!-- 			  		<div class="col-md-2  "><strong>글내용</strong></div> -->
<%-- 					<div class="col-md-10 " >${board.postContent}</div> --%>
<!-- 				</div> -->

				
              </ul>

              
              
<!--               </div></div> -->
            </div>
          </div>
        </div>
        
        
        
        <div class="col-md-12" align="center">

        	
	        
	        <button class="main_btn" style="width: 189px">수정</button>
	        <button class="main_btn" style="width: 189px">목록</button>
        </div>
        
     
    </div>
   <br><br><br/>
    <!--================ start footer Area  =================-->
    <jsp:include page="/layout/footer.jsp"></jsp:include>
    <!--================ End footer Area  =================-->
    <!--================End Single Product Area =================-->
    
    <!-- 	/////////////////////////////////////////       dialog       ///////////////////////////////////////////////////////////////////// -->
   
			<div id="dialog-delAdopt" title="">
			  <p align="center"><br/>삭제하시겠습니까?</p>
			</div>  



  
    <!--================End Product Description Area =================-->

    
    

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
    
    
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>

    
	 //////////////////////////////////////////////////////////////////////////////////////////////////////      
      
      $( function() {
  	    $( "#dialog-delAdopt" ).dialog({
  	    	autoOpen: false,
  		      width: 350,
  		      height: 180,
  		      modal: true,
  		      buttons: {
  		        	예: function() {
  		        		self.location = "/adoptReview/delAdoptReivew?postNo=${board.postNo}";
  		        	},
  		        	아니오: function() {
  		          		$( this ).dialog( "close" );
  		        	}
  		      }
  	    });
      });

      
  //////////////////////////////////////////////////////////////////////////////////////////////////////

  
  
  
      $(function() {
    	
		
    	    $( "button:contains('수정')" ).on("click" , function() {
				self.location = "/adoptReview/updateAdoptReview?postNo=${board.postNo}"
			});
		
			$( "button:contains('삭제')" ).on("click" , function() {
				$('#dialog-delAdopt').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				$('#dialog-delAdopt').dialog( "open" );
			});
		
			$( "button:contains('목록')" ).on("click" , function() {
				self.location = "/adoptReview/listAdoptReview?boardCode=${board.boardCode}"
			});

	  });
  


      

    </script>
    

  </body>
</html>
  
    