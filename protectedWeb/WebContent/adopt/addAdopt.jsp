 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

	<title>보호할개 · 분양</title>
	
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
    <style type="text/css">
    
	    html {
	 		scroll-behavior: smooth;
		}
		
		.waves-effect>span {
			background-color: #f04f23;
			border-radius: 3px;
			padding: 3px;
			color: white;
		}
		
		input[name=dogDate] {
			height: 38px;

		}
		
		.fa-exclamation-circle {
			color: #f04f23;
		}
		
		#areaFocus {
			opacity: 0.6;
		}

	</style>
   <jsp:include page="/layout/toolbar.jsp"></jsp:include> 
  </head>
  
  
  <body class="goto-here">
  

	<div class="hero-wrap hero-bread" style="padding-bottom: 60px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">Adopt</span> <span>Missing</span></p>
            <font size="7">
            	분양글 등록
            </font>
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
	          	
	          	
					<!-- hidden -->
					<input type="hidden" name="boardCode" value=" ${ param.boardCode.trim() }" >
					<input type="hidden" name="statusCode" value="1" >
					<input type="hidden" class="form-control" id="multiFile" name="multiFile" >
				
				
					<!-- 약관 시작 -->
					<div class="col-md-12">
					
		          		<div class="cart-detail bg-light p-3 p-md-4">
		          			<h3 class="billing-heading mb-4"><strong>작성 안내</strong></h3>
		          			
							<div class="form-group">
								<div class="col-md-12"><strong>1. </strong>
									분양글을 등록하고, 입양신청서가 등록되거나 분양완료 상태로 변경하신 경우 글을 수정하거나 삭제하실 수 없습니다.
								</div>
								<div class="col-md-12">
									<div class="radio" align="right">
									   <label><input type="checkbox" name="terms" class="mr-2">확인</label>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-md-12"><strong>2. </strong>신청서는 상세조회 화면에서 확인하실 수 있으며, 신청서를 확인하고 직접 연락하시면 됩니다.</div>
								<div class="col-md-12">
									<div class="radio" align="right">
									   <label><input type="checkbox" name="terms" class="mr-2">확인</label>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-md-12">
									<div class="radio" align="right">
									   <label><input type="checkbox" name="termsAll" class="mr-2"><strong>모두 확인</strong></label>
									</div>
								</div>
							</div>
							
						</div>
					</div>
					<!-- 약관 끝 -->
				
		          	
		          	<div class="col-md-12"><br/><hr/><br/></div>
		          	
	          		<div class="col-md-12">
		                <div class="form-group">
		                	<h5><strong>글제목</strong></h5>
<!-- 		                	&nbsp;&nbsp;<span name="postTitle"></span> -->
		                	<input type="text" class="form-control" name="postTitle" value="" placeholder="제목을 입력하세요.">
		                </div>
	                </div>
		          	
	          		<div class="col-md-12">
		                <div class="form-group">
		                	<h5><strong>연락처</strong></h5>
<!-- 		                	&nbsp;&nbsp;<span name="phone">연락처가 다를 경우 회원정보를 수정해주세요.</span></label> -->
		                	<input type="text" class="form-control" name="phone" value="${ sessionScope.user.phone }" readonly >
		                </div>
	                </div>
	
	                <div class="col-md-12"><br/></div>
		                
	                <!-- 첨부 버튼 -->
	                <div class="col-md-12">
			            <div id="attach" class="form-group">
			                <span class="label label-primary " ><label class="waves-effect waves-teal btn-flat" for="uploadInputBox">
			               		<span><strong>사진등록</strong></span>&nbsp;&nbsp;맨 앞 이미지는 대표 이미지입니다. (최대 5장까지 업로드 가능합니다.)
			                </label></span>
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
		                	<h5><strong>견종</strong></h5>
<!-- 		                	&nbsp;&nbsp;<span name="dogBreed"></span></label> -->
		                	<input type="text" class="form-control" id="dogBreed" name="dogBreed" placeholder="이미지 등록 시 자동으로 입력됩니다.">
		                </div>
	                </div>
		                
	            	<div class="col-md-6">
	              		<div class="form-group">
	                		<h5><strong>크기</strong></h5>
