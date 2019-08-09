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

    <title>보호할개 : 신고글목록 </title>
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
	<div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 60px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/report/listReport">ReportList</a></span>
					</p>
					<font size="7">신고글목록</font>
				</div>
			</div>
		</div>
	</div>
<!--====================================================
                        PAGE CONTENT
======================================================-->
<div class="container">
    <div class="page-content d-flex align-items-stretch">

        <!--***** SIDE NAVBAR *****-->
		<jsp:include page="/users/mypage/userSideBar.jsp"></jsp:include>

            <!--***** MAILBOX *****-->     

            <div class="row" id="emails">
            	<form name="pageForm">
            		<input type="hidden" id="currentPage" name="currentPage" value="" />
            	</form>
                <div class="mail-box">
                    <aside class="lg-side"> 
                        <div class="inbox-body">
                            <div class="mail-option">
                            <input type="hidden" id="currentPage" name="currentPage" value=""/>	 
                                    	<div class="col-md-6" align="left">
					    					<p style="font-weight: bold;">
					    						전체  ${resultPage.totalCount } 건
					    					</p>
					   					</div>
                            </div>
                            <c:if test="${resultPage.totalCount == 0}">
								<div class="row">
									<div class="col-md-9" align="center" style="height: 500px; padding-top: 250px;">
										<p>신고함이 비어있습니다<p/>
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
										<th width="15%" class="text-center">신고자</th>
										<th width="15%" class="text-center">신고대상</th>
										<th width="20%" class="text-center">신고유형</th>
										<th width="15%" class="text-center">신고일시</th>
										<th width="15%" class="text-center">처리상태</th>
										<th width=""  class="text-center">더보기</th>
<!-- 										<th width="85px">신고자</th> -->
<!-- 										<th width="85px">신고대상</th> -->
<!-- 										<th width="270px" class="text-center">신고유형</th> -->
<!-- 										<th width="200px" align="center" class="text-center">신고일시</th> -->
<!-- 										<th width="90px">처리상태</th> -->
<!-- 										<th width="90px">더보기</th> -->
									</tr>
								</thead>
                                <tbody>
                                	<c:set var="i" value="0" />
									<c:forEach var="report" items="${list}">
										<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="reportViewModal" class="modal fade reportViewModal" style="display: none;">
			                                <div class="modal-dialog">
			                                    <div class="modal-content">
			                                        <div class="modal-body">
			                                            <form role="form" class="form-horizontal reportViewSection">
			                                            	
					                                        <div class="row" style="position: relative; height: 25px;">
					                                        	<div class="modalReportNo" style="display: none;"></div>
					                                        	<input type="hidden" class="reportStatus" name="reportStatus" value="1">
					                                        	<input type="hidden" class="delCode" name="delCode" value="n">
																<div class="col-md-6 reportCategory"
																	style="position: absolute; left: 0px; bottom: 0px;">신고유형 | <span class="reportCategory"></span></div>
																			
																<div class="col-md-6 reportDate" align="right"
																	style="position: absolute; right: 0px; bottom: 0px;">
																	신고일자 | <span class="reportDate"> </span>
																</div>
															</div>
			                                                <div class="row reportNick" style="position: relative; height: 25px;">
																<div class="col-md-6"
																	style="position: absolute; left: 0px; bottom: 0px;">신고자 | <span class="reporterNick"></span></div>
																			
																<div class="col-md-6" align="right"
																	style="position: absolute; right: 0px; bottom: 0px;">신고대상 | <span class="reportedNick"> </span></div>
															</div>
															<br/>
			                                                <div class="form-group reportContent">
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
			                                                        <button class="btn btn-send ml-3 blackOp" type="submit">블랙처리</button>
			                                                        <button class="btn btn-send ml-3 normalOp" type="submit">일반처리</button>
			                                                        <button class="btn btn-send ml-3 noneOp" type="submit">비처리</button>
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
                                        <td class="inbox-small-cells" width="50px"  class="text-center">
