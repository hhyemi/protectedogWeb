y<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- ////////////	Bootsrap, css ///////////////////////// -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">

<link rel="stylesheet"
	href="../../resources/prodmenu/css/open-iconic-bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="stylesheet" href="../../resources/prodmenu/css/animate.css">

<link rel="stylesheet"
	href="../../resources/prodmenu/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="../../resources/prodmenu/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="../../resources/prodmenu/css/magnific-popup.css">

<link rel="stylesheet" href="../../resources/prodmenu/css/aos.css">

<link rel="stylesheet"
	href="../../resources/prodmenu/css/ionicons.min.css">

<!-- <link rel="stylesheet" -->
<!-- 	href="../../resources/prodmenu/css/bootstrap-datepicker.css"> -->



<link rel="stylesheet" href="../../resources/prodmenu/css/flaticon.css">
<link rel="stylesheet" href="../../resources/prodmenu/css/icomoon.css">
<link rel="stylesheet" href="../../resources/prodmenu/css/style.css">
<!-- <script src="./../resources/prodmenu/js/jquery.min.js"></script> -->
<!-- jQuery UI toolTip 사용 CSS-->
<!-- <link rel="stylesheet" -->
<!-- 	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<script src="../../resources/prodmenu/js/jquery-migrate-3.0.1.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	border: 3px;
	margin-top: 10px;
}

#orderinfo {
	padding-left: 50px;
	padding-right: 50px;
	font-size: small;
}

#texth5 {
	font-size: small;
}

#ordertable {
	width: 60%;
	height: 100px;
	margin: auto;
	text-align: center;
}

.img-fluid {
	width: 150px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	function fncAddPurchase() {
		$("form").attr("method", "POST").attr("action", "/order/addOrder")
				.submit();
	}

	//============= "구매"  Event 연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#addOrder").on("click", function() {
			fncAddPurchase();
		});
	});

	//============= "뒤로"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#']").on("click", function() {
			history.go(-1);
		});
	});
</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--//////////////////////////// Sub Toolbar Start/////////////////////////////-->
	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">order</a></span> <span>page</span>
					</p>
					<h1 class="mb-0 bread">DOG|SHOP 구매하기</h1>
				</div>
			</div>
		</div>
	</div>
	<!--//////////////////////////// Sub Toolbar end/////////////////////////////-->
	<div class="container" id="orderinfo">
		<input type="hidden" value="${product.prodNo}" />
		<div class="container">
			<div class="cart_inner">
				<table class="table" id="ordertable">
					<thead>
						<tr>
							<th scope="col">주문상품정보</th>
							<th scope="col">상품명</th>
							<th scope="col">수량</th>
							<th scope="col">주문금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="media">
									<div class="d-flex">
										<img class="img-fluid"
											src="../../resources/file/fileShop/${product.mainFile}"
											alt="Colorlib Template">
									</div>
									<div class="media-body">
										<p></p>
									</div>
								</div>
							</td>
							<td>
								<h5 id="texth5">${product.prodName}</h5>
							</td>
							<td>
								<h5 id="texth5">${product.price}</h5>
							</td>
							<td>
								<h5 id="texth5"></h5>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- ///////////////////////////body navigation tag/////////////////////////// -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-8 ftco-animate">

					<!-- ///////////////////////////body navigation tag/////////////////////////// -->

					<!--////////////////////////// form tag Start /////////////////////////////////-->
					<form class="billing-form" name="addForm">
						<h3 class="mb-4 billing-heading">구매 정보를 입력해주세요</h3>
						<div class="row align-items-end">

							<!-- 							<div class="col-md-6"> -->
							<!-- 								<div class="form-group"> -->
							<!-- 									<label for="firstname">연락처</label> <input type="text" -->
							<!-- 										class="form-control" name="phone" id="phone" -->
							<!-- 										placeholder="상품명을 입력해주세요" value="테스트"> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">주문회원</label> <input type="text"
										class="form-control" name="Id" id="receiverName"
										placeholder="상품명을 입력해주세요" value="${user.id}">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-sm-3">
								구매회원 연락처 <input type="text" class="form-control" id="phone2"
									name="phone1"
									value="${ ! empty user.phone1 ? user.phone1 : ''}"
									placeholder="번호" maxlength="4" style="height: 35px;">
							</div>
							-
							<div class="col-sm-3">
								<input type="text" class="form-control" id="phone2"
									name="phone2"
									value="${ ! empty user.phone2 ? user.phone2 : ''}"
									placeholder="번호" maxlength="4" style="height: 35px;">
							</div>
							-
							<div class="col-sm-3">
								<input type="text" class="form-control" id="phone3"
									name="phone3"
									value="${ ! empty user.phone3 ? user.phone3 : ''}"
									placeholder="번호" maxlength="4" style="height: 35px;">
							</div>
							<input type="hidden" name="phone" />

							<div class="w-100"></div>
							<div class="w-100"></div>

							<!-- 여기부터 receiver Info //////////////////////////////////////////// -->
							<h3 class="mb-4 billing-heading">배송지 정보를 입력해주세요</h3>
							<div class="w-100"></div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">이름</label> <input type="text"
										class="form-control" name="receiverName" id="receiverName"
										placeholder="상품명을 입력해주세요" value="테스트">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-sm-3">
								배송지 연락처 <input type="text" class="form-control" id="phone1"
									name="receiverPhone1" placeholder="번호" maxlength="4"
									style="height: 35px;">
							</div>
							-
							<div class="col-sm-3">
								<input type="text" class="form-control" id="receiverPhone2"
									name="phone2" placeholder="번호" maxlength="4"
									style="height: 35px;">
							</div>
							-
							<div class="col-sm-3">
								<input type="text" class="form-control" id="receiverPhone3"
									name="phone3" placeholder="번호" maxlength="4"
									style="height: 35px;">
									<input type="hidden" name="receiverPhone" />
							</div>
							
