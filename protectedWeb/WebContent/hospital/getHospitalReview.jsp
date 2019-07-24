<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마커 생성하기</title>
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>

.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;
}

</style>

</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->

	<div class="container">
	<form id ="uploadForm" class="form-horizontal">
		<div class="hero-wrap hero-bread"
			style="padding-bottom: 0px; padding-top: 10px;">
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-9 ftco-animate text-center">
						<p class="breadcrumbs">
							<span class="mr-2"><a href="/index.jsp">Animal
									Hospital</a></span>
						</p>
						<h1 class="mb-0 bread">동물병원</h1>
					</div>
				</div>
			</div>
		</div>
		<br />
		<p />
	<div id="map" style="width: 100%; height: 350px;"></div>
	<br/>
	<font size="6" color="#252236">${placeList.placeName}</font>
	<br/><br/>
	<h1>도로명주소</h1>
	${placeList.placeAddr }
	<br/><br/>
	<h1>지번주소</h1>
	${placeList.placeJIAddr }	
	<br/><br/>
	<h1>연락처</h1>
	<font size="4" color="#d65a5a">${placeList.placeTel}</font>
	<br/><br/>
	<h1>동물병원후기</h1>
	<p/>
	
		<div class="starRev">
		  <span class="starR" >1</span>
		  <span class="starR" >2</span>
		  <span class="starR">3</span>
		  <span class="starR">4</span>
		  <span class="starR">5</span>
		  <font size="4" color="#000000" id = "starText">0/5 평가해주세요</font>
	   </div>
	   <br/>
	   
	  <div class="row" style="padding-left:18px">
		 <textarea id="postContent" name="postContent" cols="100" rows="2" placeholder="후기를 작성해주세요." ></textarea>
		 	 <div class="col-md-2" align="center">
				<button  class="btn btn-primary py-5 px-4 col-md-8"  type="button" id="btn-add">
					등록
				</button>
			</div>
		</div>	
		<input type="hidden" id="hospitalName"  name="hospitalName" value="${placeList.placeName}" />	
		 <input type="hidden" id="grade" name="grade"  />	
		</form>
    <p/></div>
        
	<br/><br/>	
	
	<!--================ start footer Area  =================-->
	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!-- footer End /////////////////////////////////////-->
	<!--================ End footer Area  =================-->
	<script src="../../resources/prodmenu/js/popper.min.js"></script>
	<script src="../../resources/prodmenu/js/bootstrap.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.easing.1.3.js"></script>
	<script src="../../resources/prodmenu/js/jquery.waypoints.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.stellar.min.js"></script>
	<script src="../../resources/prodmenu/js/owl.carousel.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
	<script src="../../resources/prodmenu/js/aos.js"></script>
	<script src="../../resources/prodmenu/js/jquery.animateNumber.min.js"></script>
	<!-- 	<script src="./../resources/prodmenu/js/bootstrap-datepicker.js"></script> -->
	<script src="../../resources/prodmenu/js/scrollax.min.js"></script>
	<script src="../../resources/prodmenu/js/main.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=153d14a106a978cdc7a42f3f236934a6&libraries=services"></script>
	<script>
	
	   //============= 등록버튼 눌렀을때 함수 =============      
	   function fncAddReview(){
	      
	      //Form 유효성 검증
	      var grade = $("#grade").val();	      
	      var postContent = $("textarea[name=postContent]").val();
	      
	      if(grade == ''){
	         alert("평가점수는 반드시 입력하여야 합니다.");
	         return;
	      }	      

	      if(postContent == ''){
	         alert("후기내용은 반드시 입력하여야 합니다.");
	         $("textarea[name=postContent]").focus();
	         return;
	      }
	      

	     // $('form').attr("method","POST").attr("action","/funding/addVoting").attr("enctype","multipart/form-data").submit();
	   }	
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		//주소로 좌표를 검색합니다
		geocoder.addressSearch('${placeList.placeAddr}', function(result,
				status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
		
		$('.starRev span').hover(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  
			  var sNum = $(this).parent().children('span.starR.on').length;
			  var sText = null;
			  if(sNum==1){
				  sText = "1/5 별로예요"
			  }else if (sNum==2){
				  sText = "2/5 조금 아쉬워요";				  
			  }else if(sNum ==3){
				  sText = "3/5 보통이에요";
			  }else if(sNum==4){
				  sText = "4/5 좋아요";
			  }else{
				  sText = "5/5 최고예요";
			  }

			  $("#starText").text(sText);
			  $("#grade").val(sNum);
			  return false;
			});
		
		$("#postContent").focus(function(){
			if(${user == null}){
					alert("로그인이 필요합니다.")
					$(this).blur();
				}
			
		});
		
		   $(function() {
			      
		         //============= 등록 Event  처리 =============   
		         $( "#btn-add" ).on("click" , function() {
		        	 fncAddReview();
		            });

		            
		   });   
	</script>
</body>
</html>