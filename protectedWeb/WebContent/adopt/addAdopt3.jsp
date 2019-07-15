<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
<title>Add Adopt</title>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
      body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
	/*   ↓↓↓ 지도관련   ↓↓↓   */
      #map {
        height: 100%;
      }
      #mapArea {
        height: 100%;
      }
      
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		 $(function() {
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
			
			$( "button:contains('보호할개')" ).on("click" , function() {
				self.location = "../index.jsp"
			});
			
			$( "button:contains('dd')" ).on("click" , function() {
				alert($('#pop').text());
			});
		});	
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
// 				$("form")[0].reset();
				alert("글 등록 취소 -> 목록으로")
			});
		});	
	
		
		function fncAddUser() {
			$("form").attr("method" , "POST").attr("action" , "/adopt/addAdopt").submit();
		}
		

	</script>		

</head>

<body>




	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<button type="button" class="btn btn-primary">보호할개</button>
	
		<h1 class="bg-primary text-center">
			<c:if test="${param.boardCode eq 'AD' }">
	  			분양글 등록
	  		</c:if>
		    <c:if test="${param.boardCode eq 'MS' }">
	  			실종글 등록
	  		</c:if>
		
		</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="boardCode" value=" ${ param.boardCode.trim() }" >
		<input type="hidden" name="id" value="user03" >
		<input type="hidden" name="statusCode" value="1" >
		
		  <div class="form-group" >
		    <label for="postTitle" class="col-sm-offset-1 col-sm-3 control-label">글제목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="postTitle" name="postTitle" placeholder="글제목"  >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="postContent" class="col-sm-offset-1 col-sm-3 control-label">글내용</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="postContent" name="postContent" placeholder="글내용">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" value="01121234567" placeholder="연락처">
		     <span id="pwdTest" > </span>
		    </div>
		  </div>
		  
		  <c:if test="${param.boardCode eq 'AD' }">
			  <div class="form-group">
			    <label for="adoptArea" class="col-sm-offset-1 col-sm-3 control-label">분양가능지역</label>
			    <div class="col-sm-4">
			    <div id="mapArea" style="width: 600px; height: 300px;"  align="center"></div>
			    <span id="pop"></span>
			      <input type="text" class="form-control" id="adoptArea" name="adoptArea" placeholder="3개까지 선택가능합니다.">
			      <button >dd</button>
			    </div>
			  </div>
		  </c:if>
		
<!-- 		  <br/><br/><br/><br/><br/> -->
		  
		  <div class="form-group">
		    <label for="location" class="col-sm-offset-1 col-sm-3 control-label">
				<c:if test="${param.boardCode eq 'AD' }">
		  			발견위치
		  		</c:if>
			    <c:if test="${param.boardCode eq 'MS' }">
		  			실종위치
		  		</c:if>
			</label>
		    <div class="col-sm-6">
		    
		<!-- 	■■■■■  위치 마커 찍기   ■■■■■	  -->
		      <div id="map" style="width: 600px; height: 300px;"  align="center"></div>
			  <p>마우스로 위치를 지정하세요. 우클릭시 마커가 사라집니다.</p>
		      <input type="hidden" class="form-control" id="location" name="location" placeholder="위치">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogBreed" class="col-sm-offset-1 col-sm-3 control-label">견종</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogBreed" name="dogBreed" placeholder="견종">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogWeight" class="col-sm-offset-1 col-sm-3 control-label">무게</label>
		    <div class="col-sm-4">
		      <input type="number" class="form-control" id="dogWeight" name="dogWeight" step="any"  >
		    </div>
		  </div>
	  
		  <div class="form-group">
		    <label for="dogSize" class="col-sm-offset-1 col-sm-3 control-label">크기</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="dogSize" id="dogSize">
				  	<option value="소형견" >소형견</option>
					<option value="중형견" >중형견</option>
					<option value="대형견" >대형견</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogGender" class="col-sm-offset-1 col-sm-3 control-label">성별</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="dogGender" id="dogGender">
				  	<option value="남아" >남아</option>
					<option value="여아" >여아</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogPay" class="col-sm-offset-1 col-sm-3 control-label">비용</label>
		    <div class="col-sm-4">
		      <input type="number" class="form-control" id="dogPay" name="dogPay" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogStatus" class="col-sm-offset-1 col-sm-3 control-label">개상태</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogStatus" name="dogStatus" placeholder="개상태">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogChar" class="col-sm-offset-1 col-sm-3 control-label">외모특징</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogChar" name="dogChar" placeholder="외모특징">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogPersonality" class="col-sm-offset-1 col-sm-3 control-label">성격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogPersonality" name="dogPersonality" placeholder="성격">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogDate" class="col-sm-offset-1 col-sm-3 control-label">
			    <c:if test="${param.boardCode eq 'AD' }">
		  			발견일자
		  		</c:if>
			    <c:if test="${param.boardCode eq 'MS' }">
		  			실종일자
		  		</c:if>
		    </label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="dogDate" name="dogDate" placeholder="발견실종일자">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
			</div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
	 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>

      var map;
      var mapArea;
      var markers = [];
      var markersArea = [];
      
      function initMap() {
	        mapArea = new google.maps.Map(document.getElementById('mapArea'), {
		    	zoom: 13,
		    	center: {lat: 37.564, lng: 127.0017}
	        });
	
	        mapArea.addListener('click', function(event) {
	        	addMarker(event.latLng, "aaa");
	        });
	  ///////////////////////////////////////////////////////////////////////////
	        map = new google.maps.Map(document.getElementById('map'), {
	        	zoom: 13,
	        	center: {lat: 37.564, lng: 127.0017}
	        });
	
	        map.addListener('click', function(event) {
	        	addMarker(event.latLng, "a");
	        });
      }
      
      
      var markerArea;
      var marker;
      var loca;
      var str = "";
