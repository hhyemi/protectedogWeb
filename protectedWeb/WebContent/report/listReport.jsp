<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->

<!DOCTYPE html>
<html>

<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>보호할개 : 메시지함 </title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/apps/email.css">
    
    <jsp:include page="/layout/toolbar.jsp"></jsp:include>
</head>

<body> 

<!--====================================================
                         MAIN NAVBAR
======================================================-->        

<!--====================================================
                        PAGE CONTENT
======================================================-->
    <div class="page-content d-flex align-items-stretch">
    <input type="hidden" id="myId" name="senderId" value="${ sessionScope.user.id }"/>

        <!--***** SIDE NAVBAR *****-->
		<jsp:include page="/users/mypage/userSideBar.jsp"></jsp:include>

            <!--***** MAILBOX *****-->     
            <div class="row" id="emails">
                <div class="mail-box">
                    <aside class="lg-side"> 
                        <div class="inbox-body">
                            <div class="mail-option"> 
<!--                                 <div class="btn-group hidden-phone"> -->
<!--                                     <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false"> -->
<!--                                          <input type="checkbox" class="mail-checkbox mail-group-checkbox"> All  -->
<!--                                          <i class="fa fa-angle-down "></i> -->
<!--                                      </a> -->
<!--                                     <ul class="dropdown-menu drop-inbox"> -->
<!--                                         <li><a href="#"><i class="fa fa-pencil"></i> All</a></li> -->
<!--                                         <li><a href="#"><i class="fa fa-ban"></i> None</a></li> -->
<!--                                         <li><a href="#"><i class="fa fa-book"></i> Read</a></li> -->
<!--                                         <li class="divider"></li> -->
<!--                                         <li><a href="#"><i class="fa fa-trash-o"></i> Unread</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->

<!--                                 <div class="btn-group hidden-phone"> -->
<!--                                     <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false"> -->
<!--                                      More -->
<!--                                      <i class="fa fa-angle-down "></i> -->
<!--                                  </a> -->
<!--                                     <ul class="dropdown-menu drop-inbox"> -->
<!--                                         <li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li> -->
<!--                                         <li><a href="#"><i class="fa fa-ban"></i> Spam</a></li> -->
<!--                                         <li class="divider"></li> -->
<!--                                         <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                                 <div class="btn-group"> -->
<!--                                     <a data-toggle="dropdown" href="#" class="btn mini blue"> -->
<!--                                      Move to -->
<!--                                          <i class="fa fa-angle-down "></i> -->
<!--                                     </a> -->
<!--                                     <ul class="dropdown-menu drop-inbox"> -->
<!--                                         <li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li> -->
<!--                                         <li><a href="#"><i class="fa fa-ban"></i> Spam</a></li> -->
<!--                                         <li class="divider"></li> -->
<!--                                         <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
                                <ul class="unstyled inbox-pagination">
                                    <li><span> 총 ${ resultPage.totalCount } 건 || ${ resultPage.currentPage } 페이지</span></li>
                                    
                                </ul>
                            </div>
                            <c:if test="${resultPage.totalCount == 0}">
								<div class="row">
									<div class="col-md-9" align="center" style="height: 500px; padding-top: 250px;">
										검색결과 없음<p/>
									<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
									<input type="hidden" id="currentPage" name="currentPage" value="" />					
									</div>
								</div>
							</c:if>
							<c:if test="${resultPage.totalCount != 0 }">
                            <table class="table table-inbox table-hover">
								<thead>
									<tr align="center">
									    <td class="inbox-small-cells" width="50px">
