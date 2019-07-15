<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Complex Polylines</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  	<script type="text/javascript">
  	$(function() {
		  $( "button" ).on("click" , function() {
			
			  alert( $('#pop').text().trim() );
		  });
  	});
  </script>
  </head>
  <body>
    <div id="map" style="width: 600px; height: 400px;"></div>
    
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>

      // This example creates an interactive map which constructs a polyline based on
      // user clicks. Note that the polyline only appears once its path property
      // contains two LatLng coordinates.

      var poly;
      var map;
      var markers = [];

      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
	        zoom: 13,
	        center: {lat: 37.564, lng:  127.0017}  // Center the map on Chicago, USA.
        });

        poly = new google.maps.Polyline({
	        strokeColor: '#000000',
	        strokeOpacity: 1.0,
	        strokeWeight: 3,
	        map: map
        });
//         poly.setMap(map);

        // Add a listener for the click event
        map.addListener('click', addLatLng);
      }

      
      // Handles click events on a map, and adds a new point to the Polyline.
      function addLatLng(event) {
    	  
	        
	        
	        $( '#maptest' ).html(  event.latLng.toString()   );
	
	        // Add a new marker at the new plotted point on the polyline.
	         if (markers.length <5){
	        	 
	        	 var path = poly.getPath();
// 	 	        var infowindow = new google.maps.InfoWindow();
	 	        // Because path is an MVCArray, we can simply append a new coordinate
	 	        // and it will automatically appear.
	 	        path.push(event.latLng);
	        var marker = new google.maps.Marker({
		        position: event.latLng,
		        title: '#' + path.getLength(),
		        map: map
	        });
	        $( "#pop ").append(  event.latLng.toString()+"#<br>"  );
	         }else{
		        	alert("5개까지 지정 가능함");
		        }
	        
	        
// 	        infowindow.setContent("여기요");
// 	        infowindow.open(map, marker);
	        
	        markers.push(marker);

	        if (marker != undefined){
	        	
	            marker.addListener('rightclick', function() {
	            	
					for (var i = 0; i < markers.length; i++) {
					
				       if (markers[i] === marker) {
				           markers[i].setMap(null);
				           markers.splice(i, 1);
			
				           poly.getPath().removeAt(i);
				       }
			 	  	}
	            });
	        }
      }
      
      
      
      $( "button:contains('등록')" ).on("click" , function() {
    	  $("form").attr("method" , "POST").attr("action" , "/product/mapTest").submit();
	  });
    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"
    async defer></script>
    <span id="pop"></span>
    <button type="button" class="btn btn-primary"  >등록</button>
  </body>
</html>