<%--                                         	<c:if test="${ search.searchCondition != 'delete' }"> --%>
<!-- 			                                <div class="btn-group"> -->
<!-- 			                                    <a data-original-title="trash" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips"> -->
<!-- 													<i class=" fa fa-trash"></i> -->
<!-- 												</a> -->
<!-- 			                                </div> -->
<%-- 			                                </c:if> --%>
                                            <input type="hidden" name="reportNo" value="${ report.reportNo }">
                                        </td>
										<td width="85px" class="text-center">${ report.reporterNick }</td>
										<td width="85px" class="text-center">${ report.reportedNick }</td>
                                        <td class="view-message text-center" width="270px"> 
                                       		${ report.reportCategory }
                                        	<input type="hidden" name="reportContent" value="${ report.reportContent }"/>
                                        </td>
                                        <td class="view-message text-center" width="200px"> 
											<fmt:formatDate value="${ report.reportDate }" pattern="yy.MM.dd"/>
										</td>
                                        <td class="view-message text-center" width="90px" >
                                        	<c:if test="${ report.reportStatus == 0 }">
                                        		<a>처리중(${ report.reportStatus })</a>
                                        	</c:if>
                                        	<c:if test="${ report.reportStatus == 1 }">
                                        		<a>처리완료(${ report.reportStatus })</a>
                                        	</c:if>
                                        </td>
                                        <td class="view-message text-center" width="90px" >
                                        	<c:if test="${ report.reportStatus == 0 }">
                                        	<a href=".reportViewModal" data-toggle="modal" title="Compose" class="btn btn-compose">
                                        		더보기
                                        	</a>
                                        	</c:if>
                                        </td>
                                    </tr>
                                    
									</c:forEach>
									
                                </tbody>
                                
                            </table>
                            <div style="padding-left: 350px;">
                            <jsp:include page="/common/pageNavigator_new.jsp"/>                            
                            </div>
                            </c:if>
                        </div>
                    </aside>
                </div>
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

		$("form[name='pageForm']").attr("method", "POST").attr("action","/report/listReport").submit();
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
// 			alert(reportNo);
			$.ajax({
				url : "/report/json/getReport/"+reportNo,
				method : "GET",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
// 					alert(JSON.stringify(JSONData))
// 					var sendDate=JSONData.sendDate;
// 					alert(sendDate);
					$(".modalReportNo").text(JSONData.report.reportNo);
					$(".reportContent").text(JSONData.report.reportContent);
					$(".reportCategory").text(JSONData.report.reportCategory);
					$(".reportDate").text(JSONData.reportDate);
					$(".reporterNick").text(JSONData.report.reporterNick);
					$(".reportedNick").text(JSONData.report.reportedNick);
					
					$(".reportImg").remove();
					$.each(JSONData.file, function(file, file){
// 						alert(JSON.stringify(file.fileName));
						var fileName=JSON.stringify(file.fileName);
						var fileView=fileName.substring(1, fileName.length-1);
// 						alert(fileView);
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
		
	
	$(function(){
	
		var reportNo;
		var delCode;
		var reportCategory;
		var reportContent;
		var reportDate;
		var reportedId;
		var reporterId;
		var reportStatus;
	
		$(function(){
			$(".blackOp").on("click", function(){
				var methodPath="black";
				var addPoint=-1;
				var targetId=$(this).parent().parent().parent().children(".reportNick").find(".reportedNick").text();
				
				reportNo=$(this).parent().parent().parent().children().children(".modalReportNo").text();
				delCode=$(this).parent().parent().parent().children(".row").children(".delCode").val();
				reportCategory=$(this).parent().parent().parent().children(".row").children(".reportCategory").text();
				reportContent=$(this).parent().parent().parent().children(".reportContent").text();
				reportedId=$(this).parent().parent().parent().children(".reportNick").find(".reportedNick").text();
				reporterId=$(this).parent().parent().parent().children(".reportNick").find(".reporterNick").text();
				reportDate=$(this).parent().parent().parent().children(".row").children(".reportDate").text();
				reportStatus=$(this).parent().parent().parent().children(".row").children(".reportStatus").val();
				
// 				alert(reportNo+", "+delCode+", "+reportCategory+", "+reportContent+", "+reportedNick+", "+reporterNick+", "+reportDate+", "+reportStatus);
				
				var reportBody={
						"reportNo" : reportNo,
						"delCode" : delCode,
						"reportCategory" : reportCategory,
						"reportContent" : reportContent,
						"reportDate" : reportDate,
						"reportedNick" : reportedNick,
						"reporterNick" : reporterNick,
						"reportStatus" : reportStatus
				}
				
				$.ajax({
					url : "/report/json/updateReport/"+methodPath+"/"+addPoint+"/"+targetId,
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					method : "POST",
					data : JSON.stringify(reportBody),
					success : function(response){
// 						alert(JSON.stringify(response));
						swal({
							text : "신고처리가 완료되었습니다.",
							buttons : {
								catch : {
									text : "확인"
								}
							}
						})
						.then((A) => {
							if(A) {
								$('#reportViewModal').modal("hide");
							}
						})
					},
					error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			});
		})
		
		$(function(){
			$(".normalOp").on("click", function(){
				var methodPath="normal";
				var addPoint=300;
				var targetId=$(this).parent().parent().parent().children(".reportNick").find(".reportedNick").text();
				
				reportNo=$(this).parent().parent().parent().children().children(".modalReportNo").text();
				delCode=$(this).parent().parent().parent().children(".row").children(".delCode").val();
				reportCategory=$(this).parent().parent().parent().children(".row").children(".reportCategory").text();
				reportContent=$(this).parent().parent().parent().children(".reportContent").text();
				reportedId=$(this).parent().parent().parent().children(".reportNick").find(".reportedNick").text();
				reporterId=$(this).parent().parent().parent().children(".reportNick").find(".reporterNick").text();
				reportDate=$(this).parent().parent().parent().children(".row").children(".reportDate").text();
				reportStatus=$(this).parent().parent().parent().children(".row").children(".reportStatus").val();
				
// 				alert(reportNo+", "+delCode+", "+reportCategory+", "+reportContent+", "+reportedNick+", "+reporterNick+", "+reportDate+", "+reportStatus);
				alert(methodPath+", "+addPoint+","+targetId);
				
				var reportBody={
						"reportNo" : reportNo,
						"delCode" : delCode,
						"reportCategory" : reportCategory,
						"reportContent" : reportContent,
						"reportDate" : reportDate,
						"reportedNick" : reportedNick,
						"reporterNick" : reporterNick,
						"reportStatus" : reportStatus
				}
				
				$.ajax({
					url : "/report/json/updateReport/"+methodPath+"/"+addPoint+"/"+targetId,
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					method : "POST",
					data : JSON.stringify(reportBody),
					success : function(response){
// 						alert(JSON.stringify(response));
						swal({
							text : "신고처리가 완료되었습니다.",
							buttons : {
								catch : {
									text : "확인"
								}
							}
						})
						.then((A) => {
							if(A) {
								$('#reportViewModal').modal("hide");
							}
						})
					},
					error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})

			});
		});
		
		$(function(){
			$(".noneOp").on("click", function(){
				var methodPath="none";
				var addPoint=0;
				var targetId=$(this).parent().parent().parent().children(".reportNick").find(".reportedNick").text();
				
				reportNo=$(this).parent().parent().parent().children().children(".modalReportNo").text();
				delCode=$(this).parent().parent().parent().children(".row").children(".delCode").val();
				reportCategory=$(this).parent().parent().parent().children(".row").children(".reportCategory").text();
				reportContent=$(this).parent().parent().parent().children(".reportContent").text();
				reportedId=$(this).parent().parent().parent().children(".reportNick").find(".reportedNick").text();
				reporterId=$(this).parent().parent().parent().children(".reportNick").find(".reporterNick").text();
				reportDate=$(this).parent().parent().parent().children(".row").children(".reportDate").text();
				reportStatus=$(this).parent().parent().parent().children(".row").children(".reportStatus").val();
				
// 				alert(reportNo+", "+delCode+", "+reportCategory+", "+reportContent+", "+reportedNick+", "+reporterNick+", "+reportDate+", "+reportStatus);
				
// 				debugger;
				
				var reportBody={
						"reportNo" : reportNo,
						"delCode" : delCode,
						"reportCategory" : reportCategory,
						"reportContent" : reportContent,
						"reportDate" : reportDate,
						"reportedNick" : reportedNick,
						"reporterNick" : reporterNick,
						"reportStatus" : reportStatus
				}
				
				$.ajax({
					url : "/report/json/updateReport/"+methodPath+"/"+addPoint+"/"+targetId,
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					method : "POST",
					data : JSON.stringify(reportBody),
					success : function(response){
// 						alert(JSON.stringify(response));
						swal({
							text : "신고처리가 완료되었습니다.",
							buttons : {
								catch : {
									text : "확인"
								}
							}
						})
						.then((A) => {
							if(A) {
								$('#reportViewModal').modal("hide");
							}
						})
					},
					error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			});
		})
	
// 		function reportAjax(){
			
// 			alert("들어옴?");
			
// 			alert(reportNo);
			
// 			$.ajax({
// 				url : "/report/json/updateReport/"+methodPath+"/"+addPoint+"/"+targetId,
// 				dataType : "json",
// 				method : "POST",
// 				data : JSON.stringify({
// 					"reportNo" : reportNo,
// 					"delCode" : delCode,
// 					"reportCategory" : reportCategory,
// 					"reportContent" : reportContent,
// 					"reportDate" : reportDate,
// 					"reportedId" : reportedId,
// 					"reporterId" : reporterId,
// 					"reportStatus" : reportStatus
// 				}),
// 				success : function(response){
// 					alert(JSON.stringify(response));
// 					$('#reportViewModal').modal("hide");
// 				},
// 				error : function(request,status,error){
// 					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 				}
// 			})
// 		}
	})
		

    </script>
    
</body>

</html>