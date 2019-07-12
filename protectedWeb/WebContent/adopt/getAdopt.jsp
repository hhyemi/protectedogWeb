<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>Get Adopt</title>
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
 		body {
            padding-top : 50px;
        }
        
        /*   ↓↓↓ 지도관련   ↓↓↓   */
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
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('수정')" ).on("click" , function() {
					self.location = "/adopt/updateAdopt?postNo=${adopt.postNo}"
			});
			
			 $( "button:contains('삭제')" ).on("click" , function() {
				 	alert("삭제하시겠습니까 dialog 추가");
					self.location = "/adopt/updateStatusCode?postNo=${adopt.postNo}"
			});
			
			 $( "button:contains('신청')" ).on("click" , function() {
					self.location = "../apply/getTerms.jsp?postNo=${adopt.postNo}"
			});
			
			 $( "button:contains('목록')" ).on("click" , function() {
					self.location = "/adopt/listAdopt?boardCode=${adopt.boardCode}"
			});
			
			 $( "button:contains('신청글보기')" ).on("click" , function() {
					self.location = "/apply/listApply?adoptNo=${adopt.postNo}"
			});
			
			 $( "button:contains('보호할개')" ).on("click" , function() {
					self.location = "../index.jsp"
			});
		 
		});
		
		
		 $(function() {			
				$( "button:contains('분양완료'), button:contains('찾기완료')" ).on("click" , function() {
					var postNo = ${adopt.postNo};
					alert(typeof postNo);

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
										$( '#complete' ).text('완료됨');
									},
									error: function(request, status, error){ 
										alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
							        }
						});
				});	
			
		 });
		
// 		function fncAddUser() {
// 			self.location = "/adopt/listAdopt?boardCode=${adopt.boardCode}"
// 		}
		
	</script>
	
</head>

<body>

	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<button type="button" class="btn btn-primary">보호할개</button>
	
		<div class="page-header">
	       <h3 class=" text-info">
		        <c:if test="${adopt.boardCode eq 'AD' }">
		  			분양글 상세조회
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			실종글 상세조회
		  		</c:if>
	       </h3>
	    </div>
	    <input type="hidden" name="postNo" value=" ${ adopt.postNo }" >
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>게시판코드</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.boardCode}</div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>글번호</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.postNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>아이디</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.id}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>글제목</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.postTitle}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>글내용</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.postContent}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>연락처</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.phone}</div>
		</div>
		
		<hr/>
		
		<c:if test="${adopt.boardCode eq 'AD' }">
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>분양가능지역</strong></div>
		  		<div id="mapArea" style="width: 600px; height: 300px;"  align="center"></div>
			    <span id="pop"></span>
				<div class="col-xs-8 col-md-4">
				${adopt.adoptArea1} <br/>
				${adopt.adoptArea2}<br/>
				${adopt.adoptArea3}<br/>
				</div>
			</div>
			
			<hr/>
		</c:if>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>
	  			<c:if test="${adopt.boardCode eq 'AD' }">
		  			발견위치
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			실종위치
		  		</c:if>
	  		</strong></div>
	  		<div id="map" style="width: 600px; height: 300px;"  align="center"></div>
	  		<input type="hidden" class="form-control" id="location" name="location" value="${adopt.location}">
			<div class="col-xs-8 col-md-4"><p></p></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>견종</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogBreed}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>무게</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogWeight}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>크기</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogSize}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>성별</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogGender}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>
				<c:if test="${adopt.boardCode eq 'AD' }">
		  			책임비
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			사례비
		  		</c:if>
			</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogPay}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>개상태</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogStatus}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>외모특징</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogChar}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>성격</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogPersonality}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>
	  			<c:if test="${adopt.boardCode eq 'AD' }">
		  			발견일자
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			실종일자
		  		</c:if>
	  		</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogDate}</div>
		</div>
		
		<hr/>

		<hr/>
		
		
	
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  		
	  			<c:if test="${adopt.statusCode eq '1' }">
		  			<button type="button" class="btn btn-primary">수정</button>
		  			<button type="button" class="btn btn-primary">삭제</button>
		  			<c:if test="${adopt.boardCode eq 'MS' }">
				  		<button type="button" class="btn btn-primary">찾기완료</button>
				  	</c:if>
	  			</c:if>
	  			<c:if test="${adopt.statusCode eq '2' }">
	  				<button type="button" class="btn btn-primary">분양완료</button>
	  				<button type="button" class="btn btn-primary">신청글보기</button>
	  			</c:if>
	  			<br/><br/>
	  			<button type="button" class="btn btn-primary">목록</button>
