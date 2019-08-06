<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>보호할개 · 분양</title>
	<meta charset="utf-8">
	
	<meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
    
    	.row {
/* 			transform: rotate(0.03deg); */
		}
    
	    #carouselExampleIndicators{
        	max-height: 450px;
	    }
	    
       	img {
        	max-height: 450px;
        }
        
        #mapDiv{
        	padding: 0px;
        }
        .offset-lg-1{
        	position: relative;
        	height: 450px;
        	display: flex;
        	padding-left: 30px !important;
         	padding-right: 0px !important;
        }
        .card_area{
        	position: absolute;
        	left: 0px;
        	bottom: 0px !important;
        	width: wrap !important;
        	padding-right: 0px !important;
        }
        p {
        	margin-bottom: 0px !important;
        }
        #appendTr>td{
        	align: letf;
        	word-break: break-all;	
        }
        
        @media screen and (min-width: 768px) { 
	        .modal:before {
	                display: inline-block;
	                content: " ";
	        }
		}
		
        .modal{
      	  display: inline-block;
        	vertical-align: middle;
        }
		
		.col-md-4, .col-md-8 {
			padding-right: 0px !important;
		}
 		
		.col-md-10 {
			padding-right: 15px !important;
		}
 		
        .fa-heart {
         	color: #f04f23;
          	padding-top: 10px !important; 
        }
         
        ol.carousel-indicators {
         	width: 70% !important;
        }
        
        .s_product_inner {
        	padding-right: 0px !important;
        }
        .s_product_text {
         	flex: 1;
        }
         
         #face{
/*          	display: none; */
         }
         .ui-dialog-buttonset button {
         	min-height: 40px;
         	max-height: 40px;
         	margin-top: 0px !important;
         	margin-bottom: 0px !important;
         	border-radius: 5px;
          	padding-top: 5px  !important; 
          	padding-bottom: 5px  !important; 
         }

		.fc-title{
			width: wrap !important;
			white-space:nowrap;
			display:block;
		/* 	white-space: pre-line; */
			font-weight: 1000 !important;
			font-size: 12px !important;
			text-overflow: ellipsis !important;
		/* 	word-wrap: break-word; */
		/* 	display: block; */
		}
        

    </style>
    
  <jsp:include page="/layout/toolbar.jsp"></jsp:include>
  <jsp:include page="/common/modal/modalReport.jsp"></jsp:include>
	<jsp:include page="/common/modal/modalMessage.jsp"></jsp:include>
  </head>
  
  <body>
    
    
    <div class="product_image_area">
      <div class="container">
      <div class="col-md-12" style="padding-bottom: 10px;"><hr/><br/>작성일 ${adopt.regDate }</div>
        <div class="row s_product_inner col-md-12">
        
          <div class="col-lg-6">
<!--             <div class="s_product_img"> -->
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
		                      class="d-block w-100" style="width:100%;background:url('../resources/file/fileAdopt/${name.fileName}') no-repeat center center;background-size:cover; " 
		                      height="450px;" />
	                  	</div>			
	                </c:forEach>
                </div>
                
              </div>
<!--             </div> -->
          </div>
          <div class="col-lg-6 offset-lg-1" >
            <div class="s_product_text">
            
<%--              <span style="text-align: justify;"> <font size="5px">${adopt.postTitle}</font> &nbsp;&nbsp;${adopt.id}&nbsp;&nbsp; ${ adopt.regDate }</span><hr/> --%>
              
              
<!--               <ul class="list" > -->
              	
              	<input type="hidden" name="postNo" value="${adopt.postNo}">
              	<input type="hidden" name="id" value="${adopt.id}">
              	<input type="hidden" name="userId" value="${user.id}">
              	<input type="hidden" name="levels" value="${user.levels}">
              	<input type="hidden" name="sessionNickname" value="${user.nickname}">  
              	<input type="hidden" name="nickname" value="${adopt.nickname}">  
