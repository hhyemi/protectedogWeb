<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->



<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body{
             border:0px; border-spacing:0px;
        }
    </style>
<script>
	//setTimeout(function() { alert("30안에 결제를 완료하지 않으시면 구매못함.") }, 0);
	//setTimeout(function() { alert("예약이 취소됩니다."); location.href = "/";}, 300000);
</script>
</head>
<body>
<BR><BR><BR>
	<!-- header -->
	<!-- Page Content -->
	<div class="container">
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<div class="col-md-8">
				<!-- 결제 방법 선택 -->
				<div class="col-md-5">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h1 class="panel-title">
								결제방법<small> &nbsp;&nbsp;결제방법을 선택해 주세요.</small>
							</h1>
						</div>
						<div class="panel-body" style="height: 500px;">
							<ul class="nav nav-pills nav-stacked" id="paymethodSelect">
								<li><a value="1">신용카드 결제</a></li>
								<li><a value="2">무통장 입금</a></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- 마일리지 선택 -->
				<div class="col-md-7">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h1 class="panel-title">
								쿠폰 | 마일리지<small> &nbsp;&nbsp;사용 할 마일리지와 쿠폰을 확인해주세요.</small>
							</h1>
						</div>
						
						
						<div class="panel-body" style="height: 500px;">
							<form>
	
								<br>
								<div class="form-group">
									<label class="col-sm-6 control-label" for="">사용가능한 마일리지</label>
									<div>
										<div class="input-group col-sm-5">
											<input class="form-control" id="userMileage" name="" type="number"
												value="300000"
												readonly="readonly">
										</div>
									</div>
								</div>
								<br>
								
								<div class="form-group">
									<label class="col-sm-6 control-label" for="">사용 마일리지</label>
									<div>
										<div class="input-group col-sm-5">
											<input class="form-control" min="0" max="99999" id="useMileage"
												type="number" value="0" maxlength="5"
												oninput="maxLengthCheck(this)" />
										</div>
									</div>
								</div>
								<br>
								<div class="form-group">
									<label class="col-sm-6 control-label" for="">잔여 마일리지</label>
									<div>
										<div class="input-group col-sm-5">
											<input class="form-control" id="restMileage" type="number"
												value="300000" readonly="readonly">
										</div>
									</div>
								</div>
								<hr>
								<div class="row"
									style="height: 50px; margin-left: 5%; margin-right: 5%;">
									<div class="col-md-12">
										<button class="btn btn-md btn-outline btn-primary pull-right"
											id="mileageCal">
											<i class="glyphicon glyphicon-ok"></i> 적용
										</button>
										<button class="btn btn-md btn-outline btn-danger pull-right"
											type="reset">
											<i class="glyphicon glyphicon-repeat"></i> 초기화
										</button>
									</div>
									<!-- /.col-lg-12 -->
								</div>
								<!-- /.row -->
							</form>

						</div>
					</div>
				</div>
			</div>
			<!-- /.col-md-8 -->

			<div class="col-md-4">
				<!-- 결제 내역 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">결제 내역</h3>
					</div>
					<div class="panel-body" style="height: 500px;">
						<form>
							<div class="form form-horizontal">

								<div class="form-group">
									<label class="col-sm-4 control-label" for="">결제 금액</label>
									<div class="input-group col-sm-6">
									<!-- value에 totalprice -->
										<input class="form-control" type="number" id="paymentBefore"
											value="400000" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="">마일리지</label>
									<div class="input-group col-sm-6">
										<input class="form-control" id="resvMileage" type="number"
											value="0" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="">총 결제 금액</label>
									<div class="input-group col-sm-6">
									<!-- totalPrice동일 입력 -->
										<input class="form-control" id="paymentAfter" type="number"
											value="400000" readonly="readonly">
									</div>
								</div>
								<hr>
								<div class="row"
									style="height: 50px; margin-left: 5%; margin-right: 5%;">
									<div class="col-md-12">
										<button id="nextStep"
											class="btn btn-md btn-outline btn-success pull-right">
											<i class="glyphicon glyphicon-ok"></i> 결제하기
										</button>
										<button onclick="location.href='/'"
											class="btn btn-md btn-outline btn-danger pull-right">
											<i class="glyphicon glyphicon-home"></i> 취소
										</button>

									</div>
									<!-- /.col-lg-12 -->
								</div>
								<!-- /.row -->
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
		
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	
	
	<form class="hide" id="paymentForm">
		
	</form>

	<script type="text/javascript">
		//maxlength 체크
		function maxLengthCheck(object) {
			if (object.value.length > object.maxLength) {
				object.value = object.value.slice(0, object.maxLength);
			}
		}
		
		
		$(document).ready(function() {
			// 초기 변수
			var calCheck = 0;
			
			
			//마일리지 차감
			$("#mileageCal").click(function(e) {
				e.preventDefault();
				if ($("#useMileage").val() == '') {
					$("#useMileage").val(0);
				}
				
				if (parseInt($("#userMileage").val()) >= parseInt($("#useMileage").val())){
					var sub = parseInt($("#userMileage").val()) - parseInt($("#useMileage").val());
					console.log($("#paymentAfter").val());
					$("#restMileage").val(sub);
					$("#resvMileage").val($("#useMileage").val());
					$("#paymentAfter").val(parseInt($("#paymentBefore").val()) - parseInt($("#useMileage").val()));
					console.log($("#paymentAfter").val());
					$("#resvPayamount").val($("#paymentAfter").val());
					$("#resvUsingmileage").val($("#useMileage").val());
					
					calCheck = 1;
				} else {
					alert("사용가능한 마일리지를 초과하였습니다.")
					$("#useMileage").val(0);
					$("#mileageCal").trigger("click");
					
					calCheck = 0;
				}
			});
			
			$("#paymethodSelect > li > a").click(function(e) {
				e.preventDefault();
				if ($(this).parent("li").hasClass("active")) {
					$("#resvPaymethod").val("");
				} else {
					$("#resvPaymethod").val($(this).text());
				}
				$("#paymethodSelect li").each(function() {
					$(this).removeClass("active");
				});
				$(this).parent("li").addClass("active");
				
			});
			
			$("#nextStep").click(function(e) {
				e.preventDefault();
				// 유효성 체크
				if ($("#resvPaymethod").val() == '') {
					alert("결제 수단을 선택해 주세요.");
					return;
				}
				if (calCheck != 1) {
					alert("사용할 마일리지를 결정해 주세요.");
					return;
				}
				
				$("#paymentForm").attr("method", "POST");
				$("#paymentForm").attr("action", "");
				$("#paymentForm").submit();
			});
			
		});
	</script>
	

</body>
</html>