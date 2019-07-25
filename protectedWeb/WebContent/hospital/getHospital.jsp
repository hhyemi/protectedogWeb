<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
		.map_wrap, .map_wrap * {
			margin: 0;
			padding: 0;
			font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
			font-size: 12px;
		}
		
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
			color: #000;
			text-decoration: none;
		}
		
		.map_wrap {
			position: relative;
			width: 100%;
			height: 500px;
		}
		
		#menu_wrap {
			position: absolute;
			top: 0;
			left: 0;
			bottom: 0;
			width: 250px;
			margin: 10px 0 30px 10px;
			padding: 5px;
			overflow-y: auto;
			background: rgba(255, 255, 255, 0.7);
			z-index: 1;
			font-size: 12px;
			border-radius: 10px;
		}
		
		.bg_white {
			background: #fff;
		}
		
		#menu_wrap hr {
			display: block;
			height: 1px;
			border: 0;
			border-top: 2px solid #5F5F5F;
			margin: 3px 0;
		}
		
		#menu_wrap .option {
			text-align: center;
		}
		
		#menu_wrap .option p {
			margin: 10px 0;
		}
		
		#menu_wrap .option button {
			margin-left: 5px;
		}
		
		#placesList li {
			list-style: none;
		}
		
		#placesList .item {
			position: relative;
			border-bottom: 1px solid #888;
			overflow: hidden;
			cursor: pointer;
			min-height: 65px;
		}
		
		#placesList .item span {
			display: block;
			margin-top: 4px;
		}
		
		#placesList .item h5, #placesList .item .info {
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;
		}
		
		#placesList .item .info {
			padding: 10px 0 10px 55px;
		}
		
		#placesList .info .gray {
			color: #8a8a8a;
		}
		
		#placesList .info .jibungray {
			padding-left: 26px;
			background:
				url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
				no-repeat;
		}
		
		#placesList .info .tel {
			color: #009900;
		}
		
		#placesList .item .markerbg {
			float: left;
			position: absolute;
			width: 36px;
			height: 37px;
			margin: 10px 0 0 10px;
			background:
				url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
				no-repeat;
		}
		
		#placesList .item .marker_1 {
			background-position: 0 -10px;
		}
		
		#placesList .item .marker_2 {
			background-position: 0 -56px;
		}
		
		#placesList .item .marker_3 {
			background-position: 0 -102px
		}
		
		#placesList .item .marker_4 {
			background-position: 0 -148px;
		}
		
		#placesList .item .marker_5 {
			background-position: 0 -194px;
		}
		
		#placesList .item .marker_6 {
			background-position: 0 -240px;
		}
		
		#placesList .item .marker_7 {
			background-position: 0 -286px;
		}
		
		#placesList .item .marker_8 {
			background-position: 0 -332px;
		}
		
		#placesList .item .marker_9 {
			background-position: 0 -378px;
		}
		
		#placesList .item .marker_10 {
			background-position: 0 -423px;
		}
		
		#placesList .item .marker_11 {
			background-position: 0 -470px;
		}
		
		#placesList .item .marker_12 {
			background-position: 0 -516px;
		}
		
		#placesList .item .marker_13 {
			background-position: 0 -562px;
		}
		
		#placesList .item .marker_14 {
			background-position: 0 -608px;
		}
		
		#placesList .item .marker_15 {
			background-position: 0 -654px;
		}
		
		#pagination {
			margin: 10px auto;
			text-align: center;
		}
		
		#pagination a {
			display: inline-block;
			margin-right: 10px;
		}
		
		#pagination .on {
			font-weight: bold;
			cursor: default;
			color: #777;
		}
       @font-face{
          font-family: NanumSquare;
          src : url(http://ssl.pstatic.net/static/kin/fonts/NanumSquareR.woff2) format("woff2");
       }
       body{
          font-family: NanumSquare, sans-serif !important;
       }
</style>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->
	
	<div class="container" >
		<div class="hero-wrap hero-bread" style="padding-bottom: 0px; padding-top : 10px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/index.jsp">Animal Hospital</a></span>
					</p>
					<h1 class="mb-0 bread">동물병원</h1>
				</div>
			</div>
		</div>
	</div>
	<br/><p/>
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form>

						<select id="z1">
							<option value="동물병원">시를 선택해주세요</option>
							<option value="서울특별시 동물병원" data-lat="37.5668260055"
								data-lng="126.978656786">서울특별시</option>
							<option value="부산광역시 동물병원" data-lat="35.1798200523"
								data-lng="129.075087492">부산광역시</option>
							<option value="대구광역시 동물병원" data-lat="35.8713802647"
								data-lng="128.601805491">대구광역시</option>
							<option value="인천광역시 동물병원" data-lat="37.4559252001"
								data-lng="126.705267423">인천광역시</option>
							<option value="광주광역시 동물병원" data-lat="35.1600820602"
								data-lng="126.851572921">광주광역시</option>
							<option value="대전광역시 동물병원" data-lat="36.3505388993"
								data-lng="127.384834847">대전광역시</option>
							<option value="울산광역시 동물병원" data-lat="35.5394827878"
								data-lng="129.311467919">울산광역시</option>
							<option value="경기도 동물병원" data-lat="37.2749769873"
								data-lng="127.00892997">경기도</option>
							<option value="강원도 동물병원" data-lat="37.8853257858"
								data-lng="127.72982901">강원도</option>
							<option value="충청북도 동물병원" data-lat="36.635358196"
								data-lng="127.491457326">충청북도</option>
							<option value="충청남도 동물병원" data-lat="36.6588292533"
								data-lng="126.672776194">충청남도</option>
							<option value="전라북도 동물병원" data-lat="35.820196364"
								data-lng="127.108976712">전라북도</option>
							<option value="전라남도 동물병원" data-lat="34.8160821479"
								data-lng="126.462788333">전라남도</option>
							<option value="경상북도 동물병원" data-lat="36.58123975"
								data-lng="128.58261919">경상북도</option>
							<option value="경상남도 동물병원" data-lat="35.2377742105"
								data-lng="128.691896889">경상남도</option>
							<option value="제주특별자치도 동물병원" data-lat="33.4889107082"
								data-lng="126.498233487">제주특별자치도</option>
						</select>
						<!-- 				  <select id="z2">
					    <option value="">시군구</option>
					  </select>
					  <select id="z3">
					    <option value="">읍면동</option>
					  </select>-->
	    		    
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
         </div>
		</div>
		<br/><br/><br/><br/>
	</div>
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
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 10
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		//============= 시도 선택 Event   처리 =============
		$("#z1").change(function() {
			// 키워드로 장소를 검색합니다
			searchPlaces();
		});

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = $("#z1").val();
			//var keyword = document.getElementById('keyword').text;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					// 마커에 click 이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function() {
		
						alert(places[i].place_name)
						alert(places[i].road_address_name)
						//alert(i)
						//alert(placesY[i])
						//alert(places[i].y)

						// self.location = "/review/getHospitalReview";

					});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};

					itemEl.onclick = function() {
						
						var placeName = $(this).children("div").children("h5").text();
						var placeAddr = $(this).children("div").children("span").text();
						var placeJIAddr = $(this).children("div").children("span.jibungray").text();
						var placeTel = $(this).children("div").children("span.tel").text();

						self.location = "/review/getHospitalReview?placeName="+ encodeURI(encodeURIComponent(placeName))
																  +"&placeAddr="+ encodeURI(encodeURIComponent(placeAddr))
																  +"&placeJIAddr="+ encodeURI(encodeURIComponent(placeJIAddr))
																  +"&placeTel="+encodeURI(encodeURIComponent(placeTel));

					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
		

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info" >'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibungray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>
</body>
</html>