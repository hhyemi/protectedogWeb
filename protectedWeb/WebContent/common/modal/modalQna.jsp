<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 Q&A</title>
</head>
<body>

							<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="addProdQna" class="modal fade" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                       		<h4 class="modal-title">상품 문의</h4>
                                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" class="form-horizontal sendMessage">
                                            <input type="hidden" name="id" value="${ sessionScope.user.id }">
                                            <input type="hidden" name="postNo"/>
											<input type="hidden" name="boardCode"/>
                                                <div class="row form-group">
                                                    <label class="col-lg-2 control-label">제목</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" placeholder="" id="postTitle" name="postTitle" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <label class="col-lg-2 control-label">질문 유형</label>
                                                    <div class="col-lg-10">
                                                        <select name="qanCode" id="qanCode">
															<option value="1">상품</option>
															<option value="2">배송</option>
															<option value="3">교환</option>
															<option value="4">환불</option>
															<option value="5">기타</option>
														</select>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <label class="col-lg-2 control-label">문의내용</label>
                                                    <div class="col-lg-10">
                                                        <textarea rows="10" cols="30" class="form-control" id="postContent" name="postContent"></textarea>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="offset-lg-2 col-lg-12" align="right" style="padding-right: 0;">
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