<!--                                             <input type="checkbox" class="mail-checkbox" id="allCheck"> -->
                                        </td>
										<th width="85px">신고자</th>
										<th width="85px">신고대상</th>
										<th width="300px" class="text-center">신고유형</th>
										<th width="200px" align="center" class="text-center">신고일시</th>
										<th width="75px">처리상태</th>
										<th width="75px">더보기</th>
									</tr>
								</thead>
                                <tbody>
                                	<c:set var="i" value="0" />
									<c:forEach var="report" items="${list}">
										<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="reportViewModal" class="modal fade reportViewModal" style="display: none;">
			                                <div class="modal-dialog">
			                                    <div class="modal-content">
			                                        <div class="modal-body">
			                                            <form role="form" class="form-horizontal">
					                                        <div class="row" style="position: relative; height: 25px;">
					                                        	<div class="modalReportNo" style="display: none;"></div>
																<div class="col-md-6"
																	style="position: absolute; left: 0px; bottom: 0px;">신고유형 | <span class="reportContent"></span></div>
																			
																<div class="col-md-6" align="right"
																	style="position: absolute; right: 0px; bottom: 0px;">
																	신고일자 | <span class="reportDate"> </span>
																</div>
															</div>
			                                                <div class="row reportId" style="position: relative; height: 25px;">
																<div class="col-md-6"
																	style="position: absolute; left: 0px; bottom: 0px;">신고자 | <span class="reporterId"></span></div>
																			
																<div class="col-md-6" align="right"
																	style="position: absolute; right: 0px; bottom: 0px;">신고유형 | <span class="reportedId"> </span></div>
															</div>
															<br/>
			                                                <div class="form-group">
			                                                    <label class="col-lg-2 control-label">내용</label>
			                                                    <hr/>
																<div class="content col-lg-8" >
																	<span class="reportContent"></span>
																</div>
																<hr/>
			                                                </div>
			                                                <br/>
			                                                <br/>
			                                                <div class="form-group reportImgBox">
																<c:forEach var="name" items="${ file }">
																	<img class="reportImg" src="../resources/file/fileReport/${ name.fileName }" width="300px" height="300px" 
																		style="cursor:pointer;" onclick="doImgPop('../resources/file/fileReport/${ name.fileName }')">
																</c:forEach>	
															</div>											
			                                                <div class="row form-group">
			                                                    <div class="offset-lg-2 col-lg-12" align="right" style="padding-right: 0;">
			                                                        <button class="btn btn-send ml-3 " type="submit">Send</button>
			                                                    </div>
			                                                </div>
			                                            </form>
			                                        </div>
			                                    </div>
			                                    <!-- /.modal-content -->
			                                </div>
			                                <!-- /.modal-dialog -->
			                            </div>
                                    <tr class="">
                                        <td class="inbox-small-cells" width="50px">
<%--                                         	<c:if test="${ search.searchCondition != 'delete' }"> --%>
<!-- 			                                <div class="btn-group"> -->
<!-- 			                                    <a data-original-title="trash" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips"> -->
<!-- 													<i class=" fa fa-trash"></i> -->
<!-- 												</a> -->
<!-- 			                                </div> -->
<%-- 			                                </c:if> --%>
                                            <input type="hidden" name="reportNo" value="${ report.reportNo }">
                                        </td>
										<td width="85px">${ report.reporterId }</td>
										<td width="85px">${ report.reportedId }</td>
                                        <td class="view-message text-center" width="300px"> 
                                       		${ report.reportCategory }
                                        	<input type="hidden" name="reportContent" value="${ report.reportContent }"/>
                                        </td>
                                        <td class="view-message text-right" width="200px"> 
											<fmt:formatDate value="${ report.reportDate }" pattern="yy.MM.dd"/>
										</td>
                                        <td class="view-message text-center" width="75px" >
                                        	<c:if test="${ report.reportStatus == 0 }">
                                        		<a>처리중(${ report.reportStatus })</a>
                                        	</c:if>
                                        	<c:if test="${ report.reportStatus == 1 }">
                                        		<a>처리완료(${ report.reportStatus })</a>
                                        	</c:if>
                                        </td>
                                        <td class="view-message text-center" width="75px" >
                                        	<a href=".reportViewModal" data-toggle="modal" title="Compose" class="btn btn-compose">
                                        		더보기
                                        	</a>
                                        </td>
                                    </tr>
									</c:forEach>
                                </tbody>
                            </table>
                            <jsp:include page="/common/pageNavigator.jsp" />
                            </c:if>
                        </div>
                    </aside>
                </div>
            </div> 
        </div>
   
    
    <jsp:include page="/common/modal/modalMessage.jsp"></jsp:include>
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
    <script>
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)

		$("form").attr("method", "POST").attr("action","/message/listMessage").submit();
	}
	
