 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<!-- KAKAO -->
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
	<style>
		.form-group2{
		padding-left:420px;
		padding-right:100px;
		}	
		.form-group3{
		padding-left:465px;
		padding-right:100px;
		}	
	   @font-face{
          font-family: NanumSquare;
          src : url(http://ssl.pstatic.net/static/kin/fonts/NanumSquareR.woff2) format("woff2");
       }
       body{
          font-family: NanumSquare, sans-serif !important;
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
            조회 ${funding.fundViewCount } / 작성일 ${funding.fundStartDate}
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
			<div style="padding-bottom:10px; padding-top:30px"><font size="5" >${funding.fundPay}원</font></div>
			<!-- 후원종료 -->
			 <c:if test ="${!(funding.statusCode eq 3) }">		
			<font size="5"><strong style="color:#d43333">후원종료</strong></font>		 			
			 </c:if>
        	 <!-- 후원중 -->
			<c:if test ="${funding.statusCode eq 3 }">					 
			<font size="5" class="media-heading">남은기간 <b>${funding.fundRemainDate }</b>일</font> 	
			</c:if>		    
			 <div class="progress">
			  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="50" style="width:  ${funding.fundTargetDay-funding.fundRemainDate}%; background-color:#e8cec8!important;"></div>
			 </div>
			<div class="row" style="position:relative;height:35px;">
					 <div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" > ${funding.fundStartDate}</div>
					<div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " >${funding.fundEndDate}</div>
			 </div>					 
		     <br/>
	
				 <div><font size="5" >후원율&ensp;<strong style="color:#f04f23">${funding.fundRate}%</strong></font></div>
				 <div class="progress">					 
				 <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="50" style="width: ${funding.fundRate}%; background-color:#e66447!important;"></div>
				 </div>		
			<div class="row" style="position:relative;height:35px;">
					 <div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" > 0원</div>
					<div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " ><fmt:formatNumber value="${funding.fundTargetPay}" pattern="#,###" />원</div>
			 </div>			 	 		 	 
               <br/>  
              <div class="card_area">
                <button id="btnFund" class="btn btn-default" style="width: 225px">후원하기</button><button id="btnQuestion" class="btn btn-default" style="width: 225px">문의하기</button>  
              </div>
              <br/>
              <div align="right">
			    <a href="#"  id="twitter"  title="트위터로 공유"><img src="/resources/file/others/twitter.png" height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
				<a href="#" id="facebook" title="페이스북으로 공유"><img src="/resources/file/others/facebook.png" height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
				<a href="#"  id="kakao" title="카카오톡으로 공유"> <img src="/resources/file/others/kakao.png"  height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
	 		  </div>
            </div>
          </div></div>
        </div>
      </div>
    </div></div>
   <br><br><br/>
<!--================Product Description Area =================-->
	 <section class="product_description_area">
	      <div class="container">
	        <ul class="nav nav-tabs" id="myTab" role="tablist">
		          <li class="nav-item">
		            <a
		              class="nav-link show active"
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
		              class="nav-link"
		              id="review-tab"
		              data-toggle="tab"
		              href="#review"
		              role="tab"
		              aria-controls="review"
		              aria-selected="false"
		              >후기 </a>
		          </li>
		          <li class="nav-item">
		            <a
		              class="nav-link"
		              id="voter-tab"
		              data-toggle="tab"
		              href="#voter"
		              role="tab"
		              aria-controls="voter"
		              aria-selected="false"
		              >후원자</a
		            >
		          </li>
		
		        </ul>
		        <div class="tab-content" id="myTabContent">
		          <div
		            class="tab-pane fade active show"
		            id="home"
		            role="tabpanel"
		            aria-labelledby="home-tab">
		            	<div class="col-md-10 col-md-offset-1">
								<h2>${funding.postContent }</h2>
						</div>
		          </div>
		          
		          <div
		            class="tab-pane fade"
		            id="review"
		            role="tabpanel"
		            aria-labelledby="review-tab">
		            
					<c:if test="${funding.reviewContent == null}">
					<h4>등록된 후기가 없습니다.</h4>
					<c:if test="${user.id eq funding.id || user.id eq 'admin'}">
					<div class="form-group3">
					<button type="button" id="reviewAdd" class="btn btn-default">후기작성</button> 								
		            </div>					
					</c:if>						
					</c:if>
					
					<c:if test="${!(funding.reviewContent == null) }">
					<div class="row" style="position:relative;height:35px;">
							 <div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" ><h2>${funding.reviewTitle }</h2></div>
							<div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " >작성일 ${funding.reviewRegDate }</div>
					 </div>			            
		            <hr/><br/>
					<c:forEach var="name" items="${fileReview}" varStatus="status">      
	                    <img src="/resources/file/fileSF/${name.fileName}"  width="150px;" height="150px;"/>	
	                  </c:forEach>	
	                <br/>   <br/><p/>   
					${funding.reviewContent }
					<hr/><br/>	
					<div class="form-group2">
					<c:if test="${user.id eq funding.id || user.id eq 'admin'}">
					<button type="button" id="reviewUpdate" class="btn btn-default">후기수정</button> 			
					<button type="button" id="reviewDelete" class="btn btn-default">후기삭제</button> 
					</c:if>									
		            </div>
					</c:if>	
		          </div>
		          
		          <div
		            class="tab-pane fade"
		            id="voter"
		            role="tabpanel"
		            aria-labelledby="voter-tab">
 					<div><h3>현재 <font color="#8c8479">${funding.sponsorCount}명</font>의 참여가 이루어졌습니다.</h3></div>		            
	 					<hr/>
		 				<c:forEach var="participate" items="${list}">						
							<div class="row" style="position:relative;height:35px;">
									 <div class="col-xs-8 col-md-8" style="position:absolute; left:0px; bottom:0px;" ><h4 ><b>${participate.nickname}</b>&nbsp; <small>님이 ${participate.fundPay }원을 후원하셨습니다.</small>&nbsp;</h4></div>
									<div class="col-xs-4 col-md-4" align="right" style="position:absolute; right:0px; bottom:0px; " >${participate.regDate}</div>
							 </div>																 		
					    <hr/>       
				       </c:forEach>
		          </div>		          
		       </div>
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
	

    
		//============= 후원하기 Event  처리 =============	
	 	$( "#btnFund" ).on("click" , function() {
	 		if(${user == null}){
	 			alert("로그인이 필요합니다.");
	 		}else{
		 		if(!(${funding.statusCode eq '3'})){
		 			alert("후원이 종료되었습니다.")
		 		}else{
		 		self.location = "/funding/getTerms?termsTitle=SFFund&postNo=${funding.postNo}";
		 		}
	 		}
	 	});   
	    
		//============= 문의하기 Event  처리 =============	
	 	$( "#btnQuestion" ).on("click" , function() {

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
	    
		//============= 후기작성 Event  처리 =============	
	 	$( "#reviewAdd" ).on("click" , function() {
	 		self.location = "/funding/addReview?postNo=${funding.postNo}";
		});   
		
		//============= 후기수정 Event  처리 =============	
	 	$( "#reviewUpdate" ).on("click" , function() {
	 		self.location = "/funding/updateReview?postNo=${funding.postNo}";
		});   
		
		//============= 후기삭제 Event  처리 =============	
	 	$( "#reviewDelete" ).on("click" , function() {
	 		swal({
	            title: "정말 삭제 하시겠습니까 ?",
	            text: "삭제시 한달간 글 작성 불가입니다.",
	            icon: "warning",
	            buttons: true,
	            dangerMode: true,
	          })
	          .then((willDelete) => {
	            if (willDelete) {
	              swal("삭제가 완료되었습니다!", {
	                icon: "success",
	              }).then((value) => {
	            	  self.location = "/funding/delReview?postNo=${funding.postNo}"
	              });
	            }
	          });	 	 				
       });
		//============= 카카오 공유하기Event  처리 =============		
		 //Kakao.init('153d14a106a978cdc7a42f3f236934a6');
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