<!--                 <li> -->
                   	<div class="row" style="position:relative;height:35px;">
			        	<div class="col-xs-9 col-md-9" style="height:35px; left:0px; bottom:0px;" >
			        		<font id="title" size="5px"><strong>${adopt.postTitle}</strong></font>
			        	&nbsp;&nbsp;${adopt.nickname}
			        	</div>
			        	
			        	<c:if test="${ user.id ne adopt.id }">
			        	
			        	
			        		<div class="col-xs-2 col-md-2" style="height:35px;  right:0px; bottom:0px;padding-left: 0;padding-right: 0;" >
								<p align="right" style="padding-top: 10px;">
								<img src="/resources/file/others/siren.png"  id ="report"  width="22px" height="22px" >
								</p>
							</div>
				        	<div class="col-xs-1 col-md-1" style="height:35px; right:0px; bottom:0px;padding-right:15px;padding-left: 0;" >
								<p align="right">
								<font size="5px" id="heartIcon">
									<c:if test="${ check eq 'already' && sessionScope.user.role ne 'admin'}">
										<span class="fas fa-heart"></span>
									</c:if>
									<c:if test="${ check ne 'already' && sessionScope.user.role ne 'admin' }">
										<span class="far fa-heart"></span>
									</c:if>
								</font></p>
				        	</div>
				        	
				        	
			        	</c:if>

			        </div>
<!--                 </li> -->
                
                <hr/>
              	
<!--                 <li> -->
<!--                    	<div class="row"> -->
<!-- 				  		<div class="col-md-2 " ><font size="4px"><strong>작성자</strong></font></div> -->
<%-- 						<div class="col-md-4 "><font size="4px">${adopt.nickname}</font></div> --%>
						
<!-- 						<div class="col-md-2 " style="padding-left: 0px;"><font size="4px"><strong>작성일자</strong></font></div> -->
<%-- 						<div class="col-md-4 "><font size="4px">${adopt.regDate}</font></div> --%>
<!-- 					</div> -->
                   	<div class="row">
				  		<div class="col-md-2 " ><font size="4px"><strong>견종</strong></font></div>
						<div class="col-md-4 "><font size="4px">${adopt.dogBreed}</font></div>
						
						<div class="col-md-2 " style="padding-left: 0px;padding-right: 0px;"><font size="4px"><strong>크기</strong></font></div>
						<div class="col-md-4 " style="padding-left: 0px;"><font size="4px">${adopt.dogSize}</font></div>
					</div>
<!--                 </li> -->
                
<!--                 <li> -->
                   	<div class="row">
				  		<div class="col-md-2 "><font size="4px"><strong>체중</strong></font></div>
						<div class="col-md-4 "><font size="4px">${adopt.dogWeight}kg</font></div>
			
				  		<div class="col-md-2 " style="padding-left: 0px;padding-right: 0px;"><font size="4px"><strong>성별</strong></font></div>
						<div class="col-md-4 " style="padding-left: 0px;" ><font size="4px">${adopt.dogGender}</font></div>
					</div>
<!--                 </li> -->
                
