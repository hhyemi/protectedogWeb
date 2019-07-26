<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko">
<head>

<title>견종백과</title>

<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery JS -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

<style type="text/css">
body {
	font-family: Helvetica;
}

#banner-message {
	BACKGROUND: #FFF;
	BORDER-RADIUS: 4PX;
	PADDING: 20PX;
	FONT-SIZE: 25PX;
	TEXT-ALIGN: CENTER;
	TRANSITION: ALL 0.2S;
	MARGIN: 0 AUTO;
	WIDTH: 500PX;
}

#breed_data {
	background: #fff;
	border-radius: 4px;
	padding: 20px;
	font-size: 14px;
	text-align: left;
	transition: all 0.2s;
	margin: 0 auto;
	width: 500px;
	color: black;
}

#breed_image {
	background: #fff;
	margin: 0 auto;
	width: 500px;
	height: 500px;
}

td{
	color : black;
	width : 300px;
}
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
	
	<div class="container">
		
		<div id="banner-message">

			<select class="breed_select">
				<option></option>
			</select>

		</div>
		<div id="breed_data">
			<img id="breed_image" src="" />
			<p><b>품종 정보</b></p>
			<table id="breed_data_table">

			</table>
		</div>
	</div>
	<script type="text/javascript">
		var $breed_select = $('div.breed_select1');
		$breed_select.click(function() {
			//alert($(this).children().attr("id"));
			// 			alert("1 : "+$(".breed_select1").children(this).attr("id"));
			// 			alert("2 : "+$(this).parents().html());
			// 			alert("3 : "+$(this).children(":clicked").attr("id"));
			// 			alert("4 : "+$(this).text());
			//var id = $(this).children(":selected").attr("id");
			//alert(id);
			getDogByBreed(id);
		});
		
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

							if (value.name == 'Chow Chow') {
								value.name = '차우차우';
							}
							if (value.name == 'Affenpinscher') {
								value.name = '아펜핀셔';
							}
							if (value.name == 'Afghan Hound') {
								value.name = '아프간 하운드';
							}
							if (value.name == 'African Hunting Dog') {
								value.name = '아프리카들개';
							}
							if (value.name == 'Airedale Terrier') {
								value.name = '에어데일 테리어';
							}
							if (value.name == 'Akbash Dog') {
								value.name = '악바쉬 도그';
							}
							if (value.name == 'Akita') {
								value.name = '아키타';
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

							// 							output += '<span id="' + value.id + '">'
							// 							+ value.name + '</span><br>';

							output += '<option id="' + value.id + '">'
									+ value.name + '</option>';
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
					console.log('responseText:' + xmlhttp.responseText);
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
	<!-- ////////////////////달력 /////////////////////////////-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>

</html>