 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>보호할개 · 분양후기글 상세조회</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    
    <style type="text/css">
    
    	html {
	 		scroll-behavior: smooth;
		}
		
		.ftco-section {
			padding-top: 0px !important;
		}

		#modiButton, #delButton, #listButton {
		    padding: 0px ;
		    margin-right:0px;
		    margin-left:0px;
		    width:40px;
		    height:20px;
 		    line-height: 20px; 
 		    border-radius: 3px; 
  		    font-size: 13px; 
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
    <jsp:include page="/layout/toolbar.jsp"></jsp:include>
  </head>
  <body class="goto-here">
	

	<div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">Get</span> <span>AdoptReview</span></p>
            <font size="7">분양후기</font>
          </div>
        </div>
      </div>
    </div>
    
    

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
		                	<h4 style="margin-bottom: 0px;font-weight: bold;">${board.postTitle}</h4>
<!-- 		                </div> -->
	                </div>
	                <div class="col-md-12"><hr/></div>
	                <div class="col-md-12">
	                	<div class="row" style="position: relative; height: 25px;">
							<div class="col-md-8" style="position: absolute; left: 0px; bottom: 0px;">
								${board.nickName}(${board.id}) | ${board.regDate}
							</div>
							<div class="col-md-4" align="right"style="position: absolute; right: 0px; bottom: 0px;">
								조회수: ${board.viewCount}  댓글수: 
								<c:if test="${totalCount eq null}">0</c:if>
								<c:if test="${totalCount ne null}">${totalCount}</c:if>
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
                
	            </div>
	          </form>
	          
	          <!-- END -->
		<div class="minibox" align="center">
			<div>
				<br/>
				<p/>
				<br/>
				<a href="#"  id="twitter"  title="트위터로 공유"><img src="/resources/file/others/twitter.png"></a>
				<a href="#" id="facebook" title="페이스북으로 공유"><img src="/resources/file/others/facebook.png"></a>
				<a href="#"  id="naver" title="네이버로 공유"><img src="/resources/file/others/naver.png"></a>
				<a href="#"  id="kakao" title="카카오톡으로 공유"> <img src="/resources/file/others/kakao.png" ></a>
			</div>
		</div>
		<div class="col-md-12"><hr/></div>
        
		        <p align="right">
		       		<c:if test="${sessionScope.user.id eq board.id }">
						<button class="btn btn-default" id="modiButton">수정</button>
						
<%-- 						<c:if test="${board.regDate+15 }"> --%>
			       			<button class="btn btn-default" id="delButton">삭제</button>
<%-- 			       			<c:set var="year" value="<%=new Date(new Date().getTime() + 1000 * 60 * 60 * 24 * 365)%>"/> --%>
<%-- 			       		</c:if> --%>
					</c:if>
					
			        <button class="btn btn-default" id="listButton">목록</button>
		        </p>

	          <div class="row mt-5 pt-3 d-flex">
	          <jsp:include page="/common/comment.jsp"></jsp:include>
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
<%-- 	          <jsp:include page="/common/comment.jsp"></jsp:include>   --%>
	          
  
	          
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
    
    
  


  
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="/resources/events.js"></script>
  <!-- KAKAO -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  	
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/12.3.0/classic/ckeditor.js"></script>
  <script>
  
 




	var boardCode = $( 'input[name=boardCode]' ).val().trim();
	

	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■     ↑  dialog      ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■	

	
	//============= SNS공유 Event  처리 =============	
	$( "#twitter" ).on("click" , function() {
 		 window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');
	});		
	
	$( "#naver" ).on("click" , function() {
 		 window.open('https://share.naver.com/web/shareView.nhn?url='+encodeURIComponent(document.URL)+'&title=hyemi!', 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');
	});		
	
	$( "#facebook" ).on("click" , function() {
 		 window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
	});			
	
	$( "#kakao" ).on("click" , function() {
		sendLinkKakao()
	});	
	
  //============= 카카오 공유하기Event  처리 =============		
	 Kakao.init('153d14a106a978cdc7a42f3f236934a6');
  
	 function sendLinkKakao(){
	     Kakao.Link.sendDefault({
	     	objectType: 'feed',
	     	content: {
	     		title: '유기견보호',
	     		description: '멍멍',
	     		imageUrl:document.location.href,
	     		link: {
			     		mobileWebUrl: document.location.href,
			     		webUrl:document.location.href
	     			  }
	     		},
	    	buttons: [       
	        			{
	        				title: '링크 열기',
	        				link: {
	       							mobileWebUrl: document.location.href,
	        						webUrl: document.location.href
	        					  }
	        			}
	      			  ]
	     }); 
	 }  
	 
  //==================================================

    $(function() {
    	
			$( "button:contains('수정')" ).on("click" , function() {
				self.location = "/adoptReview/updateAdoptReview?postNo="+${board.postNo};
			});
			
			$( "button:contains('삭제')" ).on("click" , function() {
				
				swal({
			           text: "삭제하시겠습니까?",
			           dangerMode: true,
			           buttons: {
								 catch: {
								 	text: "예",
								 },
								 cancel: "아니오",
					   },
					   
			    }).then((willDelete) => {
			           if (willDelete) {
			        	   self.location = "/adoptReview/delAdoptReview?postNo="+${board.postNo};
			           }
			    });
			});
			
			$( "button:contains('목록')" ).on("click" , function() {
				self.location = "/adoptReview/listAdoptReview";
			});
	 });	
      
      
    </script>

  
  
  
  
  </body>
</html>