<!-- 	                		</label> -->
						      	<select class="form-control" name="dogSize" id="dogSize">
								  	<option value="소형견" >소형견</option>
									<option value="중형견" >중형견</option>
									<option value="대형견" >대형견</option>
								</select>
	               		</div>
	            	</div>
	               		
	            	<div class="col-md-6">
	              		<div class="form-group">
	                		<h5><strong>체중(kg)</strong></h5>
<!-- 	                		&nbsp;&nbsp;<span name="dogWeight"></span></label> -->
	                  		<input type="number" min="0" class="form-control" name="dogWeight"  value="" placeholder="강아지 체중을 입력하세요.">
	               		</div>
	              	</div>
	               		
	            	<div class="col-md-6">
	              		<div class="form-group">
	                		<h5><strong>성별</strong></h5>
<!-- 	                		</label> -->
						      	<select class="form-control" name="dogGender" id="dogGender">
								  	<option value="남아" >남아</option>
									<option value="여아" >여아</option>
								</select>
	               		</div>
	              	</div>
	               		
	            	<div class="col-md-6">
	              		<div class="form-group">
	                		<h5><strong>책임비</strong></h5>
<!-- 	                		&nbsp;<span name="dogPay"></span></label> -->
	                  		<input type="text" min="0" class="form-control" name="dogPay" value="" placeholder="원하지 않을 경우 0을 입력하세요.">
	               		</div>
	              	</div>
	               		
	            	<div class="col-md-6">
	              		<div class="form-group">
	                		<h5><strong id="dogDateLabel">발견일</strong></h5>
<!-- 	                		</label> -->
	                  		<input type="text" class="form-control" name="dogDate" value="" placeholder="캘린더 아이콘을 클릭하세요." readonly>
	                  	</div>
	               	</div>
	              	
	               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<h5><strong>상태</strong></h5>
<!-- 	                		&nbsp;&nbsp;<span name="dogStatus"></span></label> -->
	                  		<input type="text" class="form-control" name="dogStatus" value="" placeholder="강아지 상태를 설명해주세요.">
	               		</div>
	               	</div>
	               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<h5><strong>성격</strong></h5>
<!-- 	                		&nbsp;&nbsp;<span name="dogPersonality"></span></label> -->
	                  		<input type="text" class="form-control" name="dogPersonality" value="" placeholder="강아지 성격을 설명해주세요.">
	               		</div>
	              	</div>
	               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<h5><strong>특징</strong></h5>
<!-- 	                		&nbsp;&nbsp;<span name="dogChar"></span></label> -->
	                  		<input type="text" class="form-control" name="dogChar" value="" placeholder="강아지 특징을  설명해주세요.">
	               		</div>
	               	</div>
	               		
		            <div class="col-md-12" id="areaFocus"><br/>
	               		<label><strong><span class="fas fa-exclamation-circle"></span>
	               		지도를 클릭하면 마커가 생성되며, 우클릭할 경우 마커가 모두 삭제됩니다. <br/>특정 마커를 우클릭할 경우 우클릭한 마커만 삭제됩니다.<br/>
	               		분양가능지역은 3곳까지 지정 가능하며 처음 지정한 지역이 게시판 썸네일에 표시됩니다.
	               		</strong></label><br/>
	               	</div>
	               		
	              	<c:if test="${param.boardCode eq 'AD' }">
		            	<div class="col-md-12">
		              		<div class="form-group">
		                		<h5><strong>분양가능지역</strong></h5>
<!-- 		                		 &nbsp;(3곳까지 지정가능하며, 처음 지정한 지역이 리스트에 표시됩니다.)</label> -->
		                		<div id="mapArea" style="width: wrap; height: 300px;"></div><br/>
		                  		<input type="hidden" class="form-control" id="adoptArea" name="adoptArea" >
		                  		<input type="text" class="form-control" id="areaKr" name="areaKr" placeholder="마커 위치가 입력됩니다." readonly="readonly">
		               		</div>
	               		</div>
	              	</c:if>
	               		
		            <div class="col-md-12">
	              		<div class="form-group">
	                		<h5><strong>발견위치</strong></h5>
