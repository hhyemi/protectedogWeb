<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>Update Adopt</title>
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
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		 $(function() {
			$( "button:contains('수정')" ).on("click" , function() {
				fncAddUser();
			});
			
			$( "button:contains('보호할개')" ).on("click" , function() {
				self.location = "../index.jsp"
			});
		});	
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
// 				$("form")[0].reset();
				alert("글 등록 취소 -> getAdopt")
				$("form").attr("method" , "POST").attr("action" , "/adopt/getAdopt?postNo=${adopt.postNo}").submit();
			});
		});	
	
		
		function fncAddUser() {
			$("form").attr("method" , "POST").attr("action" , "/adopt/updateAdopt").submit();
		}
		
		
	</script>	
	
	
		

</head>

<body>




	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<button type="button" class="btn btn-primary">보호할개</button>
	
	
		<h1 class="bg-primary text-center">
			<c:if test="${adopt.boardCode eq 'AD' }">
	  			분양글 수정
	  		</c:if>
		    <c:if test="${adopt.boardCode eq 'MS' }">
	  			실종글 수정
	  		</c:if>
		
		</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="boardCode" value=" ${ adopt.boardCode.trim() }" >
		<input type="hidden" name="postNo" value=" ${ adopt.postNo }" >
		
		  <div class="form-group">
		    <label for="postTitle" class="col-sm-offset-1 col-sm-3 control-label">글제목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="postTitle" name="postTitle" value="${ adopt.postTitle }" placeholder="글제목"  >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="postContent" class="col-sm-offset-1 col-sm-3 control-label">글내용</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="postContent" name="postContent" value="${ adopt.postContent }" placeholder="글내용">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone"  value="${ adopt.phone }" placeholder="연락처">
		     <span id="pwdTest" > </span>
		    </div>
		  </div>
		  
		  <c:if test="${adopt.boardCode eq 'AD' }">
			  <div class="form-group">
			    <label for="adoptArea" class="col-sm-offset-1 col-sm-3 control-label">분양가능지역</label>
			    <div class="col-sm-4">
			    <div id="mapArea" style="width: 600px; height: 300px;"  align="center"></div>
			    <span id="pop"></span>
			      <input type="textbox" style=" width: 600px;" class="form-control" id="adoptArea" name="adoptArea" placeholder="3개까지 선택가능합니다.">
			      <button >dd</button>
			    </div>
			  </div>
		  </c:if>
		  
		  
		   <div class="form-group">
		    <label for="location" class="col-sm-offset-1 col-sm-3 control-label">
				<c:if test="${adopt.boardCode eq 'AD' }">
		  			발견위치
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			실종위치
		  		</c:if>
			</label>
		    <div class="col-sm-4">
		      <div id="map" style="width: 600px; height: 300px;"  align="center"></div>
			  <p>마우스로 위치를 지정하세요. 우클릭시 마커가 사라집니다.</p>
		      <input type="hidden" class="form-control" id="location" name="location" value="${ adopt.location }" placeholder="위치">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogBreed" class="col-sm-offset-1 col-sm-3 control-label">견종</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogBreed" name="dogBreed" value="${ adopt.dogBreed }" placeholder="견종">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogWeight" class="col-sm-offset-1 col-sm-3 control-label">무게</label>
		    <div class="col-sm-4">
		      <input type="number" class="form-control" id="dogWeight" name="dogWeight" value="${ adopt.dogWeight }" step="any"  >
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
		    <label for="dogPay" class="col-sm-offset-1 col-sm-3 control-label">
				<c:if test="${adopt.boardCode eq 'AD' }">
		  			책임비
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			사례비
		  		</c:if>
			</label>
		    <div class="col-sm-4">
		      <input type="number" class="form-control" id="dogPay" name="dogPay"  value="${ adopt.dogPay }" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogStatus" class="col-sm-offset-1 col-sm-3 control-label">개상태</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogStatus" name="dogStatus" value="${ adopt.dogStatus }" placeholder="개상태">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogChar" class="col-sm-offset-1 col-sm-3 control-label">외모특징</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogChar" name="dogChar" value="${ adopt.dogChar }" placeholder="외모특징">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogPersonality" class="col-sm-offset-1 col-sm-3 control-label">성격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogPersonality" name="dogPersonality" value="${ adopt.dogPersonality }" placeholder="성격">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogDate" class="col-sm-offset-1 col-sm-3 control-label">
			    <c:if test="${adopt.boardCode eq 'AD' }">
		  			발견일자
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			실종일자
		  		</c:if>
		    </label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="dogDate" name="dogDate" placeholder="발견실종일자">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
			</div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>

