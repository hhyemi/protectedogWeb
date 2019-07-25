 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>보호할개 · 분양후기글 상세조회</title>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    
    <style type="text/css">
    
    	html {
	 		scroll-behavior: smooth;
		}
		
/* 		p, strong, select { */
/* 			transform: rotate(0.1deg); */
/* 		} */
		
		.ftco-section {
			padding-top: 0px !important;
		}

		.main_btn {
		    display: inline-block;
		    background: #94BFCA;
		    padding: 0px 32px;
		    letter-spacing: 0.25px;
		    color: #fff;
		    font-size: 12px;
		    font-weight: 500;
		    line-height: 44px;
		    outline: none !important;
		    box-shadow: none !important;
		    text-align: center;
		    border: 1px solid #94BFCA;
		    cursor: pointer;
		    text-transform: uppercase;
		    transition: all 300ms linear 0s;
		    border-radius: 5px;
		}
		
		#modiButton, #delButton, #listButton {
		    padding: 0px 5px;
/* 		    letter-spacing: 0.25px; */
/* 		    color: #fff; */
/* 		    font-size: 12px; */
/* 		    font-weight: 500; */
 		    line-height: 20px; 
/* 		    outline: none !important; */
/* 		    box-shadow: none !important; */
/* 		    text-align: center; */
/* 		    border: 1px solid #94BFCA; */
/* 		    cursor: pointer; */
/* 		    text-transform: uppercase; */
/* 		    transition: all 300ms linear 0s; */
 		    border-radius: 3px; 
		}

   		.main_btn:hover {
	   		background:transparent;
	   		color:#94BFCA
   		}
   		
   		.mt-5, .pt-3 {
   			margin-top: 0px important;
   		}
   		
   		.col-md-12>.form-group {
   			min-height: 300px;
   		}
   		
   		img {
   			max-width: 730px !important;
   		}
   		
    </style>
  </head>
  <body class="goto-here">
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>

<!--     <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');"> -->
<!--       <div class="container"> -->
<!--         <div class="row no-gutters slider-text align-items-center justify-content-center"> -->
<!--           <div class="col-md-9 ftco-animate text-center"> -->
<!--           	<p class="breadcrumbs"><span class="mr-2"><a href="index0.html">Home</a></span> <span>Checkout</span></p> -->
<!--             <h1 class="mb-0 bread" id="h1"> -->
<!--            		후기 상세조회 -->
<!--             </h1> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
    
    

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-8 ftco-animate">
			<form  class="billing-form" name="detailForm">
	          	<div class="row align-items-end">
	          	
	          	
				<input type="hidden" name="boardCode" value="AR" >
				<input type="hidden" name="id" value="${board.id }" >
				<input type="hidden" name="nickName" value="${board.nickName}" >
				<input type="hidden" name="phone" value="${board.phone }" >
<!-- 				<input type="hidden" class="form-control" id="multiFile" name="multiFile" > -->
				
   	
	          	<div class="col-md-12"><br/><br/></div>
	          	
	          		<div class="col-md-12">
<!-- 		                <div class="form-group"> -->
		                	<h4 style="margin-bottom: 0px;">${board.postTitle}</h4>
<!-- 		                </div> -->
	                </div>
	                <div class="col-md-12"><hr/></div>
	                <div class="col-md-12">
	                	<div class="row" style="position: relative; height: 25px;">
							<div class="col-md-8" style="position: absolute; left: 0px; bottom: 0px;">
								${board.nickName}(${board.id}) | ${board.regDate}
							</div>
							<div class="col-md-4" align="right"style="position: absolute; right: 0px; bottom: 0px;">
								조회수 :${board.viewCount}  댓글수 :${totalCount}
							</div>
						</div>
					</div>	
	                <div class="col-md-12"><hr/></div>
	                
	             	
		            
		            <div class="col-md-12"><br/></div>
	
               		<div class="col-md-12">
		                <div class="form-group">
