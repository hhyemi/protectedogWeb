<%@ page contentType="text/html; charset=EUC-KR" %>
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
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('수정')" ).on("click" , function() {
					self.location = "/adopt/updateAdopt?postNo=${adopt.postNo}"
			});
			
			 $( "button:contains('삭제')" ).on("click" , function() {
				 	alert("삭제하시겠습니까 dialog 추가");
					self.location = "/adopt/updateStatusCode?postNo=${adopt.postNo}"
			});
			
			 $( "button:contains('신청')" ).on("click" , function() {
					self.location = "../apply/getTerms.jsp?postNo=${adopt.postNo}"
			});
			
			 $( "button:contains('목록')" ).on("click" , function() {
					self.location = "/adopt/listAdopt?boardCode=${adopt.boardCode}"
			});
			
			 $( "button:contains('신청글보기')" ).on("click" , function() {
					self.location = "/apply/listApply?adoptNo=${adopt.postNo}"
			});
			
			 $( "button:contains('보호할개')" ).on("click" , function() {
					self.location = "../index.jsp"
			});
		 
		});
		
		
		 $(function() {			
				$( "button:contains('분양완료')" ).on("click" , function() {
					var postNo = ${adopt.postNo};
					alert(typeof postNo);

					$.ajax( 
						 		{
									url : "/adopt/json/updateStatusCode/"+postNo ,
									method : "GET" ,
									dataType : "json" ,
									headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											  },
									success : function(status) {
										$( '#complete' ).text('<b>완료됨</b>');
									},
									error: function(request, status, error){ 
										alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  
							        }
						});
				});	
			
		 });
		
// 		function fncAddUser() {
// 			self.location = "/adopt/listAdopt?boardCode=${adopt.boardCode}"
// 		}
		
	</script>
	
</head>

<body>

	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<button type="button" class="btn btn-primary">보호할개</button>
	
		<div class="page-header">
	       <h3 class=" text-info">
		        <c:if test="${adopt.boardCode eq 'AD' }">
		  			분양글 상세조회
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			실종글 상세조회
		  		</c:if>
	       </h3>
	    </div>
	    <input type="hidden" name="postNo" value=" ${ adopt.postNo }" >
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>게시판코드</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.boardCode}</div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>글번호</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.postNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>아이디</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.id}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>글제목</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.postTitle}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>글내용</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.postContent}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>연락처</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.phone}</div>
		</div>
		
		<hr/>
		
		<c:if test="${adopt.boardCode eq 'AD' }">
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>분양가능지역</strong></div>
				<div class="col-xs-8 col-md-4">${adopt.adoptArea}</div>
			</div>
			
			<hr/>
		</c:if>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>
	  			<c:if test="${adopt.boardCode eq 'AD' }">
		  			발견위치
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			실종위치
		  		</c:if>
	  		</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.location}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>견종</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogBreed}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>무게</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogWeight}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>크기</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogSize}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>성별</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogGender}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>
				<c:if test="${adopt.boardCode eq 'AD' }">
		  			책임비
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			사례비
		  		</c:if>
			</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogPay}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>개상태</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogStatus}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>외모특징</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogChar}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>성격</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogPersonality}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>
	  			<c:if test="${adopt.boardCode eq 'AD' }">
		  			발견일자
		  		</c:if>
			    <c:if test="${adopt.boardCode eq 'MS' }">
		  			실종일자
		  		</c:if>
	  		</strong></div>
			<div class="col-xs-8 col-md-4">${adopt.dogDate}</div>
		</div>
		
		<hr/>

		<hr/>
		
		
	
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  		
	  			<c:if test="${adopt.statusCode eq '1' }">
		  			<button type="button" class="btn btn-primary">수정</button>
		  			<button type="button" class="btn btn-primary">삭제</button>
		  			<c:if test="${adopt.boardCode eq 'MS' }">
				  		<button type="button" class="btn btn-primary">찾기완료</button>
				  	</c:if>
	  			</c:if>
	  			<c:if test="${adopt.statusCode eq '2' }">
	  				<button type="button" class="btn btn-primary">분양완료</button>
	  				<button type="button" class="btn btn-primary">신청글보기</button>
	  			</c:if>
	  			<br/><br/>
	  			<button type="button" class="btn btn-primary">목록</button>
<%-- 	  			<c:if test="${user.role eq 'admin' }"> --%>
<!-- 	  				<button type="button" class="btn btn-default">목록</button> -->
<%-- 	  			</c:if> --%>
				<c:if test="${adopt.boardCode eq 'AD' }">
		  			<button type="button" class="btn btn-primary">입양신청</button>
		  		</c:if>
		  		<br/><br/>
		  		<span id="complete">${adopt.statusCode }</span>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>