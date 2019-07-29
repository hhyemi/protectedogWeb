<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>

<html lang="ko">
<head>

<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>보호할개.애견상식</title>
<!-- jQuery JS -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	
	var cnt = 9;	
	var searchKeyword = '애견상식';
	var flag = false;
	
	$(document).ready(function(){
		fnGetList();
	});
	
	$(function () {
		$("button").on("click",function(){
			searchKeyword = $(this).text();
			fnGetList();
		});		
	});
	
	
	function fnGetList(sGetToken){
		
		console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+sGetToken);
		
// 			var $getval = $("#search_box").val();
		
// 			if($getval == ""){
// 			//alert("검색어 입력 !");
// 				$("#search_box").focus();
// 				return;
// 			}
		
// 		$("#get_view").empty();
// 		$("#nav_view").empty();
		
		var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
				+ "&q=" + encodeURIComponent(searchKeyword) + "&key=AIzaSyCVwWk8DuaQGG-80_4PNzstgcKjdTX4PH0&maxResults=9";
		
		// 민희 : AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0
		// 은우 : AIzaSyDp2Rg4rgoTVN4mB33-zyPZgl1GjIpYt1w
		// 혜미 : AIzaSyDaxq2wYvYelkT22k9ZLzBVM4xDqT2Jai8
		// 지수 : AIzaSyCVwWk8DuaQGG-80_4PNzstgcKjdTX4PH0
		console.log("Token before : "+sTargetUrl);
		
		
		console.log("sGetToken : " + sGetToken);
		
 		if(sGetToken){
 			
 			var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
				+ "&q=" + encodeURIComponent(searchKeyword) + "&key=AIzaSyCVwWk8DuaQGG-80_4PNzstgcKjdTX4PH0&maxResults=3";
 			sTargetUrl += "&pageToken=" + sGetToken;
 			
 			debugger;
			//sTargetUrl += "&maxResults="+ 10;
 		}
		
 		console.log("Token after : "+sTargetUrl);
 		
		$.ajax({
			
			type : "POST",
			url : sTargetUrl,
			dataType : "jsonp",
			success : function(jdata) {
				
				//console.log(jdata);
				sGetToken = undefined;
				
				$(jdata.items).each(function(i){
					
					//debugger;
					
					var videoId = this.id.videoId;
// 					console.log(" 비디오 아이디 : " + videoId) ;
// 					console.log(" sinppet.title : " + this.snippet.title) ; 
// 					console.log(" sinppet.description : " + this.snippet.description) ; 
// 					console.log(" sinppet.thumbnail : " + this.snippet.thumbnails.default.url);
					$("#get_view").append(
							  "<div class='col-md-4' style='min-width : 350px'>"
							+ "<iframe width='300px' height='200px' src='https://www.youtube.com/embed/"+this.id.videoId+"'></iframe>"
							+ "<span class='box'>"
							+ "<a href=http://youtu.be/"+this.id.videoId+" "+"target='_blank'>" + "<br><span class='title' style='width:300px;'>"+this.snippet.title+"</span></a><br>"										
							+ "<span style='width:300px;'>"+this.snippet.publishedAt+"</span><br>"
							+ "<span class='description' style='width:300px;'><br>"+this.snippet.description+"</span><br><span class='channelTitle'>"+this.snippet.channelTitle+"</span></span><br><p>"
							+ "</div>");
									
				}).promise().done(function(){					
					
					
					
					$(window).on("scroll", function(){
		 				
						if($(window).scrollTop() == ( $(document).height() - $(window).height() )){
							
							console.log("sGetToken"+sGetToken); 
							javascript:fnGetList(jdata.nextPageToken);
			 				
						
// 						$.ajax({
							
// 							type : "POST",
// 							url : sTargetUrl,
// 							dataType : "jsonp",
// 							success : function(jdata) {

// 		 						console.log(" 검색개수 : " + cnt);
// 		 						if(flag == true){
// 		 							fnGetList();
// 		 							flag = false;
// 		 							return;
// 		 						}
// 		 					}
// 		 				}); // ajax End
						} // If End
						}); // window End						
				}); // promise End
			}
		});
				
// 					if(jdata.nextPageToken){
// 						$("#nav_view").append("<button class='paging btn btn-default' onclick='javascript:fnGetList(\""+jdata.nextPageToken+"\");'> 더 보기 </button>");
// 					}
// 				})
// 			}
// 		});
		
		
	}
</script>

<style type="text/css">
img {
	width: 100px;
	height: 100px;
}

span {
	max-width: 900px;
	/* 	background-color: green; */
	display: inline-block;
}

.box {
	/* 	background-color: red; */
	min-width: 50%;
	max-width: 50%;
	/* 	min-height: 500px; */
	/* 	max-height: 500px; */

	/* 	margin-top : 1px; */
	/* 	margin-bottom : 1px; */
	/* 	padding-bottom: 1px; */
}

/* #get_view { */
/* 	float: left; */
/* } */

.paging btn btn-default {
	width: 100%;
	height: 50px;
	background-color: black;
	color: white;
}

.title {
	font-size: 18px;
}

.description {
	font-size: 14px;
}

.channelTitle {
	font-size: 14px;
	font-weight: bold;
}

.btn btn-default{
	color: white;
	background-color : #3a76d6;
}

.btn btn-default :hover{
	background-color : #1062e6;
}

a :hover{
	color : #1062e6;
}
</style>
</head>
<body>

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>

	<div class="container">
	
	<div class="row">
	<button class="btn btn-default col-md-2">#애견상식</button>
	<button class="btn btn-default col-md-2">#애견훈련</button>
	<button class="btn btn-default col-md-2">#애견분양</button>
	<button class="btn btn-default col-md-2">#애견음악</button>
	<button class="btn btn-default col-md-2">#애견카페</button>
	<button class="btn btn-default col-md-2">#애견사건</button>
	</div>
	
<!-- 	<form name="form1" method="post" onsubmit="return false;"> -->
<!-- 		<input type="text" id="search_box" /> -->
<!-- 		<button onClick="fnGetList();">가져오기</button> -->
<!-- 	</form> -->
	
	<hr>
	<div id="get_view" class="row"></div>
<!-- 	<div id="nav_view" class="col-md-12 col-sm-12 col-lg-12"></div> -->
	</div>
	
	
	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>