// 	$(function(){
// 		$("#messageViewModal").on("load", function(){
// 			var messageNo=$(this).parents().children("td").children("input[name='messageNo']").val();
// 			alert(messageNo);
// 			debugger;
// 			self.location="/message/getMessage?messageNo="+messageNo;
// 		})
// 	});

// 	$(document).ready(function(){
// 		$(".messageViewModal").on('show.bs.modal', function(event){
// 			var messageTitle=$(event.relatedTarget).data('messageTitle');
// 			var messageContent=$(event.relatedTarget).data('messageContent');
// 			var sendDate=$(event.relatedTarget).data('sendDate');
// 			var senderId=$(event.relatedTarget).data('senderId');
// 			var receiverId=$(event.relatedTarget).data('receiverId');
			
// 		})
// 	})

// 	$(function(){
// 		$(".sendMessage").on("click", function(){
// 			var sendId=$(this).parents().parents().parents().children(".messageId").children().children(".sendId").text().trim();
// 			alert(sendId);
// 		})
// 	})
	
	$(function(){
		$('td:contains("더보기")').on('click', function(){
			var reportNo=$(this).parents().children("td").children("input[name='reportNo']").val();
			alert(reportNo);
			$.ajax({
				url : "/report/json/getReport/"+reportNo,
				method : "GET",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
					alert(JSON.stringify(JSONData))
// 					var sendDate=JSONData.sendDate;
// 					alert(sendDate);
					$(".reportContent").text(JSONData.report.reportContent);
					$(".reportCategory").text(JSONData.report.reportCategory);
					$(".reportDate").text(JSONData.reportDate);
					$(".reporterId").text(JSONData.report.reporterId);
					$(".reportedId").text(JSONData.report.reportedId);
					
					$(".reportImg").remove();
					$.each(JSONData.file, function(file, file){
						alert(JSON.stringify(file.fileName));
						var fileName=JSON.stringify(file.fileName);
						var fileView=fileName.substring(1, fileName.length-1);
						alert(fileView);
						$(".reportImgBox").append(
							"<img class='reportImg' src='../resources/file/fileReport/" +fileView+ "' width='300px' height='300px' style='cursor:pointer;'"
							+"onclick='doImgPop('../resources/file/fileReport/" +fileView+ "')'>"
						);
					})
					
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	})
	
// 		$(function() {

// 			$(document).ready(function(){
		
// 				var id=$("#myId").val();
// 				var rcvId=JSON.stringify({id:id});
// // 				alert(id);
// // 				alert(msgId);
// 				$.ajax({
// 					type : "POST",
// 					contentType : "application/json",
// 					url : "/message/json/getReceiveTotalCount",
// 					data : rcvId,
// 					datatype : "json",
// 					success : function(response){
// // 						alert(response);
// 						if(id != null && response != 0){
// 							$(".received").show();
// 							$(".received").text(response)
// 						}
// 						if(id != null && response == 0){
// 							$(".received").hide();
// 						}
// 					},
// 					error : function(request,status,error){
// 						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 					}
	
// 				});
				
// 			});

// 		});
		
		$(function(){
			$(".submit").on("click", function(){
				$(".sendMessage").attr("method", "POST").attr("action", "/message/addMessage");
				alert("쪽지전송 성공");
				$("#messageModal").modal('hide');
			})
		})
		
	function doImgPop(img){
		img1=new Image();
		img1.src=(img);
		imgControll(img);
	}
	
	function imgControll(img){
		if((img1.width!=0)&&(img1.height!=0)){
			viewImage(img);
		}else{
			controller="imgControll('"+img+"')";
			intervalId=setTimeout(controller, 20);
		}
	}
	
	function viewImage(img){
		W=img.width;
		H=img.height;
		O="width="+W+", height="+H+",scrollbars=yes";
		imgWin=window.open("","",O);
		imgWin.document.write("<html><head><title>:*:*:*: 이미지 상세보기 :*:*:*:*:*:*:</title></head>");
		imgWin.document.write("<body topmargin=0 leftmargin=0>");
		imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title='클릭시 창이 닫힙니다.'>");
		
	} 
		

		

    </script>
    
</body>

</html>