/////////////////////////////////////////////////////////////////////////////////////////////
      function addMarker(location, str) {
    	  
    	  if ( str == "aaa"){
	    		 if (markersArea.length <3){
	  		        var markerArea = new google.maps.Marker({
	  			        position: location,
	  			        map: mapArea
	  		        });
	  		        
	  		     	markersArea.push(markerArea);
	  		   		 
	  		   		if(markersArea.length >0){
	  			   		 var markTest="";
	  			   		 for (var i = 0; i < markersArea.length; i++) {
// 	  			   			markTest += markersArea[i].position+"#" ;
	  			   			
	  			   			
	  			   	// 역지오코딩 //
	  		    	        var localat = parseFloat(  markersArea[i].position.toString().substring( markersArea[i].position.toString().indexOf("(")+1 ,markersArea[i].position.toString().indexOf(",") )  );
	  				 	    var localng = parseFloat(  markersArea[i].position.toString().substring( markersArea[i].position.toString().indexOf(",")+1, markersArea[i].position.toString().indexOf(")") )  );
	  		    	        $.ajax({ url:'https://maps.googleapis.com/maps/api/geocode/json?latlng='+localat+","+localng+'&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&sensor=true',
	  		    	            success: function(data){
	  		//    	                 alert(JSON.stringify(data));
	  		//    	                 alert(data.results[0].formatted_address);
	  		//    	                 $('p').text(JSON.stringify(data));
	  		
	  		    	               markTest+= data.results[0].formatted_address.substring(5, data.results[0].formatted_address.length)+"#";
// 	  		    	             alert(markTest);
	  		    	             $("#pop").text(markTest);
	  		    	            }
	  		    	 		});
	  				 	 }
// 	  			   		 alert(markTest);
// 	  		       		 $("#pop").text(markTest);
	  		   		}
	
	  	        }else{
	  	        	alert("3개까지 지정 가능함");
	  	        }
	    		 ////////////////////////////////////////////////
	  	        if (markerArea != undefined){
	  	        	markerArea.addListener('rightclick', function() {
// 	  	        		$("#pop").text('삭제');



	  					for (var i = 0; i < markersArea.length; i++) {
	  				       if (markersArea[i] === markerArea) {
			  				   markersArea[i].setMap(null);
			  				   markersArea.splice(i, 1 );
	  				       }
	  			 	  	} 
	  					var markTest="";
	  					for (var i = 0; i < markersArea.length; i++) {
	  				       
	  				       
	  				 		 // 역지오코딩 //
	  		    	        var localat = parseFloat(  markersArea[i].position.substring( markersArea[i].position.indexOf("(")+1 ,markersArea[i].position.indexOf(",") )  );
	  				 	    var localng = parseFloat(  markersArea[i].position.substring( markersArea[i].position.indexOf(",")+1, markersArea[i].position.indexOf(")") )  );
	  		    	        $.ajax({ url:'https://maps.googleapis.com/maps/api/geocode/json?latlng='+localat+","+localng+'&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&sensor=true',
	  		    	            success: function(data){
	  		//    	                 alert(JSON.stringify(data));
	  		//    	                 alert(data.results[0].formatted_address);
	  		//    	                 $('p').text(JSON.stringify(data));
	  		    	               markTest+= data.results[0].formatted_address.substring(5, data.results[0].formatted_address.length);
	  		    	             $("#pop").text(markTest);
	  		    	            }
	  		    	 		});
	  	    	        
// 	  		    	      markTest += markersArea[i].position;
	  			 	  	}// $("#pop").text(markTest);
	  			 	  	
	  	            });
	  	        }
	    	        
		  	      	
	    	        
    	  }else if( str == "a"){
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
		
		 	    var localat = parseFloat(  loca.substring( loca.indexOf("(")+1 ,loca.indexOf(",") )  );
		 	    var localng = parseFloat(  loca.substring( loca.indexOf(",")+1, loca.indexOf(")") )  );
		        
		        if (marker != undefined){
		           marker.addListener('rightclick', function() {
		            	deleteMarkers();
		           });
		        }
		        
		        // 역지오코딩 //
		        $.ajax({ url:'https://maps.googleapis.com/maps/api/geocode/json?latlng='+localat+","+localng+'&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&sensor=true',
		            success: function(data){
		//                 alert(JSON.stringify(data));
		//                 alert(data.results[0].formatted_address);
		//                 $('p').text(JSON.stringify(data));
		                $('p').text(data.results[0].formatted_address.substring(5, data.results[0].formatted_address.length));
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
      
      
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"
    async defer></script>
	
</body>

</html>