//       var mapArea;
//       var markersArea = [];

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
  	    
  	   		var aaa = "";
  	    
  	   		for ( i=0; i<arrayTest.length; i++){
  	    	
	  		    markerArea= arrayMark[i];
	  		
	  		    markerArea = new google.maps.Marker({
	  		        position: { lat: parseFloat(arrayTest[i].substring( 0, arrayTest[i].indexOf(",") ))  ,
	  		    			lng: parseFloat(arrayTest[i].substring( arrayTest[i].indexOf(",")+1, arrayTest[i].length )) },
	  		        map: mapArea
	  		    });
	  		    
	  		 	markersArea.push(markerArea);
	  		 	
	    		$.ajax({ url:'https://maps.googleapis.com/maps/api/geocode/json?latlng='+arrayTest[i]+'&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&sensor=true',
	  	            success: function(data){
	  	            	aaa += data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length)+", ";
	  	                $('#pop').text(aaa);
	  	            }
	  	 		});
    		 	
  	  		}//$('#pop').text(aaa);
	
	        mapArea.addListener('click', function(event) {
	            	addMarker(event.latLng, "aaa");
	        });
	        
	        mapArea.addListener('rightclick', function() {
// 	        	alert(markersArea);
	        	for (var i = markersArea.length-1; i >=0; i--) {
	        		markersArea[i].setMap(null);
	        		markersArea.splice(i, 1 );
	            }
	        	$('#pop').text('');
           });
    	}
	///////////////////////////////////////////////////////////////////////////
	
	    	var centerLoca = {lat: localat, lng: localng};
	
	        map = new google.maps.Map(document.getElementById('map'), {
	          zoom: 13,
	          center: centerLoca
	        });
	        
	        marker = new google.maps.Marker({
	            position: centerLoca,
	            map: map
	        });
	        markers.push(marker);
	
	        map.addListener('click', function(event) {
	        	addMarker(event.latLng, "a");
	        });
        
      }
      
      var str = "";
      var mmm = "";
    
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
	  			   		 mmm="";
	  			   		 
	  			   		 for (var i = 0; i < markersArea.length; i++) {
	  			   			mmm += markersArea[i].position+"#" ;
	  			   			$("#adoptArea").val(mmm);
	  			   			
	  			  		 	// 역지오코딩 //
	  		    	        var localat = parseFloat(  markersArea[i].position.toString().substring( markersArea[i].position.toString().indexOf("(")+1 ,markersArea[i].position.toString().indexOf(",") )  );
	  				 	    var localng = parseFloat(  markersArea[i].position.toString().substring( markersArea[i].position.toString().indexOf(",")+1, markersArea[i].position.toString().indexOf(")") )  );
	  		    	        $.ajax({ url:'https://maps.googleapis.com/maps/api/geocode/json?latlng='+localat+","+localng+'&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&sensor=true',
	  		    	            success: function(data){
//	  		   	              			 	  $('p').text(JSON.stringify(data));
	  		    	           				  markTest+= data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length)+", ";
	  		    	          				  $("#pop").text(markTest);
	  		    	            }
	  		    	 		});
	  				 	 }
	  		   		}
	
	  	        }else{
	  	        	alert("3개까지 지정 가능함");
	  	        }
	    		 ////////////////////////////////////////////////
	  	        if (markerArea != undefined){
	  	        	
	  	        	markerArea.addListener('rightclick', function() {
	  	        		mmm="";
						var markTest="";
	  					for (var i = 0; i < markersArea.length; i++) {
	  						markTest="";
	  						$("#pop").val(markTest);
	  				       if (markersArea[i].position === markerArea.position) {
			  				   markersArea[i].setMap(null);
			  				   markersArea.splice(i, 1 );
	  				       }else{
	  				       
	  				 		 // 역지오코딩 //
	  		    	        var localat = parseFloat(  markersArea[i].position.toString().substring( markersArea[i].position.toString().indexOf("(")+1 ,markersArea[i].position.toString().indexOf(",") )  );
	  				 	    var localng = parseFloat(  markersArea[i].position.toString().substring( markersArea[i].position.toString().indexOf(",")+1, markersArea[i].position.toString().indexOf(")") )  );
	  		    	        mmm += markersArea[i].position+"#";
	  		    	      $("#adoptArea").val(mmm);
	  				 		 $.ajax({ url:'https://maps.googleapis.com/maps/api/geocode/json?latlng='+localat+","+localng+'&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&sensor=true',
	  		    	            success: function(data){
	  		//    	                 alert(JSON.stringify(data));
	  		//    	                 alert(data.results[0].formatted_address);
	  		    	              	markTest += data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length)+"#";
	  		    	       			$("#pop").text(markTest);
	  		    	            }
	  		    	 		});  // markTest += markersArea[i].position;
	  			 	  	} //$("#pop").text(markTest);
	  					}$("#pop").text(markTest);
	  					$("#adoptArea").val(mmm);
	  	            });
	  	        	
}

  
		  	      	
	    	        
    	  }else if( str == "a"){
// 		    	if (marker != undefined){
		    		deleteMarkers();
// 		    	}
		    	
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
		                $('p').text(data.results[2].formatted_address.substring(5, data.results[2].formatted_address.length));
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