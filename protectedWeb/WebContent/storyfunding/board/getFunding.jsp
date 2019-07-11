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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
   

</head>

<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">펀딩이력조회</h3>
	       <h5 class="text-muted">구매하신  <strong class="text-danger">펀딩</strong>상세 조회입니다.</h5>
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
	  		<div class="col-md-10 text-center">
	  			<button type="button" class="btn btn-primary">수정</button>
	  			<button type="button" class="btn btn-warning">이전</button>
	  		</div> 		
	 	</div>
	 	
	 	<br/><br/>			
		<br/>
		
 	</div>
 	
 	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	 $(function() {
		 
		 $( "button.btn.btn-primary" ).on("click" , function() {
			 self.location = "/funding/updateFunding?postNo=${funding.postNo}"
			});
			 
			 $( "button.btn.btn-warning" ).on("click" , function() {
					history.go(-1);
				});

		});
	
	
	</script>
 	
</body>

</html>

