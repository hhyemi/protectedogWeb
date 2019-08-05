<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>보호할개 · 분양실종 후기</title>
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
	cursor : pointer;
}

</style>

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	
</head>

<body>
	
	<div class="container" style="padding-top: 30px">
		
		<form name="info">
			<input type="hidden" name="postNo" value="${board.postNo}" />
			<input type="hidden" name="boardCode" value="IS" />

			<h3>
				<b>${board.postTitle}</b>
			</h3>

			<div class="row" style="position: relative; height: 25px;">
				<div class="col-md-8"style="position: absolute; left: 0px; bottom: 0px;">${board.nickName}(${board.id}) | ${board.regDate}</div>
				<div class="col-md-4" align="right" style="position: absolute; right: 0px; bottom: 0px;">조회수 ${board.viewCount} | 댓글수 ${totalCount} </div>
			</div>
			<p />

			<hr />

			<div class="content">${board.postContent}</div>

			<br />
			

		</form>
		
				  	
		  	<br />
		  	<p />
		  	
		<div class="minibox" align="center">
			<div>
<!-- 				<span style="border: 1px solid black; padding: 3px"> -->
<!-- 					<span id="recommand" class="recommand fas fa-medal">추천</span> -->
<%-- 					<span style="font-size: 15px;">${board.recommendCount}</span> --%>
<!-- 				</span> -->
<!-- 				<p/> -->
				<div align="center">
		        	<a href="javascript:void(0);"  id="twitter"  title="트위터로 공유"><img src="/resources/file/others/twitter.png" height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
		            <a href="javascript:void(0);" id="facebook" title="페이스북으로 공유"><img src="/resources/file/others/facebook.png" height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
		            <a href="javascript:void(0);"  id="kakao" title="카카오톡으로 공유"> <img src="/resources/file/others/kakao.png"  height="40px" width="40px" style="opacity: 1" onmouseover="this.style.opacity='0.4'" onmouseleave="this.style.opacity='1'"></a>
            	</div>
            	<br/>
				<p/>
				<br/>
			</div>
		</div>

		
        <p align="right" style="padding-right: 0px;">
       		<c:if test="${ sessionScope.user.id eq board.id }">
				<button class="btn btn-default" id="modiButton">수정</button>
	       		<button class="btn btn-default" id="delButton">삭제</button>
			</c:if>
       		<c:if test="${ sessionScope.user.role eq 'admin'}">
	       		<button class="btn btn-default" id="delButton">삭제</button>
			</c:if>
			
	        <button class="btn btn-default" id="listButton">목록</button>
        </p>
	</div>

	<jsp:include page="/common/comment.jsp"></jsp:include>

	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script type="text/javascript">

	$(function() {
		
		
		
		$("button:contains('수정')").on("click",function() {
			self.location = "/adoptReview/updateAdoptReview?postNo="+ $("input[name='postNo']").val();
		});

		$("button:contains('삭제')").on("click",function() {
					
			swal({
				  title: "정말 삭제 하시겠습니까 ?",
				  text: "더 이상 이 글을 다른 회원이 볼 수 없습니다.",
				  icon: "warning",
				  buttons: ["취소", "확인"],
				  dangerMode: true
				})
				.then((result) => {
				  if (result) {
					  
				    swal("삭제가 완료되었습니다!", {
				      	icon: "success",
				    }).then((value)=>{
				    	
				    	 self.location = "/adoptReview/delAdoptReview?postNo="+ $("input[name='postNo']").val();
						 
				    });
				  }
				});
		});
		
		$("button:contains('목록')").on("click",function() {
			self.location = "/adoptReview/listAdoptReview";
		});
	});
	

	
	//============= SNS공유 Event  처리 =============	
	$( "#twitter" ).on("click" , function() {
 		 window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');
		});			
	
	$( "#facebook" ).on("click" , function() {
 		 window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
		});			
	
	$( "#kakao" ).on("click" , function() {
		sendLinkKakao()
	});	
	
  //============= 카카오 공유하기Event  처리 =============		
	 Kakao.init('153d14a106a978cdc7a42f3f236934a6');
	 function sendLinkKakao(){
	     Kakao.Link.sendDefault({
	       objectType: 'feed',
	       content: {
	         title: '${board.postTitle}',
	         description: '${board.nickName} 님의 작성글 입니다.',
	         imageUrl:document.location.href,
	         link: {
	           mobileWebUrl: document.location.href,
	           webUrl:document.location.href
	         }
	       },
	       buttons: [       
	         {
	           title: '링크 열기',
	           link: {
	             mobileWebUrl: document.location.href,
	             webUrl: document.location.href
	           }
	         }
	       ]
	     }); 
	 }    
     
	</script>

</body>
</html>