<%-- 	  			<c:if test="${user.role eq 'admin' }"> --%>
<!-- 	  				<button type="button" class="btn btn-default">목록</button> -->
<%-- 	  			</c:if> --%>

				<c:if test="${adopt.boardCode eq 'AD' && adopt.statusCode ne '3'}">
		  			<button type="button" class="btn btn-primary">입양신청</button>
		  		</c:if>
		  		<br/><br/>
		  		<span id="complete">${adopt.statusCode }</span>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>

      var map;
      var markers = [];
      var loca = "${adopt.location}";
      var localat = parseFloat(  loca.substring( loca.indexOf("(")+1 ,loca.indexOf(",") )  );
      var localng = parseFloat(  loca.substring( loca.indexOf(",")+1, loca.indexOf(")") )  );
//       console.log(  localat  );
//       console.log(   localng   );
      var marker;
      
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
        
        
       
        $.ajax({ url:'https://maps.googleapis.com/maps/api/geocode/json?latlng='+localat+","+localng+'&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&sensor=true',
            success: function(data){
//                 alert(JSON.stringify(data));
//                 alert(data.results[0].formatted_address);
//                 $('p').text(JSON.stringify(data));
                $('p').text(data.results[0].formatted_address.substring(5, data.results[0].formatted_address.length));
            }
 		});

//         addMarker(centerLoca);


 ////////////////////////////////////////////
 
 	  var adArea1 = "${adopt.adoptArea1}";
 	  var adArea2 = "${adopt.adoptArea2}";
 	  var adArea3 = "${adopt.adoptArea3}";
      var adArea1lat = parseFloat(  adArea1.substring( adArea1.indexOf("(")+1 ,adArea1.indexOf(",") )  );
      var adArea1lng = parseFloat(  adArea1.substring( adArea1.indexOf(",")+1, adArea1.indexOf(")") )  );
      var adArea2lat = parseFloat(  adArea2.substring( adArea2.indexOf("(")+1 ,adArea2.indexOf(",") )  );
      var adArea2lng = parseFloat(  adArea2.substring( adArea2.indexOf(",")+1, adArea2.indexOf(")") )  );
      var adArea3lat = parseFloat(  adArea3.substring( adArea1.indexOf("(")+1 ,adArea3.indexOf(",") )  );
      var adArea3lng = parseFloat(  adArea3.substring( adArea1.indexOf(",")+1, adArea3.indexOf(")") )  );
        mapArea = new google.maps.Map(document.getElementById('mapArea'), {
	    	zoom: 13,
	    	center: {lat: 37.564, lng: 127.0017}
        });

        mapArea.addListener('click', function(event) {
        	addMarker(event.latLng, "aaa");
        });
        //////////////////////////////////////////////
      }
      
//       var marker;
    
//       function addMarker(location) {
//     	if (marker != undefined){
//     		deleteMarkers();
//     	}
    	
//         marker = new google.maps.Marker({
//           position: location,
//           map: map
//         });
        
//         markers.push(marker);
//         $( '#location' ).val(location);
        
//         if (marker != undefined){
//             marker.addListener('rightclick', function() {
//             	deleteMarkers();
//            });
//         }
//       }

//       function setMapOnAll(map) {
//         for (var i = 0; i < markers.length; i++) {
//           markers[i].setMap(map);
//         }
//       }

//       function deleteMarkers() {
//     	setMapOnAll(null);
//         markers = [];
//       }
      
      
      ////////////////////////////////////////////////
      
      
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"
    async defer></script>

</body>

</html>