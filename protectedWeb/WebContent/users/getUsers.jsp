<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>보호할개 : 마이페이지</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="/resources/newTemplate/css/style.css">
    

    
    <jsp:include page="/layout/toolbar.jsp" />
    
    
</head>

<body> 

	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content loginSection">
				<img src="/resources/file/fileUser/${ user.profile }" width="auto" style="max-height:700px;">
			</div>
		</div>
	</div>

	<div class="hero-wrap hero-bread" style="padding-bottom: 0px; padding-top : 10px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/index.jsp">My Info</a></span>
					</p>
					<h1 class="mb-0 bread">내정보보기</h1>
				</div>
			</div>
		</div>
	</div>
	
	<br/>
	<br/>


<!--====================================================
                        PAGE CONTENT
======================================================-->
    <div class="page-content d-flex align-items-stretch">

        <!--***** SIDE NAVBAR *****-->
		<jsp:include page="/users/mypage/userSideBar.jsp"></jsp:include>

        <div class="content-inner chart-cont">

            <!--***** CONTENT *****-->     
            <div class="row mt-2" id="card-prof">
                <div class="col-md-12">
                    <div class="card hovercard">
                        <div class="tab" role="tabpanel"> 
                            <ul class="nav nav-tabs" role="tablist">
                              <li class="nav-item" >
                                <a class="nav-link active" href="#profile" role="tab" data-toggle="tab"><span><i class="fa fa-user"></i></span>내 프로필</a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link" href="#references" role="tab" data-toggle="tab"><span><i class="fa fa-cog"></i></span> 회원정보수정</a>
                              </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content tabs">
                              <div role="tabpanel" class="tab-pane fade show active" id="profile">
                                   
                                    <div class="row mt-3">
                                        <h5 class="col-12 mb-2">나의 정보</h5>
                                        <br/>
                                        <br/>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-envelope"> 아이디 : </i></strong>
												<div>${ user.id }</div>
                                            </div>
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-phone"> 닉네임 : </i></strong>
												<div>${ user.nickname }</div>
                                            </div>
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-map"> 회원명 : </i></strong>
												<div>${ user.userName }</div>
                                            </div>
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-map"> 회원등급 : </i></strong>
												<div>${ user.levels }(${ user.levelPoint })</div>
                                            </div> 
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-globe"> 이메일 : </i></strong>
												<div>${ user.email }</div>
                                            </div>
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-map-marker"> 자택주소 : </i></strong>
												<div>${ user.userAddr }</div>
                                            </div>
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-globe"> 휴대전화 : </i></strong>
												<div>${ user.phone }</div>
                                            </div>
                                            <div class="form-group">
                                                <strong class="mr-5"><i></i></strong>
                                            </div>                                              
                                        </div>
                                    </div>
                              </div>

                              <div role="tabpanel" class="tab-pane fade" id="references">
				                <div class="col-md-3">
				                </div>
				                <div class="col-md-6 login-card">
				                    <div class="card form" id="form1">
				                        <div class="card-header" align="center">
				                            <h3><i class="fa fa-user-circle"></i>추가정보</h3>
				                        </div>
				                        <br>
				                        <form class="addUsersForm" name="formal" style="padding-left: 90px; height: 600px">
											<input type="hidden" id="id" name="id" value=${ sessionScope.user.id }>
											<input type="hidden" name="levelPoint" value=100>
											<input type="hidden" id="authKeyReturn" value="">                     
				                            <div class="row">
				                                <div class="col-md-10">
				                                
				                                    <div class="form-group">
				                                        <label for="email">이 메 일</label>
													    <div>
														    <div class="col-sm-9" style="float:left; padding-left:0; padding-right:0;">
														      <input type="text" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="이메일주소를 입력하세요">
															</div>
														    <div id="mailAuth" style="display:none">
														      		<input type="text" id="checkMail"/>
														      		<button type="button" class="btn btn-default" id="mailClick">전송</button>
														    </div>
														    <div class="col-sm-3 authMail" style="float:left; padding-top:0;">
																<button type="button" class="btn btn-default" id="authMail" name="authMail" style="margin:0;">인증하기</button>
															</div>
													    </div>
				                                    </div>
				                                    
				                                    <br/>
				                                    <br/>
				                                    <br/>
				                                    
				                                    <div class="form-group">
				                                        <label for="phone">휴대전화번호</label>
				                                        <div>
					                                        <div class="col-sm-3" style="float:left; padding-left:0">
																<select class="form-control" name="phone1" id="phone1">
																  	<option value="010" >010</option>
																	<option value="011" >011</option>
																	<option value="016" >016</option>
																	<option value="018" >018</option>
																	<option value="019" >019</option>
																</select>
					                                        </div>
														    <div class="col-sm-3" style="float:left;">
														      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="">
														    </div>
														    <div class="col-sm-3" style="float:left; padding-right:0">
														      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="">
														    </div>
														    <input type="hidden" name="phone"/>
														    <div id="authButton" style="display:none">
														   		<input type="text" id="checkAuth"/>
														    	<button type="button" class="btn btn-default" id="phoneClick">전송</button>
														    </div>
														    <div class="col-sm-3 authPhone" style="float:left;">
												 		    	<button type="button" class="btn btn-default" id="authPhone" name="authPhone" style="margin:0;">인증하기</button>
												 		    </div>
													    </div>
				                                    </div>
				                                    <br/>
				                                    <br/>
				                                    <br/>
				
				                                    <div class="form-group">
				                                        <label for="userAddr">자택주소</label>
				                                        <div>
															<div class="col-sm-6" style="float:left; padding-left: 0">
																<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
															</div>
							      
															<div class="col-sm-6" style="float:left; padding-right: 0;">
																<button type="button" class="btn btn-default" 
																style="margin:0; width:100%; height:40px;" onclick="execDaumPostcode()">검색</button><br>
															</div>
														</div>
				                                    </div> 
				                                    
				                                    <div class="form-group">
														<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"></label>
														<div class="col-sm-12" style="padding: 0;">
															<input type="text" class="form-control" id="userAddr" name="simpleAddress" placeholder="주소" readonly="readonly">
															<br>
															<input type="hidden" class="form-control"  id="sample6_extraAddress" placeholder="참고항목">
															<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
															<input type="hidden" name="userAddr" value="">
														</div>
				                                    </div>
				                                    
				                                    <div class="form-group">
				                                    	<div class="col-sm-6" style="float: left; padding-left: 0;">
															<label for="birthDate">생 년 월 일</label>                                        
															<input type="text" class="form-control" id="birthDate" name="birthDate" aria-describedby="emailHelp" placeholder="생년월일 6자리를 입력하세요">
				                                        </div>
				                                        <div class="col-sm-6" style="float: left; padding-right: 0;">
				                                        	<label for="gender">성 별</label> 
															<select class="form-control" name="gender" id="gender">
																<option value="m">남자</option>
																<option value="f">여자</option>
															</select>
														</div>
				                                    </div>
				                                </div>
				                            </div> 
											<br/>
											<br/>
											<br/>
				<!--                             <button type="submit" id="submit" class="btn btn-default">회원가입</button> -->
				<!--                             <button type="reset" id="reset" class="btn btn-default">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</button>  -->
				                        </form>
											<div class="col-sd-12" style="display: inline-block; padding-left:430px; padding-bottom:50px;">
												<div class="col-sd-6" style="float:left;">
													<button id="submit" class="btn btn-default">회원가입</button>
												</div>
												<div class="col-sd-6" style="float:left;">
													<button id="reset" class="btn btn-default">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</button> 
												</div>
											</div>
				                    </div>
				            </div>                           

                              </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 

        </div>
    </div> 

    <!--Global Javascript -->
    <script src="/resources/newTemplate/admin/js/jquery.min.js"></script>
    <script src="/resources/newTemplate/admin/js/popper/popper.min.js"></script>
    <script src="/resources/newTemplate/admin/js/tether.min.js"></script>
    <script src="/resources/newTemplate/admin/js/bootstrap.min.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.cookie.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.validate.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/chart.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/front.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
    <!--Core Javascript -->
    <script>
        
		$(function() {
			
			$("#pw2").on("keyup", function(){
				if($("#pw2").val() == $("#pw").val()){
					$("#pw2").css("background-color", "#A9F5D0");
					$('#helpBlock1').css("color", "#A9F5D0")
					$('#helpBlock1').text("비밀번호가 일치합니다");
				}else{
					$("#pw2").css("background-color", "#F5A9BC");
					$('#helpBlock1').css("color", "#F5A9BC")
					$('#helpBlock1').text("비밀번호가 일치하지 않습니다");
				}				
			})
			
			$( "#submit" ).on("click" , function() {
				
				
				var value = "";	
				var pw=$("#pw").val();
				var pw_confirm=$("#pw2").val();
				var name=$("#userName").val();
				var nickname=$("#nickname").val();
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
				
				if($("input:text[name='phone2']").val() == "" && $("input:text[name='phone3']").val() != "" ){
					$("input:hidden[name='phone']").val(${user.phone});
					
				}
				if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
					var value = $("option:selected").val() + "-" 
								+ $("input[name='phone2']").val() + "-" 
								+ $("input[name='phone3']").val();
					$("input:hidden[name='phone']").val( value );
				}
				
				if($("input:text[name='simpleAddress']").val == "" && $("input:text[name='detailAddress']").val() == "") {
					$("input:hidden[name='userAddr']").val('${user.userAddr}');
				}
				
				if($("input:text[name='simpleAddress']").val != "" && $("input:text[name='detailAddress']").val() != "") {
					var address=$("input[name='simpleAddress']").val() + " " + $("input[name='detailAddress']").val();
				}
				
				$("input:hidden[name='userAddr']").val(address);
				
				swal({
					text : "회원정보가 수정되었습니다.",
					buttons : {
						catch : {
							text : "확인"
						}
					}
				})
				.then((A) => {
					if(A) {
						$("form").attr("method" , "POST").attr("action" , "/users/updateUsers").submit();
					}
				})

			});
		});	
		
		$(function(){
		
			$("#authPhone").on("click", function(){
				var value = "";	
				if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
					var value = $("option:selected").val() + "-" 
								+ $("input[name='phone2']").val() + "-" 
								+ $("input[name='phone3']").val();
				}

				$("input:hidden[name='phone']").val( value );
				
				var check=$("input:hidden[name='phone']").val();
				
				$.ajax({
					
					url:"/users/json/sendSMS",
					method:"POST",
					data:JSON.stringify({
						phone:check
					}),
					headers: {
						"accept":"application/json",
						"content-type":"application/json"
					},
					success:function(authPhone, status){
// 						alert(status);
// 						alert(authPhone.authKey);
						$("#authKeyReturn").val(authPhone.authKey);
						$("#authButton").show();
					}
					
				})

			})
			
		});
		
		$(function() {
			$("#authClick").on("click", function(){
				if($("#checkAuth").val()==$("#authKeyReturn").val()){
					$("#authButton").hide();
					$("#authPhone").hide();
					alert("인증되었습니다.");
				}else{
					alert("인증번호가 맞지 않습니다.");
				}
			})
		});
		
		$(function(){
			
			$("#authMail").on("click", function(){

				var check=$("input[name='email']").val();

					$.ajax({
						
						url:"/users/json/mailSender",
						method:"POST",
						data:JSON.stringify({email:check}),
						headers: {
							"accept":"application/json",
							"content-type":"application/json"
						},
						success:function(authMail, status){
// 							alert(status);
// 							alert(authMail.authKey);
							$("#authKeyReturn").val(authMail.authKey);
							$("#mailAuth").show();
						}
									
					})
		
				})
					
			});

			$(function() {
				$("#mailClick").on("click", function(){
					if($("#checkMail").val()==$("#authKeyReturn").val()){
						$("#authMail").hide();
						$("#mailAuth").hide();
						alert("인증되었습니다.");
					}else{
						alert("인증번호가 맞지 않습니다.");
					}
				})
			});
		
		
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			    	return;
			     }
			});
			 
		});
		 
			function execDaumPostcode() {
			    new daum.Postcode({
			        oncomplete: function(data) {
			        	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var userAddr = ''; // 주소 변수
			            var extraAddr = ''; // 참고항목 변수

			            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                userAddr = data.roadAddress;
			            } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                userAddr = data.jibunAddress;
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
			            document.getElementById("userAddr").value = userAddr;
			            // 커서를 상세주소 필드로 이동한다.
			            document.getElementById("sample6_detailAddress").focus();
			        }
			    }).open();
			 }
			
			
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
								$('#helpBlock2').html("사용가능");
								$("#nickname").css("background-color", "#A9F5D0");
								$('#helpBlock2').css("color", "#A9F5D0")
								$('#submit').attr('disabled', false);
							}else{
								$('#helpBlock2').html("사용불가");
								$("#nickname").css("background-color", "#F5A9BC");
								$('#helpBlock2').css("color", "#F5A9BC");
								$('#submit').attr('disabled', true);
							}
						},
						error : function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					})
				});
			});
			
			
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			$("#reset").on("click" , function() {
				$("form")[0].reset();
			});
		});
		

    </script> 
</body>

</html>