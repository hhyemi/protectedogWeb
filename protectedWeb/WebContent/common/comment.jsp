<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
<head>

<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<link rel="stylesheet" href="/resources/newTemplate/admin/css/loadingAnimation.css">

<script src="https://kit.fontawesome.com/e26616618e.js"></script>
<!--  CSS -->
<style>
h6>b{color: white !important;}

.temp { height: 300px; }
.commentDiv{ background-color: #F0F0F0; min-height: 50px; }
.reportModal{ color: #f73325; }

.profileImg { border-radius: 50px; min-height: 88px; min-width: 82px; max-height: 88px; max-width: 82px; }
.fa-thumbs-up:hover{cursor:pointer;color:#F04F23;}
.fa-trash-alt:hover{cursor:pointer;color:#F04F23;}
.fa-pen:hover{cursor:pointer;color:#F04F23;}
</style>
</head>
<body>

	<div class="container">

		<hr />
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 비회원 처리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<c:if test="${sessionScope.user eq null}">
		<div class="row" id="moreView">
			<div class="col-sm-12 col-md-12" align="center">
				비회원은 댓글을 달 수 없습니다<a href="#" class="log-modal" data-toggle="modal" data-target="#login-modal"> 로그인 </a>후 이용해주시길 바랍니다.
			</div>
		</div>
		<br>
		</c:if>
		
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 회원 처리  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<c:if test="${sessionScope.user != null}">
		<form name="commentGo">
		<div class="row">
			<div class="col-sm-10 col-md-10" align="center">
				<input type="text" id="commentContent" name="commentContent" class="form-control commentContent"
					style="width: 100%; height: 50px" placeholder="댓글입력" />
			</div>
			<div class="col-sm-2 col-md-2" align="center">
				<button type="button" id="commentGo" class="commentSubmit btn btn-default"
					style="width: 100%; height: 48px; color: white;">
					<h6>
						<b>댓글등록</b>
					</h6>
				</button>
			</div>
		</div>
		</form>
		<br>
		</c:if>
		
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글 처리  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<div class="commentList">
		<c:set var="rank" value="0"/>
		<c:forEach var="comment" items="${list}">
			<c:set var="rank" value="${ rank+1 }" />
			<div class="row" id="${comment.commentNo}">
				<input type="hidden" name="nickname" value="${comment.nickName}">
				<div class="col-sm-2 col-md-1" align="center">
					<c:if test="${comment.profile != null }">
					<img src="/resources/file/fileUser/${comment.profile}" class="profileImg" />
					</c:if>
					<c:if test="${comment.profile == null }">
					<img src="/resources/file/others/kakaoDefaultImg.jfif" class="profileImg" />
					</c:if>
				</div>
				<div class="col-sm-10 col-md-11" align="left">
					
					<h4 id="${comment.commentNo}" class="h4tag">
						<b>${comment.nickName}</b>&nbsp; <small><fmt:parseDate var="dateString" value="${comment.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm" /></small>&nbsp;
						<small>
							<c:if test="${rank == 1 and comment.likeCount != 0}">
								<img src="/resources/file/others/gold-medal.png"></img> ${ rank } 등
							</c:if>
							<c:if test="${rank == 2 and comment.likeCount != 0}">
								<img src="/resources/file/others/silver-medal.png"></img> ${ rank } 등
							</c:if>
							<c:if test="${rank == 3 and comment.likeCount != 0}">
								<img src="/resources/file/others/bronze-medal.png"></img> ${ rank } 등
							</c:if>
						</small>
					</h4>
					<input type="hidden" name="commentNo" value="${comment.commentNo}">
					
					<div id="${comment.commentNo}" class="area">
					<h5  id="${comment.commentNo}" class="cmCont">${comment.commentContent}</h5>
					
					<c:if test="${user.role == 'admin' }">
					<span class="fas fa-trash-alt"></span>
					</c:if>
					<c:if test="${comment.id == sessionScope.user.id }">
					<span class="fas fa-pen"></span> 
					<span class="fas fa-trash-alt"></span>
					</c:if>
					<span class="report"><a class="reportModal" href="#" >
<!-- 					<span class="fas report"></span> -->
						<img src="/resources/file/others/siren.png"/>
					</a>
					</span>					
<!-- 					<span class="fas fa-plus"></span> &nbsp;  -->
					<span id="${comment.commentNo}" class="far fa-thumbs-up"></span>
					<font id="${comment.commentNo}" class="font">
						<b>${comment.likeCount}</b>
					</font>
					</div>
				</div>
			</div>
			<br id="${comment.commentNo}" class="line"/>
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 대댓글 처리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<%-- 			<c:forEach var="recomment" items="${relist}"> --%>
<%-- 			<c:if test="${comment.commentNo == recomment.commentNo}"> --%>
<%-- 			<div class="row" id="${recomment.recommentNo}" style="padding-left: 50px;"> --%>
<!-- 				ㄴ -->
<!-- 				<div class="col-sm-1 col-md-1" align="center"> -->
<!-- 					<img src="/resources/file/others/kakaoDefaultImg.jfif" style="border-radius: 5px; min-height: 80px; min-width: 60px;" /> -->
<!-- 				</div> -->
<!-- 				<div class="col-sm-9 col-md-9" align="left"> -->
					
<%-- 					<h4 id="${recomment.recommentNo}" class="h4tag"> --%>
<%-- 						<b>${recomment.nickName}</b>&nbsp; <small>${recomment.regDate}</small>&nbsp; --%>
<!-- 					</h4> -->
<%-- 					<input type="hidden" name="commentNo" value="${recomment.commentNo}"> --%>
					
<%-- 					<div id="${recomment.recommentNo}" class="area"> --%>
<%-- 					<h5  id="${recomment.recommentNo}" class="cmCont">${recomment.recommentContent}</h5> --%>
<%-- 					<c:if test="${recomment.id == sessionScope.user.id }"> --%>
<!-- 					<span class="fas fa-pen"></span> &nbsp;  -->
<!-- 					<span class="fas fa-trash-alt"></span> &nbsp;  -->
<%-- 					</c:if> --%>
<!-- 					<span class="fas report"></span> &nbsp; 					 -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<br/ > -->
<%-- 			</c:if> --%>
<%-- 			</c:forEach> --%>
				<!--// Link Attribution -->
<!-- <a href="http://www.domsammut.com/about#utm_source=web&utm_medium=demo&utm_campaign=CodePen" title="domsammut.com" id="link">domsammut.com</a> -->

		</c:forEach>
		</div>
		
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 로딩 처리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<div class="loading-container">
			<div class="loading"></div>
			<div id="loading-text">loading</div>
		</div>
		
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 더보기 버튼 처리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<%-- 		<c:if test="${totalCount > rank}"> --%>
<!-- 		<div class="col-md-12"> -->
<!-- 			<button type="button" class="btn btn-default moreView" value="1"> 더보기 </button> -->
<!-- 		</div> -->
<%-- 		</c:if> --%>
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 하단 공백 처리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<div style="min-height: 50px;">
			
		</div>
 		
 		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 모달 처리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<%-- 		<jsp:include page="/common/modal/modalLogin.jsp"></jsp:include> --%>
		<jsp:include page="/common/modal/modalReport.jsp"></jsp:include>		

	</div> <!--  END of Container -->
	
	<script type="text/javascript">	
	
 	var currentPage = 2;
	
 	$(document).ready(function(){
 		
 		$(".loading-container").hide();
 		
	});
 	
	$(function(){
		
		$("#commentContent").keydown(function(key){
			if(key.keyCode == 13){
				$("#commentGo").click();
			}
		});
		// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글 리스트  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		//$(document).on("click",".moreView",function(){
			
		var count = 0 ;
		
		$(window).scroll(function(){
			
			var boardCode = $("input[name=boardCode]").val();
			var postNo = $("input[name=postNo]").val();
			//console.log(${rank});
			
			if( $(this).scrollTop() +  $(this).height() + 484 > $(document).height() ){
				
				$.ajax({
					url : "/comment/json/listComment/"+postNo+"/"+currentPage+"/"+boardCode,
					method : "POST",
					dataType : "JSON",
					headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
					},
					success : function(JSONData, status){
												
						$('.loading-container').hide();
						currentPage++;
						//console.log(JSONData.list);
						
						var totalCount = JSONData.totalCount;
						//var reList = JSONData.reList;
						
						//console.log(reList);
						var list = JSONData.list; 
						
	 					if(list.length == 0 ){
	 						//$(".moreView").remove();
	 						$('.loading-container').remove();
	 						return;
	 					}
	 					
//	 					var display = "<div class='col-sm-12 col-md-12 commentList'>";
						var display = "";
						
						//console.log(${sessionScope.user.role})
						
						$.each(list, function(index, comment){
							
							var date = new Date(comment.regDate);
							//date.format("yyyy-MM-dd HH:mm");
							var convertDate = date.getFullYear() + "-" 
											+ (date.getMonth()<10?'0':'') + (date.getMonth()+1) + "-" 
											+ (date.getDate()<10?'0':'') + date.getDate() +" "
											+ (date.getHours()<10?'0':'') + date.getHours() +":"
											+ (date.getMinutes()<10?'0':'') + date.getMinutes()  ;
							display +=
								"<div class='row' id='"+comment.commentNo+"'>"
								+ "<input type='hidden' name='nickname' value="+comment.nickName+">"
								+	"<div class='col-sm-1 col-md-1' align='center'>";	
									if(comment.profile != null){
										display += "<img src='/resources/file/fileUser/"+comment.profile+"' class='profileImg' onERROR='this.src='/resources/file/others/kakaoDafaultImg.jfif''/>";
									} else {
										display += "<img src='/resources/file/others/kakaoDefaultImg.jfif' class='profileImg'/>";
									}
									
									
							display +=
								"</div>" +
									"<div class='col-sm-11 col-md-11' align='left'>" + 
										"<h4 id="+comment.commentNo+" class='h4tag'>" +	
											"<b>"+comment.nickName+"</b>&nbsp; <small>"+convertDate+"</small>" + 
										"</h4>" +
		 								"<input type='hidden' name='commentNo' value='"+comment.commentNo+"'/>" +
							   			"<div id="+comment.commentNo+" class='area'>" +
											"<h5  id="+comment.commentNo+" class='cmCont'>"+comment.commentContent+"</h5>";
						    	
								if('${sessionScope.user.role}' == "admin"){
									display +=  "<span class='fas fa-trash-alt'></span>&nbsp;";
								}
								
								if(comment.id == '${sessionScope.user.id}'){
				 					display += "<span class='fas fa-pen'></span>&nbsp;" + 
				 					           "<span class='fas fa-trash-alt'></span>&nbsp;";
								}
								
								display += 
											"<span><a class='reportModal' href='#' data-toggle='modal' data-target='#report-modal'><img class='report' src='/resources/file/others/siren.png'/></a></span>&nbsp;" + 
//	  										"<span class='glyphicon glyphicon-plus'></span>" +
	 	 									"<span id='"+comment.commentNo+"' class='far fa-thumbs-up'></span>&nbsp;"+
	 	 									"<font id='"+comment.commentNo+"' class='font'>" +
	 										"<b>"+comment.likeCount+"</b>"+
	 										"</font>" +
	 	 								"</div>" +
	 	 							"</div>" +
	 							"</div>" +
	 	 						"<br class="+JSONData.commentNo+" class='line'/>";
						}); // each END
						
						//display +="</div>";
//						console.log($(display).html());
						$(".commentList").append(display);
						
//						console.log(JSONData.totalCount);
//						console.log(list.length);															
					},
					beforeSend:function(){
						
					        $('.loading-container').show();

					},
					complete:function(){

						 	$('.loading-container').show();
					},
					timeout:1000
				}); // ajax END
			} // scroll IF END
		});
	});

	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글 등록  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$(function() {
		
		$(document).on("click","#commentGo",function() {
			
			if($("input[name=commentContent]").val() == ''){
				swal({
					text: "내용을 입력해주세요."
				});
				return;
			}
			var commentData =  
			{
					commentContent : $("input[name=commentContent]").val(),
					postNo		   : $("input[name=postNo]").val(),
					boardCode 	   : $("input[name=boardCode]").val()
			} ;
			
			$.ajax({
				url : "/comment/json/addComment/",
				method : "POST",
				dataType : "Json",
				data : JSON.stringify(commentData),
				headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
							},
				success : function(JSONData, status){
								
					//debugger;
					var date = new Date(JSONData.regDate);
					var convertDate = date.getFullYear() + "-" 
					+ (date.getMonth()<10?'0':'') + (date.getMonth()+1) + "-" 
					+ (date.getDate()<10?'0':'') + date.getDate() +" "
					+ (date.getHours()<10?'0':'') + date.getHours() +":"
					+ (date.getMinutes()<10?'0':'') + date.getMinutes()  ;
					
					//date.format("yyyy-MM-dd HH:mm");
					
	 							var display = 
	 								"<div class=row id="+JSONData.commentNo+">"
	 								+ "<input type='hidden' name='nickname' value="+JSONData.nickName+">"
	 								+"<div class=col-sm-1 col-md-1 align=center>";
	 									if(JSONData.profile == null){
	 										display += "<img src=/resources/file/others/kakaoDefaultImg.jfif class='profileImg'/>";
	 									}
	 									if(JSONData.profile != null){
	 										display += "<img src=/resources/file/fileUser/"+JSONData.profile+" class='profileImg'/>";
	 									}
	 								
	 								display += "</div>"
	 								+"<div class=col-sm-11 col-md-11 align=left>"
	 									+"<h4 id='"+JSONData.commentNo+"' class=h4tag>"
	 									+"<b>"+JSONData.nickName+"</b> &nbsp;<small>"+convertDate+"</small> &nbsp;"
	 									+"</h4>"
	 									+"<input type='hidden' name='commentNo' value='"+JSONData.commentNo+"'>"					
	 									+"<div id='"+JSONData.commentNo+"' class=area>"
	 									+"<h5  id='"+JSONData.commentNo+"' class=cmCont>"+JSONData.commentContent+"</h5>";
	 										
	 									if(JSONData.id == '${sessionScope.user.id}' ){
	 										display += "<span class='fas fa-pen'></span>&nbsp;" 
		 									+"<span class='fas fa-trash-alt'></span>&nbsp;" ;
	 									}
	 												
	 											display += "<span><a class='reportModal' href='#' data-toggle='modal' data-target='#report-modal'><img class='report' src='/resources/file/others/siren.png'/></a></span>&nbsp;"
// 	 													+"<span class='fas fa-plus'></span> &nbsp;" 
			 											+"<span id='"+JSONData.commentNo+"' class='far fa-thumbs-up'></span>&nbsp;"
	 													+"<font id='"+JSONData.commentNo+"' class='font'>"
	 														+"<b>"+JSONData.likeCount+"</b>"
	 													+"</font>"
	 									+"</div>"
	 								+"</div>"
	 							+"</div>"
	 							+"<br class="+JSONData.commentNo+" class='line'/>"
	 									 							
								$(".commentList").prepend(display);
	 							
	 							$("#commentContent").val("");
							},					
						});
		});
	});
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글 수정  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$(function(){
		
		$(document).on("click", ".fa-pen", function() {
			
			var commentNo = $(this).parent().parent().children("input").val() ;
			var boardCode = $("input[name=boardCode]").val();
			
			$.ajax(
					{
						url : "/comment/json/getComment/"+commentNo+"/"+boardCode,
						method : "POST",
						dataType : "Json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						
						success : function(JSONData, status){
							
							$("#"+commentNo+""+".cmCont").remove();
							$("#"+commentNo+""+".area").hide();
							
 							var display = 
 								  "<div class='row'><div class='ajax col-md-10'><input type='text' class='form-control' id='commentUpdateContent' name='commentContent' style='width: 100%; height: 50px; margin-top : 5px; ' value='"+JSONData.commentContent+"'/></div>"
 								+ "<div class='ajax col-md-2'>" 								
 								+ "<a href='#' onclick='update(); return false;'> "
 								+ "<input type='hidden' id='commentNo' value='"+JSONData.commentNo+"'>"
 								+ "<button class='btn btn-default' style='width:100%; height:48px;'>수정완료</button>" 								
 								+ "</div></div>"
 							
							$("#"+commentNo+""+".h4tag").append(display);
						}
				
					}
			);
		});
		
		// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 삭제 처리  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$(document).on("click", ".fa-trash-alt", function() {
			
			var commentNo = $(this).parent().parent().children("input").val();
			var boardCode = $("input[name=boardCode]").val();
			
			swal({
			  title: "정말 삭제 하시겠습니까 ?",
			  text: "당신의 소중한 한 마디가 사라지게 됩니다.",
			  icon: "warning",
			  buttons: ["취소","확인"],
			  dangerMode: true,
			})
			.then((A) => {
			  if (A) {
				  
				  $.ajax({
						url : "/comment/json/delComment/"+commentNo+"/"+boardCode,
						method : "POST",
						dataType : "Json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							
							console.log(commentNo);
							
							//debugger;
							$("#"+commentNo+""+".row").remove();
							$("#"+commentNo+""+".line").remove();
							
							swal("삭제완료 !", {
							      	icon: "success",
							      	button : "확인"
							});
							
						},
						error : function ( a , b , c ){
							
							console.log(" 1 : " + JSON.stringify(a) ); 
							console.log(" 2 : " + b ); 
							console.log(" 3 : " + c ); 
						}
					});
			  }
			});
		});
		
		// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 신고하기  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$(document).on("click",".report",function() {
			
		 		if(${user==null}){
		 			$("#login-modal").modal('show');  
		 		}else{
			 	    var nickname = $('input[name=nickname]').val();
			 	   $('#reportedNick').prop('readonly', true);
			 	    $("#reportedNick").val(nickname);
			 		$("#report-modal").modal("show");
		 		}
		
		});
			
		// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 답글달기  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// 		var flag= false;
		
