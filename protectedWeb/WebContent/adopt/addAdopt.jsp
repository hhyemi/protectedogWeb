 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>ADD ADOPT</title>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/resources/prodmenu/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/animate.css">
    
    <link rel="stylesheet" href="/resources/prodmenu/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/aos.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/jquery.timepicker.css">

    <link rel="stylesheet" href="/resources/prodmenu/css/flaticon.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/icomoon.css">
    <link rel="stylesheet" href="/resources/prodmenu/css/style.css">
    

  </head>
  <body class="goto-here">
		<div class="py-1 bg-black">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ 1235 2355 98</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">youremail@email.com</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						    <span class="text">3-5 Business days delivery &amp; Free Returns</span>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">protecteddog</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="../index.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item dropdown active">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="shop.html">Shop</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div>
            </li>
	          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
	          <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>

	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
<!--           	<p class="breadcrumbs"><span class="mr-2"><a href="index0.html">Home</a></span> <span>Checkout</span></p> -->
            <h1 class="mb-0 bread" id="h1">
           		<c:if test="${param.boardCode eq 'AD' }">분양글 등록</c:if>
			    <c:if test="${param.boardCode eq 'MS' }">실종글 등록</c:if>
            </h1>
          </div>
        </div>
      </div>
    </div>
    
    

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-8 ftco-animate">
						<form  id ="uploadForm"  action="#" class="billing-form">
