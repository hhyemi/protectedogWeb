<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>보호할개 · 정책</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
<!-- 	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" > 
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
<!--  	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!--  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  -->

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
	
		.form-group2{
		padding-left:450px;
		padding-right:100px;
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
		input[type="checkbox"]:focus {
			
			outline-color : #ff0022;
			outline-style: solid;
			outline-width : 1px;
			
		}	
       @font-face{
          font-family: NanumSquare;
          src : url(http://ssl.pstatic.net/static/kin/fonts/NanumSquareR.woff2) format("woff2");
       }
       body{
          font-family: NanumSquare, sans-serif !important;
       }
    </style>

	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->
	</head>
	<body>
      
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container ">
	
	    <div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 60px;">
	      <div class="container">
	        <div class="row no-gutters slider-text align-items-center justify-content-center">
	          <div class="col-md-9 ftco-animate text-center">
	          	<p ><span class="mr-2">protected</span> <span>terms</span></p>
	            <font size="7">${termsTitle}&nbsp;</font>정책을<strong style="color:#f04f23"> 꼼꼼히 </strong> 확인해주세요.
	          </div>
	        </div>
	      </div>
	    </div>	
	    <br/><p/>
		<hr/><br/>
		<!-- form Start /////////////////////////////////////-->
		<form id ="uploadForm" class="form-horizontal">
		
		  <div class="form-group" id="voteNum">
		    <font ><b>제1조 (목적)</b></font>
		  </div>
		  <div class="form-group" >
			${termsList.get(0) }
		  </div>
		  <br/>		
		  <div align="right" style="padding-right:100px;">
		<input type="checkbox" class="termsCheck" name="termsCheck1" >동의 합니다.
		</div>	
		 <br/>			
			
		  <div class="form-group" id="voteNum">
		    <font ><b>제2조 (정의)</b></font>
		  </div>
		  <div class="form-group" >
			${termsList.get(1) }
		  </div>
		  <br/>		
		  <div align="right" style="padding-right:100px;">
		<input type="checkbox" class="termsCheck"  name="termsCheck2" >동의 합니다.
		</div>	
		 <br/>			
					  
		  <div class="form-group" id="voteNum">
		    <font ><b>제3조 (서비스의 제공)</b></font>
		  </div>
		  <div class="form-group" >
			${termsList.get(2) }
		  </div>
		  <br/>		
		  <div align="right" style="padding-right:100px;">
		<input type="checkbox" class="termsCheck"  name="termsCheck3" >동의 합니다.
		</div>	
		 <br/>			
			
		  <div class="form-group" id="voteNum">
		    <font ><b>제4조 (서비스의 신청)</b></font>
		  </div>
		  <div class="form-group" >
			${termsList.get(3) }
		  </div>
		  <br/>			  
		  <div align="right" style="padding-right:100px;">
		<input type="checkbox" class="termsCheck"  name="termsCheck4" >동의 합니다.
		</div>	
		 <br/>			
			
		  <div class="form-group" id="voteNum">
		    <font ><b>제5조 (서비스의 이용료 등)</b></font>
		  </div>
		  <div class="form-group" >
			${termsList.get(4) }
		  </div>
		  <br/>
		  <div align="right" style="padding-right:100px;">
		<input type="checkbox" class="termsCheck"  name="termsCheck5" >동의 합니다.
		</div>	
		 <br/><br/>		
		 <hr/>
		  <div align="right" style="padding-right:100px;">
		<input type="checkbox" id="allCheck" >모두 동의합니다.
		</div>	
		<br/><br/><br/><br/>
	
	          	<div class="col-md-12" style="padding-left:160px;padding-right: 100px">
	  			<button  type="button" class="btn btn-default py-3 px-4 col-md-12"  id="btn-add">
	  			<c:if test="${termsTitle eq '후원신청글'}">
	  			작성
	  			</c:if>
	  			<c:if test="${termsTitle eq '투표하기'}">
	  			투표
	  			</c:if>
	  			<c:if test="${termsTitle eq '후원하기'}">
	  			후원
	  			</c:if>	  			
	  			</button>
	  			<p/>
						<div class="col-md-12">
							<div  align="right">
								<p><a href="#" ><font color="gray" id="btn-cancel">취소</font></a></p>
							</div>
						</div>
		  </div>
		  
		<br/><br/><br/><br/>	  		  
		</form>
		<!-- form Start /////////////////////////////////////-->

    </div>
   <!--  화면구성 div end /////////////////////////////////////-->
    <!--================ start footer Area  =================-->
    <!-- footer Start /////////////////////////////////////-->
	 <jsp:include page="/layout/footer.jsp"></jsp:include>
   	<!-- footer End /////////////////////////////////////-->  
    <!--================ End footer Area  =================-->

    <!--  ///////////////////////// JavaScript ////////////////////////// -->    
   <script type="text/javascript" >

   $(function() {
      
         //============= 등록 Event  처리 =============   
         $( "#btn-add" ).on("click" , function() {

        	if( !$("input[name=termsCheck1]").prop("checked")){
        		$("input[name=termsCheck1]").focus();
        	}else if(!$("input[name=termsCheck2]").prop("checked")){
        		$("input[name=termsCheck2]").focus();
          	}else if(!$("input[name=termsCheck3]").prop("checked")){
        		$("input[name=termsCheck3]").focus();
          	}else if(!$("input[name=termsCheck4]").prop("checked")){
        		$("input[name=termsCheck4]").focus();
          	}else if(!$("input[name=termsCheck5]").prop("checked")){
        		$("input[name=termsCheck5]").focus();        	       	       	       	
        	}else{
        		if(	${termsTitle eq '후원신청글'}){
        			self.location="/funding/addVoting";
        		}else if(${termsTitle eq '투표하기'}){

      			  swal({
      				   title: "투표하였습니다.",
      		           text:"소중한 한 표 감사합니다.",
      		           dangerMode: true,
      		           buttons: {
      							 catch: {
      							 	text: "확인"
      							 }
      				   },			      
		  		      }).then((willDelete) => {
				           if (willDelete) {
				        	   self.location="/funding/addVote?postNo=${postNo}";
				           }
				      });

        		}else if(${termsTitle eq '후원하기'}){
        			self.location="/funding/addFund?postNo=${postNo}";
        		}
        	}
        	
 
            });
         
         //============= 취소 Event  처리 =============
          $( "#btn-cancel" ).on("click" , function() {
               history.go(-1);
            });
         
        //============= "체크박스 전체해제 전체삭제"  Event 처리 및  연결 ============= 	         
	          $( "#allCheck").on('click', function(){
	              if (  $( "#allCheck").prop("checked")  ) {
	                 $(".termsCheck").prop("checked", "checked");
	             }else{
	                 $(".termsCheck").prop('checked', false);
	             }
	          });  
	          $( ".termsCheck" ).on('click', function(){
	              if($(".termsCheck:checked").length == 5){
	                 $("#allCheck").prop("checked", "checked");
	              }else{
	                 $("#allCheck").prop("checked", false);
	              }
	           });          
         
   });   
               
   
   </script>
   
      
</body>

</html>