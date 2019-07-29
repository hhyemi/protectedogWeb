 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<head>
	<title>보호할개 · 분양글 수정</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> 

    
    <style type="text/css">
		
	    html {
	 	 scroll-behavior: smooth;
		}
		
		h1 {
			font-family: 'NanumSquare', sans-serif !important;
/* 			font-size: 22px !important; */
		}
		
		section { 
			font-family: 'NanumSquare', sans-serif !important;
		}
		
	</style>
	
	
  </head>
  <body class="goto-here">
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
<!--           	<p class="breadcrumbs"><span class="mr-2"><a href="index0.html">Home</a></span> <span>Checkout</span></p> -->
            <h1 class="mb-0 bread">
            	<c:if test="${adopt.boardCode eq 'AD' }">분양글 수정</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">실종글 수정</c:if>
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
	          	<div class="row align-items-end">
	          	
	          	
				<input type="hidden" name="boardCode" value=" ${ adopt.boardCode.trim() }" >
				<input type="hidden" name="postNo" value=" ${ adopt.postNo }" >
				<input type="hidden" id="multiFile" name="multiFile" >
				<input type="hidden" id="deleteFile" name="deleteFile" />
				
				
				
	          	
	          	<div class="col-md-12"></div>
	          	
	          		<div class="col-md-12">
		                <div class="form-group">
		                	<label for="postTitle"><strong>글제목</strong>&nbsp;&nbsp;<span name="postTitle"></span></label>
		                	<input type="text" class="form-control" name="postTitle" value="${ adopt.postTitle }" placeholder="제목을 입력하세요.">
		                </div>
	                </div>
	          	
	          		<div class="col-md-12">
		                <div class="form-group">
		                	<label for="phone"><strong>연락처</strong>&nbsp;&nbsp;<span name="phone">연락처가 다를 경우 회원정보를 수정해주세요.</span></label>
		                	<input type="text" class="form-control" name="phone" value="${ adopt.phone }" readonly>
		                </div>
	                </div>
	                
	                <!-- 첨부 버튼 -->
	                <div class="col-md-12">
			            <div id="attach" class="form-group">
			                <span class="label label-primary " ><label class="waves-effect waves-teal btn-flat" for="uploadInputBox"><strong>사진등록</strong>&nbsp;&nbsp;맨앞 이미지는 대표이미지입니다. (최대 5장까지 업로드 가능합니다.)</label></span>
			                <input id="uploadInputBox" style="display: none" type="file" value="등록" name="filedata"  />
			            </div>
		            </div>
		           	<br/>
		            
		            <!-- 미리보기 영역 -->
		            <div class="form-group">
			            <div id="preview" class="col-md-3" align="center" style='display:inline; min-width:600px;'>
			
							<c:forEach var="name" items="${file}" varStatus="status">            
							<div class="preview-box2" value="${name.fileName}"  style='display:inline;float:left;width:140px' >
			                     <img class="thumbnail" src="/resources/file/fileAdopt/${name.fileName}"  width="120px;" height="120px;"/><br/>
			                            <a href="#" value="${name.fileName}"  onclick="deletePreview2(this)">삭제</a></div>     
			                </c:forEach>     
			                
			            </div> 
		            </div>
      
	                
	          		<div class="col-md-12">
	                </div>
	                
	          		<div class="col-md-6">
		                <div class="form-group">
		                	<label for="dogBreed"><strong>견종</strong>&nbsp;&nbsp;<span name="dogBreed"></span></label>
		                	<input type="text" class="form-control" id="dogBreed" name="dogBreed" value="${ adopt.dogBreed }">
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
	                  		<input type="number" class="form-control" name="dogWeight"  value="${ adopt.dogWeight }">
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
		                		<c:if test="${adopt.boardCode eq 'AD' }">책임비</c:if>
							    <c:if test="${adopt.boardCode eq 'MS' }">사례비</c:if>
	                		</strong>&nbsp;&nbsp;<span name="dogPay"></span></label>
	                  		<input type="number" class="form-control" name="dogPay" value="${ adopt.dogPay }">
	               		</div>
               		</div>
               		
	            	<div class="col-md-6">
	              		<div class="form-group">
	                		<label for="dogDate"><strong>
	                			<c:if test="${adopt.boardCode eq 'AD' }">발견일자</c:if>
							    <c:if test="${adopt.boardCode eq 'MS' }">실종일자</c:if>
	                		</strong></label>
	                  		<input type="date" class="form-control" name="dogDate" value="${ adopt.dogDate }" >
	               		</div>
               		</div>
               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="dogStatus"><strong>상태</strong>&nbsp;&nbsp;<span name="dogStatus"></span></label>
	                  		<input type="text" class="form-control" name="dogStatus"  value="${ adopt.dogStatus }">
	               		</div>
               		</div>
               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="dogPersonality"><strong>성격</strong>&nbsp;&nbsp;<span name="dogPersonality"></span></label>
	                  		<input type="text" class="form-control" name="dogPersonality"  value="${ adopt.dogPersonality }">
	               		</div>
               		</div>
               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="dogChar"><strong>특징</strong>&nbsp;&nbsp;<span name="dogChar"></span></label>
	                  		<input type="text" class="form-control" name="dogChar"  value="${ adopt.dogChar }">
	               		</div>
               		</div>
               		
               		
               		
	            	<div class="col-md-12">
	            	<br/>
                		<label><strong>
	                		<c:if test="${adopt.boardCode eq 'AD' }">