<!-- 		                	<label for="postContent"><strong>글내용</strong></label>&nbsp;&nbsp;<span name="postContent"></span> -->
<!-- 		                	<input type="text" class="form-control" name="postContent" value="dd" placeholder="내용을 입력하세요."> -->
<!-- 		                	<textarea  class="form-control"  name="postContent"  rows="10"  placeholder="내용을 입력하세요."></textarea> -->
		               
		                <div class="postForm" align="left">
						<div id="toolbar-container" class="col-xs-12 col-md-12"></div>
							${board.postContent}
						</div>
		               
		                </div>
	                </div>
	                
	                
               		
               		<div class="w-100"></div>
		            <div class="w-100"></div>
               		<div class="w-100"></div>
                <div class="col-md-12"><hr/></div>
	            </div>
	          </form>
	          
	          <!-- END -->

        
		        <p align="right">
		       		<c:if test="${sessionScope.user.id eq board.id }">
						<button class="main_btn" id="modiButton">수정${board.regDate+15 }</button>
						
						<c:if test="${board.regDate+15 }">
			       			<button class="main_btn" id="delButton">삭제</button>
			       		</c:if>
					</c:if>
					
			        <button class="main_btn" id="listButton">목록</button>
		        </p>

	          <div class="row mt-5 pt-3 d-flex">
<%-- 	          <jsp:include page="/common/comment.jsp"></jsp:include> --%>
			  <br/><br/>
<!-- 	          	<div class="col-md-12"> -->
<!-- 					<p><button class="btn btn-primary py-3 px-4 col-md-12">등록</button></p> -->
					
<!-- 					<div class="form-group"> -->
<!-- 						<div class="col-md-12"> -->
<!-- 							<div class="radio" align="right"> -->
<!-- 								<p><a href="#" ><font color="gray">취소</font></a></p> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 	          	</div> -->
	          </div>
	          
	          
 <!-- 	■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■       dialog       ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
  
			<div id="dialog-del" title="">
			  <p align="center"><br/>삭제하시겠습니까?</p>
			</div>       

<!-- 	■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   dialog  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->      
	          
	          
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
    
    
  


  <!-- dialog -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <!-- 템플릿 -->
  <script src="/resources/prodmenu/js/jquery.min.js"></script>
  <script src="/resources/prodmenu/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/prodmenu/js/popper.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.easing.1.3.js"></script>
  <script src="/resources/prodmenu/js/jquery.waypoints.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.stellar.min.js"></script>
  <script src="/resources/prodmenu/js/owl.carousel.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/prodmenu/js/aos.js"></script>
  <script src="/resources/prodmenu/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap-datepicker.js"></script>
  <script src="/resources/prodmenu/js/scrollax.min.js"></script>
  <script src="/resources/prodmenu/js/main.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="/resources/events.js"></script>
  
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/12.3.0/classic/ckeditor.js"></script>
  <script>
  
 




	var boardCode = $( 'input[name=boardCode]' ).val().trim();
	
	$( function() {
	    $( "#dialog-del" ).dialog({
	    	autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	 	 예: function(){
		    		  self.location = "/adoptReview/delAdoptReview?postNo="+${board.postNo};
		    	  	},
		    	  	아니오: function(){
		    		  $( this ).dialog( "close" );
		    	 	}
		      }
	    });
	});

	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■     ↑  dialog      ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■	

	
	// 등록버튼 누르고
	function fncAddAdoptReview(){


// 		var postContent = $("#editor").text();
// 		$("form[name=detailForm]").attr("method" , "POST").attr("action" , "/adoptReview/addAdoptReview").attr("enctype","multipart/form-data").submit();
		
	}
	

    $(function() {
    	
			$( "button:contains('수정')" ).on("click" , function() {
				self.location = "/adoptReview/updateAdoptReview?postNo="+${board.postNo};
			});
			
			$( "button:contains('삭제')" ).on("click" , function() {
				$('#dialog-del').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				$('#dialog-del').dialog('open');
			});
			
			$( "button:contains('목록')" ).on("click" , function() {
				self.location = "/adoptReview/listAdoptReview";
			});
	 });	
      
      
    </script>

  
  
  
  
  </body>
</html>