<br>
<br/>
							<div class="w-100"></div>
							<div class="w-100"></div>

							<div class="w-100"></div>
							<input type="text" id="sample2_postcode" placeholder="우편번호">
							<input type="button" onclick="sample2_execDaumPostcode()"
								value="우편번호 찾기"><br> <input type="text"
								id="sample2_address" placeholder="주소"><br> <input
								type="text" id="sample2_detailAddress" placeholder="상세주소">
							<input type="text" id="sample2_extraAddress" placeholder="참고항목">

							<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
							<div id="layer"
								style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
									id="btnCloseLayer"
									style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
									onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
							<div class="w-100"></div><br/>

							<div class="w-100"></div>

							<div class="col-md-12">
								<div class="form-group">
									<label for="firstname">배송요청사항</label> <input type="text"
										class="form-control" name="orderRequest" id="price"
										placeholder="배송요청사항을 입력해주세여">
								</div>
							</div>

							<p class="buttons">
								<a class="btn btn-primary py-3 px-4" id="pointpage"
									href="http://localhost:8080/shop/order/pointexample.jsp">포인트
									적용</a>
							<div class="w-100"></div>
							<!-- 
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">쿠폰적용</label> <input type="text"
										class="form-control" name="price" id="sample4_postcode"
										placeholder="우편번호 입력해주세요">
								</div>
							</div>
							<p align="center">
								<a class="btn btn-primary py-3 px-4"
									onclick="sample4_execDaumPostcode()" id="sample4_postcode">조회하기</a>
								&nbsp;&nbsp;
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">포인트 조회</label> <input type="text"
										class="form-control" name="price" id="price"
										placeholder="판매가격을 입력해주세요">
								</div>
							</div>
							<div class="w-100"></div>-->
							<div class="text-center">


								<p class="buttons">
									<a class="btn btn-primary py-3 px-4" id="addOrder">구매하기</a>
									&nbsp;&nbsp;<a href="#" class="btn btn-primary py-3 px-4">취소하기</a>
								</p>
							</div>
						</div>
					</form>
					<!-- ////////////////////////////form tag end //////////////////////////////-->
				</div>
			</div>
		</div>
	</section>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>

		//////////////////////////////////////////////////////// 다움 우편번호 END

		///////////////////////////////////////////////////////////구매완료 EVENT처리
		<!-- ///////////////////////// JavaScript ////////////////////////// -->
		<script type="text/javascript">
		//============= "등록"  Event 연결 =============
		$(function() {

			$("#addOrder").on(
					"click",
					function() {

						//Debug..
						//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
						$("form[name='addForm']").attr("method", "POST").attr(
								"action", "/order/addOrder").submit();
						//fncAddProduct();
					});
		});
	</script>





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