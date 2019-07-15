<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
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
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		 $(function() {
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddApply();
			});
			
			$( "button:contains('보호할개')" ).on("click" , function() {
				self.location = "../index.jsp"
			});
		});	
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
// 				$("form")[0].reset();
				alert("글 등록 취소 -> 목록으로")
			});
		});	
	
		
		function fncAddApply() {
			alert("신청완료 dialog")
			$("form").attr("method" , "POST").attr("action" , "/apply/addApply").submit();
		}
		
		
	</script>		

</head>

<body>




	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<button type="button" class="btn btn-primary">보호할개</button>
	
		<h1 class="bg-primary text-center">입양신청</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="id" value="user03" >
		<input type="hidden" name="adoptNo" value="${ apply.adoptNo }" >
		
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">연락처</label>
		    <div class="col-sm-4">
		      <input type="number" class="form-control" id="phone" name="phone" value="01121234567" placeholder="연락처">
		     <span id="pwdTest" > </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="adoptArea" class="col-sm-offset-1 col-sm-3 control-label">직업을 선택하세요.</label>
		    <div class="col-sm-4">
		      <input type="radio"  name="jop" value="1">학생
		      <input type="radio"  name="jop" value="2">직장인
		      <input type="radio"  name="jop" value="3">기타
		    </div>
		  </div>
	  
		  <div class="form-group">
		    <label for="location" class="col-sm-offset-1 col-sm-3 control-label">거주지를 선택하세요.</label>
		    <div class="col-sm-4">
		      <input type="radio"  name="addr" value="1">아파트
		      <input type="radio"  name="addr" value="2">주택
		      <input type="radio"  name="addr" value="3">빌라
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogBreed" class="col-sm-offset-1 col-sm-3 control-label">동거인 여부를 선택하세요.</label>
		    <div class="col-sm-4">
		      <input type="radio"  name="mate" value="1">있음
		      <input type="radio"  name="mate" value="2">없음
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogWeight" class="col-sm-offset-1 col-sm-3 control-label"><u>동거인이 있는 경우</u>, <br/>동의 여부를 선택하세요.</label>
		    <div class="col-sm-4">
		      <input type="radio"  name="mateAree" value="1">동의
		      <input type="radio"  name="mateAree" value="2">비동의
		    </div>
		  </div>
	  
		  <div class="form-group">
		    <label for="dogSize" class="col-sm-offset-1 col-sm-3 control-label">반려견 양육경험이 있습니까?</label>
		     <div class="col-sm-2">
		      <input type="radio"  name="raise" value="1">있음
		      <input type="radio"  name="raise" value="2">없음
		   	 </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogGender" class="col-sm-offset-1 col-sm-3 control-label"><u>반려견 양육경험이 있는 경우</u>, <br/>현재 양육 중 입니까?</label>
		     <div class="col-sm-2">
		      <input type="radio"  name="currently" value="1">양육중
		      <input type="radio"  name="currently" value="2">양육중아님
		     </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogPay" class="col-sm-offset-1 col-sm-3 control-label">반려견을 입양하게 될 경우, <br/>앞으로의 계획을 서술해주세요.</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="plan" name="plan" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogStatus" class="col-sm-offset-1 col-sm-3 control-label">반려견을 입양하게 될 경우, <br/>1년간의 예상 비용 써주세요.</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="pay" name="pay" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogChar" class="col-sm-offset-1 col-sm-3 control-label">반려견을 입양하고 싶은 이유를 서술해주세요.</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="reason" name="reason">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dogPersonality" class="col-sm-offset-1 col-sm-3 control-label">반려견을 입양하고 상황이 바뀔 경우, <br/>대처방법을 서술해주세요.</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="situation" name="situation">
		    </div>
		  </div>
		  
		  &nbsp;
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >신청</button>
			  <a class="btn btn-primary btn" href="#" role="button">취소</a>
			</div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>