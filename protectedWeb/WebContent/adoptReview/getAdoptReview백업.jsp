<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>GET ADOPTREVIEW</title>
<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- KAKAO -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
<!-- <link href="/resources/css/others/animate.css" rel="stylesheet"> -->
<script type="text/javascript">

		

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

/* .button { */
/* 	position: relative; */
/* } */

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
				<div class="col-md-8" style="position: absolute; left: 0px; bottom: 0px;">
					${board.nickName}(${board.id}) | ${board.regDate}
				</div>
				<div class="col-md-4" align="right"style="position: absolute; right: 0px; bottom: 0px;">
					조회수 :${board.viewCount}  댓글수 :${totalCount}
				</div>
			</div>
			<p />

			<hr />

			<div class="content">${board.postContent}</div>

			<br />
			
			        
        	<div id="mapDiv"  class="col-md-12 ">	
		  		<div id="mapArea" style="width: wrap; height: 300px;"  align="center"></div>
		  	</div>

		</form>
		
		<c:if test="${ sessionScope.user.id eq board.id }">
				<button class="main_btn" style="width: 189px" id="modiButton">수정</button>
	       		<button class="main_btn" style="width: 189px" id="delButton">삭제</button>
		</c:if>
				  	
		  	<br />
		  	<p />
		  	
		<div class="minibox" align="center">
			<div>
				<br/>
				<p/>
				<br/>
				<a href="#"  id="twitter"  title="트위터로 공유"><img src="/resources/file/others/twitter.png"></a>
				<a href="#" id="facebook" title="페이스북으로 공유"><img src="/resources/file/others/facebook.png"></a>
				<a href="#"  id="naver" title="네이버로 공유"><img src="/resources/file/others/naver.png"></a>
				<a href="#"  id="kakao" title="카카오톡으로 공유"> <img src="/resources/file/others/kakao.png" ></a>
			</div>
		</div>

		
	</div>

<%-- 	<jsp:include page="/common/comment.jsp"></jsp:include> --%>

	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script type="text/javascript">

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
	     		title: '유기견보호',
	     		description: '멍멍',
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
	 
  //==================================================
	 
	  
	$( "button:contains('수정')" ).on("click" , function() {
		self.location = "/adoptReview/updateAdoptReview?postNo=${board.postNo}";
	});
	  
	$( "button:contains('삭제')" ).on("click" , function() {
		console.log("삭제클릭");
		self.location = "/adoptReview/delAdoptReview?postNo=${board.postNo}";
	});
     
  
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap" async defer></script>

</body>
</html>
