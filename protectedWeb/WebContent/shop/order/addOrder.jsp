<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>보호할개 · 스토어</title>
<!--  bootstrap CDN  -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- IM PORT 추가 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


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
		$("#addproduct").on("click",function() {
			
			if ( parseInt( $('input[name=orderQuantity]').val() ) > ${product.quantity} ){
				swal({
			           text: "제한수량을 초과하였습니다.",
			           dangerMode: true,
			           buttons: {
								 catch: {
								 	text: "확인"
								 }
					   },
					   
			      }).then((willDelete) => {
			           if (willDelete) {
			        	   $("input[name=orderQuantity]").focus();
			           }
			      });
				return;
			}
			var address=$("input[name='simpleAddress']").val() + " " + $("input[name='receiverAddr4']").val();
			$("input[name='receiverAddr']").val(address);
	
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
		$("#btn-cancle").on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			history.go(-1);
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
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
</head>

<body>

	<!--■■■■■■■■■■■■■■■■■■■■ Sub Toolbar Start	■■■■■■■■■■■■■■■■■■■■-->
	<body class="goto-here">
    <div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">Protected</span> <span>Store</span></p>
            <font size="7">스토어 상품구매</font>
          </div>
        </div>
      </div>
    </div>
	<br/><p/>
	<!--■■■■■■■■■■■■■■■■■■■■ Sub Toolbar end■■■■■■■■■■■■■■■■■■■■-->

	<!-- ■■■■■■■■■■■■■■■■■■■■body navigation tag / FORM START■■■■■■■■■■■■■■■■■■■■ -->
	<div class="container">
	<section class="ftco-section">
			<form class="billing-form" name="addForm">
			
			
			
			
			
			
			<!-- ■■■■■■■■■■■■■■■■■■■■Parameter value 시작■■■■■■■■■■■■■■■■■■■■■ -->
				<input type="hidden" name="prodNo" value="${product.prodNo}" /> 
				<input type="hidden" name="id" value="${user.id}" />
				<input type="hidden" name="receiverAddr" value="" />
			<!-- ■■■■■■■■■■■■■■■■■■■■Parameter value END■■■■■■■■■■■■■■■■■■■■■ -->
			
			
					<!-- ///////////////////////////////////////////////////////// -->
					
				<div class="row justify-content-center">
					<div class="col-xl-8 ftco-animate">

						<!-- ///////////////////////////body navigation tag/////////////////////////// -->

							<input type="hidden" value="${product.prodNo}" />
								<div id="cart" class="cart col-md-12">
										<table id="cartTable" class="table table-hover table-condensed">
											<thead>
												<tr>
													<th style="width: 50%" class="text-center">상품명</th>
													<th style="width: 20%" class="text-center">상품가격</th>
													<th style="width: 15%" class="text-center">수량</th>
													<th style="width: 10%" class="text-center"></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td data-th="Product">
														<div class="row">
															<div class="col-sm-2 hidden-xs">
																<img
																	src="../../resources/file/fileShop/${product.mainFile}"
																	alt="..." class="img-responsive" width="60px"/>
															</div>
															<div class="col-sm-10 prod-desc">
																<h6 class="nomargin">${product.company}</h6>
																<p>${product.prodName}</p>
															</div>
														</div>
													</td>
													<td class="text-center"><fmt:formatNumber
												value="${product.discountPrice}" pattern="#,###" />원</td>
												
													<td class="text-center">
														<input type="number" min="1" size="1" name="orderQuantity"
															class="form-control text-center" value="1" >
													</td>
													<td class="actions"></td>
												</tr>
											</tbody>
										</table>
								</div>
						<br />
						<!--////////////////////////// form tag Start /////////////////////////////////-->
						<h3 class="mb-4 billing-heading">구매정보를 입력해주세요</h3>
						<div class="row align-items-end">
							<br />

							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname"><b>구매회원</b></label> <input type="text"
										class="form-control" name="id" id="id"
										placeholder="상품명을 입력해주세요" value="${sessionScope.user.id }"
										readonly>
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="phone"><b>연락처</b>&nbsp;&nbsp;</label> 
									<c:if test="${ sessionScope.user.phone ne null }">
										<input type="text" class="form-control" name="phone" value="${ sessionScope.user.phone }" readonly>
									</c:if>
									<c:if test="${ sessionScope.user.phone eq null }">
										<input type="text" class="form-control" name="phone" value="" placehold="연락처를 입력하세요.">
									</c:if>
								</div>
							</div>

							<div class="w-100"></div>
							<div class="w-100"></div>
							<div class="w-100"></div>
							<br />

							<h3 class="mb-4 billing-heading">&nbsp;&nbsp;배송지정보를 입력해주세요</h3>
							<div class="w-100"></div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname"><b>받는이</b></label> <input type="text"
										class="form-control" name="receiverName" id="receiverName"
										placeholder="배송받는분 이름을 입력해주세요">
								</div>
							</div>
							<br />

							<div class="w-100"></div>
							<div class="form-group">

								<div class="row">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="receiverPhone1" class="form-control" style="width: 160px" id="receiverPhone1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select> &nbsp;&nbsp; <input type="text" class="form-control" id="receiverPhone2" name="receiverPhone2"
										placeholder="번호" maxlength="4" style="height: 35px;width: 160px">
									&nbsp;&nbsp; <input type="text" id="receiverPhone3" class="form-control"  name="receiverPhone3"
										placeholder="번호" maxlength="4" style="height: 35px;width: 160px">
								</div> 
							</div>

							<div class="w-100"></div>
							<br />
							<div class="form-group">
							<div class="row" style="padding-left: 10px">
								&nbsp;<div class="col-md-8">
									<label for="firstname"><b>주소&nbsp;|&nbsp;우편번호</b></label> 
								<button type="button" class="btn btn-default" onclick="sample6_execDaumPostcode()" >우편번호 찾기</button>
									<input type="text" class="form-control" id="sample6_postcode"
										placeholder="번호" style="height: 35px;margin-bottom: 10px" readonly name="receiverAddr1">
								</div>
	
								&nbsp;<div class="col-sm-4">
								<input type="text" class="form-control" id="sample6_address" placeholder="주소" style="height: 35px;margin-left: 5px" readonly
								name="receiverAddr2">
								</div>
								<div class="col-sm-4" style="padding-left: 0px">
									<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목"
										style="height: 35px;" readonly
										name="receiverAddr3">
								</div>
								 <div class="col-sm-8">
									<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소를 입력하세요." style="height: 35px;margin-left: 5px;margin-top:10px"
									name="receiverAddr4">
								</div>
							</div>
							</div>
							<p>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname"><b>배송요청사항</b></label> <input type="text"
										class="form-control" name="orderRequest" id="orderRequest"
										placeholder="배송요청사항을 입력하세요.">
								</div>
							</div>
							<hr />
							<div class="w-100"></div>
							<p>

							<div class="col-md-13" style="margin-left: 16px">
								<div class="form-group">
									<label for="streetaddress"><b>결제수단</b></label> <select
										class="form-control" name="paymentCode" id="paymentCode">
										<option value="1">무통장결제</option>
										<option value="2">카드결제</option>
									</select>
								</div>
							</div>
						</div>
						<p align="center">
						<button class="btn btn-default" id="addproduct">구매</button>
							&nbsp;<button class="btn btn-default" id="btn-cancle">취소</button>
						</p>

						<!-- ////////////////////////////form tag end //////////////////////////////-->
					</div>
				</div>
			</form>

	</section>
		</div>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	

		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
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
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}

		//총액 계산 jqury 
		$(document).ready(function() {
			const p = $("#price").data('price');

			$("#orderQuantity").change(function() {
				const q = $(this).find(':selected').data('quantity');
				const total = p * q;
				$("#total").text(total);
			});
		});
		
		
		//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ IM PORT START ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■//
		
// 		IMP.init('imp32437611'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
// 		IMP.request_pay({
// 		    pg : 'inicis', // version 1.1.0부터 지원.
// 		    pay_method : 'card',
// 		    merchant_uid : 'merchant_' + new Date().getTime(),
// 		    name : ':결제테스트',
// 		    amount : 14000,
// /*		    buyer_email : 'iamport@siot.do',
// 		    buyer_name : '구매자이름',
// 		    buyer_tel : '010-1234-5678',
// 		    buyer_addr : '서울특별시 강남구 삼성동',*/
// 		    buyer_postcode : '123-456',
// 		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
// 		}, function(rsp) {
// 		    if ( rsp.success ) {
// /*		        var msg = '결제가 완료되었습니다.';
// 		        msg += '고유ID : ' + rsp.imp_uid;
// 		        msg += '상점 거래ID : ' + rsp.merchant_uid;
// 		        msg += '결제 금액 : ' + rsp.paid_amount;
// 		        msg += '카드 승인번호 : ' + rsp.apply_num; */
// 		    } else {
// 		        var msg = '결제에 실패하였습니다.';
// 		        msg += '에러내용 : ' + rsp.error_msg;
// 		    }
// 		    alert(msg);
// 		});
	</script>


</body>
</html>


