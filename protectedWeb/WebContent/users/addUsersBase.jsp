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
    <link rel="stylesheet" href="css/pages/register.css">
    


</head>

<body> 

<!--====================================================
                         MAIN NAVBAR
======================================================-->        

	
    <header class="header">
		<jsp:include page="/layout/toolbar.jsp"></jsp:include>
    </header>

<!--====================================================
                        PAGE CONTENT
======================================================-->
	<br/>
	<br/>
	<br/>
    <div class="page-content d-flex align-items-stretch">

            <!--***** CONTENT *****-->     


                <!--***** USER INFO *****-->
                <div class="col-md-3">
                </div>
                <div class="col-md-6 login-card">
                    <div class="card form" id="form1">
                        <div class="card-header" align="center">
                            <h3><i class="fa fa-user-circle"></i>회원가입</h3>
                        </div>
                        <br>
                        <form class="addUsersForm" style="padding-left: 90px;">
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label for="id">아 이 디</label>
                                        <input type="text" class="form-control" id="id" name="id" aria-describedby="emailHelp" placeholder="Enter ID">
										<span id="helpBlock1" class="help-block"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="cont-number">비 밀 번 호</label>
                                        <input type="password" class="form-control" id="pw" name="pw" aria-describedby="emailHelp" placeholder="Enter Password">
                                    </div> 

                                    <div class="form-group has-success">
                                        <label for="website">비밀번호 확인</label>
                                        <input type="password" class="form-control" id="pw2" name="pw2" aria-describedby="emailHelp" placeholder="Confirm Password">

                                    </div>  
                                    <div class="form-group">
                                        <label for="userName">회 원 명</label>
                                        <input type="email" class="form-control" id="userName" name="userName" aria-describedby="emailHelp" placeholder="Enter UserName">
                                    </div>
                                    <div class="form-group">
                                        <label for="nickname">닉 네 임</label>
                                        <input type="email" class="form-control" id="nickname" name="nickname" aria-describedby="emailHelp" placeholder="Enter Nickname">
                                        <span id="helpBlock2" class="help-block"></span>
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
							<button type="submit" id="submit" class="btn btn-general btn-blue mr-2">회원가입</button>
                            <button type="submit" id="addition" class="btn btn-general btn-blue mr-2">추가정보입력</button>
                            <button type="reset" id="reset" class="btn btn-general btn-white">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</button> 
                        	<br/>
                       		<br/>
                        	<br/>
							</form>	
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
		$(function() {
			
			$( "#submit" ).on("click" , function() {
				var id=$("input[name='id']").val();
				var pw=$("input[name='pw']").val();
				var pw_confirm=$("input[name='pw2']").val();
				var name=$("input[name='userName']").val();
				var check=$("input:checkbox[name='purpose[]']:checked");
				
				if(id == null || id.length <1){
					alert("아이디는 반드시 입력하셔야 합니다.");
					return;
				}
				if(id.length < 8 || id.length > 12){
					alert("아이디는 8자 이상 12자 이하로 입력하셔야 합니다.");
					return;
				}
				if(pw == null || pw.length <1){
					alert("패스워드는  반드시 입력하셔야 합니다.");
					return;
				}
				if(pw.length < 8 || pw.length > 12){
					alert("패스워드는 8자 이상 12자 이하로 입력하셔야 합니다.");
					return;
				}
				if(pw_confirm == null || pw_confirm.length <1){
					alert("패스워드 확인은  반드시 입력하셔야 합니다.");
					return;
				}
				if(name == null || name.length <1){
					alert("이름은  반드시 입력하셔야 합니다.");
					return;
				}
				if( pw != pw_confirm ) {				
					alert("비밀번호 확인이 일치하지 않습니다.");
					$("input:text[name='password2']").focus();
					return;
				}
				if( check.length != 3 || check.length == 0){
					alert("이용목적을 3개 체크해주세요");
					return;
				}
				
				$("form[name=formal]").attr("method" , "POST").attr("action" , "/users/addUsersBase");
				
				alert("미인증회원으로 가입되셨습니다. 인증하시려면 개인정보수정란에서 추가정보를 기입해주십시오.")
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
							$('#helpBlock1').html("사용가능");
							$('#submit').attr('disabled', false);
						}else{
							$('#helpBlock1').html("사용불가");
							$('#submit').attr('disabled', true);
						}
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
							$('#helpBlock2').html("사용가능");
							$('#submit').attr('disabled', false);
						}else{
							$('#helpBlock2').html("사용불가");
							$('#submit').attr('disabled', true);
						}
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			});
		});
	
		
		$(function() {
			
			$( "#addition" ).on("click" , function() {
				var id=$("input[name='id']").val();
				var pw=$("input[name='pw']").val();
				var pw_confirm=$("input[name='pw2']").val();
				var name=$("input[name='userName']").val();
				
				
				if(id == null || id.length <1){
					alert("아이디는 반드시 입력하셔야 합니다.");
					return;
				}
				if(pw == null || pw.length <1){
					alert("패스워드는  반드시 입력하셔야 합니다.");
					return;
				}
				if(pw_confirm == null || pw_confirm.length <1){
					alert("패스워드 확인은  반드시 입력하셔야 합니다.");
					return;
				}
				if(name == null || name.length <1){
					alert("이름은  반드시 입력하셔야 합니다.");
					return;
				}
				
				if( pw != pw_confirm ) {				
					alert("비밀번호 확인이 일치하지 않습니다.");
					$("input:text[name='password2']").focus();
					return;
				}
				
				$("form[name=formal]").attr("method" , "POST").attr("action" , "/users/addUsersBase2");
				
				alert("인증페이지로 넘어갑니다.")
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
					alert("3개까지 선택 가능합니다.");
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