<!-- 							<h3 class="mb-4 billing-heading">미정</h3> -->
	          	<div class="row align-items-end">
	          	
	          	
				<input type="hidden" name="boardCode" value=" ${ param.boardCode.trim() }" >
				<input type="hidden" name="id" value="user03" >
				<input type="hidden" name="statusCode" value="1" >
				<input type="hidden" class="form-control" id="multiFile" name="multiFile" >
				
				<div class="col-md-12">
				
	          		<div class="cart-detail bg-light p-3 p-md-4">
	          			<h3 class="billing-heading mb-4"><strong>약관 동의</strong></h3>
	          			
						<div class="form-group">
							<div class="col-md-12"><strong>1. </strong>약관 추가</div>
							<div class="col-md-12">
								<div class="radio" align="right">
								   <label><input type="checkbox" name="terms" class="mr-2">동의</label>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-12"><strong>2. </strong>
								<c:if test="${param.boardCode eq 'AD' }">분양글을 등록하고, 입양신청서가 등록되거나 분양완료 상태로 변경하신 경우 글을 수정하거나 삭제하실 수 없습니다.</c:if>
			 					<c:if test="${param.boardCode eq 'MS' }">실종글을 등록하고, 찾기완료 상태로 변경하신 경우 글을 수정하거나 삭제하실 수 없습니다.</c:if>
							</div>
							<div class="col-md-12">
								<div class="radio" align="right">
								   <label><input type="checkbox" name="terms" class="mr-2">동의</label>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-12">
								<div class="radio" align="right">
								   <label><input type="checkbox" name="termsAll" class="mr-2"><strong>모두 동의</strong></label>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				
				
	   
	          	
	          	
	          	<div class="col-md-12"><br/><hr/><br/></div>
	          	
	          		<div class="col-md-12">
		                <div class="form-group">
		                	<label for="postTitle"><strong>글제목</strong>&nbsp;&nbsp;<span name="postTitle"></span></label>
		                	<input type="text" class="form-control" name="postTitle" placeholder="제목을 입력하세요.">
		                </div>
	                </div>
	          	
	          		<div class="col-md-12">
		                <label for="phone"><strong>연락처</strong>&nbsp;&nbsp;<span name="phone"></span></label>
	                </div>
	                
	                <div class="col-md-4">
	                	<select  class="form-control" name="phone1" id="phone1">
			            	<option value="010">010</option>
			            	<option value="011" selected="selected">011</option>
			            	<option value="016">016</option>
			            	<option value="017">017</option>
			            	<option value="019">019</option>
			            </select>
	                </div>
	                
	          		<div class="col-md-4">
	                	<input type="text" class="form-control" id="phone2" name="phone2" value="2123">
	                </div>
	                
	          		<div class="col-md-4">
	                	<input type="text" class="form-control" id="phone3" name="phone3" value="4567">
	                </div>
	               
	                <input type="hidden" class="form-control" id="phone" name="phone">
	                
	                <div class="col-md-12"><br/></div>
	                
	                <!-- 첨부 버튼 -->
	                <div class="col-md-12">
			            <div id="attach" class="form-group">
			                <span class="label label-primary " ><label class="waves-effect waves-teal btn-flat" for="uploadInputBox"><strong>이미지 등록</strong>&nbsp;&nbsp;맨앞 이미지는 대표이미지입니다. (최대 5장까지 업로드 가능합니다.)</label></span>
			                <input id="uploadInputBox" style="display: none" type="file" value="등록" name="filedata"  />
			            </div>
		            </div>
		           	<br/>
		            
		            <!-- 미리보기 영역 -->
		            <div class="col-md-12">
			            <div class="form-group">
			           	 <div id="preview" class="col-md-3" align="center" style='display:inline; min-width:600px;'></div> 
			            </div>
		            </div>
		            
		            <div class="col-md-12"><br/></div>
	                
	          		<div class="col-md-6">
		                <div class="form-group">
		                	<label for="dogBreed"><strong>견종</strong>&nbsp;&nbsp;<span name="dogBreed"></span></label>
		                	<input type="text" class="form-control" id="dogBreed" name="dogBreed" placeholder="이미지 등록 시 자동으로 입력됩니다.">
		                </div>
	                </div>
	                
	            	<div class="col-md-6">
	              		<div class="form-group">
	                		<label for=""><strong>크기</strong></label>
						      	<select class="form-control" name="dogSize" id="dogSize">
								  	<option value="소형견" >소형견</option>
									<option value="중형견" >중형견</option>
									<option value="대형견" >대형견</option>
								</select>
	               		</div>
               		</div>
               		
	            	<div class="col-md-6">
	              		<div class="form-group">
	                		<label for="dogWeight"><strong>체중</strong>&nbsp;&nbsp;<span name="dogWeight"></span></label>
	                  		<input type="number" class="form-control" name="dogWeight"  value="5.5" placeholder="강아지 체중을 입력하세요.">
	               		</div>
               		</div>
               		
	            	<div class="col-md-6">
	              		<div class="form-group">
	                		<label for="dogGender"><strong>성별</strong></label>
						      	<select class="form-control" name="dogGender" id="dogGender">
								  	<option value="남아" >남아</option>
									<option value="여아" >여아</option>
								</select>
	               		</div>
               		</div>
               		
	            	<div class="col-md-6">
	              		<div class="form-group">
	                		<label for="dogPay"><strong>
		                		<c:if test="${param.boardCode eq 'AD' }">책임비</c:if>
							    <c:if test="${param.boardCode eq 'MS' }">사례비</c:if>
	                		</strong>&nbsp;&nbsp;<span name="dogPay"></span></label>
	                  		<input type="text" class="form-control" name="dogPay" value="123456" placeholder="비용을 입력하세요.">
	               		</div>
               		</div>
               		
	            	<div class="col-md-6">
	              		<div class="form-group">
	                		<label for="dogDate"><strong>
	                			<c:if test="${param.boardCode eq 'AD' }">발견일자</c:if>
							    <c:if test="${param.boardCode eq 'MS' }">실종일자</c:if>
	                		</strong></label>
	                  		<input type="date" class="form-control" name="dogDate" value="2019-07-07" >
	               		</div>
               		</div>
               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="dogStatus"><strong>상태</strong>&nbsp;&nbsp;<span name="dogStatus"></span></label>
	                  		<input type="text" class="form-control" name="dogStatus" value="dd" placeholder="강아지 상태를 설명해주세요.">
	               		</div>
               		</div>
               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="dogPersonality"><strong>성격</strong>&nbsp;&nbsp;<span name="dogPersonality"></span></label>
	                  		<input type="text" class="form-control" name="dogPersonality" value="dd" placeholder="강아지 성격을 설명해주세요.">
	               		</div>
               		</div>
               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="dogChar"><strong>특징</strong>&nbsp;&nbsp;<span name="dogChar"></span></label>
	                  		<input type="text" class="form-control" name="dogChar" value="dd" placeholder="강아지 특징을  설명해주세요.">
	               		</div>
               		</div>
               		
               		
               		
	            	<div class="col-md-12">
	            	<br/>
                		<label><strong>
                		<c:if test="${param.boardCode eq 'AD' }">
                			지도를 클릭하면 마커가 생성되며, 우클릭할 경우 마커가 모두 삭제됩니다. <br/>특정 마커를 우클릭할 경우 우클릭한 마커만 삭제됩니다.
                		</c:if>
                		<c:if test="${param.boardCode eq 'MS' }">
                			지도를 클릭하면 마커가 생성되며, 지도를 우클릭하거나 마커를 우클릭한 경우 마커가 삭제됩니다. 
                		</c:if>
                		</strong></label>
               		</div>
               		
               		
               		
               		<c:if test="${param.boardCode eq 'AD' }">
		            	<div class="col-md-12">
		              		<div class="form-group">
		                		<label for="adoptArea"><strong>분양가능지역</strong> &nbsp;(3곳까지 선택가능합니다.)</label>
		                		<div id="mapArea" style="width: wrap; height: 300px;"></div><br/>
		                  		<input type="hidden" class="form-control" id="adoptArea" name="adoptArea" >
		                  		<input type="text" class="form-control" id="areaKr" name="areaKr" placeholder="마커 위치가 입력됩니다." readonly="readonly">
		               		</div>
	               		</div>
               		</c:if>
               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="location"><strong>
		                		<c:if test="${param.boardCode eq 'AD' }">
						  			발견위치
						  		</c:if>
							    <c:if test="${param.boardCode eq 'MS' }">
						  			실종위치
						  		</c:if>
	                		</strong></label>
	                		<div id="map" style="width:wrap; height: 300px;"></div><br/>
	                  		<input type="hidden" class="form-control" id="location" name="location">
	                  		<input type="text" class="form-control" id="locationKr" name="locationKr" placeholder="마커 위치가 입력됩니다." readonly>
	               		</div>
               		</div>
               		
               		
               		<div class="col-md-12">
		                <div class="form-group">
		                	<label for="postContent"><strong>글내용</strong></label>&nbsp;&nbsp;<span name="postContent"></span>
