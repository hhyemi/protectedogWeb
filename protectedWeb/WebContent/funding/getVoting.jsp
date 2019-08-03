 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>보호할개 · 후원신청</title>	
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
	<!-- KAKAO -->
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
	<style>

       @font-face{
          font-family: NanumSquare;
          src : url(http://ssl.pstatic.net/static/kin/fonts/NanumSquareR.woff2) format("woff2");
       }
       body{
          font-family: NanumSquare, sans-serif !important;
       }	
       b, sup, sub, u{
 			color : #000000 !important;      
       }	
        .fa-heart {
         	color: #f04f23;
/*          	padding-top: 5px; */
        }

            
	</style> 
 
 	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->   
 
  </head>
  <body>
    <!--================Header Menu Area =================--> 

    <!--================Single Product Area =================-->
    <div class="product_image_area">
      <div class="container">
        <div class="row s_product_inner">
          <div class="col-lg-6">

            조회 ${funding.voteViewCount } / 작성일 ${funding.voteStartDate}
            <p/>
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
 			 <div class="col-lg-5 offset-lg-1">
             <div class="s_product_text">			 
            <div>
            <h4>&emsp;</h4>
            
            
            <div style="padding-bottom:10px">
           		 <div class="row">
           		 <div class="col-xs-11 col-md-11" style="height:35px; left:0px; bottom:0px;" >
            <font size=6 ><b>${funding.postTitle}</b></font> <b>&emsp;${funding.nickname}</b>
				  </div> 	
			        	<c:if test="${ user.id ne funding.id }">
				         	<div class="col-xs-1 col-md-1" style="height:35px; right:0px; bottom:0px;padding-left: 0;" >
								
								<font size="5px" id="heartIcon">
									<c:if test="${ check eq 'already' }">
										<span class="fas fa-heart"></span>
									</c:if>
									<c:if test="${ check ne 'already' }">
										<span class="far fa-heart"></span>
									</c:if>
								</font>
				 			</div>
			        	</c:if>
				</div>
			<div style="padding-bottom:10px; padding-top:30px"><font size="5" ><strong style="color:#f04f23">${funding.voterCount}표</strong></font></div>
			<!-- 투표종료 -->
			 <c:if test ="${!(funding.statusCode eq 1) }">		
			<font size="5"><strong style="color:#d43333">투표종료</strong></font>
			 </c:if>
            <!-- 투표중 -->			 
			<c:if test ="${funding.statusCode eq 1 }">				 			
			<font size="5" class="media-heading">남은기간 <b>${funding.voteRemainDate }</b>일</font> 
			</c:if>			    
			 <div class="progress">
			  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="50" style="width: ${(30-funding.voteRemainDate)*100/30}%; background-color:#e8cec8!important;"></div>
			 </div>
			<div class="row" style="position:relative;height:35px;">
					 <div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" >${funding.voteStartDate}</div>
					<div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " >${funding.voteEndDate}</div>
			 </div>					 
		     <br/>

			 <div><font size="5" >투표율&ensp;${funding.voteRate}%</font></div>
			 <div class="progress">					 
			 <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="50" style="width: ${funding.voteRate}%; background-color:#e66447!important;"></div>
			 </div>		

			<div class="row" style="position:relative;height:35px;">
					 <div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" > 0표</div>
					<div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " >${funding.voteTargetCount}표</div>
			 </div>		 	 		 	 
               <br/>  
              <div class="card_area">
              
			<!-- 투표종료 -->
			 <c:if test ="${!(funding.statusCode eq 1) }">		
               		<button class="btn btn-default" id="noApply" style="width: 460px;" id="confirmButton">완료된 글입니다.</button>
			 </c:if>
            <!-- 투표중 -->			 
			<c:if test ="${funding.statusCode eq 1 }">				 			
                <button  id="btnAddVote" class="btn btn-default" style="width: 225px">투표하기</button><button id="btnQuestion"  class="btn btn-default" style="width: 225px">문의하기</button>             
			</c:if>		              
       
              </div>
              <br/>
              
			  <div align="right">
                 <a href="javascript:void(0);"  id="twitter"  title="트위터로 공유"><img src="/resources/file/others/twitter.png" height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
                  <a href="javascript:void(0);" id="facebook" title="페이스북으로 공유"><img src="/resources/file/others/facebook.png" height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
                  <a href="javascript:void(0);"  id="kakao" title="카카오톡으로 공유"> <img src="/resources/file/others/kakao.png"  height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
               </div>
 		 	  
            </div></div>
          </div></div>
        </div>
      </div>
    </div>
   <br><br><br/>
<!--================Product Description Area =================-->
	 <section class="product_description_area">
	  <form class="form-inline" name="detailForm">
	      <div class="container">
	        <ul class="nav nav-tabs" id="myTab" role="tablist">
		          <li class="nav-item">
		            <a
		              class="${ !(search.searchKeyword eq '1') ? 'nav-link show active' : 'nav-link' }"
		              id="home-tab"
		              data-toggle="tab"
		              href="#home"
		              role="tab"
		              aria-controls="home"
		              aria-selected="true"
		              >스토리</a
		            >
		          </li>
		          <li class="nav-item">
		            <a
		             class="${ (search.searchKeyword eq '1') ? 'nav-link show active' : 'nav-link' }"
		              id="voter-tab"
		              data-toggle="tab"
		              href="#voter"
		              role="tab"
		              aria-controls="voter"
		              aria-selected="false"
		              >투표자</a
		            >
		          </li>
		
		        </ul>
		        <div class="tab-content" id="myTabContent">
		          <div
       				class="${ !(search.searchKeyword eq '1') ? 'tab-pane fade active show' : 'tab-pane fade' }"
		            id="home"
		            role="tabpanel"
		            aria-labelledby="home-tab">
				 			<h2>${funding.postContent }</h2>									
		
		          </div>
		          <div
		            
		            class="${ (search.searchKeyword eq '1') ? 'tab-pane fade active show' : 'tab-pane fade' }"
		            id="voter"
		            role="tabpanel"
		            aria-labelledby="voter-tab">
		            
 					<div><h3>현재 <font color="#f04f23">${funding.voterCount}명</font>의 참여가 이루어졌습니다.</h3></div>
 					<hr/>
		 				<c:forEach var="participate" items="${list}">						
							<div class="row" style="position:relative;height:35px;">
									 <div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" ><h4 ><b>${participate.nickname}</b>&nbsp; <small>님이 투표를 하셨습니다.</small>&nbsp;</h4></div>
									<div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " >${participate.regDate}</div>
							 </div>																 		
					    <hr/>       
				       </c:forEach>
				       
				       <input type="hidden" name="postNo" value="${funding.postNo }" />	
	              	   <input type="hidden" name="userId" value="${user.id}">
              	       <input type="hidden" name="levels" value="${user.levels}">			       
			 		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
			 		   <input type="hidden" id="searchKeyword" name="searchKeyword" value=""/>	  
 					   <input type="hidden" id="pageCheck" name="pageCheck"  value="${pageCheck }"/>			 		   		  			       
				           <!-- PageNavigation Start... -->
				           <div style="padding-left:460px">
				           <jsp:include page="../common/pageNavigator_new.jsp" />
						   </div>
							<!-- PageNavigation End... -->
		          </div>		          
		       </div>
	      </div>
	      </form>
	      <p/>
				<div align="right"  style="padding-right:205px">					
							<c:if test="${user.id eq funding.id || user.id eq 'admin'}">
							<button type="button" id = "btnUpdate" class="btn btn-default">수정</button> 
							<button type="button" id = "btnDelete" class="btn btn-default">삭제</button>
							</c:if>
							<button type="button" id = "btnList" class="btn btn-default">목록</button>  
			    </div>	        
	    </section>
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
	
		    $(document).ready(function() {
		 	   var pageCheck = false;
		 	  //alert($("#pageCheck").val())
		 	   pageCheck = $("#pageCheck").val();
		       // ============= 페이징 스크롤이동 =============	    	   
		 	   if(${pageCheck} ){
		 		var offset = $('#myTab').offset(); 
		 		 $('html').animate({scrollTop : offset.top}, 1);
		 	   }

		    });
				   	
    	function fncGetList(currentPage) {
    	   	$("#searchKeyword").val("1");
    	   	$("#currentPage").val(currentPage)
    	   	$("form").attr("method" , "POST").attr("action" , "/funding/getVoting").submit();
    	 
    	}   
    	//관심목록에 추가
    	var postNo = ${funding.postNo};
    	  var id = $('input[name=userId]').val();
    		 
    	
   	 function addInterest(){
   	  
   	  		if ( id == "" ){
   	  			
   	  			swal({
   			           text: "회원만 이용할 수 있는 기능입니다.",
   			           dangerMode: true,
   			           buttons: {
   								 cancel: "확인",
   					   }
   	  			});
   	  			return;
   	  			
   	  		}else{
   	  			
   	  			$.ajax( 
   	  			 		{
   	  						url : "/interest/json/addInterest/SF/"+postNo+"/"+id,
   	  						method : "GET" ,
   	  						dataType : "json" ,
   	  						headers : {
   	  									"Accept" : "application/json",
   	  									"Content-Type" : "application/json"
   	  								  },
   	  						success : function(data , status) {
//    	  								console.log(JSON.stringify(data));
   	  								console.log(data.message);
   	  								
   	  								if ( data.message == "insertOK" ) {
   	  									$('#heartIcon').html('<i class="fas fa-heart" ></i>');
   	  									swal({
   	  							           text: "관심목록에 추가되었습니다.",
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
   	  		}
     		
     	 }
     
     	//관심목록에서 삭제
   	 function delInterest(){
   	 		console.log(postNo+","+id);
   	  
   	  			
     			$.ajax( 
     			 		{
     						url : "/interest/json/delInterest/SF/"+postNo+"/"+id,
     						method : "GET" ,
     						dataType : "json" ,
     						headers : {
     									"Accept" : "application/json",
     									"Content-Type" : "application/json"
     								  },
     						success : function(data , status) {
     								console.log(JSON.stringify(data));
     								console.log(data.message);
     								
     								if ( data.message == "delOK" ) {
     									$('#heartIcon').html('<i class="far fa-heart"></i>');
     									swal({
   	  							           text: "관심목록에서 삭제되었습니다.",
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

     		
     	 }
    $(function(){
		//관심목록에 추가
		$(document).on("click", ".far", function() {
//			$( ".far" ).on("click" , function() {
			addInterest(  );
		});
		
		//관심목록에서 삭제
		$(document).on("click", ".fas", function() {
//			$( ".fas" ).on("click" , function() {
			console.log("dd");
			delInterest(   );
		});
    	
		//============= 투표하기 Event  처리 =============	
	 	$( "#btnAddVote" ).on("click" , function() {
	 		if(${user==null}){
	 			alert("로그인이 필요합니다.")
// 	 		}else{
	 			 		
// 		 		if(!(${funding.statusCode eq '1'})){
// 		 			swal("투표가 종료되었습니다.", " ");   
		 		}else{
		 	   		 $.ajax( 
		 					{
		 			        	url : "/funding/json/addVote/"+${funding.postNo},
		 						method : "GET" ,
		 						dataType : "json" ,
		 						headers : {
		 							"Accept" : "application/json",
		 							"Content-Type" : "application/json"
		 						},
		 						error:function(request,status,error){
		                             alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		                            },
		 						success : function(JSONData , status) {
		 		
		 			                if(JSONData ==1 ) {
		 			                	
		 			     			  swal({
		 			  		           text: "이미 투표한 글 입니다.",
		 			  		           dangerMode: true,
		 			  		           buttons: {
		 			  							 catch: {
		 			  							 	text: "확인"
		 			  							 }
		 			  				   },			   
		 			  		      });
              	
		 			                } else {
		 			   		 	     	self.location = "/funding/getTerms?termsTitle=SFVote&postNo=${funding.postNo}"

		 			                } 
		 						}
		 						
		 				});		 			
		 		
	 		}
	 	});   
	    
		//============= 문의하기 Event  처리 =============	
	 	$( "#btnQuestion" ).on("click" , function() {
	 		if(${user==null}){
	 			alert("로그인이 필요합니다.")
	 		}else{
		 		 window.open("/chatting/addChattingUser?postId=${funding.id}",
							"_blank",
							"left=500, top=100, width=462, height=550, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	 		}
		});   
	
		//============= SNS공유 Event  처리 =============	
		$( "#twitter" ).on("click" , function() {
	 		 window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');
			});			
		
		$( "#facebook" ).on("click" , function() {
	 		 window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
			});			
		
		$( "#kakao" ).on("click" , function() {
			sendLinkKakao()
		});	
	    
		//============= 수정하기 Event  처리 =============	
	 	$( "#btnUpdate" ).on("click" , function() {

	 		if(${!(funding.voterCount ==0) || user.id == 'admin'}){
	
				  swal({
			           text: "투표 1개이상 받을 시 수정이 불가합니다.",
			           dangerMode: true,
			           buttons: {
								 catch: {
								 	text: "확인"
								 }
					   },			   
			      });	 			

	 		}else{
	 		 self.location = "/funding/updateVoting?postNo=${funding.postNo}"
	 		}
		});   
		
		//============= 삭제하기 Event  처리 =============	
	 	$( "#btnDelete" ).on("click" , function() {
	 		swal({
	            title: "정말 삭제 하시겠습니까 ?",
	            text: "삭제시 한달간 글 작성 불가입니다.",
	            icon: "warning",
                buttons: ["취소", "확인"],
	            dangerMode: true,
	          })
	          .then((willDelete) => {
	            if (willDelete) {
	              swal("삭제가 완료되었습니다!", {
	                icon: "success",
	              }).then((value) => {
	            	  self.location = "/funding/delVoting?postNo=${funding.postNo}"
	              });
	            }
	          });	 		
		});  
	
    });
	//============= 목록버튼 Event  처리 =============	
 	$( "#btnList" ).on("click" , function() {
		self.location = "/funding/listVoting" 	
 	});
    
		//============= 카카오 공유하기Event  처리 =============		
		// Kakao.init('153d14a106a978cdc7a42f3f236934a6');
		 function sendLinkKakao(){
		     Kakao.Link.sendDefault({
		       objectType: 'feed',
		       content: {
		         title: '보호할개',
		         description: '스토리펀딩',
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
    </script>
    
  </body>
</html>
