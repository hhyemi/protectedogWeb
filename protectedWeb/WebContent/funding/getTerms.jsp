<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
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
   
   
    <!-- jQuery UI toolTip 사용 CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip 사용 JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	

	   #btn-add{
		background: #fff;
        border:2px solid #29304d;
		color:#29304d;
		height:40px;
		width:150px;
		}
		#btn-cancel{
		background: #fff;
        border:2px solid #29304d;
		color:#29304d;
		height:40px;
		width:150px;
		}
		.container{
		width: 1000px;
		font-size :15px;
		}		
		.form-group{
		padding-left:170px;
		padding-right:100px;
		}
		.form-form{
	    padding-left:15px;	
		}
    </style>

	</head>
	<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->
      
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container ">
		<div class="form-group">
		<div class="page-header text-center">	
		<font size=6>후원 신청글 약관동의</font> 후원신청정책을<strong style="color:#225cba"> 꼼꼼히 </strong> 확인해주세요.
	    </div>		
		</div>	
		
		<!-- form Start /////////////////////////////////////-->
		<form id ="uploadForm" class="form-horizontal">
		
		  <div class="form-group" id="voteNum">
		    <font ><b>제1조 (목적)</b></font>
		  </div>
		  <div class="form-group" >
			${termsList.get(0) }
		  </div>
		  <br/>		
		  <div align="right" style="padding-right:1000px;">
		<input type="checkbox" name="termsCheck" > <label>동의 합니다.</label>
		</div>	
		 <br/>			
			
		  <div class="form-group" id="voteNum">
		    <font ><b>제2조 (정의)</b></font>
		  </div>
		  <div class="form-group" >
			${termsList.get(1) }
		  </div>
		  <br/>		
		  <div align="right" style="padding-right:1000px;">
		<input type="checkbox" name="termsCheck" > <label>동의 합니다.</label>
		</div>	
		 <br/>			
					  
		  <div class="form-group" id="voteNum">
		    <font ><b>제3조 (서비스의 제공)</b></font>
		  </div>
		  <div class="form-group" >
			${termsList.get(2) }
		  </div>
		  <br/>		
		  <div align="right" style="padding-right:1000px;">
		<input type="checkbox" name="termsCheck" > <label>동의 합니다.</label>
		</div>	
		 <br/>			
			
		  <div class="form-group" id="voteNum">
		    <font ><b>제4조 (서비스의 신청)</b></font>
		  </div>
		  <div class="form-group" >
			${termsList.get(3) }
		  </div>
		  <br/>			  
		  <div align="right" style="padding-right:1000px;">
		<input type="checkbox" name="termsCheck" > <label>동의 합니다.</label>
		</div>	
		 <br/>			
			
		  <div class="form-group" id="voteNum">
		    <font ><b>제5조 (서비스의 이용료 등)</b></font>
		  </div>
		  <div class="form-group" >
			${termsList.get(4) }
		  </div>
		  <br/>
		  <div align="right" style="padding-right:1000px;">
		<input type="checkbox" name="termsCheck" > <label>동의 합니다.</label>
		</div>	
		 <br/><br/>		
		<input type="checkbox" id="allCheck" ><label>모두동의</label>
		<br/><br/><br/><br/>
		  <div class="form-group text-center">
	  			<button type="button" id="btn-add">작성하기</button>
	  			<button type="button" id="btn-cancel">취소</button>
		  </div>
		<br/><br/><br/><br/>	  		  
		</form>
		<!-- form Start /////////////////////////////////////-->

    </div>
   <!--  화면구성 div end /////////////////////////////////////-->


    <!--  ///////////////////////// JavaScript ////////////////////////// -->    
   <script type="text/javascript" >

   $(function() {
      
         //============= 등록 Event  처리 =============   
         $( "#btn-add" ).on("click" , function() {
        	if( !$("input[name=termsCheck]").prop("checked")){
        		alert("모두 동의해주세요.")
        	}else{
        		self.location="/funding/addFunding"
        	}
        	
 
            });
         
         //============= 취소 Event  처리 =============
          $( "#btn-cancel" ).on("click" , function() {
               history.go(-1);
            });
            
	  		//============= "체크박스 전체해제 전체삭제"  Event 처리 및  연결 ============= 		
		    $("#allCheck").click(function(){
		        //클릭되었으면
		        if($("#allCheck").not(":disabled").prop("checked")){
		            //input태그의 name이 termsCheck인 태그들을 찾아서 checked옵션을 true로 정의
		            $("input[name=termsCheck]").not(":disabled").prop("checked",true);
		            //클릭이 안되있으면
		        }else{
		            //input태그의 name이 termsCheck인 태그들을 찾아서 checked옵션을 false로 정의
		            $("input[name=termsCheck]").not(":disabled").prop("checked",false);
		        }
		    });
   });   
               
   
   </script>
   
      
</body>

</html>