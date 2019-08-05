<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

							<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="messageModal" class="modal fade" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="text-align: center;">
											<div class="hero-wrap hero-bread" 
											style="padding-bottom: 10px; padding-top : 20px; display: inline-block;">
												<div class="container">
													<div class="row no-gutters slider-text align-items-center justify-content-center">
														<div class="col-md-12 ftco-animate text-center" style="padding-left: 125px;">
															<p class="breadcrumbs">
																<span class="mr-6"><a href="#">SendMessage</a></span>
															</p>
															<font size="7">쪽지작성</font>
														</div>
													</div>
												</div>
											</div>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" class="form-horizontal sendMessage">
                                            <input type="hidden" name="senderNick" value="${ sessionScope.user.nickname }">
                                            <input type="hidden" name="messageStatus" value="0"/>
											<input type="hidden" name="delCode" value="0"/>
                                                <div class="row form-group">
                                                    <label class="col-lg-4 control-label">받는사람</label>
                                                    <div class="col-lg-12">
                                                        <input type="text" placeholder="" id="receiverNick" name="receiverNick" class="form-control" value="${ ! empty message.receiverNick ? message.receiverNick : '' }">
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <label class="col-lg-4 control-label">쪽지제목</label>
                                                    <div class="col-lg-12">
                                                        <input type="text" placeholder="" id="messageTitle" name="messageTitle" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <label class="col-lg-4 control-label">쪽지내용</label>
                                                    <div class="col-lg-12">
                                                        <textarea rows="10" cols="30" class="form-control" id="messageContent" name="messageContent"></textarea>
                                                    </div>
                                                </div>
                                            </form>
                                                <div class="row form-group">
                                                    <div class="offset-lg-2 col-lg-12" align="right" style="padding-right: 0;">
                                                        <button class="btn btn-send ml-3 submit" style="float:right;">보내기</button>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>

        <script>          
        $(function(){
			$(".submit").on("click", function(){
	        	var receiverNick=$("input[name=receiverNick]").val();
	        	var messageTitle=$("input[name=messageTitle]").val();
	        	var messageContent=$("textarea[name=messageContent]").val();
	        	var checkNick=JSON.stringify({"nickname" : $("input[name=receiverNick]").val()});
// 	        	debugger;
// 				alert(receiverNick+", "+messageTitle+", "+messageContent+", "+checkNick);
				if($("input[name=receiverNick]").val() == null || $("input[name=receiverNick]").val() == ''){
					swal({
						text : "받는 사람의 닉네임을 입력해주세요.",
						buttons : {
							catch : {
								text : "확인"
							}
						}
					})
				}
				
				if($("input[name=messageTitle]").val() == null || $("input[name=messageTitle]").val() == ''){
					swal({
						text : "제목을 입력해주세요.",
						buttons : {
							catch : {
								text : "확인"
							}
						}
					})
				}
				
				if($("textarea[name=messageContent]").text() == null || $("textarea[name=messageContent]").text() == ''){
					swal({
						text : "내용을 입력해주세요.",
						buttons : {
							catch : {
								text : "확인"
							}
						}
					})
				}
				
				$.ajax({
					url: "/users/json/checkNick",
					type: "POST",
					contentType: "application/json",
					data: checkNick,
					datatype: "json",
					success: function(response){
						if($.trim(response.result)==1){
							swal({
								text : "쪽지를 전송하였습니다.",
								icon : "success",
								buttons : {
									catch : {
										text : "확인"
									}
								}
							})
							.then((A) => {
								if(A) {
									$(".sendMessage").attr("method", "POST").attr("action", "/message/addMessage").submit();
									$("#receiverNick").val('');
									$("#messageTitle").val('');
									$("#messageContent").text('');
									$("#messageModal").modal('hide');
								}
							})
						}else{
							swal({
								text : "해당되는 회원이 없습니다.",
								icon : "error",
								buttons : {
									catch : {
										text : "확인"
									}
								}
							})
						}
					},
					error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
				
			})
		})
		
		
		$("textarea[name=messageContent]").keyup(function(){
                var byteText = $(this).val();
                var byteNum = 0;
                
                for(var i = 0; i < byteText.length ; i++) {
                   byteNum += ( byteText.charCodeAt(i) > 127 ) ? 3 : 1;
                   if(byteNum > 3000) {     
                    swal({
                            text: "제한길이를 초과하였습니다.",
                            dangerMode: true,
                            buttons: {
                                 catch: {
                                    text: "확인"
                                 }
                          },            
                       }).then((willDelete) => {
                            if (willDelete) {
                               $(this).val($(this).val().substr(0,i-1));
                               $("input[name=id]").focus();
                            }
                       });
                   }
                }
			})
			
			$("input[name=messageTitle]").keyup(function(){
                var byteText = $(this).val();
                var byteNum = 0;
                
                for(var i = 0; i < byteText.length ; i++) {
                   byteNum += ( byteText.charCodeAt(i) > 127 ) ? 3 : 1;
                   if(byteNum > 90) {     
                    swal({
                            text: "제한길이를 초과하였습니다.",
                            dangerMode: true,
                            buttons: {
                                 catch: {
                                    text: "확인"
                                 }
                          },            
                       }).then((willDelete) => {
                            if (willDelete) {
                               $(this).val($(this).val().substr(0,i-1));
                               $("input[name=id]").focus();
                            }
                       });
                   }
                }
			})
		</script>

</body>
</html>