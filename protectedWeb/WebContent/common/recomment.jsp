<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!--  meta  -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script type="text/javascript">
	$(function(){
		
		$("button:contains('답글등록')").on("click",function(){
			
			if(${sessionScope.user == null}){
				alert("로그인 하십쇼");
				return;
			}
			
			var commentNo = '${param.commentNo}';
			var context = { recommentContent : $("input[name=context]").val() , commentNo : commentNo, postNo : '${param.postNo}'};
			var tansContext = JSON.stringify(context);
			
			$.ajax({
				url : "/recomment/json/addReComment/",
				method : "POST",
				data : tansContext,
				dataType : "Json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
					
					alert("JSON ID : " + JSONData.id + "SESSION ID : " + '${sessionScope.user.id}');
					$("#"+commentNo+""+".reComment").remove();
					$("#"+commentNo+""+".row").append(
					 "<div class='row'>"
					+	"<div class='col-sm-1 col-md-1' align='center'>"
							+"<img src='https://via.placeholder.com/80' style='border-radius: 5px; min-height: 80px; min-width: 60px;' />"
					+	"</div>"
					+	"<div class='col-sm-9 col-md-9' align='left'>"						
							+"<h4 id='"+JSONData.recommentNo+"' class='h4tag'>"
								+"<b>"+JSONData.nickName+"</b>&nbsp; <small>"+JSONData.regDate+"</small>&nbsp;"
							+"</h4>"
							+"<input type='hidden' name='recommentNo' value='"+JSONData.recommentNo+"'>"
					+	"<div id='"+JSONData.recommentNo+"' class='area'>"
							+"<h5  id='"+JSONData.recommentNo+"' class='cmCont'>"+JSONData.recommentContent+"</h5>"
								+"<span class='glyphicon glyphicon-refresh' onclick='fncModify();'></span> &nbsp; "
								+"<span class='glyphicon glyphicon-remove'></span> &nbsp;  "
								+"<span class='glyphicon glyphicon-alert'></span> &nbsp;   "		
					+	"</div>"
					+	"</div>"
					+"<div>");
					
				},							
				error : function(request, status, error){							
					alert("Error");							
				}
			}); // ajax end 
		}); // add end
	});
	
	function fncModify(){
		alert("1");
	}
</script>

</head>
<body>
	<div class="container">
		<br/>
		<div id="${param.commentNo}" class="row reComment">
			<div class="col-sm-1 col-md-1" align="center">
				&nbsp;&nbsp; <span>ㄴ</span>
			</div>
			<div class="col-sm-9 col-md-9" align="center">
				<input type="text" name="context" class="form-control"
					style="width: 100%; height: 50px" placeholder="답글입력" />
			</div>
			<div class="col-sm-2 col-md-2" align="center">
				<button type="button" style="background-color: #6190ed; color: white; width: 100%; height: 40px; border: 1px solid #1449b3">
					<h6>
						<b>답글등록</b>
					</h6>
				</button>
			</div>
		</div>
	</div>
</body>
</html>