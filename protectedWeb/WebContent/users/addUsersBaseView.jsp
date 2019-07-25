<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
	<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/layout/loginToolbar.jsp"></jsp:include>

		<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">회 원 가 입</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="formal">
		<input type="hidden" id="kakao" name="kakao" value="${ kakao }">
		<input type="hidden" id="google" name="google" value="${ google }">
		<input type="hidden" id="naver" name="naver" value="${ naver }">
		  <div class="form-group">
		    <label for="id" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="id" name="id" placeholder="중복확인하세요">
		       <span id="helpBlock1" class="help-block">
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="pw" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="pw2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호 확인">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickname" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임">
		      <span id="helpBlock2" class="help-block">
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="purpose" class="col-sm-offset-1 col-sm-3 control-label">이용목적</label>
		    <div class="col-sm-4">
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
		  </div>	  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <input type="submit" id="submit" name="submit" class="btn btn-primary" value="가 &nbsp;입">
		      <input type="submit" id="addition" name="addition" class="btn btn-primary" value="추가정보">
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		
 	</div>


     <!--  ///////////////////////// JavaScript ////////////////////////// -->
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
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	

		


		
		

	</script>		
</body>
</html>