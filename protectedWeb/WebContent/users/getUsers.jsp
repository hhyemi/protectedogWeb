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
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/profile.css">
    
    
    
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
                <div class="col-md-3">
                    <div class="card hovercard">
                        <div class="cardheader"></div>
                        <div class="avatar">
                        	<c:if test="${ user.profile != null }">
                            	<img src="/resources/file/fileUser/${ user.profile }" id="profileImage" data-toggle="modal" data-target="#profile-modal" class="img-fluid">
                            </c:if>
                            <c:if test="${ user.profile == null }">
                            	<img src="/resources/file/others/anonymous-250.jpg" class="img-fluid">
                            </c:if>
                        </div>
                        <div class="info">
                            <div class="title">
                                <a target="_blank" href="#">${ user.nickname }</a>
                            </div>
                            <div class="desc">${ user.email }</div> 
                            <hr>
                        </div>
                        <nav class="nav text-center prof-nav">
                            <ul  class="list-unstyled ">
                                <li><a href="#profile">Profile</a></li> 
                                <li><a href="#references">Setting</a></li> 
                                <li><a href="/users/logout">Logout</a></li> 
                            </ul>
                        </nav>
<!--                         <div class="bottom"> -->
<!--                             <a class="btn btn-info btn-twitter btn-sm" href="#"> -->
<!--                                 <i class="fa fa-twitter"></i> -->
<!--                             </a> -->
<!--                             <a class="btn btn-danger btn-sm" rel="publisher" -->
<!--                                href="#"> -->
<!--                                 <i class="fa fa-google-plus"></i> -->
<!--                             </a> -->
<!--                             <a class="btn btn-primary btn-sm" rel="publisher" -->
<!--                                href="#"> -->
<!--                                 <i class="fa fa-facebook"></i> -->
<!--                             </a>  -->
<!--                         </div> -->
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="card hovercard">
                        <div class="tab" role="tabpanel"> 
                            <ul class="nav nav-tabs" role="tablist">
                              <li class="nav-item ">
                                <a class="nav-link active" href="#profile" role="tab" data-toggle="tab"><span><i class="fa fa-user"></i></span> Profile</a>
                              </li>
