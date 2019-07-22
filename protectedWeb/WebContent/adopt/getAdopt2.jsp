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
    
    
    
    <style>
    
	    #carouselExampleIndicators{
        	max-height: 400px;
	    }
       	img {
        	max-height: 450px;
        }
        
        #mapDiv{
/*         	padding-left: 0px; */
/*         	padding-right: 0px; */
        	padding: 0px;
        }
        .col-lg-5.offset-lg-1{
        	position: relative;
        	height: 450px;
        }
        .card_area{
        	position: absolute;
        	left: 0px;
        	bottom: 0px;
        }
/*         .lnr-heart:before { */
/* 			content: "\e813"; */
/* 		} */
        
    </style>
 
  </head>
  
  <body>
    
    <!--================Header Menu Area =================-->

    <jsp:include page="/layout/toolbar.jsp"></jsp:include>

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
                <ol class="carousel-indicators" >
                
                
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
		                      src="/resources/file/fileAdopt/${name.fileName}" height="450px;" />
	                  	</div>			
	                </c:forEach>
                </div>
                
              </div>
            </div>
          </div>
          <div class="col-lg-5 offset-lg-1">
            <div class="s_product_text">
            
              <font size="5px">${adopt.postTitle}</font> &nbsp;&nbsp;${adopt.id}&nbsp;&nbsp; ${ adopt.regDate }<hr/>
              <ul class="list">
              
                <li>
                   	<div class="row">
				  		<div class="col-md-2 " ><strong>견종</strong></div>
						<div class="col-md-3 ">${adopt.dogBreed}</div>
						
						<div class="col-md-2 "><strong>크기</strong></div>
						<div class="col-md-5 ">${adopt.dogSize}</div>
					</div>
                </li>
                
                <li>
                   	<div class="row">
				  		<div class="col-md-2 "><strong>체중</strong></div>
						<div class="col-md-3 ">${adopt.dogWeight}kg</div>
			
				  		<div class="col-md-2 "><strong>성별</strong></div>
						<div class="col-md-5 ">${adopt.dogGender}</div>
					</div>
                </li>
                
                <li>
                   	<div class="row">
				  		<div class="col-md-2 "><strong>
					  		<c:if test="${adopt.boardCode eq 'AD' }">책임비</c:if>
						    <c:if test="${adopt.boardCode eq 'MS' }">사례비</c:if>
				  		</strong></div>
						<div class="col-md-3 "><fmt:formatNumber value="${ adopt.dogPay }" pattern="#,###" />원</div>
			
				  		<div class="col-md-2 " style="padding-right: 0px;"><strong>
				  			<c:if test="${adopt.boardCode eq 'AD' }">발견일자</c:if>
						    <c:if test="${adopt.boardCode eq 'MS' }">실종일자</c:if>
				  		</strong></div>
						<div class="col-md-5">${adopt.dogDate}</div>
					</div>
                </li>
                
                <li>
                	<div class="row">
				  		<div class="col-md-2  "><strong>상태</strong></div>
						<div class="col-md-10 ">${adopt.dogStatus}</div>
					</div>
                </li>
                
                <li>
                	<div class="row">
				  		<div class="col-md-2  "><strong>성격</strong></div>
						<div class="col-md-10 ">${adopt.dogPersonality}</div>
					</div>
                </li>
                
                <li>
                	<div class="row">
				  		<div class="col-md-2  "><strong>특징</strong></div>
						<div class="col-md-10 ">${adopt.dogChar}</div>
					</div>
                </li>
         
               	<div class="row">
			  		<div class="col-md-2  "><strong>글내용</strong></div>
					<div class="col-md-10 " >${adopt.postContent}</div>
				</div>
				
              </ul>
              
              
              <div class="product_count">
                <button
                  onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                  class="increase items-count"
                  type="button"
                >
                </button>
                <button
                  onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                  class="reduced items-count"
                  type="button"
                >
                </button>
              </div>
              
              
              <div class="card_area" >
