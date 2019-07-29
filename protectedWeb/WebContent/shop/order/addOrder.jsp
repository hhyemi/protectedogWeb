<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko">
<head>
<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  bootstrap Dropdown CSS & JS  -->
<link href="../resources/css/others/animate.css" rel="stylesheet">
<!-- IMPORT -->
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
.container {
	width: 1000px;
	font-size: 17px;
	margin-top: 10px;
}
</style>

<script type="text/javascript">
	//============= "등록"  Event 연결 =============
	$(function() {
		$("#addproduct").on(
				"click",
				function() {
					//Debug..
					console.log($("form[name='addForm']").html());
					$("form[name='addForm']").attr("method", "POST").attr("action", "/order/addOrder").submit();
					//fncAddProduct();
				});
	});

	//  	$(function() {

	// 		$("#addproduct").on("click", function() {
	// 			self.location = "/shop/product/addProduct"
	// 		});

	// 	});

	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$("a[href='#' ]").on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			$("form")[0].reset();
		});
	});

	function fncAddProduct() {
		//Form 유효성 검증

		// 		var prodName=$("input[name='prodName']").val();
		// 	 	//var name = document.detailForm.prodName.value;
		// 	 	var prodDetail=$("input[name='prodDetail']").val();
		// 		//var detail = document.detailForm.prodDetail.value;
		// 		var manuDate=$("input[name='manuDate']").val();
		// 		//var manuDate = document.detailForm.manuDate.value;
		// 		var price=$("input[name='price']").val();
		// 		//var price = document.detailForm.price.value;

		// 		if(prodName == null || prodName.length<1){
		// 			alert("상품명은 반드시 입력하여야 합니다.");
		// 			return;
		// 		}

		// 		if(manuDate == null || manuDate.length<1){
		// 			alert("제조일자는 반드시 입력하셔야 합니다.");
		// 			return;
		// 		}
		// 		if(price == null || price.length<1){
		// 			alert("가격은 반드시 입력하셔야 합니다.");
		// 			return;
		// 		}

		//$("form[name='addForm']").attr("method", "POST").attr("action","/product/addProduct").submit;
	}


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
						<span class="mr-2"><a href="index.html">중고</a></span> <span>장터</span>
					</p>
					<h1 class="mb-0 bread">DOG|SHOP 구매하기</h1>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br />
	<!--//////////////////////////// Sub Toolbar end/////////////////////////////-->

	<!-- ///////////////////////////body navigation tag/////////////////////////// -->
	<section class="ftco-section">
		<div class="container">
			<form class="billing-form" name="addForm">
			<input type="hidden" value="prodNo"/>
				<div class="row justify-content-center">
					<div class="col-xl-8 ftco-animate">

						<!-- ///////////////////////////body navigation tag/////////////////////////// -->
						<div class="container" id="orderinfo">
							<input type="hidden" value="${product.prodNo}" />
							<div class="container">
								<section id="cart" class="cart">
									<div class="container">
										<table id="cart" class="table table-hover table-condensed">
											<thead>
												<tr>
													<th style="width: 50%">상품명</th>
													<th style="width: 10%">상품가</th>
													<th style="width: 22%" class="text-center">총액</th>
													<th style="width: 10%"></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td data-th="Product">
														<div class="row">
															<div class="col-sm-2 hidden-xs">
																<img
																	src="../../resources/file/fileShop/${product.mainFile}"
																	alt="..." class="img-responsive" />
															</div>
															<div class="col-sm-10 prod-desc">
																<h6 class="nomargin">${product.company}</h6>
																<p>${product.prodName}</p>
															</div>
														</div>
													</td>
													<td data-th="Price">${product.price}</td>
													<td data-th="Subtotal" class="text-center">$64.34</td>
													<td class="actions" data-th="">
														<button class="btn btn-info btn-sm">
															<i class="fa fa-refresh"></i>
														</button>
														<button class="btn btn-danger btn-sm">
															<i class="fa fa-trash-o"></i>
														</button>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</section>
							</div>
						</div>
						<!--////////////////////////// form tag Start /////////////////////////////////-->
						<h3 class="mb-4 billing-heading">구매정보를 입력해주세요</h3>
						<div class="row align-items-end">

							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">구매회원</label> <input type="text"
										class="form-control" name="id" id="id"
										placeholder="상품명을 입력해주세요" value="${sessionScope.user.id }"
										readonly>
								</div>
							</div>

							<div class="w-100"></div>
							<div class="w-100"></div>
							<div class="w-100"></div>

							<h3 class="mb-4 billing-heading">&nbsp;&nbsp;배송지정보를 입력해주세요</h3>
							<div class="w-100"></div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">받는이</label> <input type="text"
										class="form-control" name="receiverName" id="receiverName"
										placeholder="배송받는분 이름을 입력해주세요">
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-sm-3">
								<label for="firstname">배송연락처</label> <select
									class="form-control" name="receiverPhone2" id="receiverPhone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							-
							<div class="col-sm-3">
								<input type="text" class="form-control" id="receiverPhone2"
									name="receiverPhone2" placeholder="번호" maxlength="4"
									style="height: 35px;">
							</div>
							-
							<div class="col-sm-3">
								<input type="text" class="form-control" id="receiverPhone3"
									name="receiverPhone3" placeholder="번호" maxlength="4"
									style="height: 35px;">
							</div>
							<input type="hidden" name="receiverPhone" />



							<div class="w-100"></div>
							<br />
							<div class="col-sm-4">
								<label for="firstname">주소|우편번호</label> <input type="text"
									class="form-control" id="sample6_postcode" placeholder="번호"
									style="height: 35px;">
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							<div class="w-100"></div>
							<div class="col-sm-4">
								<input type="text" class="form-control"
									id="sample6_address" placeholder="주소"
									style="height: 35px;">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control"
									id="sample6_extraAddress" placeholder="참고항목"
									style="height: 35px;">
							</div>
								<div class="col-sm-4">
								<input type="text" class="form-control" id="sample6_detailAddress"
									placeholder="상세주소" style="height: 35px;">
							</div>
							<input type="hidden" name="receiverAddr" />

							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">배송요청사항</label> <input type="text"
										class="form-control" name="orderRequest" id="orderRequest"
										placeholder="배송요청사항을 입력해주세요">
								</div>
							</div>
							<hr />
							<div class="w-100"></div>

							<div class="col-md-13">
								<div class="form-group">
									<label for="streetaddress">결제수단</label> <select
										class="form-control" name="paymentCode" id="paymentCode">
										<option value="1">무통장결제</option>
										<option value="2">카드결제</option>
									</select>
								</div>
							</div>
						</div>
						<p align="center">
							<a class="btn btn-primary py-3 px-4" id="addproduct">등록하기</a>
							&nbsp;<a href="#" class="btn btn-primary py-3 px-4">취소하기</a>
						</p>

						<!-- ////////////////////////////form tag end //////////////////////////////-->
					</div>
				</div>
			</form>
		</div>
	</section>


	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
 		</body></html>