<!--                 <li> -->
                   	<div class="row">
				  		<div class="col-md-2 "><font size="4px"><strong>책임비</font></strong></div>
						<div class="col-md-4 "><font size="4px"><fmt:formatNumber value="${ adopt.dogPay }" pattern="#,###" />원</font></div>
			
				  		<div class="col-md-2 " style="padding-left: 0px;padding-right: 0px;"><font size="4px"><strong>발견일</font></strong></div>
						<div class="col-md-4" style="padding-left: 0px;"><font size="4px">${adopt.dogDate}</font></div>
					</div>

                	<div class="row">
				  		<div class="col-md-2  "><font size="4px"><strong>상태</strong></font></div>
						<div class="col-md-10 "><font size="4px">${adopt.dogStatus}</font></div>
					</div>

                	<div class="row">
				  		<div class="col-md-2  "><font size="4px"><strong>성격</strong></font></div>
						<div class="col-md-10 "><font size="4px">${adopt.dogPersonality}</font></div>
					</div>
					
                	<div class="row">
				  		<div class="col-md-2  "><font size="4px"><strong>특징</strong></font></div>
						<div class="col-md-10 "><font size="4px">${adopt.dogChar}</font></div>
					</div>
         
	               	<div class="row">
				  		<div class="col-md-2  "><font size="4px"><strong>글내용</strong></font></div>
						<div class="col-md-10 " style="padding-right: 0px;" ><font size="4px">${adopt.postContent}</font></div>
					</div>
					
             
    <!-- 글내용 밑에 버튼  --> 
             <div class="row" style="flex: 1;bottom: 0px;position: absolute;" >
              <div class="col-md-12 card_area">

				<!-- 분양 메뉴일때  -->
              	
           		<c:if test="${adopt.statusCode ne '3' && user.id ne adopt.id }">
           			<button id="adoptApply" class="btn btn-default" style="width: 255px">입양신청</button>
           		</c:if>
           		
           		<c:if test="${adopt.statusCode eq '2' && user.id eq adopt.id }">
           			<button class="btn btn-default" style="width: 255px" id="confirmButton" data-toggle="modal" data-target="#applyModal">신청서확인</button>
           			<button class="btn btn-default" style="width: 255px" id="adoptCompleteButton">분양완료</button>
           		</c:if>
           		
           		<c:if test="${adopt.statusCode eq '1' && user.id eq adopt.id }">
           			<button class="btn btn-default" id="noApply" style="width: 517px;" id="confirmButton">아직 신청서가 등록되지 않았습니다.</button>
           		</c:if>

             	
				<!-- 공통  -->
              	<c:if test="${adopt.statusCode ne '3' &&  user.id ne adopt.id   }">
               		<button class="btn btn-default" style="width: 255px" id="messageRq">문의하기</button>
<!--                		<button class="btn btn-default" style="width: 255px" data-toggle="modal" data-target="#messageModal">문의하기</button> -->
<!--                		<a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a> -->
               	</c:if>
               	
              	<c:if test="${adopt.statusCode eq '3'}">
               		<button class="btn btn-default" id="noApply" style="width: 517px;" id="confirmButton">완료된 글입니다.</button>
               	</c:if>
              	
              </div>
              <div class="col-md-12" style="padding-top: 10px;">
	              <div align="right">
			            <a href="javascript:void(0);" id="twitter"  title="트위터로 공유"><img src="/resources/file/others/twitter.png" height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
			            <a href="javascript:void(0);" id="facebook" title="페이스북으로 공유"><img src="/resources/file/others/facebook.png" height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
			            <a href="javascript:void(0);" id="kakao" title="카카오톡으로 공유"> <img src="/resources/file/others/kakao.png" height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
			      </div>
		      </div>
 			</div>
 			
 			
 			
 			
<!--               </ul> -->
              
            </div>
           
            
          </div>
        </div>
        
        
        <div class="col-md-12 "><br/><hr/><br/></div>
        
        
        
        <div id="mapDiv"  class="col-md-12 " style="padding-left: 15px;padding-right: 15px;">
        
        	<c:if test="${adopt.boardCode eq 'AD' }">
				<font size="4px"><strong>분양가능지역</strong></font><br/>
		  		<div id="mapArea" style="width:wrap; height: 300px;"  align="center"></div>
		  		<input type="hidden" class="form-control" id="areaKr" name="areaKr" value="${adopt.areaKr}">
<%-- 				<div><font size="4px" id="areaKr">${adopt.areaKr }</font></div><br/> --%>
			</c:if>
			<br/>
	  		<font size="4px"><strong>발견위치</strong></font><br/>
	  		<div id="map" style="width: wrap; height: 300px;"  align="center"></div>
	  		<input type="hidden" class="form-control" id="location" name="location" value="${adopt.location}">
	  		<input type="hidden" class="form-control" id="locaKr" name="locaKr" value="${adopt.locationKr}">