<!-- 		                	<input type="text" class="form-control" name="postContent" value="dd" placeholder="내용을 입력하세요."> -->
		                	<textarea  class="form-control"  name="postContent"  rows="5" value="dd"  placeholder="내용을 입력하세요."></textarea>
		                </div>
	                </div>
               		

               		
               		<div class="w-100"></div>
		            <div class="w-100"></div>
               		<div class="w-100"></div>
                
	            </div>
	          </form>
	          
	          <!-- END -->


	          <div class="row mt-5 pt-3 d-flex">
	          	<div class="col-md-12">
					<p><button class="btn btn-primary py-3 px-4 col-md-12">등록</button></p>
					
					<div class="form-group">
						<div class="col-md-12">
							<div class="radio" align="right">
								<p><a href="#" ><font color="gray">취소</font></a></p>
							</div>
						</div>
					</div>
	          	</div>
	          </div>
	          
	          
 <!-- 	■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■       dialog       ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

			<div id="dialog-terms" title="">
			  <p align="center"><br/>약관동의를 모두 클릭해주세요.</p>
			</div>       
			<div id="dialog-postTitle" title="">
			  <p align="center"><br/>제목을 입력해주세요.</p>
			</div>       
			<div id="dialog-postTitleLength" title="">
			  <p align="center"><br/>제목은 10자까지 입력할 수 있습니다.</p>
			</div>       
			<div id="dialog-phone" title="">
			  <p align="center"><br/>연락처를 정확히 입력하세요.</p>
			</div>       
			<div id="dialog-dogBreedLength" title="">
			  <p align="center"><br/>견종은 10자까지 입력할 수 있습니다.</p>
			</div>       
			<div id="dialog-img" title="">
			  <p align="center"><br/>이미지를 등록해주세요.</p>
			</div>        
			<div id="dialog-dogWeight" title="">
			  <p align="center"><br/>체중을 입력해주세요.</p>
			</div>       
			<div id="dialog-dogWeightLength" title="">
			  <p align="center"><br/>체중은 6자까지 입력할 수 있습니다.</p>
			</div>       
			<div id="dialog-dogPay" title="">
			  <p align="center"><br/>
			  		<c:if test="${param.boardCode eq 'AD' }">책임비를 입력해주세요.</c:if>
			  		<c:if test="${param.boardCode eq 'MS' }">사례비를 입력해주세요.</c:if>
			  </p>
			</div>       
			<div id="dialog-dogPayLength" title="">
			  <p align="center"><br/>
			  		<c:if test="${param.boardCode eq 'AD' }">책임비는 백만원 이상은 입력하실 수 없습니다.</c:if>
			  		<c:if test="${param.boardCode eq 'MS' }">사례비는 백만원 이상은 입력하실 수 없습니다.</c:if>
			  </p>
			</div>       
			<div id="dialog-dogDate" title="">
			  <p align="center"><br/>
			  		<c:if test="${param.boardCode eq 'AD' }">발견일자를 입력해주세요.</c:if>
			  		<c:if test="${param.boardCode eq 'MS' }">실종일자를 입력해주세요.</c:if>
			  </p>
			</div>       
			<div id="dialog-dogStatus" title="">
			  <p align="center"><br/>강아지 상태를 설명해주세요.</p>
			</div>       
			<div id="dialog-dogStatusLength" title="">
			  <p align="center"><br/>강아지 상태는 20자까지 입력할 수 있습니다.</p>
			</div>       
			<div id="dialog-dogPersonality" title="">
			  <p align="center"><br/>강아지 성격을 설명해주세요.</p>
			</div>       
			<div id="dialog-dogPersonalityLength" title="">
			  <p align="center"><br/>강아지 성격은 20자까지 입력할 수 있습니다.</p>
			</div>       
			<div id="dialog-dogChar" title="">
			  <p align="center"><br/>강아지 특징을 설명해주세요.</p>
			</div>       
			<div id="dialog-dogCharLength" title="">
			  <p align="center"><br/>강아지 특징은 20자까지 입력할 수 있습니다.</p>
			</div>       
			<div id="dialog-area" title="">
			  <p align="center"><br/>분양가능지역을 선택해주세요.</p>
			</div>       
			<div id="dialog-location" title="">
			  <p align="center"><br/>
			  		<c:if test="${param.boardCode eq 'AD' }">발견위치를 선택해주세요.</c:if>
			  		<c:if test="${param.boardCode eq 'MS' }">실종위치를 선택해주세요.</c:if>
			  </p>
			</div>   
			<div id="dialog-postContent" title="">
			  <p align="center"><br/>내용을 입력해주세요.</p>
			</div>      
			<div id="dialog-postContentLength" title="">
			  <p align="center"><br/>내용는 100자까지 입력할 수 있습니다.</p>
			</div>      
       
