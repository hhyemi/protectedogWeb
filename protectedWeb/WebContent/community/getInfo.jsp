<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>보호할개 · 정보공유 조회</title>
<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- KAKAO -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/e26616618e.js"></script>

<!-- CSS -->
<style type="text/css">

body {position: relative;}
img{max-width: 600px;}

.content {text-align: left;width: 720px;min-height: 400px;}
.button {position: relative;}
.goto-here {padding: 0px;}
.minibox{padding : 1px solid black;}
.fa-medal{font-size: 15px;}

#recommand:hover{
	color: #f04f23;
}
</style>

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	
</head>

<body>
	
	<div class="container" style="padding-top: 30px">
		
		<form name="info">
			<input type="hidden" name="postNo" value="${board.postNo}" />
			<input type="hidden" name="boardCode" value="IS" />

			<h3>
				<b>${board.postTitle}</b>
			</h3>

			<div class="row" style="position: relative; height: 25px;">
				<div class="col-md-8"style="position: absolute; left: 0px; bottom: 0px;">${board.nickName}(${board.id})| ${board.regDate}</div>
				<div class="col-md-4" align="right" style="position: absolute; right: 0px; bottom: 0px;">조회수 :${board.viewCount} 추천수 : ${board.recommendCount} 댓글수 :${totalCount}</div>
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
				<span style="border: 1px solid black; padding: 3px">
					<span id="recommand" class="recommand fas fa-medal">추천</span>
					<span style="font-size: 15px;">${board.recommendCount}</span>
				</span>
				<p/>
				<div align="center">
		        	<a href="javascript:void(0);"  id="twitter"  title="트위터로 공유"><img src="/resources/file/others/twitter.png" height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
		            <a href="javascript:void(0);" id="facebook" title="페이스북으로 공유"><img src="/resources/file/others/facebook.png" height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
		            <a href="javascript:void(0);"  id="kakao" title="카카오톡으로 공유"> <img src="/resources/file/others/kakao.png"  height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
            	</div>
            	<br/>
				<p/>
				<br/>
			</div>
		</div>

		<c:if test="${board.id == sessionScope.user.id || sessionScope.user.role == 'admin'}">
			<div class="button" align="right">
				<button type="button" class="btn btn-default" style="width: 50px; height: 40px;">수정</button>
				<button type="button" class="btn btn-default" style="width: 50px; height: 40px;">삭제</button>
			</div>
		</c:if>
	</div>

	<jsp:include page="/common/comment.jsp"></jsp:include>

	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script type="text/javascript">

	$(function() {
		
		$("#recommand").on("click", function(){
				
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
							
							var result = "<span style='font-size: 15px; border: 1px solid black; padding: 3px'>"+JSONData.recommendCount+"</span>"
										+"<span class='recommand fas fa-medal'>HOT개로</span>";
							
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
					self.location = "/info/updateView?postNo="+ $("input[name='postNo']").val();
				});

		$("button:contains('삭제')").on("click",function() {
					
			swal({
				  title: "정말 삭제 하시겠습니까 ?",
				  text: "더 이상 이 글을 다른 회원이 볼 수 없습니다.",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true
				})
				.then((result) => {
				  if (result) {
					  
				    swal("삭제완료 !", {
				      	icon: "success",
				    }).then((value)=>{
				    	
				    	 self.location = "/info/delInfo?postNo="+ $("input[name='postNo']").val();
				    	 
						 //$("form[name=info]").attr("method", "POST").attr("action", "/info/delInfo").submit();
						 
				    });
				  }
				});
// 					var result = confirm("정말 삭제 하시겠습니까?");
				
// 					if (result) {
// 						$("form[name='info']").attr("method", "POST").attr(
// 								"action", "/info/delInfo").attr("enctype",
// 								"multipart/form-data").submit();
// 					}
		});
	});
	
    var poly;
    var map;
   var marker;
   var markers = [];
   var route = "${board.route}";
   var routeTest = [];
   var routeMark = [];
   var infowindowF;
   var infowindowL;
   
   
   if (route.indexOf("#") != -1){
      var routeArray = route.split("#");
      
      for ( i=0; i<routeArray.length-1; i++){
       routeTest[i] = routeArray[i].substring( routeArray[i].indexOf("(")+1, routeArray[i].indexOf(",") )+","+ (routeArray[i].substring( routeArray[i].indexOf(",")+1, routeArray[i].indexOf(")") )).trim() ;
       routeMark[i] = "marker"+i.toString();
      }        
   }
   
   function initMap() {
     map = new google.maps.Map(document.getElementById('mapArea'), {
           zoom: 16,
           center: { lat: parseFloat(routeTest[0].substring( 0, routeTest[0].indexOf(",") )   ) ,
                 lng: parseFloat(routeTest[0].substring( routeTest[0].indexOf(",")+1, routeTest[0].length )) }
    });
     
     poly = new google.maps.Polyline({
         strokeColor: '#000000',
         strokeOpacity: 0.5,
         strokeWeight: 5,
         map: map
      });
     
     infowindowF = new google.maps.InfoWindow();
      infowindowL = new google.maps.InfoWindow();
     
     var aaa = "";
     
     for ( i=0; i<routeTest.length; i++){
        
         var path = poly.getPath();

          path.push(new google.maps.LatLng(    parseFloat(routeTest[i].substring( 0, routeTest[i].indexOf(",") )),
                                  parseFloat(routeTest[i].substring( routeTest[i].indexOf(",")+1, routeTest[i].length ))));
//           console.log("확인 : "+centerLocaArea);
        marker= routeMark[i];
    
        marker = new google.maps.Marker({
            position: {lat: parseFloat(routeTest[i].substring( 0, routeTest[i].indexOf(",") )), 
             lng: parseFloat(routeTest[i].substring( routeTest[i].indexOf(",")+1, routeTest[i].length )) },
           title: '#' + path.getLength(),
           map: map
        });
        
        markers.push(marker);
     }
     
    // pop up
     infowindowF.setContent("출발");
      infowindowF.open(map, markers[0]);
      
      infowindowL.setContent("도착");
      infowindowL.open(map, markers[markers.length-1]);
   }

	
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
     
	</script>
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap" async defer></script>
</body>
</html>