<%-- 			<div><font size="4px" id="locaKr">${adopt.locationKr }</font></div> --%>
			<br/><br/><br/>
        
        </div>

		
		
		
        <div class="col-md-12"><hr/></div>
        
        <p align="right" style="padding-right: 15px;">
       		<c:if test="${ adopt.statusCode eq '1' && sessionScope.user.id eq adopt.id }">
				<button class="btn btn-default" id="modiButton">수정</button>
	       		<button class="btn btn-default" id="delButton">삭제</button>
			</c:if>
       		<c:if test="${ adopt.statusCode eq '1' && sessionScope.user.role eq 'admin'}">
	       		<button class="btn btn-default" id="delButton">삭제</button>
			</c:if>
			
	        <button class="btn btn-default" id="listButton">목록</button>
        </p>
        
       
        
        
      </div>
    </div>
   <br><br><br/>
    <!--================End Single Product Area =================-->
    
    <!-- 	/////////////////////////////////////////       dialog       ///////////////////////////////////////////////////////////////////// -->
  
			
<!-- 			<div id="dialog-listApply" title=""> -->
<!-- <!-- 			  <p id="listJSON"></p> --> -->
<!-- 			</div>  -->
			
			
			
			
	<div id="applyModal" class="modal modal-top fade calendar-modal" >

	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	    <div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 30px;">
	      <div class="container">
	        <div class="row no-gutters slider-text align-items-center justify-content-center">
	          <div class="col-md-9 ftco-animate text-center">
	          	<p ><span class="mr-2">List</span> <span>Apply</span></p>
	            <font size="7">
	            	신청서 확인
	            </font>
	          </div>
	        </div>
	      </div>
	    </div>

        <div class="modal-body" id="listApplyModal" style="overflow-y:auto;overflow-x:hidden;"></div>
        
        <div class="modal-footer">
<!--           <button type="button" class="btn btn-default" ></button> -->
          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>        
        </div>
        
    </div>
  </div>
</div>
			
			
	
	<jsp:include page="/layout/footer.jsp"></jsp:include>
  
    <!--================End Product Description Area =================-->

    <!--================ start footer Area  =================-->
    
    <!--================ End footer Area  =================-->
    

    
    <!-- KAKAO -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
    