<!-- 	                		</label> -->
	                		<div id="map" style="width:wrap; height: 300px;"></div><br/>
	                  		<input type="hidden" class="form-control" id="location" name="location">
	                  		<input type="text" class="form-control" id="locationKr" name="locationKr" placeholder="마커 위치가 입력됩니다." readonly>
	               		</div>
	              	</div>
	               		
	               	<div class="col-md-12">
		                <div class="form-group">
		                	<h5><strong>글내용</strong></h5>
<!-- 		                	</label>&nbsp;&nbsp;<span name="postContent"></span> -->
		                	<textarea  class="form-control"  name="postContent"  rows="5" value="dd"  placeholder="내용을 입력하세요."></textarea>
		                </div>
	                </div>
	               		
                </div>
	         	</div>
	         </form>
	         <!-- END -->

	         <div class="col-xl-8 row mt-5 pt-3 d-flex">
	          	<div class="col-md-12" style="padding-left: 0px;padding-right: 0px;">
	          	
					<p><button class="btn btn-default py-3 px-4 col-md-12">등록</button></p>
					
					<div class="form-group">
						<div class="col-md-12">
							<div class="radio" align="right">
								<p><a href="#" ><font color="gray">취소</font></a></p>
							</div>
						</div>
					</div><br/><br/>
	          	</div>
	         </div>
	                    
	          
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

    
    <jsp:include page="/layout/footer.jsp"></jsp:include>
  

  
<!--   <script src="./jquery-ui-1.12.1/datepicker-ko.js"></script> -->
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!--   <script type="text/javascript" src="/resources/events.js"></script> -->
<!--   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
  <script>

 	  var mapArea;
      var map;
      
      var markersArea = [];
      var markers = [];
      
      var infowindowLoca;
      var infowindowArea;
//       var infowindowAA = [];
      
      function initMap() {
    	  

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
	        infowindowArea = new google.maps.InfoWindow();
  
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
	      
			infowindowLoca = new google.maps.InfoWindow();
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
	    	           			markTest = ","+data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length);
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
	    	          			
	    	          			if ( $("#areaKr").val().toString().indexOf(',') == 0 ){
	    	          				$("#areaKr").val(   $("#areaKr").val().toString().substring(  1  ,   ($("#areaKr").val().toString().length)  ) ) ;
	    	          			}
	    	          			
	    	          			infowindowArea.setContent(data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length));
	    	    	    		infowindowArea.open(mapArea, markerArea);