<!-- 	■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   dialog  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->      
	          
	          
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

    
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

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
  <script>

 	  var mapArea;
      var map;
      
      var markersArea = [];
      var markers = [];
      
      
      function initMap() {
    	  
    	  if( $('input[name=boardCode]').val().trim() =='AD'){
		        mapArea = new google.maps.Map(document.getElementById('mapArea'), {
			    	zoom: 13,
			    	center: {lat: 37.564, lng: 127.0017}
		        });
		
		        mapArea.addListener('click', function(event) {
		        	addMarker(event.latLng, "area");
		        });
		        
		        mapArea.addListener('rightclick', function() {
			    	if( markersArea.length > 0 ){
	   		        	
			    		for (var i = markersArea.length-1; i >=0; i--) {
	   		        		markersArea[i].setMap(null);
	   		        		markersArea.splice(i, 1 );
	   		            }
	   		        	
	   		        	$('#adoptArea').val('');
	   		        	$('#areaKr').val('');
			    	}
			    });
    	  }
	  ////////////////////        위: 분양가능지역               //      아래: 분양|실종위치          ////////////////////////////////////////
	  
	      map = new google.maps.Map(document.getElementById('map'), {
	        	zoom: 13,
	        	center: {lat: 37.564, lng: 127.0017}
	      });
	
	      map.addListener('click', function(event) {
	        	addMarker(event.latLng, "loca");
	      });
	      
	      map.addListener('rightclick', function() {
	        	deleteMarkers();
	        	$('#location').val('');
	        	$('#locationKr').val('');
		  });
      }
      
      
      var markerArea;
      var marker;
      var loca;
      var str = "";
      var markTest="";
      var mmm = "";
      
/////////////////////////////////////////////////////////////////////////////////////////////
      function addMarker(location, str) {
    	  
    	  if ( str == "area"){
    		  
	    		 if (markersArea.length <3){
	  		        var markerArea = new google.maps.Marker({
	  			        position: location,
	  			        map: mapArea
	  		        });
	  		        
	  		     	markersArea.push(markerArea);
	  		   		 
			   		$("#adoptArea").val( $("#adoptArea").val()+location+"#");
			   			
		    	    var localat = parseFloat(  location.toString().substring( location.toString().indexOf("(")+1 ,location.toString().indexOf(",") )  );
				 	var localng = parseFloat(  location.toString().substring( location.toString().indexOf(",")+1, location.toString().indexOf(")") )  );
		    	    $.ajax({ url:'https://maps.googleapis.com/maps/api/geocode/json?latlng='+localat+","+localng+'&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&sensor=true',
		    	         success: function(data){
		    	           			markTest = data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length)+"  ";
		    	          			$("#areaKr").val($("#areaKr").val()+markTest);
		    	         }
		    	 	});

	  	        }else{
// 	  	        	alert("3개까지 지정 가능함 dialog 추가");
	  	        }
	    		 

	  	        if (markerArea != undefined){
	  	        	
	  	        	markerArea.addListener('rightclick', function() {
	  	        		
	  					for (var i = 0; i < markersArea.length; i++) {
	  				      	if (markersArea[i] === markerArea) {
			  				   markersArea[i].setMap(null);
			  				   markersArea.splice(i, 1);
	  				       	}
	  					}
	  					
	  					markTest="";
	  					mmm="";
	  					for (var i = 0; i < markersArea.length; i++) {
	  						
	  						mmm += markersArea[i].position+"#";
	  						var localat = parseFloat(  markersArea[i].position.toString().substring( markersArea[i].position.toString().indexOf("(")+1, markersArea[i].position.toString().indexOf(",") )  );
	  				 	    var localng = parseFloat(  markersArea[i].position.toString().substring( markersArea[i].position.toString().indexOf(",")+1, markersArea[i].position.toString().indexOf(")") )  );
	  				 		
	  		    	        $.ajax({ url:'https://maps.googleapis.com/maps/api/geocode/json?latlng='+localat+","+localng+'&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&sensor=true',
	  		    	            success: function(data){
// 	  		   	               		alert(JSON.stringify(data));
	  		    	              	markTest += data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length)+"  ";
	  		    	       			$("#areaKr").val(markTest);
	  		    	            }
	  		    	 		});
	  					}
	  					$("#areaKr").val(markTest);
	  					$("#adoptArea").val(mmm);
	  	            });
	  	        }
	  	        
