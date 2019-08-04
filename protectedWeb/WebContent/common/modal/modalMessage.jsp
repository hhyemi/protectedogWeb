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
                                        <div class="modal-header">
                                       		<h4 class="modal-title">쪽지작성</h4>
                                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" class="form-horizontal sendMessage">
                                            <input type="hidden" name="senderNick" value="${ sessionScope.user.nickname }">
                                            <input type="hidden" name="messageStatus" value="0"/>
											<input type="hidden" name="delCode" value="0"/>
                                                <div class="row form-group">
                                                    <label class="col-lg-2 control-label">받는사람</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" placeholder="" id="receiverNick" name="receiverNick" class="form-control" value="${ ! empty message.receiverNick ? message.receiverNick : '' }">
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <label class="col-lg-2 control-label">쪽지제목</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" placeholder="" id="messageTitle" name="messageTitle" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <label class="col-lg-2 control-label">쪽지내용</label>
                                                    <div class="col-lg-10">
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
				swal({
					text : "쪽지를 전송하였습니다.",
					buttons : {
						catch : {
							text : "확인"
						}
					}
				})
				.then((A) => {
					if(A) {
						$(".sendMessage").attr("method", "POST").attr("action", "/message/addMessage").submit();
						$("#messageModal").modal('hide');
					}
				})
			})
		})
		</script>

</body>
</html>