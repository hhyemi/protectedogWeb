<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/pages/register.css">
    
		<jsp:include page="/layout/toolbar.jsp"></jsp:include>

</head>

<body> 

<!--====================================================
                         MAIN NAVBAR
======================================================-->        


<!--====================================================
                        PAGE CONTENT
======================================================-->

	<div class="hero-wrap hero-bread" style="padding-bottom: 0px; padding-top : 10px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/index.jsp">Regist</a></span>
					</p>
					<h1 class="mb-0 bread">회원가입</h1>
				</div>
			</div>
		</div>
	</div>
	
	<br/>
	<br/>
	
    <div class="page-content d-flex align-items-stretch">
                <!--***** USER INFO *****-->
                <div class="col-md-3">
                </div>
                <div class="col-md-6 login-card">
                    <div class="card form" id="form1">
                        <div class="card-header" align="center">
                            <h3><i class="fa fa-user-circle"></i>기본정보</h3>
                        </div>
                        <br>
                        <form class="addUsersForm" name="formal" style="padding-left: 90px;">
                        <input type="hidden" name="kakao" value="${ kakao }">
                        <input type="hidden" name="naver" value="${ naver }">
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label for="id">아 이 디</label>
                                        <input type="text" class="form-control" id="id" name="id" aria-describedby="emailHelp" placeholder="아이디를 입력하세요">
										<span id="helpBlock1" class="help-block" style="font-size: 14px; display: none;"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="cont-number">비 밀 번 호</label>
                                        <input type="password" class="form-control" id="pw" name="pw" aria-describedby="emailHelp" placeholder="비밀번호를 입력하세요">
                                    </div> 

                                    <div class="form-group has-success">
                                        <label for="website">비밀번호 확인</label>
                                        <input type="password" class="form-control" id="pw2" name="pw2" aria-describedby="emailHelp" placeholder="비밀번호를 확인하세요"
                                        style="margin-bottom: 0;">
										<span id="helpBlock3" class="help-block" style="font-size: 14px; display: none;"></span>
                                    </div>  
                                    <div class="form-group">
                                        <label for="userName">회 원 명</label>
                                        <input type="text" class="form-control" id="userName" name="userName" aria-describedby="emailHelp" placeholder="본인의 이름을 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="nickname">닉 네 임</label>
                                        <input type="text" class="form-control" id="nickname" name="nickname" aria-describedby="emailHelp" placeholder="사용하실 닉네임을 입력하세요">
                                        <span id="helpBlock2" class="help-block" style="font-size: 14px; display: none;"></span>
                                    </div>
                                </div>
                            </div> 
                            
                            <div class="card form col-md-10">
                            	<div class="row mt-3" align="center">
									<div class="col-md-12" align="center">
                                	    <h4 style="border-bottom: 1px solid #ddd; padding-bottom: 7px; color:#555; padding-right: 10px;">이용목적</h4>
                                	</div>
                           		</div>
							  	<div class="form-group col-md-12">

									<div class="col-sm-12">
										<span>이용목적을 3개 입력해주세요</span>
										<br/>
										<input type="checkbox" name="purpose[]" id="fund" value="펀딩참여"/>펀딩참여
							      		<br/>
					              		<input type="checkbox" name="purpose[]" id="adopt" value="입양 및 분양"/>입양 및 분양
					              		<br/>
					             		<input type="checkbox" name="purpose[]" id="buying" value="물품구매"/>물품구매
					              		<br/>
					              		<input type="checkbox" name="purpose[]" id="selling" value="물품판매"/>물품판매
					              		<br/>
					              		<input type="checkbox" name="purpose[]" id="info" value="정보공유"/>정보공유
					              		<br/>
					              		<input type="checkbox" name="purpose[]" id="etc" value="기타"/>기타
							    	</div>

							    	<br/>
							    </div>
							  </div>
                        	<br/>
                       		<br/>
                        	<br/>
							</form>
							<div class="col-sd-12" style="display: inline-block;">
								<div class="col-sd-4" style="float:right;">
									<button id="submit" class="btn btn-default">회원가입</button>
								</div>
								<div class="col-sd-4" style="float:right;">
									<button id="addition" class="btn btn-default">추가정보입력</button>
								</div>
								<div class="col-sd-4" style="float:right;">
									<button id="reset" class="btn btn-default">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</button> 
								</div>
							</div>
                         </div> 
                    </div>
  
            </div> 

    	<jsp:include page="/layout/footer.jsp"></jsp:include>

    <!--Global Javascript -->
    <script src="/resources/newTemplate/admin/js/jquery.min.js"></script>
    <script src="/resources/newTemplate/admin/js/popper/popper.min.js"></script>
    <script src="/resources/newTemplate/admin/js/tether.min.js"></script>
    <script src="/resources/newTemplate/admin/js/bootstrap.min.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.cookie.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.validate.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/chart.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/front.js"></script> 
    
    <!--Core Javascript -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
			
			
			$("input[name=id]").keyup(function(){
				if($("input:text[name=id]").val().length > 12) {
					swal({
						text : "아이디가 제한길이를 초과하였습니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					});
					$("input[name='pw']").focus();
				}
			});
			
			$("#pw").on("keyup", function(){
				if(limitPw.length > 12) {
					swal({
						text : "비밀번호가 제한길이를 초과하였습니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					});
					$("input[name='id']").focus();
				}	
			});
		
			$("#nickname").on("keyup", function(){
				if(limitNick.length > 10) {
					swal({
						text : "닉네임이 제한길이를 초과하였습니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input[name='nickname']").focus();
				}
			})

		
		$(function() {
			
			$("#pw2").on("keyup", function(){
				if($("#pw2").val() == $("#pw").val()){
					$('#helpBlock3').show();
					$("#pw2").css("background-color", "#A9F5D0");
					$('#helpBlock3').css("color", "#A9F5D0")
					$('#helpBlock3').text("비밀번호가 일치합니다");
				}else{
					$('#helpBlock3').show();
					$("#pw2").css("background-color", "#F5A9BC");
					$('#helpBlock3').css("color", "#F5A9BC")
					$('#helpBlock3').text("비밀번호가 일치하지 않습니다");
				}				
			})

			
			$( "#submit" ).on("click" , function() {
				var id=$("#id").val();
				var pw=$("#pw").val();
				var pw_confirm=$("#pw2").val();
				var name=$("#userName").val();
				var nickname=$("#nickname").val();
				var check=$("input:checkbox[name='purpose[]']:checked");
// 				alert(id+","+pw+","+pw_confirm+","+name+","+nickname);
// 				alert()

// 				debugger;
				
				if(id == null || id.length <1){
					swal({
						text : "아이디는 반드시 입력하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='id']").focus();
					return false;
				}
				if(id.length < 8 || id.length > 12){
					swal({
						text : "아이디는 8자 이상 12자 이하로 입력하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='id']").focus();
					return false;
				}
				
				if(pw == null || pw.length <1){
					swal({
						text : "비밀번호는 반드시 입력하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='pw']").focus();
					return false;
				}
				if(pw.length < 8 || pw.length > 12){
					swal({
						text : "비밀번호는 8자 이상 12자 이하로 입력하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='pw']").focus();
					return false;
				}
				
				if(pw_confirm == null || pw_confirm.length <1){
					swal({
						text : "비밀번호는 반드시 확인하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='pw2']").focus();
					return false;
				}
				
				if(name == null || name.length <1){
					swal({
						text : "이름은 반드시 입력하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='userName']").focus();
					return false;
				}
				
				if( pw != pw_confirm ) {				
					swal({
						text : "비밀번호가 일치하지 않습니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='pw2']").focus();
					$("input:password[name='pw2']").val('');
					return false;
				}
				
				if( check.length != 3 || check.length == 0){
					swal({
						text : "이용목적은 3개를 선택하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					return false;
				}
				swal({
					text : "미인증회원으로 가입되셨습니다. 추가정보를 기입하시면 인증회원으로 가입하실 수 있습니다.",
					buttons : {
						catch : {
							text : "확인"
						}
					}
				})
				.then((A) => {
					if(A) {
						$("form[name=formal]").attr("method" , "POST").attr("action" , "/users/addUsersBase").submit();
					}
				})
// 				alert("미인증회원으로 가입되셨습니다. 추가정보를 기입하시면 인증회원으로 가입하실 수 있습니다.");
				
// 				$("form[name=formal]").attr("method" , "POST").attr("action" , "/users/addUsersBase");
				
			});
		});	
		
		$(function(){
			
			$("#id").keyup(function(){
				var id=$("#id").val();
				var checkId=JSON.stringify({id:id});
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/users/json/checkId",
					data : checkId,
					datatype : "json" ,
					success : function(response){
						if($.trim(response.result)==0){
							$('#helpBlock1').show();
							$('#helpBlock1').html("사용가능");
							$("#id").css("background-color", "#A9F5D0");
							$('#helpBlock1').css("color", "#A9F5D0");
							$('#submit').attr('disabled', false);
						}else{
							$('#helpBlock1').show();
							$('#helpBlock1').html("사용불가");
							$("#id").css("background-color", "#F5A9BC");
							$('#helpBlock1').css("color", "#F5A9BC");
							$('#submit').attr('disabled', true);
						}
					},
					error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			});
		});
		
		$(function(){
			
			$("#nickname").keyup(function(){
				var nickname=$("#nickname").val();
				var checkNick=JSON.stringify({nickname:nickname});
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/users/json/checkNick",
					data : checkNick,
					datatype : "json" ,
					success : function(response){
						if($.trim(response.result)==0){
							$('#helpBlock2').show();
							$('#helpBlock2').html("사용가능");
							$("#nickname").css("background-color", "#A9F5D0");
							$('#helpBlock2').css("color", "#A9F5D0")
							$('#submit').attr('disabled', false);
						}else{
							$('#helpBlock2').show();
							$('#helpBlock2').html("사용불가");
							$("#nickname").css("background-color", "#F5A9BC");
							$('#helpBlock2').css("color", "#F5A9BC");
							$('#submit').attr('disabled', true);
						}
					},
					error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			});
		});
	
		
		$(function() {
			
			$( "#addition" ).on("click" , function() {
				var id=$("#id").val();
				var pw=$("#pw").val();
				var pw_confirm=$("#pw2").val();
				var name=$("#userName").val();
				var nickname=$("#nickname").val();
				var check=$("input:checkbox[name='purpose[]']:checked");
// 				alert(id+","+pw+","+pw_confirm+","+name+","+nickname);
				
				if(id == null || id.length <1){
					swal({
						text : "아이디는 반드시 입력하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='id']").focus();
					return false;
				}
				if(id.length < 8 || id.length > 12){
					swal({
						text : "아이디는 8자 이상 12자 이하로 입력하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='id']").focus();
					return false;
				}
				
				if(pw == null || pw.length <1){
					swal({
						text : "비밀번호는 반드시 입력하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='pw']").focus();
					return false;
				}
				if(pw.length < 8 || pw.length > 12){
					swal({
						text : "비밀번호는 8자 이상 12자 이하로 입력하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='pw']").focus();
					return false;
				}
				
				if(pw_confirm == null || pw_confirm.length <1){
					swal({
						text : "비밀번호는 반드시 확인하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='pw2']").focus();
					return false;
				}
				
				if(name == null || name.length <1){
					swal({
						text : "이름은 반드시 입력하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='userName']").focus();
					return false;
				}
				
				if( pw != pw_confirm ) {				
					swal({
						text : "비밀번호가 일치하지 않습니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					$("input:password[name='pw2']").focus();
					$("input:password[name='pw2']").val('');
					return false;
				}
				if( check.length != 3 || check.length == 0){
					swal({
						text : "이용목적은 3개를 선택하셔야 합니다.",
						icon : "error",
						buttons :{
							catch : {
								text : "확인"
							}
						}
					})
					return false;
				}
				
				swal({
					text : "미인증회원으로 가입되셨습니다. 추가정보를 기입하시면 인증회원으로 가입하실 수 있습니다.",
					buttons : {
						catch : {
							text : "확인"
						}
					}
				})
				.then((A) => {
					if(A) {
						$("form[name=formal]").attr("method" , "POST").attr("action" , "/users/addUsersBase2").submit();
					}
				})
			});
		});	
		
		$(function(){
			$($("input:checkbox")).on("click", function(){
// 				alert($(this).is(":checked"));
				var chkNo=$('input:checkbox:checked').length;
// 				alert(chkNo);
				var purpose=$("input:checkbox[name='purpose[]']:checked");
				$.each(purpose, function(index, value){
// 					alert($(value).val());
				})
				if(chkNo>3){
					swal({
//	 					icon : "error",
						buttons :{
							catch : {
								text : "닫기"
							}
						}
					})
					$(this).prop("checked", false);
				}
			})
		})
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			$("#reset").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	

		


		
		

	</script>	


</body>

</html>