<!-- 	                			지도를 클릭하면 마커가 생성되며, 우클릭할 경우 마커가 모두 삭제됩니다. <br/>특정 마커를 우클릭할 경우 우클릭한 마커만 삭제됩니다.<br/> -->
	                			분양가능지역을 수정하실 경우 지도를 우클릭하고 마커를 다시 생성해주세요.
	                		</c:if>
	                		<c:if test="${adopt.boardCode eq 'MS' }">
	                			지도를 클릭하면 마커가 생성되며, 지도를 우클릭하거나 마커를 우클릭한 경우 마커가 삭제됩니다. 
	                		</c:if>
                		</strong></label>
               		</div>
               		
               		
               		
               		<c:if test="${adopt.boardCode eq 'AD' }">
		            	<div class="col-md-12">
		              		<div class="form-group">
		                		<label for="adoptArea"><strong>분양가능지역</strong> &nbsp;(3곳까지 선택가능합니다.)</label>
		                		<div id="mapArea" style="width: wrap; height: 300px;"></div><br/>
		                  		<input type="hidden" class="form-control" id="adoptArea" name="adoptArea"  value="${ adopt.adoptArea }">
		                  		<input type="text" class="form-control" id="areaKr" name="areaKr" value="${ adopt.areaKr }" placeholder="마커 위치가 입력됩니다." readonly="readonly">
		               		</div>
	               		</div>
               		</c:if>
               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="location"><strong>
		                		<c:if test="${adopt.boardCode eq 'AD' }">
						  			발견위치
						  		</c:if>
							    <c:if test="${adopt.boardCode eq 'MS' }">
						  			실종위치
						  		</c:if>
	                		</strong></label>
	                		<div id="map" style="width:wrap; height: 300px;"></div><br/>
	                  		<input type="hidden" class="form-control" id="location" name="location" value="${ adopt.location }" >
	                  		<input type="text" class="form-control" id="locationKr" name="locationKr" value="${ adopt.locationKr }" placeholder="마커 위치가 입력됩니다." readonly>
	               		</div>
               		</div>
               		
               		
               		<div class="col-md-12">
		                <div class="form-group">
		                	<label for="postContent"><strong>글내용</strong>&nbsp;&nbsp;<span name="postContent"></label>
<!-- 		                	<input type="text" class="form-control" name="postContent" value="dd" placeholder="내용을 입력하세요."> -->
		                	<textarea  class="form-control"  name="postContent"  rows="5"  placeholder="내용을 입력하세요.">${adopt.postContent }</textarea>
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
					<p><button class="btn btn-primary py-3 px-4 col-md-12">수정</button></p>
					
					<div class="form-group">
						<div class="col-md-12">
							<div class="radio" align="right">
								<p><a href="#" ><font color="gray">취소</font></a></p>
							</div>
						</div>
					</div>
	          	</div>
	          </div>
	          
	          
 <!-- 	/////////////////////////////////////////       dialog       ///////////////////////////////////////////////////////////////////// -->
   
 
 
			<div id="dialog-img" title="">
			  <p align="center"><br/>이미지를 등록해주세요.</p>
			</div>        
			<div id="dialog-area" title="">
			  <p align="center"><br/>분양가능지역을 선택해주세요.</p>
			</div>       
			<div id="dialog-location" title="">
			  <p align="center"><br/>
			  		<c:if test="${adopt.boardCode eq 'AD' }">발견위치를 선택해주세요.</c:if>
			  		<c:if test="${adopt.boardCode eq 'MS' }">실종위치를 선택해주세요.</c:if>
			  </p>
			</div>   

       
