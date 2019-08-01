<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의하기</title>
</head>
<body>

	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
		tabindex="-1" id="qnaModel" class="modal fade"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">문의하기</h4>
					<button aria-hidden="true" data-dismiss="modal" class="close"
						type="button">×</button>
				</div>
				<div class="modal-body">
					<form role="form" class="form-horizontal sendMessage">
						<input type="hidden" name="senderId"
							value="${ sessionScope.user.id }"> <input type="hidden"
							name="messageStatus" value="0" /> <input type="hidden"
							name="delCode" value="0" />
						<div class="row form-group">
							<label class="col-lg-2 control-label">제목</label>
							<div class="col-lg-10">
								<input type="text" placeholder="" id="postTitle"
									name="postTite" class="form-control">
							</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2 control-label">질문유형</label>
							<div class="col-lg-10">
								<select class="form-control" name="qnaCode" id="qnaCode">
									<option value="1">상품</option>
									<option value="2">배송</option>
									<option value="3">결제</option>
									<option value="4">반품</option>
								</select>
							</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2 control-label">내용</label>
							<div class="col-lg-10">
								<textarea rows="10" cols="30" class="form-control"
									id="postContent" name="postContent"></textarea>
							</div>
						</div>
						<div class="row form-group">
							<div class="offset-lg-2 col-lg-12" align="right"
								style="padding-right: 0;">
								<button class="btn btn-send ml-3 submit" type="submit">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

</body>
</html>