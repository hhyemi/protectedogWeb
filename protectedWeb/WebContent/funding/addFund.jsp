<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet"
			href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
			    <title>보호할개 · 후원</title>
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		    <link rel="stylesheet" href="/resources/get/css/bootstrap.css" />

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		.container2{
		width: 950px;
		padding-left:170px;
		font-size :15px;
		}	
		.container{
		width: 1000px;
		font-size :15px;
		}		
		.form-group{
		padding-left:460px;
		padding-right:100px;
		}
		.form-group2{
		padding-left:170px;
		padding-right:100px;
		}		
		.form-form{
	    padding-left:15px;	
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
          	<p ><span class="mr-2">Support</span> <span>Apply</span></p>
            <font size="7">후원이 완료되었습니다.</font><br/> 후원 해주셔서 <strong  style="color:#f04f23">감사</strong>합니다.
          </div>
        </div>
      </div>
    </div>
		<br/>
	 <section class="ftco-section bg-light" style="padding-bottom: 0px; padding-top : 20px;">   
		
					<!--  table Start /////////////////////////////////////-->
	<div class="container2">	 
			      <table class="table table-hover table-striped" >
			      
			        <thead>
			          <tr>
			            <th ></th>
			            <th><b>후원글 제목</b></th>
			            <th><b>닉네임</b></th>	
			          </tr>
			        </thead>
			       
			 		<tbody>	
			 		   <tr>			
						  <td width="150px;" align="center"><img src="/resources/file/fileSF/${funding.mainFile}"  width="150px;" height="150px;"/></td>		
						  <td width="150px;">${funding.postTitle}</td>					 		  
						  <td width="150px;">${funding.nickname}</td> 
						</tr>
			        </tbody> 
			      
			      </table>
			</div>      
             	  <!--  table End /////////////////////////////////////--> 
				<br/>
				
		<!-- form Start /////////////////////////////////////-->
		<form id ="uploadForm" class="form-horizontal center">
		  <div class="form-group  ">
			<font class="text-center" size="5"><b>후원자&emsp;&emsp;&emsp;</b></font>
			 ${user.userName }
		  </div>		  
		  <div class="form-group ">
			<font class="text-center" size="5"><b>후원금액&emsp;&emsp;</b></font>
			<fmt:formatNumber value="${participate.fundPay }" pattern="#,###" />
		  </div>  
 		  <div class="form-group ">
			<font class="text-center" size="5"><b>결제방법&emsp;&emsp;</b></font>
			휴대폰결제
			 <c:if test="${participate.paymentCode eq 'card' }">
			 신용카드
			 </c:if>
			 <c:if test="${participate.paymentCode eq 'trans' }">
			 계좌이체
			 </c:if>			 
		  </div>
		  <div class="form-group ">
			<font class="text-center" size="5"><b>후원날짜&emsp;&emsp;</b></font>
			 ${participate.regDate }
		  </div>		  
			<br/><hr/>        
		  <br/><br/>
		  
		  <div class="col-md-12 " style=" padding-left: 170px;" >
	  			<button type="button"  class="btn btn-default py-3 px-4 col-md-12" style="width: 770px;" id="btn-ok">확인</button>
		  </div>
		  <br/><br/><br/><br/><br/><br/><br/><br/>
		</form>
		<!-- form Start /////////////////////////////////////-->
</section>
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
      
         
         //============= 확인 Event  처리 =============
          $( "#btn-ok" ).on("click" , function() {
  			$(self.location).attr("href","/funding/getFunding?postNo=${funding.postNo}");
  		
          });

            
   });   
               
   
   </script>
   
      
</body>

</html>