<!-- 	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->      
	          
	          
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

    <jsp:include page="/layout/footer.jsp"></jsp:include>
    
  

  <!-- loader -->

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
  <script>

  var map;
  var marker;
  var markers = [];
  var loca = "${adopt.location}";
  var localat = parseFloat(  loca.substring( loca.indexOf("(")+1 ,loca.indexOf(",") )  );
  var localng = parseFloat(  loca.substring( loca.indexOf(",")+1, loca.indexOf(")") )  );
  
  var mapArea;
  var markerArea;
  var markersArea = [];
  var adArea = "${adopt.adoptArea}";
  var arrayTest = [];
  var arrayMark = [];
  
  var str = "";
  var markTest="";
  var mmm = "";
  
  
  if (adArea.indexOf("#") != -1){
	  var areaArray = adArea.split("#");
	  
	  for ( i=0; i<areaArray.length-1; i++){
		  arrayTest[i] = areaArray[i].substring( areaArray[i].indexOf("(")+1, areaArray[i].indexOf(",") )+","+ (areaArray[i].substring( areaArray[i].indexOf(",")+1, areaArray[i].indexOf(")") )).trim() ;
		  arrayMark[i] = "markerArea"+i.toString();
	  }   	  
  }
  
  
  
  function initMap() {
	  
	   if( $('input[name=boardCode]').val().trim() =='AD'){
	    	mapArea = new google.maps.Map(document.getElementById('mapArea'), {
				    zoom: 11,
				    center: { lat: parseFloat(arrayTest[0].substring( 0, arrayTest[0].indexOf(",") ))  ,
				    		lng: parseFloat(arrayTest[0].substring( arrayTest[0].indexOf(",")+1, arrayTest[0].length )) }
			});
		    
		    for ( i=0; i<arrayTest.length; i++){
		    	
			    markerArea= arrayMark[i];
			
			    markerArea = new google.maps.Marker({
			        position: { lat: parseFloat(arrayTest[i].substring( 0, arrayTest[i].indexOf(",") ))  ,
			    			lng: parseFloat(arrayTest[i].substring( arrayTest[i].indexOf(",")+1, arrayTest[i].length )) },
			        map: mapArea
		   		});
			    
			    markersArea.push(markerArea);
	   		}
		    
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
    
    //////////////////////////////////////////////////////////////
    
        map = new google.maps.Map(document.getElementById('map'), {
        	zoom: 15,
        	center: {lat: localat, lng: localng}
        });
        
        marker = new google.maps.Marker({
            position: {lat: localat, lng: localng},
            map: map
        });
        
        markers.push(marker);
        
        map.addListener('click', function(event) {
        	deleteMarkers();
        	addMarker(event.latLng, "loca");
      	});
        
        map.addListener('rightclick', function() {
        	deleteMarkers();
        	$('#location').val('');
        	$('#locationKr').val('');
	    });
   
  }
  
  
  
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
	    	           			if( markTest.indexOf('특별') != -1  ){
	    	           				markTest = markTest.replace('특별' ,   '');
	    	           			}
	    	           			if( markTest.indexOf('광역') != -1  ){
	    	           				markTest = markTest.replace('광역' ,   '');
	    	           			}
	    	           			if( markTest.indexOf('자치') != -1  ){
	    	           				markTest = markTest.replace('자치' ,   '');
	    	           			}
	    	          			$("#areaKr").val($("#areaKr").val()+markTest);
	    	         }
	    	 	});

  	        }else{
//	  	        	alert("3개까지 지정 가능함 dialog 추가");
  	        }
    		 

  	        if (markerArea != undefined){
  	        	
  	        	markerArea.addListener('rightclick', function() {
  	        		alert(markerArea.position);
  	        		
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
//	  		   	               		alert(JSON.stringify(data));
  		    	              	markTest += data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length)+"  ";
  		    	                if( markTest.indexOf('특별') != -1  ){
	    	           				markTest = markTest.replace('특별' ,   '');
	    	           			}
	    	           			if( markTest.indexOf('광역') != -1  ){
	    	           				markTest = markTest.replace('광역' ,   '');
	    	           			}
	    	           			if( markTest.indexOf('자치') != -1  ){
	    	           				markTest = markTest.replace('자치' ,   '');
	    	           			}
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
//		                $('#locationKr').val(JSON.stringify(data));
	            	var locaKrkr = data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length);
	                if( locaKrkr.indexOf('특별') != -1  ){
	                	locaKrkr = locaKrkr.replace('특별' ,   '');
           			}
           			if( locaKrkr.indexOf('광역') != -1  ){
           				locaKrkr = locaKrkr.replace('광역' ,   '');
           			}
           			if( locaKrkr.indexOf('자치') != -1  ){
           				locaKrkr = locaKrkr.replace('자치' ,   '');
           			}
	                $('#locationKr').val( locaKrkr );
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
  

      
      //////////////////////        ↑ map         /////////////////////////////////////////////////////////////////////////////////////////////////////////
       

	  //============= "다중파일업로드 파일명만 저장해서 value" =============   
	  function fnAddFile(fileNameArray) {
	  	   $("#multiFile").val(fileNameArray);    
	  }   
      
	  //============= "다중파일업로드 파일명만 저장해서 delete할 value" =============   
	  function fnDeleteFile(deletefileNameArray) {
	       $("#deleteFile").val(deletefileNameArray);    
	  } 

	  //============= "다중파일업로드"  Event 처리 및  연결 =============      

	  //임의의 file object영역
	 var files = {};
	 var previewIndex = 0;
	 var fileNameArray = new Array();
     //원래있던사진 삭제할 array
     var deletefileNameArray = new Array();
	 
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
	            
	            //append할때 동영상 이미지 구분해주기
	            var imgSelectName = "img";
	            if(fileNameExtension === 'mp4' || fileNameExtension === 'avi'){
	             	imgSelectName = "iframe";
	            }                           
	
	            var reader = new FileReader();
	            reader.onload = function(img) {
	                 //div id="preview" 내에 동적코드추가.
	                 //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
	                 
	                 var imgNum = previewIndex++;
	                 
	                //5장 이상 업로드시
	                 if(Object.keys(files).length>=5){
	            		alert("사진은 5장까지만 업로드 가능합니다.");
	                    delete files[imgNum];
	                 }else{
	          		 // 5장 이하 
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
//                           	console.log("확인 : "+data);
//                           	console.log("모두 확인 : "+JSON.stringify(data));
                          	
                          	var test = data.responses[0].webDetection.bestGuessLabels[0];
                          	console.log("견종 확인 : "+test.label);
//                             var faceData = data.responses[0].faceAnnotations[0];
//                             console.log('joy: ' + faceData.joyLikelihood);
//                             console.log('sorrow: ' + faceData.sorrowLikelihood);
//                             console.log('anger: ' + faceData.angerLikelihood);
//                             console.log('surprise: ' + faceData.surpriseLikelihood);
                       		$( "#dogBreed" ).val(test.label);
//                        		$( "#test" ).html(test.label.replace(/ /gi, "") );
                          },
                          error: function (data, textStatus, errorThrown) {
                            console.log('error: ' + data);
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
	 
	 //=============원래있던사진들 삭제버튼누를때 =============
     function deletePreview2(obj) {
         var imgName = obj.attributes['value'].value;
         deletefileNameArray.push(imgName);
         fnDeleteFile(deletefileNameArray);
         $("#preview .preview-box2[value=\"" + imgName + "\"]").remove();
         resizeHeight();
     }


	 //============= 파일 확장자 validation 체크 =============
	 function validation(fileName) {
	     fileName = fileName + "";
	     var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	     var fileNameExtension = fileName.toLowerCase().substring(
	             fileNameExtensionIndex, fileName.length);
	     if (!((fileNameExtension === 'jpg')|| (fileNameExtension === 'gif') || (fileNameExtension === 'png')||(fileNameExtension === 'avi')||(fileNameExtension === 'mp4'))) {
	         alert('jpg, gif, png, avi, mp4 확장자만 업로드 가능합니다.');
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
	
	

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	var boardCode = $( 'input[name=boardCode]' ).val().trim();
	
	$( function() {
	    $( "#dialog-img" ).dialog({
	    	autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  jQuery($("span[name=phone]"))[0].scrollIntoView(true);
		    	  }
		      }
	    });
	});
	
	$( function() {
	    $( "#dialog-area" ).dialog({
	    	autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  jQuery($("#areaFocus"))[0].scrollIntoView(true);
		    	  }
		      }
	    });
	});
	
	$( function() {
	    $( "#dialog-location" ).dialog({
	    	autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  jQuery($("input[name=areaKr]"))[0].scrollIntoView(true);
		    	  }
		      }
	    });
	});

