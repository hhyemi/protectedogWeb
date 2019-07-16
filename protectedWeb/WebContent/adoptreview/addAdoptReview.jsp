<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
<title> 경로 테스트</title>
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
        #map {
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
	
// 		$(function() {
// 			$( "button" ).on("click" , function() {
// 				alert( $('#pop').text().trim() );
// 			});
// 	  	});
  	
	
		 $(function() {
			$( "button:contains('등록')" ).on("click" , function() {
				fncAddApply();
			});
			
			$( "button:contains('보호할개')" ).on("click" , function() {
				self.location = "../index.jsp"
			});
		});	
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
// 				$("form")[0].reset();
				alert("글 등록 취소 -> 목록으로")
			});
		});	
	
		
		function fncAddApply() {
// 			alert("등록완료 dialog")
			$("form").attr("method" , "POST").attr("action" , "/adoptreview/addAdoptReview").submit();
		}
		
		
	</script>		

</head>

<body>




	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<button type="button" class="btn btn-primary">보호할개</button>
	
		<h1 class="bg-primary text-center">경로테스트</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="id" value="user03" >
		<input type="hidden" name="nickName" value="안녕" >
		<input type="hidden" name="boardCode" value="AR" >
		
		  




		  <div class="form-group">
		    <label for="postTitle" class="col-sm-offset-1 col-sm-3 control-label">글제목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="postTitle" name="postTitle" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="postContent" class="col-sm-offset-1 col-sm-3 control-label">글내용</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="postContent" name="postContent">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="route" class="col-sm-offset-1 col-sm-3 control-label">루트</label>
		    <div class="col-sm-4">
		    <div id="map" style="width: 600px; height: 400px;"></div>
		      <input type="text" class="form-control" id="route" name="route">
		      <span id="pop"></span>
		    </div>
		    <p></p>
		  </div>
		  
		  &nbsp;
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취소</a>
			</div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  	<script>
	  	
	  	
	  	  var poly;
	      var map;
	      var markers = [];
          var infowindowF;
          var infowindowL;

	      function initMap() {
	    	  
		        map = new google.maps.Map(document.getElementById('map'), {
			        zoom: 15,
			        center: {lat: 37.564, lng:  127.0017} 
		        });
	
		        poly = new google.maps.Polyline({
			        strokeColor: '#000000',
			        strokeOpacity: 0.5,
			        strokeWeight: 5,
			        map: map
		        });
		        
		        infowindowF = new google.maps.InfoWindow();
		        infowindowL = new google.maps.InfoWindow();
		        
		        map.addListener('click', addLatLng);
	      }

	      
	      function addLatLng(event) {
	    	  
		        if (markers.length <5){
		        	 
		        	var path = poly.getPath();
		 	        path.push(event.latLng);
		 	        
		       		var marker = new google.maps.Marker({
				        position: event.latLng,
				        title: '#' + path.getLength(),
				        map: map
		       		});
		       		markers.push(marker);
		       		
		        	$( "#route ").val(  $( "#route ").val()+ event.latLng.toString()+"#"  );
		        	
		        	// pop up
		        	infowindowF.setContent("출발");
		 	        infowindowF.open(map, markers[0]);
		 	        
		 	        if(markers.length > 1){
			        	infowindowL.setContent("도착");
			 	        infowindowL.open(map, marker);
			 	        
// 			 	        if(infowindowL.getPosition() != undefined){
// 				        	infowindowL.setContent("도착");
// 				 	        infowindowL.open(map, marker);
// 			 	        }
		 	        }
		        	
		        }else{
			        alert("5개까지 지정 가능함 dialog 추가");
			    }
		        
		       
		        if (marker != undefined){
		        	
		            marker.addListener('rightclick', function() {
		            	
						for (var i = 0; i < markers.length; i++) {
					    	if (markers[i] === marker) {
								markers[i].setMap(null);
								markers.splice(i, 1);
				
								poly.getPath().removeAt(i);
					    	}
						}
						
						var test = "";
						
				    	for (var i = 0; i < markers.length; i++) {
				    		test += markers[i].position+"#";
				    		
				    		//pop up
				        	infowindowF.setContent("출발");
				 	        infowindowF.open(map, markers[0]);
				 	        
				 	        infowindowL.setContent("도착");
				 	        infowindowL.open(map, markers[markers.length-1]);
					 	}
				    	
				    	$( "#route ").val(  test  );
					 	
		            });
		        }
	      }
	      
 	 </script>
  
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"
    async defer></script>
  
  
</body>

</html>