<!--   ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 		세션처리해야함                  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->


              	<c:if test="${adopt.boardCode eq 'AD' }">
              		<c:if test="${adopt.statusCode ne '3' }">
              			<a class="main_btn" href="#" style="width: 189px">입양신청</a>
              		</c:if>
              		<c:if test="${adopt.statusCode eq '2' }">
              			<a class="main_btn" href="#" style="width: 189px" id="confirmButton">신청서확인</a>
              			<a class="main_btn" href="#" style="width: 189px" id="adoptCompleteButton">분양완료</a>
              		</c:if>

              	</c:if>
              	
              	<c:if test="${adopt.boardCode eq 'MS' }">
              		<c:if test="${adopt.statusCode eq '1' }">
              			<a class="main_btn" href="#" style="width: 189px" id="missingCompleteButton">찾기완료</a>
              		</c:if>
              	</c:if>
              	
              	<c:if test="${adopt.statusCode ne '3' }">
               		<a class="main_btn" href="#" style="width: 189px">문의하기</a>
               		<a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a>
               	</c:if>
               	
              </div>
              
              
              
            </div>
          </div>
        </div>
        
        
        <div class="col-md-12 "><br/><br/></div>
        <hr/><br/>
        
        
        <div id="mapDiv"  class="col-md-12 ">
        
        	<c:if test="${adopt.boardCode eq 'AD' }">
				<strong>분양가능지역</strong><br/>
		  		<div id="mapArea" style="width:wrap; height: 300px;"  align="center"></div>
				<div>${adopt.areaKr }</div><br/>
			</c:if>
			
	  		<strong>
	  			<c:if test="${adopt.boardCode eq 'AD' }">
		  			발견위치
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			실종위치
		  		</c:if>
	  		</strong><br/>
	  		<div id="map" style="width: wrap; height: 300px;"  align="center"></div>
	  		<input type="hidden" class="form-control" id="location" name="location" value="${adopt.location}">
			<div>${adopt.locationKr }</div>
        
        </div>
        
        <br/><hr/><div class="col-md-12"><br/><br/></div>
        
        <div class="col-md-12" align="center">
       		<c:if test="${adopt.statusCode eq '1' }">
				<button class="main_btn" style="width: 189px" id="modiButton">수정</button>
	       		<button class="main_btn" style="width: 189px" id="delButton">삭제</button>
			</c:if>
        	
	        
	        <button class="main_btn" style="width: 189px">목록</button>
        </div>
        
        
      </div>
    </div>
   <br><br><br/>
    <!--================End Single Product Area =================-->
    
    <!-- 	/////////////////////////////////////////       dialog       ///////////////////////////////////////////////////////////////////// -->
   
			<div id="dialog-delAdopt" title="">
			  <p align="center"><br/>삭제하시겠습니까?</p>
			</div>  
			<div id="dialog-adoptComplete" title="">
			  <p align="center"><br/>분양완료 상태로 변경하시겠습니까?</p>
			</div>  
			<div id="dialog-missingComplete" title="">
			  <p align="center"><br/>찾기완료 상태로 변경하시겠습니까?</p>
			</div>  
			<div id="dialog-listApply" title="">
				<p align="left" id="listJSON"></p>
			</div> 
  
    <!--================End Product Description Area =================-->

    <!--================ start footer Area  =================-->
    
    <!--================ End footer Area  =================-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">

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

 ////////////////////////////////////////////
 
	    mapArea = new google.maps.Map(document.getElementById('mapArea'), {
			    zoom: 12,
			    center: { lat: parseFloat(arrayTest[0].substring( 0, arrayTest[0].indexOf(",") ))  ,
			    		lng: parseFloat(arrayTest[0].substring( arrayTest[0].indexOf(",")+1, arrayTest[0].length )) }
		});
	    
	    var aaa = "";
	    for ( i=0; i<arrayTest.length; i++){
	    	
		    markerArea= arrayMark[i];
		
		    markerArea = new google.maps.Marker({
		        position: { lat: parseFloat(arrayTest[i].substring( 0, arrayTest[i].indexOf(",") ))  ,
		    			lng: parseFloat(arrayTest[i].substring( arrayTest[i].indexOf(",")+1, arrayTest[i].length )) },
		        map: mapArea
		    });
  		 	
	    }//$('#pop').text(aaa);
	    
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
							$( "#dialog-adoptComplete, #dialog-missingComplete" ).dialog( "close" );
						},
						error: function(request, status, error){ 
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
				        }
			});
	 };

	 //////////////////////////////////////////////////////////////////////////////////////////////////////      
      
      $( function() {
  	    $( "#dialog-delAdopt" ).dialog({
  	    	autoOpen: false,
  		      width: 350,
  		      height: 180,
  		      modal: true,
  		      buttons: {
  		        	예: function() {
  		        		self.location = "/adopt/updateStatusCode?postNo=${adopt.postNo}";
  		        	},
  		        	아니오: function() {
  		          		$( this ).dialog( "close" );
  		        	}
  		      }
  	    });
      });
      
      $( function() {
  	    $( "#dialog-adoptComplete, #dialog-missingComplete" ).dialog({
  	    	  autoOpen: false,
  		      width: 350,
  		      height: 180,
  		      modal: true,
  		      buttons: {
  		        	예: function() {
  		        		fncComplete();
  		        	},
  		        	아니오: function() {
  		          		$( this ).dialog( "close" );
  		        	}
  		      }
  	    });
      });
      
      $( function() {
  	    $( "#dialog-listApply" ).dialog({
  	    	  autoOpen: false,
  		      width: 350,
  		      height: 180,
  		      modal: true,
  		      buttons: {
//   		        	예: function() {
//   		        		fncComplete();
//   		        	},
  		        	닫기: function() {
  		          		$( this ).dialog( "close" );
  		        	}
  		      }
  	    });
      });
      
  //////////////////////////////////////////////////////////////////////////////////////////////////////
  	  function listApply(){
	  	var adoptNo = ${adopt.postNo};
  		$.ajax( 
		 		{
					url : "/apply/json/listApply/"+adoptNo ,
					method : "POST" ,
					dataType : "json" ,
					headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							  },
					success : function(JSONData , status) {
//							alert(status);
			
						var displayValue = 
							'<table class=\"table table-hover table-striped\" >'
						        +'<thead>'
						        	+'<tr>'
							            +'<th><p align="center">No</p></th>'
							            +'<th><p align="center">신청자 ID</p></th>'
							            +'<th><p align="center">신청일자</p></th>' 
					           		+'</tr>'
					            +'</thead>'
					            +'<tbody>'
						            +'<c:set var="i" value="0" />'
						            	+'<c:forEach var="apply" items="${list}">'
						            	+'<c:set var="i" value="${ i+1 }" />'
						            		+'<tr name="${ apply.applyNo }">'
						            			+'<input type="hidden" name="applyNo" value="${ apply.applyNo }">'
							            		+'<td align="left">${ i }</td>'
							            		+'<td align="left">${apply.id}</td>'
							            		+'<td align="left">${apply.regDate}'
							            			+'<button class="btn btn-primary py-0 px-2">제외</button>'
							            		+'</td>'
						            		+'</tr>'
						            +'</c:forEach>'
						         +'</tbody>'
						     +'</table>';
							
													
						$( "#getJSON" ).html(displayValue);
						$('#dialog-getApply').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
						$( "#dialog-getApply" ).dialog( "open" );
						
				},
				error: function(request, status, error){ 
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
//						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
		        }
				
				
			});
	  
	  
	  
	  		
	  		$('#dialog-listApply').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
			$('#dialog-listApply').dialog( "open" );
 	  }
  
  
  
      $(function() {
    	    $( "button:contains('수정')" ).on("click" , function() {
				self.location = "/adopt/updateAdopt?postNo=${adopt.postNo}"
			});
		
			$( "button:contains('삭제')" ).on("click" , function() {
				$('#dialog-delAdopt').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				$('#dialog-delAdopt').dialog( "open" );
			});
		
			$( "a:contains('입양신청')" ).on("click" , function() {
				self.location = "/apply/addApply?postNo=${adopt.postNo}"
			});
		
			$( "a:contains('신청서확인')" ).on("click" , function() {
				listApply();
// 				self.location = "/apply/listApply?adoptNo=${adopt.postNo}"
			});
		
			$( "#adoptCompleteButton" ).on("click" , function() {
				$('#dialog-adoptComplete').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				$('#dialog-adoptComplete').dialog( "open" );
			});
		
			$( "#missingCompleteButton" ).on("click" , function() {
				$('#dialog-missingComplete').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				$('#dialog-missingComplete').dialog( "open" );
			});
		
			$( "button:contains('목록')" ).on("click" , function() {
				self.location = "/adopt/listAdopt?boardCode=${adopt.boardCode}"
			});
		
			$( "a:contains('신청서확인')" ).on("click" , function() {
				self.location = "/apply/listApply?adoptNo=${adopt.postNo}"
			});
	  });
      

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"
    async defer></script>
    

  </body>
</html>
  
    