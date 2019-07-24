<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- KAKAO -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
<!-- <link href="/resources/css/others/animate.css" rel="stylesheet"> -->
<script type="text/javascript">
	$(function() {
		
		$("button:contains('추천')").on("click", function(){
				
			if(${sessionScope.user == null}){
				alert("로그인 하십쇼");
				return;
			}
			var postNo = "${board.postNo}" ;
			var id = '${sessionScope.user.id}';
			$.ajax({
				url : "/info/json/check/"+postNo+"/"+id,
				method : "POST",
				dataType : "Json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
					
					if(JSONData == 1){
						alert("이미 추천한 글입니다.");
						return;
					}
					
					if(JSONData == 0){
					$.ajax({
						url : "/info/json/updateRecommandCnt/"+postNo,
						method : "POST",
						dataType : "Json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							
							$(".minibox").children("div").children("span").remove();
							
							var result = "<span>"+JSONData.recommendCount+"</span>";
							
							$(".minibox").children("div").prepend(result);
						}
					});
					} // JSONDATA 0 END			
				}
			});
		
		});
		
		$("button:contains('비추천')").on("click", function(){
			alert("비추천기능추가");
		});
		
		$("button:contains('수정')").on(
				"click",
				function() {
					//alert($("input[type='hidden']").val());
					// 			$(self.location).attr("href","/community/updateInfo.jsp");
					self.location = "/info/updateView?postNo="
							+ $("input[name='postNo']").val();
				});

		$("button:contains('삭제')").on(
				"click",
				function() {

					var result = confirm("정말 삭제 하시겠습니까?");

					if (result) {
						$("form[name='info']").attr("method", "POST").attr(
								"action", "/info/delInfo").attr("enctype",
								"multipart/form-data").submit();
					}
				});
	});
</script>
<style type="text/css">
body {
	position: relative;
}

.container {
	font-size: 14px;
}

.content {
	text-align: left;
	width: 720px;
	min-height: 400px;
}

.button {
	position: relative;
}

.goto-here {
	padding: 0px;
}
.minibox{
	padding : 1px solid black;
}
</style>
</head>

<body>
	
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	
	<div class="container">
		
		<form name="info">
			<input type="hidden" name="postNo" value="${board.postNo}" />

			<h3>
				<b>${board.postTitle}</b>
			</h3>

			<div class="row" style="position: relative; height: 25px;">
				<div class="col-md-8"
					style="position: absolute; left: 0px; bottom: 0px;">${board.nickName}(${board.id})
					| ${board.regDate}</div>
				<div class="col-md-4" align="right"
					style="position: absolute; right: 0px; bottom: 0px;">조회수 :
					${board.viewCount} 추천수 : ${board.recommendCount} 댓글수 :
					${totalCount}</div>
			</div>
			<p />

			<hr />

			<div class="content">${board.postContent}</div>

			<br />
			
			        
        	<div id="mapDiv"  class="col-md-12 ">	
		  		<div id="mapArea" style="width: wrap; height: 300px;"  align="center"></div>
		  	</div>

		</form>
		
				  	
		  	<br />
		  	<p />
		  	
		<div class="minibox" align="center">
			<div>
				<span>${board.recommendCount}</span>
				<button type="button" class="recommand btn btn-primary">추천</button>
				<br/>
				<p/>
				<br/>
				<a href="#"  id="twitter"  title="트위터로 공유"><img src="/resources/file/others/twitter.png"></a>
				<a href="#" id="facebook" title="페이스북으로 공유"><img src="/resources/file/others/facebook.png"></a>
				<a href="#"  id="naver" title="네이버로 공유"><img src="/resources/file/others/naver.png"></a>
				<a href="#"  id="kakao" title="카카오톡으로 공유"> <img src="/resources/file/others/kakao.png" ></a>
			</div>
		</div>

		<c:if test="${board.id == sessionScope.user.id }">
			<div class="button" align="right">
				<button>수정</button>
				<button>삭제</button>
			</div>
		</c:if>
	</div>

	<jsp:include page="/common/comment.jsp"></jsp:include>

	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	
    var map;
    var markers = [];
    var loca = "${board.route}";
    var localat = parseFloat(  loca.substring( loca.indexOf("(")+1 ,loca.indexOf(",") )  );
    var localng = parseFloat(  loca.substring( loca.indexOf(",")+1, loca.indexOf(")") )  );
    var marker;
    
	var mapArea;
    var markerArea;
    var adArea = "${board.route}";
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

//        map = new google.maps.Map(document.getElementById('map'), {
//        	zoom: 15,
//        	center: {lat: localat, lng: localng}
//        });
       
//        marker = new google.maps.Marker({
//            position: {lat: localat, lng: localng},
//            map: map
//        });

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
	
	//============= SNS공유 Event  처리 =============	
	$( "#twitter" ).on("click" , function() {
 		 window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');
		});		
	
	$( "#naver" ).on("click" , function() {
 		 window.open('https://share.naver.com/web/shareView.nhn?url='+encodeURIComponent(document.URL)+'&title=hyemi!', 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');
		});		
	
	$( "#facebook" ).on("click" , function() {
 		 window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
		});			
	
	$( "#kakao" ).on("click" , function() {
		sendLinkKakao()
	});	
	
  //============= 카카오 공유하기Event  처리 =============		
	 Kakao.init('153d14a106a978cdc7a42f3f236934a6');
	 function sendLinkKakao(){
	     Kakao.Link.sendDefault({
	       objectType: 'feed',
	       content: {
	         title: '${board.postTitle}',
	         description: '${board.nickName} 님의 작성글 입니다.',
	         imageUrl:document.location.href,
	         link: {
	           mobileWebUrl: document.location.href,
	           webUrl:document.location.href
	         }
	       },
	       buttons: [       
	         {
	           title: '링크 열기',
	           link: {
	             mobileWebUrl: document.location.href,
	             webUrl: document.location.href
	           }
	         }
	       ]
	     }); 
	 }    
	 
     }
     
	</script>
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap" async defer></script>
</body>
</html>