// 		    	          			
		    	         }
		    	 	});

	  	        }else{
	  	        	swal({
	 		           text: "3곳까지 지정 가능합니다.",
	 		           dangerMode: true,
	 		           buttons: {
	 							 catch: {
	 							 	text: "확인"
	 							 }
	 				   },
	 		      });
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
	  		    	              	markTest += ","+data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length);
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
	  		    	       			
		  		    	       		if ( $("#areaKr").val().toString().indexOf(',') == 0 ){
		    	          				$("#areaKr").val(   $("#areaKr").val().toString().substring(  1  ,   ($("#areaKr").val().toString().length)  ) ) ;
		    	          			}
		    	          			if (   $("#areaKr").val().toString().charAt(($("#areaKr").val().toString().length)-1) == ','   ){
		    	          				$("#areaKr").val(   $("#areaKr").val().toString().substring(  0  ,   ($("#areaKr").val().toString().length)-1 ) ) ;
		    	          			}
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
		                
		                infowindowLoca.setContent(data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length));
	    	    		infowindowLoca.open(map, marker);
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
	                 
	                //5장 이상 업로드시
	                 
	                 if( Object.keys(files).length>=5 ){
	                	 
	                	 swal({
	  	 		           text: "5장까지 등록 가능합니다.",
	  	 		           dangerMode: true,
	  	 		           buttons: {
	  	 							 catch: {
	  	 							 	text: "확인"
	  	 							 }
	  	 				   },
	  	 		      });
// 	            		alert("이미지는 5장까지 업로드 가능합니다.");
	                    delete files[imgNum];
	                    
	                 }else{
	          		 // 8장 이하 
	                	 $("#preview").append(
                                     "<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px;padding-top:7px' >"
                                             + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"130px;\" height=\"115px;\"/>"
                                             + "<span href=\"#\" value=\""
                                             + imgNum
                                             + "\" onclick=\"deletePreview(this)\">"
                                             + "   <font color=\"#f04f23\"> 삭제</font>" + "</span>" + "</div>");
	
		                 files[imgNum] = file;
		                 fileNameArray[imgNum]=file.name;
		                 fnAddFile(fileNameArray);
	                 }
	                
	                
	                //비전
	                if( imgNum == 0){
	                	
	                
	                	var b64 = img.target.result;
	                	
	                	if(b64.indexOf('png') != -1){
	                		b64 = b64.replace(  'data:image/png;base64,'   ,    ''  ); // remove content type
	                	}else {
	                		b64 = b64.replace(  'data:image/jpeg;base64,'   ,   ''  );
	                	}
	                	
                        request = {"requests":[{
                              				"image":{ "content": b64 },
                             				"features":[{
						                                // if you want to detect more faces, or detect something else, change this
						                                "type":"WEB_DETECTION",
						                                "maxResults":1
                                			}]
                            		}]
                        };
                        
                        $.ajax({
                          method: 'POST',
                          url: 'https://vision.googleapis.com/v1/images:annotate?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0',
                          contentType: 'application/json',
                          data: JSON.stringify(request),
                          processData: false,
                          success: function(data){
//                           console.log("모두 확인 : "+JSON.stringify(data));
	                          	var test = data.responses[0].webDetection.bestGuessLabels[0];
	                          	var breed = test.label;
	                          	console.log("견종 확인 : "+breed);
	                       		fncBreed( breed );
                          },
                          error: function (data, textStatus, errorThrown) {
	                            console.log('비전 error: ' + JSON.stringify(data));
	                            fncBreed( '모름' );
                          }
                        });//ajax
	                	
	                }//if
	             };
	
	             reader.readAsDataURL(file);
	         }
	     } else{
// 	         alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	     }
	 }
	 

	 //============= preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제 =============
	 function deletePreview(obj) {
	     var imgNum = obj.attributes['value'].value;
	     delete files[imgNum];
	     fileNameArray.splice(imgNum,1);
	     fnAddFile(fileNameArray);
	     $("#preview .preview-box[value=" + imgNum + "]").remove();
// 	     resizeHeight();
	 }

	 //============= 파일 확장자 validation 체크 =============
	 function validation(fileName) {
	     fileName = fileName + "";
	     var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	     var fileNameExtension = fileName.toLowerCase().substring(fileNameExtensionIndex, fileName.length);
	     if (!((fileNameExtension === 'jpg')|| (fileNameExtension === 'gif') || (fileNameExtension === 'png') || (fileNameExtension === 'jpeg') )) {
	    	 swal({
		           text: "jpg, gif, png, jpeg 확장자만 등록 가능합니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		     });
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
		if ( breed.toLowerCase().indexOf( 'bichon' ) != -1 || breed.toLowerCase().indexOf( '비숑' ) != -1  ) {
			breed = '비숑';
			$('select[name=dogSize]').val('소형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'pomeranian' ) != -1 || breed.toLowerCase().indexOf( '포메' ) != -1 ) {
			breed = '포메라니안';
			$('select[name=dogSize]').val('소형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'bull' ) != -1 || breed.toLowerCase().indexOf( '불독' ) != -1) {
			breed = '불독';
			$('select[name=dogSize]').val('중형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'chihuahua' ) != -1 || breed.toLowerCase().indexOf( '치와와' ) != -1  ) {
			breed = '치와와';
			$('select[name=dogSize]').val('소형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'maltese' ) != -1 || breed.toLowerCase().indexOf( '말티즈' ) != -1 ) {
			breed = '말티즈';
			$('select[name=dogSize]').val('소형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'poodle' ) != -1 || breed.toLowerCase().indexOf( 'poedel' ) != -1 || breed.toLowerCase().indexOf( '푸들' ) != -1 ) {
			breed = '푸들';
			$('select[name=dogSize]').val('소형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'retriever' ) != -1 || breed.toLowerCase().indexOf( '리트리버' ) != -1 ) {
			breed = '리트리버';
			$('select[name=dogSize]').val('대형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'jindo' ) != -1 || breed.toLowerCase().indexOf( '진돗개' ) != -1 ) {
			breed = '진돗개';
			$('select[name=dogSize]').val('중형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'welsh' ) != -1 || breed.toLowerCase().indexOf( 'corgi' ) != -1 || breed.toLowerCase().indexOf( '웰시' ) != -1 ) {
			breed = '웰시코기';
			$('select[name=dogSize]').val('중형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'chow' ) != -1 || breed.toLowerCase().indexOf( '차우' ) != -1 ) {
			breed = '차우차우';
			$('select[name=dogSize]').val('대형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'dobermann') != -1 || breed.toLowerCase().indexOf( '도베르만' ) != -1 ) {
			breed = '도베르만';
			$('select[name=dogSize]').val('대형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'spaniel') != -1 || breed.toLowerCase().indexOf( '니엘' ) != -1 || breed.toLowerCase().indexOf( '니얼' ) != -1 ) {
			breed = '스파니엘';
			$('select[name=dogSize]').val('소형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'spitz') != -1 || breed.toLowerCase().indexOf( '스피츠' ) != -1 ) {
			breed = '스피츠';
			$('select[name=dogSize]').val('중형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'husky' ) != -1 || breed.toLowerCase().indexOf( '허스키' ) != -1 ) {
			breed = '허스키';
			$('select[name=dogSize]').val('대형견').attr("selected","selected");
		}else if ( breed.toLowerCase().indexOf( 'shih' ) != -1 || breed.toLowerCase().indexOf( '시츄' ) != -1 ) {
			breed = '시츄';
			$('select[name=dogSize]').val('소형견').attr("selected","selected");
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
	//3자리 단위마다 콤마 생성
   function addCommas(x) {
       return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   }
    
   //모든 콤마 제거
   function removeCommas(x) {
       if(!x || x.length == 0) return "";
       else return x.split(",").join("");
   }

	$( "input[name=postTitle]" ).keyup(function( ) {

		if($("input[name=postTitle]").val().length > 15 ){
			swal({
		           text: "제한 길이를 초과하였습니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		     });
			$("input[name=postTitle]").val($("input[name=postTitle]").val().toString().substring(0,15));
		}else{
			$("span[name=postTitle]").text('');
		}
	});
	

	$( "input[name=dogBreed]" ).keyup(function( ) {
		if($("input[name=dogBreed]").val().length > 10 ){
			swal({
		           text: "제한 길이를 초과하였습니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		     });
			$("input[name=dogBreed]").val($("input[name=dogBreed]").val().toString().substring(0,10));
// 			$("span[name=dogBreed]").text('10자까지 입력할 수 있습니다.');
		}else{
			$("span[name=dogBreed]").text('');
		}
	});

	$( "input[name=dogWeight]" ).keyup(function( e ) {
		if(parseFloat( $("input[name=dogWeight]").val()) > 60.0 ){
// 		if($("input[name=dogWeight]").val().length > 6 ){
			swal({
		           text: "제한 체중(60kg)을 초과하였습니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		     });
			$("input[name=dogWeight]").val('60');
// 			$("input[name=dogWeight]").val($("input[name=dogWeight]").val().toString().substring(0,6));
// 			$("span[name=dogWeight]").text('6자까지 입력할 수 있습니다.');
		}else if($("input[name=dogWeight]").val().length > 6 ){
			swal({
		           text: "제한 길이를 초과하였습니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		     });
			$("input[name=dogWeight]").val($("input[name=dogWeight]").val().toString().substring(0,6));
		}else{
			$("span[name=dogWeight]").text('');
		}
	});

	$( "input[name=dogPay]" ).keyup(function( ) {
		$(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));        	 

		if(parseInt( removeCommas($(this).val())) > 300000 ){
			swal({
		           text: "제한 금액(30만원)을 초과하였습니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		     });
// 			$("span[name=dogPay]").text('100만원 이상은 입력하실 수 없습니다.');
			$(this).val('300000');
			$(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));  
		}else{
			$("span[name=dogPay]").text('');
		}
	});
	
	$( "input[name=dogStatus]" ).keyup(function( ) {
		if($("input[name=dogStatus]").val().length > 20 ){
			swal({
		           text: "제한 길이를 초과하였습니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		     });
			$("input[name=dogStatus]").val($("input[name=dogStatus]").val().toString().substring(0,20));
// 			$("span[name=dogStatus]").text('20자까지 입력할 수 있습니다.');
		}else{
			$("span[name=dogStatus]").text('');
		}
	});
	
	$( "input[name=dogPersonality]" ).keyup(function( ) {
		if($("input[name=dogPersonality]").val().length > 20 ){
			swal({
		           text: "제한 길이를 초과하였습니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		     });
			$("input[name=dogPersonality]").val($("input[name=dogPersonality]").val().toString().substring(0,20));
// 			$("span[name=dogPersonality]").text('20자까지 입력할 수 있습니다.');
		}else{
			$("span[name=dogPersonality]").text('');
		}
	});

	$( "input[name=dogChar]" ).keyup(function( ) {
		if($("input[name=dogChar]").val().length > 20 ){
			swal({
		           text: "제한 길이를 초과하였습니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		     });
			$("input[name=dogChar]").val($("input[name=dogChar]").val().toString().substring(0,20));
// 			$("span[name=dogChar]").text('20자까지 입력할 수 있습니다.');
		}else{
			$("span[name=dogChar]").text('');
		}
	});
	
	$( "textarea[name=postContent]" ).keyup(function( ) {
		if($("textarea[name=postContent]").val().length > 100 ){
			swal({
		           text: "제한 길이를 초과하였습니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		     });
			$("textarea[name=postContent]").val($("textarea[name=postContent]").val().toString().substring(0,100));
// 			$("span[name=postContent]").text('100자까지 입력할 수 있습니다.');
		}else{
			$("span[name=postContent]").text('');
		}
	});

	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■      ↑  글자수체크           ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	// 등록버튼 누르고
	function fncAddAdopt(){
		
		  if( $("input:checkbox:checked").length != 3){
			  swal({
		           text: "안내를 모두 확인하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
				   
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   $("input[name=terms]:checkbox").prop('checked', false).focus();
		           }
		      });

			  return;
		  }
		  
		  if( $("input[name=postTitle]").val().trim() == '' || $("input[name=postTitle]").val().length <1){
			  swal({
		           text: "제목을 입력하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
				   
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   $("input[name=postTitle]").focus();
		           }
		      });
			  
			  return;
		  }
		  
		  if($("input[name=dogBreed]").val().trim() == '' || $("input[name=dogBreed]").val().length <1){
			  swal({
		           text: "견종을 입력하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
				   
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   $("input[name=dogBreed]").focus();
		           }
		      });
			  
			  return;
		  }
		  
		  if( $(".preview-box").length == 0 ){
			  swal({
		           text: "사진을 한 장 이상 등록하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   jQuery($("input[name=phone]"))[0].scrollIntoView(true);
		           }
		      });
			  return;
		  }
		  
		  if( $("input[name=dogWeight]").val().trim() == '' || $("input[name=dogWeight]").val().length < 1 ){
			  swal({
		           text: "체중을 입력하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
				   
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   $("input[name=dogWeight]").focus();
		           }
		      });
// 			  $("input[name=dogWeight]").focus();
			  return;
		  }
		  if( removeCommas( $("input[name=dogPay]").val() ).trim() == '' || removeCommas( $("input[name=dogPay]").val() ).length < 1 ){
			  swal({
		           text: "책임비를 입력하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
				   
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   $("input[name=dogPay]").focus();
		           }
		      });
// 			  $("input[name=dogPay]").focus();
// 			  removeCommas($(this).val())
			  return;
		  } else {
			  $("input[name=dogPay]").val(  removeCommas( $("input[name=dogPay]").val() )  );
		  }
		  
		  if( $("input[name=dogDate]").val().trim() == '' || $("input[name=dogDate]").val().length < 1 ){
			  swal({
		           text: "발견일을 선택하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
				   
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   $("input[name=dogDate]").focus();
		           }
		      });
// 			  $("input[name=dogDate]").focus();
			  return;
		  }
		  
		  if( $("input[name=dogStatus]").val().trim() == '' || $("input[name=dogStatus]").val().length < 1 ){
			  swal({
		           text: "강아지 상태를 입력하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
				   
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   $("input[name=dogStatus]").focus();
		           }
		      });
// 			  $("input[name=dogStatus]").focus();
			  return;
		  }
		  if( $("input[name=dogPersonality]").val().trim() == '' || $("input[name=dogPersonality]").val().length < 1 ){
			  swal({
		           text: "강아지 성격을 입력하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
				   
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   $("input[name=dogPersonality]").focus();
		           }
		      });
// 			  $("input[name=dogPersonality]").focus();
			  return;
		  }
		  if( $("input[name=dogChar]").val().trim() == '' || $("input[name=dogChar]").val().length < 1 ){
			  swal({
		           text: "강아지 특징을 입력하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
				   
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   $("input[name=dogChar]").focus();
		           }
		      });
// 			  $("input[name=dogChar]").focus();
			  return;
		  }
		  if( boardCode == 'AD' ){
			  if( $("input[name=adoptArea]").val().trim() == ''){
				  swal({
			           text: "분양가능지역을 선택하세요.",
			           dangerMode: true,
			           buttons: {
								 catch: {
								 	text: "확인"
								 }
					   },
					   
			      }).then((willDelete) => {
			           if (willDelete) {
			        	   jQuery($("#areaFocus"))[0].scrollIntoView(true);
			           }
			      });
				  return;
			  }
		  }
		  if( $("input[name=location]").val().trim() == ''){
			  swal({
		           text: "발견위치를 선택하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
				   
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   jQuery($("input[name=areaKr]"))[0].scrollIntoView(true);
		           }
		      });

			  return;
		  }
		  if( $("textarea[name=postContent]").val().trim() == '' || $("textarea[name=postContent]").val().length < 1 ){
			  swal({
		           text: "내용을 입력하세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
				   
		      }).then((willDelete) => {
		           if (willDelete) {
		        	   $("textarea[name=postContent]").focus();
		           }
		      });
			  
// 			  $("textarea[name=postContent]").focus();
			  return;
		  }

		  
	    //============= 다중파일업로드 AJAX =============
	    	
	   	  var file = $("#multiFile").val(); 
		
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
			                	swal({
			     		           text: "jpg, gif, png, jpeg 확장자만 등록 가능합니다.",
			     		           dangerMode: true,
			     		           buttons: {
			     							 catch: {
			     							 	text: "확인"
			     							 }
			     				   },
			     		    	 });
// 			                    alert('jpg, gif, png, jpeg 확장자만 업로드 가능합니다.');
			                    // 이후 동작 ...
			                } else if (result === -2) {
			                	swal({
			     		           text: "파일이 10MB를 초과하였습니다.",
			     		           dangerMode: true,
			     		           buttons: {
			     							 catch: {
			     							 	text: "확인"
			     							 }
			     				   },
			     		    	 });
// 			                    alert('파일이 10MB를 초과하였습니다.');
			                    // 이후 동작 ...
			                } else {
// 			                    alert('이미지 업로드 성공');
			                }
		            },
					error: function(request, status, error){ 
						console.log("이미지 code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
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
			
			$( "input[name=dogDate]" ).datepicker({
				showOn: "button",
				buttonImage: "/resources/file/others/calendar.png",
				buttonImageOnly: true,
				buttonText: "Select date",
				dateFormat: "yy-mm-dd",
				maxDate: "+0d",
				prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년'
			});
			$('.ui-datepicker-trigger').attr('title','클릭')
			$('#dogDateLabel').after( $( ".ui-datepicker-trigger" ));
	 });	
      
      
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"
    async defer></script>
  

  
  </body>
</html>