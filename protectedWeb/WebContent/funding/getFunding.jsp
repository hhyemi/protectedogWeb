<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	<!-- KAKAO -->
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

		.container{
		width: 500px;
		font-size :15px;
		}			
		#voteDate{
		width:255px;
		float:left;
		}
		.form-group{
		padding-left:100px;
		padding-right:80px;
		}
	   #btn-vote{
		background: #fff;
        border:2px solid #29304d;
		color:#29304d;
		height:40px;
		width:100px;
		}
		#btn-interest{
		background: #fff;
        border:2px solid #29304d;
		color:#29304d;
		height:40px;
		width:100px;
		}		
		#btn-question{
		background: #fff;
        border:2px solid #29304d;
		color:#29304d;
		height:40px;
		width:150px;
		}
		
     </style>
   

</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<div class="form-group">

		<div >
			<font size=5><b>${funding.postTitle}</b></font> &emsp;${funding.id} 
				<!-- <div  align="right"  ><b>작성일 : ${funding.voteStartDate }</b></div>  -->
	    </div>
	    
	    <div class="media">  
		<div class="media-left media-middle ">
		      <img class="media-object" src="/resources/file/fileSF/${file.fileName }" width="570px;" height="370px;" >
		</div>
		<div class="media-body">
			<p/>
			<h2 class="media-heading">${funding.fundPay }표</h2>
			<p/>
			<h4 class="media-heading">남은기간 ${funding.voteRemainDate }일</h4>
			<p/>	 			    
			 <div class="progress">
			  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="50" style="width: ${30-funding.voteRemainDate}%;"></div>
			 </div>
		      <div  id="voteDate" >${funding.voteStartDate}</div>  <div >${funding.voteEndDate}</div>
			<p/>	 
			 <div><h2>투표율&ensp;<strong style="color:#225cba">${funding.voteRate}%</strong></h2></div>
			<p/>	 
			 <div><h2>현재투표인원&ensp;${funding.voterCount}명</h2></div>		
			 <p/>	 
			  <div>
	  			<button type="button" id="btn-vote">투표하기</button>
	  			<button type="button" id="btn-interest">관심등록</button>
		 	 </div>		 
		 	 <p/>
			  <div>
	  			<button type="button" id="btn-question">문의하기</button>
		 	 </div>		
		 	 <p/><p/><p/><p/><p/><p/> 
		 	 	 
			<a href="#"  id="twitter"  title="트위터로 공유"><img src="/resources/file/others/twitter.png"></a>
			<a href="#" id="facebook" title="페이스북으로 공유"><img src="/resources/file/others/facebook.png"></a>
			<a href="#"  id="naver" title="네이버로 공유"><img src="/resources/file/others/naver.png"></a>
			<a href="#"  id="kakao" title="카카오톡으로 공유"> <img src="/resources/file/others/kakao.png" ></a>

		</div>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>후원번호</strong></div>
			<div class="col-xs-8 col-md-4">${funding.postNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>후원목표금액</strong></div>
			<div class="col-xs-8 col-md-4">${funding.fundTargetPay }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>후원목표기간</strong></div>
			<div class="col-xs-8 col-md-4">${funding.fundTargetDay}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>글제목</strong></div>
			<div class="col-xs-8 col-md-4">${funding.postTitle}</div>
		</div>		
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>글내용</strong></div>
			<div class="col-xs-8 col-md-4">${funding.postContent}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>휴대전화번호</strong></div>
			<div class="col-xs-8 col-md-4">${funding.phone}</div>
		</div>

 		<hr/>
 			
		<div class="row">	
	  		<div >
	  			<button type="button" class="btn btn-primary">수정</button>
	  			<button type="button" class="btn btn-warning">취소</button>
	  		</div> 		
	 	</div>
	 	
	 	<br/><br/>			
		<br/>
	</div>	
 	</div>
 	
 	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============  카카오톡 공유하기=============	

		 
	 $(function() {
		 
			//=============  수정 Event  처리 =============	
			 $( "button.btn.btn-primary" ).on("click" , function() {
				 self.location = "/funding/updateFunding?postNo=${funding.postNo}"
				});
			
			//=============  취소 Event  처리 =============				 
			 $( "button.btn.btn-warning" ).on("click" , function() {
				 self.location = "/index.jsp"
				});
			
			//============= SNS공유 Event  처리 =============	
			$( "#twitter" ).on("click" , function() {
		 		 window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');
				});		
			
			$( "#naver" ).on("click" , function() {
		 		 window.open('https://share.naver.com/web/shareView.nhn?url='+encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');
				});		
			
			$( "#facebook" ).on("click" , function() {
		 		 window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');
				});			
			
			$( "#kakao" ).on("click" , function() {
				sendLinkKakao()
				});	
			 
	 });
		
	 Kakao.init('153d14a106a978cdc7a42f3f236934a6');
	 function sendLinkKakao(){
	     Kakao.Link.sendDefault({
	       objectType: 'feed',
	       content: {
	         title: '유기견보호',
	         description: '멍멍',
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

