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
	<!-- KAKAO -->
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
	<style>
		#voteDate{
		width:375px;
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
                       
 				<c:forEach var="i" begin="0" end="${fn:length(file)}" step="1">			
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
             <font size=6  ><b>${funding.postTitle}</b></font> <b>&emsp;${funding.nickname}</b> 
			<h3>${funding.fundPay}원</h3>
			<!-- 후원종료 -->
			 <c:if test ="${!(funding.statusCode eq 3) }">		
			<h3><strong style="color:#e00d31">후원종료</strong></h3>			 			
			 </c:if>
        	 <!-- 후원중 -->
			<c:if test ="${funding.statusCode eq 3 }">					 
			<h4 class="media-heading">남은기간 <b>${funding.fundRemainDate }</b>일</h4> 	
			</c:if>		    
			 <div class="progress">
			  <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="50" style="width:  ${funding.fundTargetDay-funding.fundRemainDate}%;"></div>
			 </div>
		      <div  id="voteDate" >${funding.fundStartDate}</div><div>${funding.fundEndDate}</div> 
		     <br/>
	
				 <div><h3>후원율&ensp;<strong style="color:#225cba">${funding.fundRate}%</strong></h3></div>
				 <div class="progress">					 
				 <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="50" style="width: ${funding.fundRate}%;"></div>
				 </div>		

		      <div  id="voteDate" >0원</div><div>&ensp;&ensp;${funding.fundTargetPay}원</div> 			 	 		 	 
               <br/>  
              <div class="card_area">
                <a class="main_btn" href="#">후원하기</a><a class="main_btn" href="#">문의하기</a>  
                <a class="icon_btn" href="#">
                  <i class="lnr lnr lnr-heart"></i>
                </a>
              </div>
              <br/>
		    <a href="#"  id="twitter"  title="트위터로 공유"><img src="/resources/file/others/twitter.png"></a>
			<a href="#" id="facebook" title="페이스북으로 공유"><img src="/resources/file/others/facebook.png"></a>
			<a href="#"  id="naver" title="네이버로 공유"><img src="/resources/file/others/naver.png"></a>
			<a href="#"  id="kakao" title="카카오톡으로 공유"> <img src="/resources/file/others/kakao.png" ></a>
		 	  
            </div>
          </div></div>
        </div>
      </div>
    </div>
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
							<span class="price">글 내용</span>
								<h2>${funding.postContent }</h2>
						</div>
		          </div>
		          <div
		            class="tab-pane fade"
		            id="review"
		            role="tabpanel"
		            aria-labelledby="review-tab">
		            <span class="price">후기 제목</span>
					<h2>${funding.reviewTitle }</h2>
		            <span class="price">후기 이미지</span>
		            <p/>
					<c:forEach var="name" items="${fileReview}" varStatus="status">      
	                    <img src="/resources/file/fileSF/${name.fileName}"  width="150px;" height="150px;"/>	
	                  </c:forEach>	
	                <p/>  
		            <span class="price">후기 내용</span>
					<h2>${funding.reviewContent }</h2>				
		            <span class="price">작성 일자</span>
					<h2>${funding.reviewRegDate }</h2>
					<a class="main_btn" href="#">후기작성</a> 
					<a class="main_btn" href="#">후기수정</a> 			
					<a class="main_btn" href="#">후기삭제</a> 									
		          </div>
		          <div
		            class="tab-pane fade"
		            id="voter"
		            role="tabpanel"
		            aria-labelledby="voter-tab">
 					<div><h3>현재후원인원&ensp;${funding.sponsorCount}명</h3></div>
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
    $(function(){
    
		//============= 후원하기 Event  처리 =============	
	 	$( "a:contains('후원하기')" ).on("click" , function() {
	 		if(!(${funding.statusCode eq '3'})){
	 			alert("후원이 종료되었습니다.")
	 		}else{
	 		self.location = "/funding/getTerms?termsTitle=SFFund&postNo=${funding.postNo}";
	 		}
	 	});   
	    
		//============= 문의하기 Event  처리 =============	
	 	$( "a:contains('문의하기')" ).on("click" , function() {
	 		//self.location = "/user/getUser?userId=${sessionScope.user.userId}";
		});   
	
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
	    
		//============= 후기작성 Event  처리 =============	
	 	$( "a:contains('후기작성')" ).on("click" , function() {
	 		self.location = "/funding/addReview?postNo=${funding.postNo}";
		});   
		
		//============= 후기수정 Event  처리 =============	
	 	$( "a:contains('후기수정')" ).on("click" , function() {
	 		self.location = "/funding/updateReview?postNo=${funding.postNo}";
		});   
		
		//============= 후기삭제 Event  처리 =============	
	 	$( "a:contains('후기삭제')" ).on("click" , function() {
            if(confirm('정말 삭제하시겠습니까?')){
            	self.location = "/funding/delReview?postNo=${funding.postNo}"
            	alert("삭제가 완료되었습니다.")
            } else {
            }
		});   
		
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
    </script>
    
  </body>
</html>