<!--                               <li class="nav-item"> -->
<!--                                 <a class="nav-link" href="#buzz" role="tab" data-toggle="tab"><span><i class="fa fa-inbox"></i></span> Inbox</a> -->
<!--                               </li> -->
                              <li class="nav-item">
                                <a class="nav-link" href="#references" role="tab" data-toggle="tab"><span><i class="fa fa-cog"></i></span> Setting</a>
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
                             	  <form enctype="multipart/form-data">
                                    <div class="row mx-2">
                                        <div class="col-md-12 panel-heading">
                                            <h3 class="panel-title"><i class="fa fa-comment"></i>내 정보 수정</h3><br>
                                        </div>
                                        <div class="col-md-6 ">
                                            <div class="form-group row">
                                                <label for="example-text-input" style="width: 85px;" class=" col-form-label">회원명</label>
                                                <div class="col-9">
                                                    <input class="form-control" type="text" value="${ user.userName }" id="userName" name="userName">
                                                </div>
                                            </div> 
                                            <div class="form-group row">
                                                <label for="example-email-input" style="width: 85px;" class=" col-form-label">비밀번호</label>
                                                <div class="col-9">
                                                    <input class="form-control" type="password" value="${ user.pw }" id="pw" name="pw">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="example-url-input" style="width: 85px;" class=" col-form-label">비밀번호확인</label>
                                                <div class="col-9">
                                                    <input class="form-control" type="password" value="${ user.pw }" id="pw2" name="pw2">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="example-text-input" style="width: 85px;" class=" col-form-label">닉네임</label>
                                                <div class="col-9">
                                                    <input class="form-control" type="text" value="${ user.nickname }" id="nickname" name="nickname">
                                                </div>
                                            </div>
	                                        <div class="form-group row">
	                                               <label for="example-text-input" style="width: 85px;" class=" col-form-label">프로필사진</label>
												   <div class="col-9">
													  <input type="file" class="form-control" id="profile" name="file" style="width: 300px; 
															height: 40px" maxLength="13" value="${ user.profile }"/>
												   </div>
	                                        </div>
						                   <nav class="nav text-center prof-nav">
					                            <ul  class="list-unstyled ">
					                                <li><a id="submit">정보수정</a></li> 
					                                <li><a id="reset">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</a></li>
					                            </ul>
					                        </nav>
                                       </div>
                                        
                                        <div class="col-md-6">

                                            <div class="form-group row">
                                            	<input type="hidden" id="authKeyReturn" value="">
                                                <label for="example-date-input" style="width: 85px;" class=" col-form-label">이메일</label>
                                                <div class="col-9">
                                                    <input class="form-control" type="email" id="email" name="email">
                                                </div>
                                                <div id="mailAuth" style="display:none">
											      <input type="text" id="checkMail"/>
											      <input type="button" id="mailClick" value="전송"/>
											    </div>
											    <input type="button" id="authMail" name="authMail" value="인증하기">
                                            </div>
                                            <div class="form-group row">
											    <label for="example-date-input" style="width: 85px;" class=" col-form-label">휴대전화번호</label>
											    <div class="col-sm-3">
											        <select class="form-control" name="phone1" id="phone1">
													  	<option value="010" ${ ! empty user.phone1 && user.phone1 == "010" ? "selected" : ""  } >010</option>
														<option value="011" ${ ! empty user.phone1 && user.phone1 == "011" ? "selected" : ""  } >011</option>
														<option value="016" ${ ! empty user.phone1 && user.phone1 == "016" ? "selected" : ""  } >016</option>
														<option value="018" ${ ! empty user.phone1 && user.phone1 == "018" ? "selected" : ""  } >018</option>
														<option value="019" ${ ! empty user.phone1 && user.phone1 == "019" ? "selected" : ""  } >019</option>
													</select>
											    </div>
											    <div class="col-sm-3">
													<input type="text" class="form-control" id="phone2" name="phone2">
											    </div>
											    <div class="col-sm-3">
													<input type="text" class="form-control" id="phone3" name="phone3">
											    </div>
												<input type="hidden" value="${ user.phone }" name="phone"/>
											    <div id="authButton" style="display:none">
													<input type="text" id="checkAuth"/>
													<input type="button" id="authClick" value="전송"/>
											    </div>
									 		    <input type="button" id="authPhone" name="authPhone" value="인증하기">
                                            </div>
                                            <div class="form-group row">
                                                <label for="example-url-input" style="width: 85px;" class=" col-form-label">자택주소</label>
											    <div class="col-sm-5">
											      <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
											    </div>
											      
											    <div class="col-sm-4">
												  <input type="button" class="form-control" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
												</div>
                                            </div>  
                                            <div class="form-group row">
                                                <label for="example-url-input" style="width: 85px;" class=" col-form-label"></label>
												  <div class="col-sm-9">
												      <input type="text" class="form-control" id="userAddr" name="simpleAddress" placeholder="주소" value="${ user.userAddr }" readonly="readonly">
												      <br>
													  <input type="text" class="form-control"  id="sample6_extraAddress" placeholder="참고항목">
													  <input type="text" class="form-control" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
													  <input type="hidden" name="userAddr" value="">
												  </div>
                                            </div>  
                                        </div>
                                    </div> 
                                 </form>
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
			
			$( "#submit" ).on("click" , function() {
				var value = "";	
				
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

				
				$("form").attr("method" , "POST").attr("action" , "/users/updateUsers").submit();
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
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			$("#reset").on("click" , function() {
				$("form")[0].reset();
			});
		});
		

    </script> 
</body>

</html>