//////////////////////↑  dialog        ////////////////////////////////////////////////

	$( "input[name=postTitle]" ).keyup(function( ) {
		if($("input[name=postTitle]").val().length > 10 ){
			$("span[name=postTitle]").text('10자까지 입력할 수 있습니다.');
		}else{
			$("span[name=postTitle]").text('');
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


	
//////////////////////       ↑  글자수체크         ////////////////////////////////////////////////



	// 등록버튼 누르고
	function fncUpdateAdopt(){
		
		  if( $("input[name=postTitle]").val().trim() == '' || $("input[name=postTitle]").val().length >10){
			  $("input[name=postTitle]").focus();
			  return;
		  }
// 		  if( $(".preview-box").length == 0 ){
// 			  $('#dialog-img').dialog( "open" );
// 			  return;
// 		  }
		  if( $("input[name=dogWeight]").val().trim() == '' || $("input[name=dogWeight]").val().length > 6 ){
			  $("input[name=dogWeight]").focus();
			  return;
		  }
		  if( $("input[name=dogPay]").val().trim() == '' || $("input[name=dogPay]").val().length > 6 ){
			  $("input[name=dogPay]").focus();
			  return;
		  }
		  if( $("input[name=dogDate]").val().trim() == '' ){
			  $("input[name=dogDate]").focus();
			  return;
		  }
		  if( $("input[name=dogStatus]").val().trim() == '' || $("input[name=dogStatus]").val().length > 20 ){
			  $("input[name=dogStatus]").focus();
			  return;
		  }
		  if( $("input[name=dogPersonality]").val().trim() == '' || $("input[name=dogPersonality]").val().length > 20 ){
			  $("input[name=dogPersonality]").focus();
			  return;
		  }
		  if( $("input[name=dogChar]").val().trim() == '' || $("input[name=dogChar]").val().length > 20 ){
			  $("input[name=dogChar]").focus();
			  return;
		  }
		  if( boardCode == 'AD' ){
			  if( $("input[name=adoptArea]").val().trim() == ''){
				  $('#dialog-area').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				  $('#dialog-area').dialog( "open" );
				  return;
			  }
		  }
		  if( $("input[name=location]").val().trim() == ''){
			  $('#dialog-location').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
			  $('#dialog-location').dialog( "open" );
			  return;
		  }
		  if( $("textarea[name=postContent]").val().trim() == '' || $("textarea[name=postContent]").val().length > 100 ){
			  $("textarea[name=postContent]").focus();
			  return;
		  }
		
		  
	    //============= 다중파일업로드 AJAX =============
	    	
// 	   	  var file = $("#multiFile").val(); 
		
	      $(function() {     
		        var form = $('#uploadForm')[0];
		        var formData = new FormData(form);
		
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
			                    alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
			                    // 이후 동작 ...
			                } else if (result === -2) {
			                    alert('파일이 10MB를 초과하였습니다.');
			                    // 이후 동작 ...
			                } else {
			                    alert('이미지 업로드 성공');
			                }
		            },
					error: function(request, status, error){ 
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
			        }
		        });
	  	  });


		
		
		$("form").attr("method" , "POST").attr("action" , "/adopt/updateAdopt").attr("enctype","multipart/form-data").submit();
		
	}
	
	
    
    
    $(function() {
			$( "button:contains('수정')" ).on("click" , function() {
				fncUpdateAdopt();
			});
			
			$( "a:contains('취소')" ).on("click" , function() {
				self.location = "/adopt/getAdopt?postNo=${adopt.postNo}"
			});
	 });	
      
      
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"
    async defer></script>
  
  
  
  
  
  </body>
</html>