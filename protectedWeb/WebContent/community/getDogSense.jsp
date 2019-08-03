<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
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

<!-- CSS -->
<style type="text/css">

.title {font-size: 18px;}
.description {font-size: 14px;}
.channelTitle {font-size: 14px;font-weight: bold;}
.paging{width: 100%;height: 40px;}
.btn-default{margin: 0px;padding: 0px;}

#searchKeyword {width : 200px;border-radius: 15px 0px 0px 15px;height:38px;}
#searchSubmit{border-radius: 0px 15px 15px 0px;}
#searchBox{padding-right: 0px;}

a :hover{color : #1062e6;}

</style>
</head>
<body>

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	
	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 상단 디자인 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --> 
	<div class="hero-wrap hero-bread" style="padding-bottom: 0px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">Dog</span> <span>Video</span></p>
            <font size="7">애견상식</font>
          </div>
        </div>
      </div>
    </div>
    
    <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 검색 영역 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --> 
	<div class="container">
		<div class="row">
			<div class="col-md-12" align="center">
				<div align="center" id="searchBox" style="padding-top : 10px; padding-bottom : 50px;">	
					<span><input type="text" id="searchKeyword" class="searchKeyword"><button type="button" id="searchSubmit" class="btn btn-default searchSubmit"><span class="fas fa-search"></span></button></span>
				</div>
			</div>
		</div>
		
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 버튼 영역 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --> 
		<div class="row">
			<button class="btn-default col-md-2 col-xs-2 col-sm-2">#애견상식</button>
			<button class="btn-default col-md-2 col-xs-2 col-sm-2">#애견훈련</button>
			<button class="btn-default col-md-2 col-xs-2 col-sm-2">#애견분양</button>
			<button class="btn-default col-md-2 col-xs-2 col-sm-2">#애견음악</button>
			<button class="btn-default col-md-2 col-xs-2 col-sm-2">#애견카페</button>
			<button class="btn-default col-md-2 col-xs-2 col-sm-2">#애견사건</button>
		</div>
	
	<hr>
	<div id="get_view" class="row"></div>
	<div id="nav_view" class="col-md-12 col-sm-12 col-lg-12"></div>
	
	<!-- 공백  -->
	<div style="min-height: 50px">
	</div>
	</div>

	
	<jsp:include page="/layout/footer.jsp"></jsp:include>

</body>


<script type="text/javascript">
	
	var searchKeyword = '애견상식';
	
	$(document).ready(function(){
		
		fnGetList();
		
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
		
		// 민희 : AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0
		// 은우 : AIzaSyDp2Rg4rgoTVN4mB33-zyPZgl1GjIpYt1w
		// 혜미 : AIzaSyDaxq2wYvYelkT22k9ZLzBVM4xDqT2Jai8
		// 지수 : AIzaSyCVwWk8DuaQGG-80_4PNzstgcKjdTX4PH0
		// 진태 : AIzaSyDCu5B3VdrbNG54M5ZmpC7jECdE8bBXtR4
		
		var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
				+ "&q=" + encodeURIComponent(searchKeyword) + "&key=AIzaSyDCu5B3VdrbNG54M5ZmpC7jECdE8bBXtR4&maxResults=9";
		
		if(sGetToken){
			
			var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
				+ "&q=" + encodeURIComponent(searchKeyword) + "&key=AIzaSyDCu5B3VdrbNG54M5ZmpC7jECdE8bBXtR4&maxResults=6";
 			sTargetUrl += "&pageToken=" + sGetToken;

		}
		
		$.ajax({
			
			type : "POST",
			url : sTargetUrl,
			dataType : "jsonp",
			success : function(jdata) {
				
				$(jdata.items).each(function(i){
					
					var videoId = this.id.videoId;
					
					var date = new Date(this.snippet.publishedAt);
					var convertDate = date.getFullYear() + "년 " + (date.getMonth()+1) + "월 " +date.getDate() +"일"  ;
					
					var title = this.snippet.title;
					var convertTitle = title.substring(0,25);
					if(title.length > 26){
						convertTitle += "..."
					}
					
					//console.log(" sinppet.thumbnail : " + this.snippet.thumbnails.default.url);
					$("#get_view").append(
							  "<div class='col-md-4' style='min-width : 350px'>"
							+ "<iframe width='350' height='200' src='https://www.youtube.com/embed/"+this.id.videoId+"' allow='autoplay; encrypted-media' allowfullscreen></iframe>"
							+ "<span class='box'>"
							+ "<a href=http://youtu.be/"+this.id.videoId+" "+"target='_blank'>" + "<br><span class='title' style='width:350px;'>"+convertTitle+"</span></a><br>"										
							+ "<span style='width:350px;'>"+convertDate+"</span><br>"
							+ "<span class='description' style='width:350px;'><br>"+this.snippet.description+"</span><br><span class='channelTitle'>"+this.snippet.channelTitle+"</span></span><br><p>"
							+ "</div>");
									
				}).promise().done(function(){
					
					if(jdata.nextPageToken){
						
						$(".paging").remove();
						$("#nav_view").append("<button class='paging btn btn-default' onclick='javascript:fnGetList(\""+jdata.nextPageToken+"\");'> 더 보기 </button>");

					}
				});	
			}
		});
		
	}//fnGetList END
</script>

</html>