<!--     <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!--     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> -->
<!--     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
    <script>
      $(document).ready(function() { 
    	  listApply('load');
      });
	  
      var map;
      var markers = [];
      var loca = "${adopt.location}";
      var localat = parseFloat(  loca.substring( loca.indexOf("(")+1 ,loca.indexOf(",") )  );
      var localng = parseFloat(  loca.substring( loca.indexOf(",")+1, loca.indexOf(")") )  );
      var marker;
      
      var mapArea;
      var markerArea;
      var adArea = "${adopt.adoptArea}";
      var arrayTest = [];
      var arrayMark = [];
      
      var infowindowLoca;
      var infowindowArea1;
      var infowindowArea2;
      var infowindowArea3;
      var infowindowArea = [];
      
      var locaKr = $('#locaKr').val().trim();
      var areaKr = $('#areaKr').val().trim();
      
      var id = $('input[name=userId]').val().trim();
      
      if (adArea.indexOf("#") != -1){
    	  var areaArray = adArea.split("#");
    	  
    	  for ( i=0; i<areaArray.length-1; i++){
    		  arrayTest[i] = areaArray[i].substring( areaArray[i].indexOf("(")+1, areaArray[i].indexOf(",") )+","+ (areaArray[i].substring( areaArray[i].indexOf(",")+1, areaArray[i].indexOf(")") )).trim() ;
    		  arrayMark[i] = "markerArea"+i.toString();
    	  }   	  
      }
      
      
      
      function initMap() {
        var centerLoca = {lat: localat, lng: localng};

        map = new google.maps.Map(document.getElementById('map'), {
        	zoom: 15,
        	center: {lat: localat, lng: localng}
        });
        
        marker = new google.maps.Marker({
            position: {lat: localat, lng: localng},
            map: map
        });
        
        infowindowLoca = new google.maps.InfoWindow();
    	// pop up
        infowindowLoca.setContent(locaKr);
        infowindowLoca.open(map, marker);
         
        
 ////////////////////////////////////////////
 
	    mapArea = new google.maps.Map(document.getElementById('mapArea'), {
			    zoom: 12,
			    center: { lat: parseFloat(arrayTest[0].substring( 0, arrayTest[0].indexOf(",") ))  ,
			    		lng: parseFloat(arrayTest[0].substring( arrayTest[0].indexOf(",")+1, arrayTest[0].length )) }
		});
	    
	    var aaa = "";
	    infowindowArea1 = new google.maps.InfoWindow();
	    infowindowArea2 = new google.maps.InfoWindow();
	    infowindowArea3 = new google.maps.InfoWindow();
	    infowindowArea.push(infowindowArea1);
	    infowindowArea.push(infowindowArea2);
	    infowindowArea.push(infowindowArea3);
	    
	    for ( i=0; i<arrayTest.length; i++){
	    	
		    markerArea= arrayMark[i];
		
		    markerArea = new google.maps.Marker({
		        position: { lat: parseFloat(arrayTest[i].substring( 0, arrayTest[i].indexOf(",") ))  ,
		    			lng: parseFloat(arrayTest[i].substring( arrayTest[i].indexOf(",")+1, arrayTest[i].length )) },
		        map: mapArea
		    });
		    
		    if (  arrayTest.length == 1   ){
		    	infowindowArea1.setContent(areaKr);
	    		infowindowArea1.open(mapArea, markerArea);
		    } else {
	    		infowindowArea[i].setContent(areaKr.split(",")[i]);
	    		infowindowArea[i].open(mapArea, markerArea);
		    }
		 
	    }
		
  
	    
      }
      
      //////////////////////////////////////////////////////////////////////////////////////////////////////
      
      function fncComplete() {			
			var postNo = ${adopt.postNo};
			var aText;

// 			alert(typeof postNo);

			$.ajax( 
			 		{
						url : "/adopt/json/updateStatusCode/"+postNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								  },
						success : function(status) {
							$('#confirmButton, #modiButton, #delButton, #adoptCompleteButton, #missingCompleteButton').remove();
							$('.card_area').html('<button class="btn btn-default" id="noApply" style="width: 532px;" id="confirmButton">완료된 글입니다.</button>');
						},
						error: function(request, status, error){ 
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
				        }
			});
	 };

	 //////////////////////////////////////////////////////////////////////////////////////////////////////      
     var boardCode = "${adopt.boardCode}";
	 var postNo =  $('input[name=postNo]').val() ;
     var id = $('input[name=userId]').val();
	 
	 
	//관심목록에 추가
	 function addInterest(){
	 		console.log(boardCode+","+postNo+","+id);
	  
	  		if ( id == "" ){
	  			$("#login-modal").modal('show'); 
// 	  			swal({
// 			           text: "회원만 이용할 수 있는 기능입니다.",
// 			           dangerMode: true,
// 			           buttons: {
// 								 cancel: "닫기",
// 					   }
// 	  			});
	  			
// 		              swal({
// 		                   title: "회원만 이용할 수 있는 기능입니다.",
// // 		                   text: "인증하기를 누르면 인증페이지로 이동합니다.",
// 		                   icon: "warning",
// 		                   buttons: ["닫기", "로그인"],
// 		                   dangerMode: true     
// 		                 })
// 		               .then((willDelete) => {
// 		                   if (willDelete) {
// // 		                        self.location = "/users/addUsersAddition.jsp"
// 		                        }
// 		      		  });
	  			
	  			return;
	  			
	  		}else{
	  			
	  			$.ajax( 
	  			 		{
	  						url : "/interest/json/addInterest/"+boardCode+"/"+postNo+"/"+id,
	  						method : "GET" ,
	  						dataType : "json" ,
	  						headers : {
	  									"Accept" : "application/json",
	  									"Content-Type" : "application/json"
	  								  },
	  						success : function(data , status) {
// 	  								console.log(JSON.stringify(data));
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
  						url : "/interest/json/delInterest/"+boardCode+"/"+postNo+"/"+id,
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
  
  
  
  // ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
	 
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

     
      
//       $( function() {
//   	    $( "#dialog-listApply" ).dialog({
//   	    	  autoOpen: false,
//   		      width: 500,
//   		      height: 600,
//   		      modal: true,
//   		      buttons: {
// //   		        	예: function() {
// //   		        		fncComplete();
// //   		        	},
//   		        	닫기: function() {
//   		          		$( this ).dialog( "close" );
//   		        	}
//   		      }
//   	    });
//       });
      
      
      
  //////////////////////////////////////////////////////////////////////////////////////////////////////
	var str = '';
  
    function listApply(str){
    	var lv = $('input[name=levels]').val();
    	console.log("lv 확인 : "+lv);
		var adoptNo = parseInt(  $('input[name=postNo]').val().trim()  );
		
  		$.ajax( 
		 		{
					url : "/apply/json/listApply/"+adoptNo ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							  },
					success : function(data , status) {
// 							console.log(JSON.stringify(data));
// 							alert( data.list.length );
							
							var displayValue = '<table class="table table-hover" >'
										        +'<thead>'
										        	+'<tr>'
											            +'<th style="width: 15%"><p align="center" text-weight="bold"><b>No</b></p></th>'
											            +'<th style="width: 55%"><p align="center"><b>신청자</b></p></th>'
											            +'<th style="width: 30%"><p align="center"><b>신청일</b></p></th>' 
									           		+'</tr>'
									            +'</thead>'
									            +'<tbody>';
					            
							for( i=0; i<data.list.length; i++ ){
		 						displayValue += 
							            		'<tr class="trApplyNo" id="'+data.list[i].applyNo+'" name="'+data.list[i].applyNo+'">'
							            			+'<input type="hidden" name="inputApplyNo" value="'+data.list[i].applyNo+'">'
								            		+'<td align="center"><p>'+(i+1)+'</p></td>'
								            		+'<td align="center"><p>'+data.list[i].nickname+"("+data.list[i].id+')</p></td>'
								            		+'<td align="center"><p>'+data.list[i].regDate+'</p></td>'
							            		+'</tr>';	
							            		
							}
							displayValue += '</tbody>'+'</table>';
							
							
							if ( str == '확인' ) {
								
								$( ".modal-body" ).html(displayValue);
// 								$( "#dialog-listApply" ).html(displayValue);
// 								$( '#dialog-listApply' ).dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
// 								$( "#dialog-listApply" ).dialog( "open" );
								
							} else if ( str == '' ){
								//로그인 안했을때
								if( lv == '미인증회원'  ){
						              swal({
						                   title: "인증회원만 신청 가능합니다.",
						                   text: "인증하기를 누르면 인증페이지로 이동합니다.",
						                   icon: "warning",
						                   buttons: ["닫기", "인증하기"],
						                   dangerMode: true     
						                 })
						               .then((willDelete) => {
						                   if (willDelete) {
						                        self.location = "/users/addUsersAddition.jsp"
						                        }
						      		  });   
								} else if ( ${sessionScope.user.role == 'admin'} ) {
									swal({
						                   text: "운영자는 신청할 수 없습니다.",
						                   icon: "warning",
						                   buttons: { cancel:"확인"},
						                   dangerMode: true     
						             });
									return;
								

								//로그인한상태+아이디가 없을때
								} else if (id == '') {
									$("#login-modal").modal('show'); 
								} else if (displayValue.indexOf(id) != -1  ) {
									swal({
								           text: "이미 신청하셨습니다.",
								           buttons: "확인",
								    });	
								
								} else {
									self.location = "/apply/addApply?postNo=${adopt.postNo}";
								}
								
								
								
							} else if ( str == 'load' && id != '' && displayValue.indexOf(id) != -1 ) {
								
								$( '#adoptApply' ).text("신청완료");
								
								
							}
							
				},
				error: function(request, status, error){ 
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
		        }
				
			});
 	}
  
  // ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  
		function getApply(applyNo){
//     		var applyNo = parseInt( $(this).children($('input')).val().trim()  );
		  	console.log(applyNo);
		  	
// 		  	var displayValue;
		  	
	  		$.ajax( 
			 		{
						url : "/apply/json/getApply/"+applyNo ,
						method : "POST" ,
						dataType : "json" ,
						headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								  },
						success : function(data , status) {
// 								console.log(JSON.stringify(data));
// 								console.log(data.raise);
								
								var mateTag = '';
								var curTag = '';
								
								if ( data.mate == '있음') {
									mateTag = '<div class="row">'
											  		+'<div class="col-md-4  "><strong>동의 여부</strong></div>'
													+'<div class="col-md-8 ">'+data.mateAgree+'</div>'
											 +'</div>';
// 										'<br\/><strong>[동의 여부]<\/strong> : '+data.mateAgree;
								}
								if ( data.raise == '있음') {
									curTag =  '<div class="row">'
											  		+'<div class="col-md-4  "><strong>현재 양육 여부</strong></div>'
													+'<div class="col-md-8 ">'+data.currently+'</div>'
											 +'</div>';
										
// 										'<br\/><strong>[현재 양육 여부]<\/strong> : '+data.currently;
								}
								
								
								var displayValue = 	 
									
									'<div class="row">'
								  		+'<div class="col-md-4  "><strong>연락처</strong></div>'
										+'<div class="col-md-8 ">'+data.phone+'</div>'
									+'</div>'
									+'<div class="row">'
								  		+'<div class="col-md-4  "><strong>직업</strong></div>'
										+'<div class="col-md-8 ">'+data.job+'</div>'
									+'</div>'
									+'<div class="row">'
								  		+'<div class="col-md-4  "><strong>거주지 유형</strong></div>'
										+'<div class="col-md-8 ">'+data.addr+'</div>'
									+'</div>'
									+'<div class="row">'
								  		+'<div class="col-md-4  "><strong>동거인 여부</strong></div>'
										+'<div class="col-md-8 ">'+data.mate+'</div>'
									+'</div>'
									+mateTag
									+'<div class="row">'
								  		+'<div class="col-md-4  "><strong>양육경험</strong></div>'
										+'<div class="col-md-8 ">'+data.raise+'</div>'
									+'</div>'
									+curTag
									+'<div class="row">'
								  		+'<div class="col-md-4  "><strong>앞으로의 계획</strong></div>'
										+'<div class="col-md-8 ">'+data.plan+'</div>'
									+'</div>'
									+'<div class="row">'
								  		+'<div class="col-md-4  "><strong>1년 예상비용</strong></div>'
										+'<div class="col-md-8 ">'+data.pay+'</div>'
									+'</div>'
									+'<div class="row">'
								  		+'<div class="col-md-4  "><strong>입양신청 이유</strong></div>'
										+'<div class="col-md-8 ">'+data.reason+'</div>'
									+'</div>'
									+'<div class="row">'
								  		+'<div class="col-md-4  "><strong>상황에 따른 대처</strong></div>'
										+'<div class="col-md-8 ">'+data.situation+'\</div>'
									+'</div>';
// 													'<p><strong>[연락처]<\/strong> : '+data.phone
// 													+'<br\/><strong>[직업]<\/strong> : '+data.job
// 													+'<br\/><strong>[거주지 유형]<\/strong> : '+data.addr
// 													+'<br\/><strong>[동거인 여부]<\/strong> : '+data.mate
// 													+mateTag
// 													+'<br\/><strong>[양육경험]<\/strong> : '+data.raise
// 													+curTag
// 													+'<br\/><strong>[앞으로의 계획]<\/strong> : '+data.plan
// 													+'<br\/><strong>[1년 예상비용]<\/strong> : '+data.pay
// 													+'<br\/><strong>[입양신청 이유]<\/strong> : '+data.reason
// 													+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+data.situation +"</p>";
								
// 								console.log("-----"+displayValue);
// 								console.log("어플라이넘버 : "+data.applyNo);
// 								console.log("에프터 확인 : "+$('#'+data.applyNo+'').html());
// 				 				$('.trApplyNo').after('<tr id="appendTr"><td colspan="3" align="left">'+displayValue+'</td></tr>');
				 				$('tr[name='+data.applyNo+']').after('<tr name="appendTr"><td colspan="3" align="left">'+displayValue+'</td></tr>');
// 				 				$('#'+data.ssapplyNo+'').after('<tr id="appendTr"><td colspan="3" align="left">'+displayValue+'</td></tr>');
// 				 				console.log("에프터 확인2 : "+$('#'+data.applyNo+'').html());
// 				 				$('#appendTr').focus();
							
					},
					error: function(request, status, error){ 
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			        }
					
				});
	 	}
	    
	    
  // ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
  
  	 
      $(function() {
//     	    $(document).on("click" ,'.trApplyNo' ,function() {
    		$( ".modal-body" ).on("click" ,'.trApplyNo' ,function() {
//     		$( "#dialog-listApply" ).on("click" ,'.trApplyNo' ,function() {
    			var applyNo = parseInt( $(this).children($('input')).val().trim()  );
//     			console.log("확인111 : "+applyNo);
//     			console.log("어펜드 tr확인: "+$('#appendTr').html());
    			$('tr[name=appendTr]').remove();

    			getApply(applyNo);
    			
//     			console.log("return 확인 : "+displayValue);
   		    });
         	
		
    	    $( "button:contains('수정')" ).on("click" , function() {
				self.location = "/adopt/updateAdopt?postNo=${adopt.postNo}"
			});
		
			$( "button:contains('삭제')" ).on("click" , function() {
				  swal({
		               text: "삭제하시겠습니까?",
		               icon: "warning",
		               buttons: ["취소", "확인"],
		               dangerMode: true,
		             })
		             .then((willDelete) => {
		               if (willDelete) {
		                 swal("삭제가 완료되었습니다!", {
		                   icon: "success",
		                   buttons: "확인",
		                 }).then((value) => {
		                	 self.location = "/adopt/updateStatusCode?postNo=${adopt.postNo}";
		                 });
		               }
		             });
				
			});
		
			$( "button:contains('입양신청')" ).on("click" , function() {
				listApply('');
// 				self.location = "/apply/addApply?postNo=${adopt.postNo}"
			});
		
			$( "button:contains('신청서확인')" ).on("click" , function() {
				listApply('확인');
// 				self.location = "/apply/listApply?adoptNo=${adopt.postNo}"
			});
		
		
			$( "#adoptCompleteButton" ).on("click" , function() {
				swal({
			           text: "분양완료 상태로 변경하시겠습니까?",
			           buttons: {
								 cancel: "취소",
								 catch: {
								 	text: "변경",
								 },
					   },
					   
			    }).then((willDelete) => {
			           if (willDelete) {
			        	    fncComplete();
			           		swal("변경되었습니다.", {
				           		icon: "success",
				           		buttons: "확인"
			           		});
			           }
			    });
			});
		
		
			$( "button:contains('목록')" ).on("click" , function() {
				self.location = "/adopt/listAdopt?boardCode=${adopt.boardCode}"
			});
			

// 			$( "button:contains('신청완료')" ).on("click" , function() {
// 				swal({
// 			           text: "이미 신청하셨습니다.",
// 			           buttons: "확인",
// 			    });
// 			});
			
			//관심목록에 추가
			$(document).on("click", ".far", function() {
				addInterest(  );
			});
			
			//관심목록에서 삭제
			$(document).on("click", ".fas", function() {
				delInterest(   );
			});
			
			$('#listApplyModal').css('max-height', $(window).height() * 0.6);
// 			$('.modal-body').css('max-height', $(window).height() * 0.6);
			
			
			//============= 신고하기 Event  처리 =============	
		 	$( "#report" ).on("click" , function() {
		 		if(${user==null}){
		 			$("#login-modal").modal('show');  
		 		}else{
			 	    var nickname = '${adopt.nickname}';
			 	   $('#reportedNick').prop('readonly', true);
			 	    $("#reportedNick").val(nickname);
			 		$("#report-modal").modal("show");
		 		}
			});
			
			//============= 문의 Event  처리 =============	
		 	$( "#messageRq" ).on("click" , function() {
		 		if(${user==null}){
		 			$("#login-modal").modal('show');  
		 		}else{
			 	    var nickname = '${adopt.nickname}';
			 	   $('#receiverNick').prop('readonly', true);
			 	    $("#receiverNick").val(nickname);
			 		$("#messageModal").modal("show");
		 		}
			});

	  });



      

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"
    async defer></script>
    

  </body>
</html>
  
    