//////////////////////////////////////////////////////////////////////////////////////////////////////////////    	        
		  	      	
    	  }else if( str == "loca"){
    		  
		    	if (marker != undefined){
		    		deleteMarkers();
		    	}
		    	
		        marker = new google.maps.Marker({
			        position: location,
			        map: map
		        });
		        
		        markers.push(marker);
	    		  
		        $( '#location' ).val(location);
		        loca =  $( '#location' ).val().toString();
		
		 	    var localat = parseFloat(  loca.substring( loca.indexOf("(")+1, loca.indexOf(",") )  );
		 	    var localng = parseFloat(  loca.substring( loca.indexOf(",")+1, loca.indexOf(")") )  );
		        
		        if (marker != undefined){
		           marker.addListener('rightclick', function() {
		            	deleteMarkers();
		            	$('#locationKr').val('');
		           });
		        }
		        
		        // 역지오코딩 //
		        $.ajax({ url:'https://maps.googleapis.com/maps/api/geocode/json?latlng='+localat+","+localng+'&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&sensor=true',
		            success: function(data){
// 		                $('#locationKr').val(JSON.stringify(data));
		                $('#locationKr').val(data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length));
		            }
		 		});
    	  }
      }
      

      function setMapOnAll(map) {
	        for (var i = 0; i < markers.length; i++) {
	          	markers[i].setMap(map);
	        }
      }

      function deleteMarkers() {
	    	setMapOnAll(null);
	        markers = [];
      }
      
     // ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■        ↑ map         ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
     
     
       

	  //============= "다중파일업로드 파일명만 저장해서 value" =============   
	  function fnAddFile(fileNameArray) {
	  	   $("#multiFile").val(fileNameArray)    
	  }   

	  //============= "다중파일업로드"  Event 처리 및  연결 =============      

	  //임의의 file object영역
	 var files = {};
	 var previewIndex = 0;
	 var fileNameArray = new Array();
	 
	 // image preview 기능 구현
	 // input = file object[]
	 function addPreview(input) {
	     if (input[0].files) {
	         //파일 선택이 여러개였을 시의 대응
	         for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
	
	            var file = input[0].files[fileIndex];
	            
	            if (validation(file.name))
	                 continue;
	            
	            var fileName = file.name + "";   
	            var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	            var fileNameExtension = fileName.toLowerCase().substring(fileNameExtensionIndex, fileName.length); 
	            var imgSelectName = "img";
	
	            var reader = new FileReader();
	            reader.onload = function(img) {
	                 //div id="preview" 내에 동적코드추가.
	                 //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
	                 
	                 var imgNum = previewIndex++;
	                 
	                //8장 이상 업로드시
	                 if(Object.keys(files).length>=5){
	            		alert("이미지는 5장까지 업로드 가능합니다.");
	                    delete files[imgNum];
	                 }else{
	          		 // 8장 이하 
	                	$("#preview").append(
	                                 "<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px' >"
	                                         + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"120px;\" height=\"120px;\"/><br\/>"
	                                         + "<a href=\"#\" value=\""
	                                         + imgNum
	                                         + "\" onclick=\"deletePreview(this)\">"
                                             + "삭제" + "</a>" + "</div> ");
	
		                 files[imgNum] = file;
		                 fileNameArray[imgNum]=file.name;
		                 fnAddFile(fileNameArray);
	                 }
	                
	                if( imgNum == 0){
	                	var b64 = img.target.result;
	                	
	                	b64 = b64.replace('data:image/jpeg;base64,', ''); // remove content type
                        request = {
                          "requests":[
                            {
                              "image":{ "content": b64 },
                              "features":[
                                {
                                  // if you want to detect more faces, or detect something else, change this
                                  "type":"WEB_DETECTION",
                                  "maxResults":1
                                }
                              ]
                            }
                          ]
                        };
                        
                        $.ajax({
                          method: 'POST',
                          url: 'https://vision.googleapis.com/v1/images:annotate?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0',
                          contentType: 'application/json',
                          data: JSON.stringify(request),
                          processData: false,
                          success: function(data){
//                           	console.log("모두 확인 : "+JSON.stringify(data));
                          	
                          	var test = data.responses[0].webDetection.bestGuessLabels[0];
                          	var breed = test.label;
                          	console.log("견종 확인 : "+breed);
//                             var faceData = data.responses[0].faceAnnotations[0];
//                             console.log('joy: ' + faceData.joyLikelihood);
//                             console.log('sorrow: ' + faceData.sorrowLikelihood);
//                             console.log('anger: ' + faceData.angerLikelihood);
//                             console.log('surprise: ' + faceData.surpriseLikelihood);
//                        		$( "#dogBreed" ).val(breed);
                       		fncBreed( breed );
//                        		$( "#test" ).html(test.label.replace(/ /gi, "") );
                          },
                          error: function (data, textStatus, errorThrown) {
                            console.log('비전 error: ' + JSON.stringify(data));
                          }
                        })
	                	
	                }
	             };
	
	             reader.readAsDataURL(file);
	         }
	     } else
	         alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	 }
	 

	 

	 //============= preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제 =============
	 function deletePreview(obj) {
	     var imgNum = obj.attributes['value'].value;
	     delete files[imgNum];
	     fileNameArray.splice(imgNum,1);
	     fnAddFile(fileNameArray);
	     $("#preview .preview-box[value=" + imgNum + "]").remove();
	     resizeHeight();
	 }

	 //============= 파일 확장자 validation 체크 =============
	 function validation(fileName) {
	     fileName = fileName + "";
	     var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	     var fileNameExtension = fileName.toLowerCase().substring(
	             fileNameExtensionIndex, fileName.length);
	     if (!((fileNameExtension === 'jpg')|| (fileNameExtension === 'gif') || (fileNameExtension === 'png') || (fileNameExtension === 'jpeg') )) {
	         alert('jpg, gif, png, jpeg 확장자만 업로드 가능합니다.');
	         return true;
	     } else {
	         return false;
	     }
	 }
	 

	$(document).ready(function() {
	      //============= 사진미리보기 =============
		$('#attach input[type=file]').change(function() {
			addPreview($(this)); //preview form 추가하기
		});
	});
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   ↑ 파일업로드      ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■


	function fncBreed(breed) {
		if ( breed.toLowerCase().indexOf( 'bichon' ) != -1 ) {
			breed = '비숑';
		}else if ( breed.toLowerCase().indexOf( 'pomeranian' ) != -1 || breed.toLowerCase().indexOf( '포메' ) != -1 ) {
			breed = '포메라니안';
		}else if ( breed.toLowerCase().indexOf( 'bull' ) != -1 ) {
			breed = '불독';
		}else if ( breed.toLowerCase().indexOf( 'chihuahua' ) != -1 ) {
			breed = '치와와';
		}else if ( breed.toLowerCase().indexOf( 'maltese' ) != -1 ) {
			breed = '말티즈';
		}else if ( breed.toLowerCase().indexOf( 'poodle' ) != -1 ) {
			breed = '푸들';
		}else if ( breed.toLowerCase().indexOf( 'retriever' ) != -1 ) {
			breed = '리트리버';
		}else if ( breed.toLowerCase().indexOf( 'jindo' ) != -1 ) {
			breed = '진돗개';
		}else if ( breed.toLowerCase().indexOf( 'welsh' ) != -1 ) {
			breed = '웰시코기';
		}else if ( breed.toLowerCase().indexOf( 'chow' ) != -1 || breed.toLowerCase().indexOf( '차우' ) != -1 ) {
			breed = '차우차우';
		}else if ( breed.toLowerCase().indexOf( 'dobermann' ) != -1 ) {
			breed = '도베르만';
		}else if ( breed.toLowerCase().indexOf( 'spaniel' ) != -1 ) {
			breed = '스파니엘';
		}else if ( breed.toLowerCase().indexOf( 'spitz' ) != -1 ) {
			breed = '스피츠';
		}else if ( breed.toLowerCase().indexOf( 'doodle' ) != -1 ) {
			breed = '골든두들';
		}else if ( breed.toLowerCase().indexOf( 'husky' ) != -1 ) {
			breed = '허스키';
		}else if ( breed.toLowerCase().indexOf( 'shih' ) != -1 ) {
			breed = '시츄';
		}else{
			breed = '알 수 없음';
		}

	    $( "#dogBreed" ).val(breed);
	 }
	
	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■      ↑ 견종번역      ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	$( 'input[name=termsAll]').on('click', function(){
	    if (  $("input[name=termsAll]:checkbox").prop("checked")  ) {
		    $("input[name=terms]:checkbox").prop("checked", "checked");
		}else{
		    $("input[name=terms]:checkbox").prop('checked', false);
		}
	});
	
	$( "input[name=terms]:checkbox" ).on('click', function(){
		if($("input[name=terms]:checkbox:checked").length == 2){
			$("input[name=termsAll]:checkbox").prop("checked", "checked");
		}else{
			$("input[name=termsAll]:checkbox").prop("checked", false);
		}
	});
	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■     ↑      check box        ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■



	var boardCode = $( 'input[name=boardCode]' ).val().trim();
	
	$( function() {
	    $( "#dialog-terms, #dialog-postTitle, #dialog-postTitleLength, #dialog-phone, #dialog-img, #dialog-dogBreedLength, #dialog-dogWeight, #dialog-dogWeightLength" ).dialog({
	    	autoOpen: false,
		      width: 350,
		      height: 150,
		      modal: true
	    });
	});
	
	$( function() {
	    $( "#dialog-dogPay, #dialog-dogPayLength, #dialog-dogDate, #dialog-dogStatus, #dialog-dogStatusLength, #dialog-dogPersonality, #dialog-dogPersonalityLength" ).dialog({
	    	autoOpen: false,
		      width: 350,
		      height: 150,
		      modal: true
	    });
	});
	
	$( function() {
	    $( "#dialog-dogChar, #dialog-dogCharLength, #dialog-area, #dialog-location, #dialog-postContent, #dialog-postContentLength" ).dialog({
	    	autoOpen: false,
		      width: 350,
		      height: 150,
		      modal: true
	    });
	});
	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■     ↑  dialog      ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■	

	$( "input[name=postTitle]" ).keyup(function( ) {
		if($("input[name=postTitle]").val().length > 10 ){
			$("span[name=postTitle]").text('10자까지 입력할 수 있습니다.');
		}else{
			$("span[name=postTitle]").text('');
		}
	});
	
	$( "input[name=phone2], input[name=phone3]" ).keyup(function( ) {
		$( '#phone' ).val( $('#phone1').val()+'-'+$('#phone2').val()+'-'+$('#phone3').val() );
		
		if($("input[name=phone]").val().length > 13 ){
			$("span[name=phone]").text('연락처를 정확히 입력하세요.');
		}else{
			$("span[name=phone]").text('');
		}
	});

	$( "input[name=dogBreed]" ).keyup(function( ) {
		if($("input[name=dogBreed]").val().length > 10 ){
			$("span[name=dogBreed]").text('10자까지 입력할 수 있습니다.');
		}else{
			$("span[name=dogBreed]").text('');
		}
	});

	$( "input[name=dogWeight]" ).keyup(function( ) {
		if($("input[name=dogWeight]").val().length > 6 ){
			$("span[name=dogWeight]").text('6자까지 입력할 수 있습니다.');
		}else{
			$("span[name=dogWeight]").text('');
		}
	});

	$( "input[name=dogPay]" ).keyup(function( ) {
		if($("input[name=dogPay]").val().length > 6 ){
			$("span[name=dogPay]").text('100만원 이상은 입력하실 수 없습니다.');
// 			$("span[name=dogDate]").text("  ");
		}else{
			$("span[name=dogPay]").text('');
// 			$("span[name=dogDate]").text('');
		}
	});
	
	$( "input[name=dogStatus]" ).keyup(function( ) {
		if($("input[name=dogStatus]").val().length > 20 ){
			$("span[name=dogStatus]").text('20자까지 입력할 수 있습니다.');
		}else{
			$("span[name=dogStatus]").text('');
		}
	});
	
	$( "input[name=dogPersonality]" ).keyup(function( ) {
		if($("input[name=dogPersonality]").val().length > 20 ){
			$("span[name=dogPersonality]").text('20자까지 입력할 수 있습니다.');
		}else{
			$("span[name=dogPersonality]").text('');
		}
	});

	$( "input[name=dogChar]" ).keyup(function( ) {
		if($("input[name=dogChar]").val().length > 20 ){
			$("span[name=dogChar]").text('20자까지 입력할 수 있습니다.');
		}else{
			$("span[name=dogChar]").text('');
		}
	});
	
	$( "textarea[name=postContent]" ).keyup(function( ) {
		if($("textarea[name=postContent]").val().length > 100 ){
			$("span[name=postContent]").text('100자까지 입력할 수 있습니다.');
		}else{
			$("span[name=postContent]").text('');
		}
	});

	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■      ↑  글자수체크           ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	// 등록버튼 누르고
	function fncAddAdopt(){
		
		  $( '#phone' ).val( $('#phone1').val()+'-'+$('#phone2').val()+'-'+$('#phone3').val() );
		
		  if( $("input:checkbox:checked").length != 3){
			  $('#dialog-terms').dialog( "open" );
			  return;
		  }
		  if( $("input[name=postTitle]").val() == ''){
			  $('#dialog-postTitle').dialog( "open" );
			  return;
		  }
		  if( $("input[name=postTitle]").val().length >10){
			  $('#dialog-postTitleLength').dialog( "open" );
			  return;
		  }
		  if( $("input[name=phone]").val().length > 13 || $("input[name=phone]").val().length < 12 ){
			  $('#dialog-phone').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogBreed]").val().length >10){
			  $('#dialog-dogBreedLength').dialog( "open" );
			  return;
		  }
		  if( $(".preview-box").length == 0 ){
			  $('#dialog-img').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogWeight]").val() == ''){
			  $('#dialog-dogWeight').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogWeight]").val().length > 6){
			  $('#dialog-dogWeightLength').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogPay]").val() == ''){
			  $('#dialog-dogPay').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogPay]").val().length > 6){
			  $('#dialog-dogPayLength').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogDate]").val() == ''){
			  $('#dialog-dogDate').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogStatus]").val() == ''){
			  $('#dialog-dogStatus').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogStatus]").val().length > 20 ){
			  $('#dialog-dogStatusLength').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogPersonality]").val() == ''){
			  $('#dialog-dogPersonality').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogPersonality]").val().length > 20 ){
			  $('#dialog-dogPersonalityLength').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogChar]").val() == ''){
			  $('#dialog-dogChar').dialog( "open" );
			  return;
		  }
		  if( $("input[name=dogChar]").val().length > 20 ){
			  $('#dialog-dogCharLength').dialog( "open" );
			  return;
		  }
		  if( boardCode == 'AD' ){
			  if( $("input[name=adoptArea]").val() == ''){
				  $('#dialog-area').dialog( "open" );
				  return;
			  }
		  }
		  if( $("input[name=location]").val() == ''){
			  $('#dialog-location').dialog( "open" );
			  return;
		  }
		  if( $("textarea[name=postContent]").val() == ''){
			  $('#dialog-postContent').dialog( "open" );
			  return;
		  }
		  if( $("textarea[name=postContent]").val().length > 100 ){
			  $('#dialog-postContentLength').dialog( "open" );
			  return;
		  }
		
		  
	    //============= 다중파일업로드 AJAX =============
	    	
	   	  var file = $("#multiFile").val(); 
		
	      $(function() {     
		        var form = $('#uploadForm')[0];
		        var formData = new FormData(form);
// 		        alert(boardCode);
		
		        for (var index = 0; index < 100; index++) {
		            formData.append('files',files[index]);
		        }
	            
	            $.ajax({
		            type : 'POST',
		            enctype : 'multipart/form-data',
		            processData : false,
		            contentType : false,
		            cache : false,
		            timeout : 600000,
		            url : '/Images/json/imageupload/'+boardCode,
		            dataType : 'JSON',
		            data : formData,
		            success : function(result) {
			                if (result === -1) {
			                    alert('jpg, gif, png, jpeg 확장자만 업로드 가능합니다.');
			                    // 이후 동작 ...
			                } else if (result === -2) {
			                    alert('파일이 10MB를 초과하였습니다.');
			                    // 이후 동작 ...
			                } else {
			                    alert('이미지 업로드 성공');
			                }
		            },
					error: function(request, status, error){ 
						alert("이미지 code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
			        }
		        });
	  	  });


		
		
		$("form").attr("method" , "POST").attr("action" , "/adopt/addAdopt").attr("enctype","multipart/form-data").submit();
		
	}
	
	
    
    
    $(function() {
			$( "button:contains('등록')" ).on("click" , function() {
				fncAddAdopt();
			});
			
			$( "a:contains('취소')" ).on("click" , function() {
				self.location = "/adopt/listAdopt?boardCode=${param.boardCode}"
			});
	 });	
      
      
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"
    async defer></script>
  
  
  
  
  </body>
</html>