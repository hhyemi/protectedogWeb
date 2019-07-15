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
  </head>
<body>
    <div id="map" style="width: 600px; height: 400px;"></div>
    <p>마우스로 위치를 지정하세요. 우클릭시 마커가 사라집니다.</p>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>

      // In the following example, markers appear when the user clicks on the map.
      // The markers are stored in an array.
      // The user can then click an option to hide, show or delete the markers.
      var map;
      var markers = [];

      function initMap() {
        var haightAshbury = {lat: 37.564, lng: 127.0017};

        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: haightAshbury
        });

        // This event listener will call addMarker() when the map is clicked.
        map.addListener('click', function(event) {
        	addMarker(event.latLng);
        });
        

        // Adds a marker at the center of the map.
        addMarker(haightAshbury);
      }
      var marker;
      

      // Adds a marker to the map and push to the array.
      function addMarker(location) {
    	if (marker != undefined){
    		deleteMarkers();
    	}
    	
    	
        marker = new google.maps.Marker({
          position: location,
          map: map
        });
        markers.push(marker);
        $( '#maptest' ).text(location);
        
        if (marker != undefined){
            marker.addListener('rightclick', function() {
            	deleteMarkers();
           });
        }

      }

      // Sets the map on all markers in the array.
      function setMapOnAll(map) {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(map);
        }
      }


      // Deletes all markers in the array by removing references to them.
      function deleteMarkers() {
    	setMapOnAll(null);
        markers = [];
      }
      
      

      
      
      
    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"
    async defer></script>
    <span id="maptest">왜안돼</span>
  </body>
</html>