// 		$(document).on("click",".fa-plus", function() {
			
// 			var commentNo = $(this).parents().parents().children("input").val();
			
// 			$.ajax({
// 				url : "/common/recomment.jsp?commentNo="+commentNo+"&postNo="+${board.postNo},
// 				type:"GET",
// 				dataType : "text",
// 				success : function(data){
					
// 					if(!flag){
// 						$("#"+commentNo+""+".row").append(data);
// 						flag = true;
// 					}
// 				},
// 				error : function(){
// 					alert(2);
// 				}
				
// 			})
// 		});
		
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 좋아요 처리  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$(document).on("click", ".far.fa-thumbs-up", function(){
			
			if(${sessionScope.user == null}){
				$("#login-modal").modal("show");
				return;
			}
			
			var boardCode = $("input[name=boardCode]").val();
			var commentNo = $(this).parent().parent().children("input").val();
			var id = '${sessionScope.user.id}';
				$.ajax({
					url : "/comment/json/check/"+commentNo+"/"+id+"/"+boardCode,
					method : "POST",
					dataType : "Json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status){
						
						if(JSONData == 1){
							swal({text:"이미 추천한 댓글입니다."});
							return;
						}
						
						if(JSONData == 0){
						$.ajax({
							url : "/comment/json/updateLikeCnt/"+commentNo+"/"+"plus"+"/"+boardCode,
							method : "POST",
							dataType : "Json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData, status){
								
								console.log("plus complete");
								
								$("#"+commentNo+""+".font >").remove();
								$("#"+commentNo+""+".font").html("<b>"+ JSONData.likeCount+"</b>");
								
							}
						});
						} // JSONDATA 0 END			
					}
				});
							
		});
	
	});
	
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 업데이트 처리  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	function update(){
		
		if( $("#commentUpdateContent").val() == ''){
			swal({
				text : "내용을 입력해주세요"							
			});
			return;
		}
		
		var search 	= {commentNo : $("#commentNo").val(), commentContent : $("#commentUpdateContent").val(), boardCode : $("input[name=boardCode]").val()};
		var convertSearch = JSON.stringify(search);
		
 		$.ajax({
 					url : "/comment/json/updateComment/",
 					method : "POST",
 					dataType : "json",
 					data : convertSearch,
 					headers : {
 						"Accept" : "application/json",
 						"Content-Type" : "application/json"
 					},
					
 					success : function(JSONData, status){						
						
 						$("#"+JSONData.commentNo+""+".cmCont").remove();
 						$(".ajax").remove();
 						$("#"+JSONData.commentNo+""+".area").show();
 						
 						var modifyScreen = 	
 							"<div id="+JSONData.commentNo+" class='area' style='padding-top : 5px;'>"
 							+ "<h5 id="+JSONData.commentNo+" class='cmCont'>"+JSONData.commentContent+"</h5><div>";
						
 						$("#"+JSONData.commentNo+""+".h4tag").append(modifyScreen);
 	
					},
 				});
	} // end of update function()
</script>
	
</body>
</html>