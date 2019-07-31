<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
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
	var flag = true;
	//var Token = '' ; 
	var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
				+ "&q=" + encodeURIComponent(searchKeyword) + "&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&maxResults=9";
	
	$(document).ready(function(){
		$(".searchKeyword").keydown(function(key){
			if(key.keyCode == 13){
				$(".searchSubmit").click();
			}
		});
	})
	
			
	$(function () {
		$(".col-md-2").on("click",function(){
			$("#get_view").empty();
			searchKeyword = $(this).text();
			fnGetList();
		});	
		
		$(".searchSubmit").on("click",function(){
			$("#get_view").empty();
			searchKeyword = $(".searchKeyword").val();
			fnGetList();
		});
	});
	
	
	function fnGetList(sGetToken){
		
		//var newToken = Token;
		
		console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+sGetToken);
				
// 		$("#get_view").empty();
// 		$("#nav_view").empty();
		
		// 민희 : AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0
		// 은우 : AIzaSyDp2Rg4rgoTVN4mB33-zyPZgl1GjIpYt1w
		// 혜미 : AIzaSyDaxq2wYvYelkT22k9ZLzBVM4xDqT2Jai8
		// 지수 : AIzaSyCVwWk8DuaQGG-80_4PNzstgcKjdTX4PH0
		console.log("Token before : "+sTargetUrl);
		
		
		console.log("sGetToken : " + sGetToken);
		
		var result = (sGetToken='undefined')?"true":"false";
		
		console.log(result);
		
 		if(sGetToken){
 			
 			sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
				+ "&q=" + encodeURIComponent(searchKeyword) + "&key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&maxResults=3";
 			sTargetUrl += "&pageToken=" + sGetToken;
			console.log("거쳤냐?")
 			//debugger;
			//sTargetUrl += "&maxResults="+ 10;
 		}
		
 		console.log("Token after : "+sTargetUrl);
 		
 		console.log("flag : "+flag);
		if(flag==false){
			return;
		}
		
 		getYoutube();
	}
	
	
	function getYoutube(callbackFunc){
		
		$.ajax({
			
			type : "POST",
			url : sTargetUrl,
			dataType : "jsonp",
			success : function(jdata) {
				
				
				callbackFunc(jdata);
				//console.log(jdata);
				
				console.log("jdata.nextPageToken : " + jdata.nextPageToken);
				//sGetToken = undefined;

			}
		});
		
	}
	
	getYoutube(function (jdata){
		
		console.log(jdata);
		
		$(jdata.items).each(function(i){

			var videoId = this.id.videoId;
			
			var date = new Date(this.snippet.publishedAt);
			var convertDate = date.getFullYear() + "년 " + (date.getMonth()+1) + "월 " +date.getDate() +"일"  ;
			
			var title = this.snippet.title;
			var convertTitle = title.substring(0,25);
			if(title.length > 26){
				convertTitle += "..."
			}
			
			// 					console.log(" 비디오 아이디 : " + videoId) ;
//				console.log(" sinppet.title : " + this.snippet.title) ; 
//				console.log(" sinppet.description : " + this.snippet.description) ; 
//				console.log(" sinppet.thumbnail : " + this.snippet.thumbnails.default.url);
			$("#get_view").append(
					  "<div class='col-md-4' style='min-width : 350px'>"
					+ "<iframe width='350px' height='200px' src='https://www.youtube.com/embed/"+this.id.videoId+"?fs=1&playsinline=1'"+" allow='autoplay; encrypted-media' allowfullscreen></iframe>"
					+ "<span class='box'>"
					+ "<a href=http://youtu.be/"+this.id.videoId+" "+"target='_blank'>" + "<br><span class='title' style='width:350px;'>"+convertTitle+"</span></a><br>"										
					+ "<span style='width:300px;' class='date'>"+convertDate+"</span><br>"
					+ "<span class='description' style='width:300px;'><br>"+this.snippet.description+"</span><br><span class='channelTitle'>"+this.snippet.channelTitle+"</span></span><br><p>"
					+ "</div>");
			
			$("")
		}).promise().done(function(){					

			$(window).on("scroll", function(){
				
				
				// scrollTop + windowHeight + 30 > documentHeight
				if($(this).scrollTop() +  $(this).height() + 484 > $(document).height() ){
					
					//console.log("sGetToken"+sGetToken);
						if(flag == true){
							flag=false;
							javascript:fnGetList(jdata.nextPageToken);
						}
					
	 								
				} // If End
				}); // window End						
		}); // promise End
		
	});
</script>

<style type="text/css">
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

a :hover{
	color : #1062e6;
}
.btn-default{
	margin: 0px;
	padding: 0px;
}

.searchBox{
	padding-top: 10px;
}

#searchKeyword {
	width : 150px;
}
#searchBox{
	padding-right: 0px;
}
</style>
</head>
<body>

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>

	<div class="container">
	
		<div class="row">
			<button class="btn-default col-md-2">#애견상식</button>
			<button class="btn-default col-md-2">#애견훈련</button>
			<button class="btn-default col-md-2">#애견분양</button>
			<button class="btn-default col-md-2">#애견음악</button>
			<button class="btn-default col-md-2">#애견카페</button>
			<button class="btn-default col-md-2">#애견사건</button>
		</div>
		
		<div class="row">
		<div class="col-md-12" align="right" id="searchBox">
		
			<span><input type="text" id="searchKeyword" class="form-control searchKeyword" /></span>
			<span><button type="button" class="btn btn-default searchSubmit"><span class="fas fa-search"></span></button></span>	
		
		</div>
		</div>
	<hr>
	<div id="get_view" class="row"></div>
		
<!-- 	<div id="nav_view" class="col-md-12 col-sm-12 col-lg-12"></div> -->
	</div>
	
	
	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>
</html>