<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
        	max-height: 400px;
        }
        
        #mapDiv{
/*         	padding-left: 0px; */
/*         	padding-right: 0px; */
        	padding: 0px;
        }
    </style>
 
  </head>
  
  <body>
    
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
                <ol class="carousel-indicators" >
                  <li
                    data-target="#carouselExampleIndicators"
                    data-slide-to="0"
                    class="active"
                  >
                    <img
                      src="images/get/img/product/single-product/s-product-s-2.jpg"
                      alt=""
                    />
                  </li>
                  <li
                    data-target="#carouselExampleIndicators"
                    data-slide-to="1"
                  >
                    <img
                      src="images/get/img/product/single-product/s-product-s-3.jpg"
                      alt=""
                    />
                  </li>
                  <li
                    data-target="#carouselExampleIndicators"
                    data-slide-to="2"
                  >
                    <img
                      src="images/get/img/product/single-product/s-product-s-4.jpg"
                      alt=""
                    />
                  </li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img
                      class="d-block w-100"
                      src="http://placehold.it/400x400"
                      alt="First slide"
                    />
                  </div>
                  <div class="carousel-item">
                    <img
                      class="d-block w-100"
                      src="http://placehold.it/400x400"
                      alt="Second slide"
                    />
                  </div>
                  <div class="carousel-item">
                    <img
                      class="d-block w-100"
                      src="http://placehold.it/400x400"
                      alt="Third slide"
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-5 offset-lg-1">
            <div class="s_product_text"><br/>
              <font size="5px">${adopt.postTitle}</font> &nbsp;&nbsp;${adopt.id}&nbsp;&nbsp; ${ adopt.regDate }<br/><br/>
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
					  		<c:if test="${adopt.boardCode eq 'AD' }">
					  			책임비
					  		</c:if>
						    <c:if test="${adopt.boardCode eq 'MS' }">
					  			사례비
					  		</c:if>
				  		</strong></div>
						<div class="col-md-3 ">${adopt.dogPay}원</div>
			
				  		<div class="col-md-2 " style="padding-right: 0px;"><strong>
				  			<c:if test="${adopt.boardCode eq 'AD' }">
					  			발견일자
					  		</c:if>
						    <c:if test="${adopt.boardCode eq 'MS' }">
					  			실종일자
					  		</c:if>
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
                
                <br/>
              
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
              <div class="card_area">
                <a class="main_btn" href="#" style="width: 189px">입양신청</a>
                <a class="main_btn" href="#" style="width: 189px">문의하기</a>
                <a class="icon_btn" href="#">
                  <i class="lnr lnr lnr-heart"></i>
                </a>
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
	        <a class="main_btn" href="#" style="width: 189px">수정</a>
	        <a class="main_btn" href="#" style="width: 189px">목록</a>
        </div>
        
      </div>
    </div>
   <br><br><br/>
    <!--================End Single Product Area =================-->
  
    <!--================End Product Description Area =================-->

    <!--================ start footer Area  =================-->
    
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
    
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
        	center: centerLoca
        });
        
        marker = new google.maps.Marker({
            position: centerLoca,
            map: map
        });

 ////////////////////////////////////////////
 
	    mapArea = new google.maps.Map(document.getElementById('mapArea'), {
			    zoom: 11,
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
      
      $(function() {
    	    $( "a:contains('수정')" ).on("click" , function() {
				self.location = "/adopt/updateAdopt?postNo=${adopt.postNo}"
			});
		
			$( "a:contains('삭제')" ).on("click" , function() {
			 	alert("삭제하시겠습니까 dialog 추가");
				self.location = "/adopt/updateStatusCode?postNo=${adopt.postNo}"
			});
		
			$( "a:contains('입양신청')" ).on("click" , function() {
				self.location = "../apply/getTerms.jsp?postNo=${adopt.postNo}"
			});
		
			$( "a:contains('목록')" ).on("click" , function() {
				self.location = "/adopt/listAdopt?boardCode=${adopt.boardCode}"
			});
		
			$( "a:contains('신청글보기')" ).on("click" , function() {
				self.location = "/apply/listApply?adoptNo=${adopt.postNo}"
			});
	  });
      
      
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"
    async defer></script>
    

  </body>
</html>
  
    