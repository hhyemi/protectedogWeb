<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>보호할개 · 정보공유 조회</title>
<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- KAKAO -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/e26616618e.js"></script>

<!-- CSS -->
<style type="text/css">

body {position: relative;}
img{max-width: 600px;}

.content {text-align: left;width: 720px;min-height: 400px;}
.button {position: relative;}
.goto-here {padding: 0px;}
.minibox{padding : 1px solid black;}
.fa-medal{font-size: 15px;}

#recommand:hover{
	color: #f04f23;
}
</style>

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	
</head>

<body>
	
	<div class="container" style="padding-top: 30px">
		
		<form name="info">
			<input type="hidden" name="postNo" value="${board.postNo}" />
			<input type="hidden" name="boardCode" value="MK" />

			<h3>
				<b>${board.postTitle}</b>
			</h3>

			<div class="row" style="position: relative; height: 25px;">
				<div class="col-md-8"style="position: absolute; left: 0px; bottom: 0px;">${board.nickName}(${board.id})| ${board.regDate}</div>
				<div class="col-md-4" align="right" style="position: absolute; right: 0px; bottom: 0px;">조회수 :${board.viewCount} 추천수 : ${board.recommendCount} 댓글수 :${totalCount}</div>
			</div>
			<p />

			<hr />

			<div class="content">${board.postContent}</div>

			<br />
			
			        
        	<div id="mapDiv"  class="col-md-12 ">	
		  		<div id="mapArea" style="width: wrap; height: 300px;"  align="center"></div>
		  	</div>

		</form>
		
				  	
		  	<br />
		  	<p />
		  	


		<c:if test="${board.id == sessionScope.user.id || sessionScope.user.role == 'admin'}">
			<div class="button" align="right">
				<button type="button" class="btn btn-default" style="width: 50px; height: 40px;">수정</button>
				<button type="button" class="btn btn-default" style="width: 50px; height: 40px;">삭제</button>
			</div>
		</c:if>
	</div>

	<jsp:include page="/common/comment.jsp"></jsp:include>

	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script type="text/javascript">

	$(function() {
		
		$("button:contains('수정')").on(
				"click",
				function() {
					//alert($("input[type='hidden']").val());
					// 			$(self.location).attr("href","/community/updateInfo.jsp");
					self.location = "/info/updateView?postNo="+ $("input[name='postNo']").val();
				});

		$("button:contains('삭제')").on("click",function() {
					
			swal({
				  title: "정말 삭제 하시겠습니까 ?",
				  text: "더 이상 이 글을 다른 회원이 볼 수 없습니다.",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true
				})
				.then((result) => {
				  if (result) {
					  
				    swal("삭제완료 !", {
				      	icon: "success",
				    }).then((value)=>{
				    	
				    	 self.location = "/prodQna/delProQna?postNo="+ $("input[name='postNo']").val();
				    	 
						 //$("form[name=info]").attr("method", "POST").attr("action", "/info/delInfo").submit();
						 
				    });
				  }
				});
// 					var result = confirm("정말 삭제 하시겠습니까?");
				
// 					if (result) {
// 						$("form[name='info']").attr("method", "POST").attr(
// 								"action", "/info/delInfo").attr("enctype",
// 								"multipart/form-data").submit();
// 					}
		});
	});
	</script>
  
</body>
</html>
