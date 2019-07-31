<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>

<title>견종백과</title>

<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- jQuery CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery JS -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

<style type="text/css">

#banner-message {BACKGROUND: #FFF;BORDER-RADIUS: 4PX;PADDING: 20PX;FONT-SIZE: 25PX;TEXT-ALIGN: CENTER;TRANSITION: ALL 0.2S;MARGIN: 0 AUTO;WIDTH: 500PX;}

#breed_data {background: #fff;border-radius: 4px;padding: 20px;font-size: 16px;text-align: left;transition: all 0.2s;margin: 0 auto;width: 500px;color: black;}

#breed_image {background: #fff;margin: 0 auto;width: 500px;height: 500px;}

td{color : black;width : 300px;}

.goog-trans{background:#f0f0f0}

.goog-trans-control{float:left;height:40px}

.goog-trans-control a{display:inline-block;padding:0 10px;height:40px;line-height:40px;background:#383838;color:#fff;text-align:center;text-decoration:none}

.goog-trans-info{float:left;margin:0 0 0 10px;height:40px;line-height:40px;color:#686868}

.goog-trans:after{display:block;visibility:hidden;clear:both;content:''}

</style>
</head>
<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="hero-wrap hero-bread" style="padding-bottom: 0px; padding-top : 10px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/index.jsp">정보공유</a></span>
					</p>
					<h1 class="mb-0 bread">견종백과</h1>
				</div>
			</div>
		</div>
	</div>
	
	<br/>
	
	<div class="container">
	
	<div id="google_sectional_element" style="display:none"></div>
		<div class="goog-trans-section">
	    	<div class="goog-trans">
	        	<input type="hidden" class="goog-trans-control"></input>
	    	</div>
	    <div id="google_translate_element_area">
	    	
		<div id="banner-message">

			<select class="breed_select">
				<option></option>
			</select>

		</div>
		<div id="breed_data">
			<img id="breed_image" src="" />
			<span style="font-size: 24px;"><b>품종 정보&nbsp;<span class="fas fa-search"></span></b></span>
			<table id="breed_data_table">

			</table>
			
			
			
		</div>
	</div>
	
	</div>
	</div>
	
	<script type="text/javascript">
		
		// 최초 로딩시 데이터 안뜨던 오류 해결
		var id = 1;
		getDogByBreed(id);
		
		// Select Box 이벤트
		var $breed_select = $('select.breed_select');
		$breed_select.change(function() {
			id = $(this).children(":selected").attr("id");
			getDogByBreed(id);
		});

		// OpenAPI이용 데이터 가져오기
		function getBreeds() {
			ajax_get('https://api.thedogapi.com/v1/breeds', function(data) {
				populateBreedsSelect(data);
			});
		}
		
		function populateBreedsSelect(breeds) {
			$breed_select.empty().append(
					function() {
						var output = '';
						$.each(breeds, function(key, value) {

							if (value.name == 'Akbash Dog') {
								value.name = '악바쉬 도그';
							}
							if (value.name == 'Alapaha Blue Blood Bulldog'){
								value.name = '알라 파하 블루 블러드 불독';
							}
							if (value.name == 'Alaskan Husky'){
								value.name = '알래스칸 허스키';
							}
							if (value.name == 'Alaskan Malamute'){
								value.name = '알래스칸 말라뮤트';
							}
							if (value.name == 'American Bulldog'){
								value.name = '아메리칸 불독';
							}
							if (value.name == 'American Bully'){
								value.name = '아메리칸 불리';
							}
							if (value.name == 'American Eskimo Dog'){
								value.name = '아메리칸 에스키모 도그';
							}
							if (value.name == 'American Eskimo Dog (Miniature)'){
								value.name = '아메리칸 에스키모 도그 (미니어처)';
							}
							if (value.name == 'American Foxhound'){
								value.name = '아메리칸 폭스하운드';
							}
							if (value.name == 'American Pit Bull Terrier'){
								value.name = '아메리칸 핏불테리어';
							}
							if (value.name == 'American Staffordshire Terrier'){
								value.name = '아메리칸 스테퍼드셔 테리어';
							}
							if (value.name == 'American Water Spaniel'){
								value.name = '아메리칸 워터 스페니얼';
							}
							if (value.name == 'Anatolian Shepherd Dog'){
								value.name = '아나톨리아 셰퍼드';
							}
							if (value.name == 'Appenzeller Sennenhund'){
								value.name = '아펜첼러 제넨훈트';
							}
							if (value.name == 'Australian Cattle Dog'){
								value.name = '오스트레일리언 캐틀 도그';
							}
							if (value.name == 'Australian Kelpie'){
								value.name = '오스트레일리안 켈피';
							}
							if (value.name == 'Australian Shepherd'){
								value.name = '오스트레일리안 셰퍼드';
							}
							if (value.name == 'Australian Terrier'){
								value.name = '오스트레일리안 테리어';
							}
							if (value.name == 'Barbet'){
								value.name = '바베트';
							}
							if (value.name == 'Basenji'){
								value.name = '바센지';
							}
							if (value.name == 'Beauceron'){
								value.name = '보스롱';
							}
							if (value.name == 'Belgian Tervuren'){
								value.name = '벨기에 테뷰런';
							}
							if (value.name == 'Appenzeller Sennenhund'){
								value.name = '아펜첼러 제넨훈트';
							}
							if (value.name == 'Bernese Mountain Dog'){
								value.name = '버니즈 마운틴 도그';
							}
							if (value.name == 'Bichon Frise'){
								value.name = '비숑 프리제';
							}
							if (value.name == 'Black and Tan Coonhound'){
								value.name = '블랙 앤드 탄 쿤하운드';
							}
							if (value.name == 'Bloodhound'){
								value.name = '블러드하운드';
							}
							if (value.name == 'Bluetick Coonhound'){
								value.name = '블루틱 쿤하운드';
							}
							if (value.name == 'Boerboel'){
								value.name = '보어보엘';
							}
							if (value.name == 'Border Collie'){
								value.name = '보더 콜리';
							}
							if (value.name == 'Boykin Spaniel'){
								value.name = '보이킨 스패니엘';
							}
							if (value.name == 'Bracco Italiano'){
								value.name = '브라코 이탈리아노';
							}
							if (value.name == 'Cane Corso'){
								value.name = '카네코르소';
							}
							if (value.name == 'Cardigan Welsh Corgi'){
								value.name = '카디건 웰시 코기';
							}
							if (value.name == 'Catahoula Leopard Dog'){
								value.name = '카타호울라 레오파드 도그';
							}
							if (value.name == 'Cavalier King Charles Spaniel'){
								value.name = '카발리에 킹 찰스 스패니얼';
							}
							if (value.name == 'Clumber Spaniel'){
								value.name = '클럼버 스패니얼';
							}
							if (value.name == 'Cocker Spaniel'){
								value.name = '코커 스패니얼';
							}
							if (value.name == 'Cocker Spaniel (American)'){
								value.name = '코커 스패니얼 (미국)';
							}
							if (value.name == 'Coton de Tulear'){
								value.name = '꼬똥 드 툴레아';
							}
							if (value.name == 'Chinese Crested'){
								value.name = '차이니스 크레스티드';
							}
							if (value.name == 'Chinese Shar-Pei'){
								value.name = '차이니스 샤페이';
							}
							if (value.name == 'Dalmatian'){
								value.name = '달마티안';
							}
							if (value.name == 'Dogo Argentino'){
								value.name = '도고 아르헨티노';
							}
							if (value.name == 'Chinese Shar-Pei'){
								value.name = '차이니스 샤페이';
							}
							if (value.name == 'Chinese Shar-Pei'){
								value.name = '차이니스 샤페이';
							}
							if (value.name == 'Chinese Shar-Pei'){
								value.name = '차이니스 샤페이';
							}
						
						
							// 							output += '<span id="' + value.id + '">'
							// 							+ value.name + '</span><br>';

							output += '<option id="' + value.id + '">' + value.name + '</option>';

								
						});
						return output;
					});
		}

		function getDogByBreed(breed_id) {
			ajax_get(
					'https://api.thedogapi.com/v1/images/search?include_breed=1&breed_id='
							+ breed_id,
					function(data) {

						if (data.length == 0) {
							clearBreed();
							$("#breed_data_table")
									.append(
											"<tr><td>아직 작성되어 있지 않은 품종 정보 입니다.</td></tr>");
						} else {
							displayBreed(data[0])
						}
					});
		}

		function clearBreed() {
			$('#breed_image').attr('src', "");
			$("#breed_data_table tr").remove();
		}
		
		function displayBreed(image) {
			$('#breed_image').attr('src', image.url);
			$("#breed_data_table tr").remove();
			
			var breed_data = image.breeds[0]
			$.each(breed_data, function(key, value) {
				
				if (key == 'weight' || key == 'height') {
					value = value.metric
				}

				if (key == 'weight') {
					key = '무게';
				}

				if (key == 'height') {
					key = '키';
				}

				if (key == 'id') {
					key = '식별번호';
				}

				if (key == 'name') {
					key = '이름';
				}

				if (key == 'breed_group') {
					key = '품종그룹';
				}

				if (key == 'life_span') {
					key = '평균수명';
				}

				if (key == 'temperament') {
					key = '성격';
					//alert(value);
					var valueArray = value.split(',');
					//alert(valueArray);
					for (i = 0; i < valueArray.length; i++) {
						//alert(valueArray[i]);
						if (valueArray[i].trim() == 'Friendly') {
							valueArray[i] = '친근한';
						}
						if (valueArray[i].trim() == 'Loyal') {
							valueArray[i] = '충성스러운';
						}
						if (valueArray[i].trim() == 'Quiet') {
							valueArray[i] = '조용한';
						}
						if (valueArray[i].trim() == 'Charming') {
							valueArray[i] = '매력적인';
						}
					}

					$("#breed_data_table").append(
							"<tr><td>" + key + "</td><td>" + valueArray
									+ "</td></tr>");

				}

				if (key == 'country_code') {
					key = '국가코드';
				}

				if (key == 'bred_for') {
					key = '유형';
				}

				if (!(key == '성격')) {
					$("#breed_data_table").append(
							"<tr><td>" + key + "</td><td>" + value
									+ "</td></tr>");
				} else {
					return false;
				}
	
			});
		}

		function ajax_get(url, callback) {
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
// 					console.log('responseText:' + xmlhttp.responseText);
					try {
						var data = JSON.parse(xmlhttp.responseText);
					} catch (err) {
						console
								.log(err.message + " in "
										+ xmlhttp.responseText);
						return;
					}
					callback(data);
				}
			};

			xmlhttp.open("GET", url, true);
			xmlhttp.send();
		}

		getBreeds();
	</script>
	
	<div style="min-height: 200px;">
	
	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	  
	<script type="text/javascript">
	
	// ■■■■■■■■■■■■■■■■■■■■■ GOOGLE TRANSLATE EVNET ■■■■■■■■■■■■■■■■■■■■
	function googleSectionalElementInit() {

        new google.translate.SectionalElement({

            sectionalNodeClassName: 'goog-trans-section',

            controlNodeClassName: 'goog-trans-control',

            background: '#78E7FF'

        }, 'google_sectional_element');
    }
	
	// 로딩 시 바로 번역
	 google_initialized = false;

	     function google_auto_translate(){
	 
	         if(google_initialized){
	        	 
				jQuery('a.goog-te-gadget-link')[0].click();
				
	         }else if( jQuery('a.goog-te-gadget-link').length ){
	        	 
	             console.log('has button');
	             google_initialized = true;
	             setTimeout(google_auto_translate, 500);
				
	         }else{
	 			 
	             console.log('no button');
	             setTimeout(google_auto_translate, 100);
	 
	         }
	 
	     }
	 
	     $(document).ready(function(){
	 
	         setTimeout(google_auto_translate, 500);
	 
	     });
	     
	     // ■■■■■■■■■■■■■■■■■■■■■ SELECT CHANGE EVNET ■■■■■■■■■■■■■■■■■■■■
	     $(document).on("change",".breed_select",function(){
	    	
	    	 //console.log($("a.goog-te-gadget-link").length);
	    	 
	    	 // 클릭할때 마다 언어전환
	    	 
	    	 setTimeout(google_auto_translate, 500);
	    	 jQuery('a.goog-te-gadget-link')[0].click();
				
	     });

	</script>
	<script src="//translate.google.com/translate_a/element.js?cb=googleSectionalElementInit&ug=section&hl=ko"></script>
	
	<script src="/resources/prodmenu/js/popper.min.js"></script>
	<script src="/resources/prodmenu/js/bootstrap.min.js"></script>
	<script src="/resources/prodmenu/js/jquery.easing.1.3.js"></script>
	<script src="/resources/prodmenu/js/jquery.waypoints.min.js"></script>
	<script src="/resources/prodmenu/js/jquery.stellar.min.js"></script>
	<script src="/resources/prodmenu/js/owl.carousel.min.js"></script>
	<script src="/resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/prodmenu/js/aos.js"></script>
	<script src="/resources/prodmenu/js/jquery.animateNumber.min.js"></script>
	<script src="/resources/prodmenu/js/scrollax.min.js"></script>
	<script src="/resources/prodmenu/js/main.js"></script>
	
</body>

</html>