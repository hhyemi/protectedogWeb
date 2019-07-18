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
	
	<!-- i'm port -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    		
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

	   #btn-fund{
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
		<font size=6>후원하기</font> 후원 시 <strong  style="color:#225cba">환불이 불가</strong>하니 참고하시길 바랍니다.
	    </div>		
		</div>	
		<br/>
					<!--  table Start /////////////////////////////////////-->
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
             	  <!--  table End /////////////////////////////////////--> 
				<br/>
				
		<!-- form Start /////////////////////////////////////-->
		<form id ="uploadForm" class="form-horizontal">
		  <div class="form-group">
			<h3><b>후원금액</b></h3>
			해당 게시글에 후원하실금액은 ( <strong style="color:#225cba">최대 300만원</strong> )입니다. <p/>
		    <div class="row form-form"  >
		      <input type="text" class="form-control" id="fundPay" name="fundPay" placeholder="0" maxlength="7"  style="width:600px; height:35px;" >&ensp; 원을 후원합니다.
		    </div>
		  </div>
			<br/>
		  <div class="form-group">
				<h3><b>후원결제방법</b></h3>
				* 브라우저 환경에 따라 결제창 실행 시간이 길어질 수 있습니다. (Explorer 11 권장)<br/>
				* 브라우저 설정에서 팝업창이 제한되어있는지 확인해 주세요.<br/><br/>
			    <div class="row form-form "  >
			    <label class="btn btn-primary"> <input type="radio" name="payment" value="card">신용카드</label>
			   &emsp;
			     <label class="btn btn-primary"> <input type="radio" name="payment" value="trans">계좌이체	</label>		     
			 
			    </div>
			 </div>        
        	 <input type="hidden" name="postNo" value="${funding.postNo }"  />
		  <br/><br/>
		  <div class="form-group text-center">
	  			<button type="button" id="btn-fund"> 후원 </button>
	  			<button type="button" id="btn-cancel">뒤로</button>
		  </div>
		  <br/><br/><br/><br/><br/><br/><br/><br/>
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

   //============= 등록버튼 눌렀을때 함수 =============      
   function fncAddFunding(){


      $('form').attr("method","POST").attr("action","/funding/addFunding").attr("enctype","multipart/form-data").submit();
   }
   //============= 아임포트 결제 Event  처리 ============        
   function fncPayment(){
	   
	   
	      //Form 유효성 검증   
	   var payment = null;
	   var fundPay = $('input[name="fundPay"]').val();	
	   
	      if(fundPay == null || fundPay.length<1){
	          alert("후원금액은 반드시 입력하여야 합니다.");
	          $('input[name="fundPay"]').focus();
	          return;
	       } 
	      if(!($('input[name="payment"]').is(':checked'))){
	          alert("결제방법은 반드시 선택하여야 합니다.");
	          return;
	       }
	      	   
	     $(function() {      
	    	 
		      $("input[name='payment']:checked").each(function() {
		    	   payment = $(this).val(); 
		      });
		      
				IMP.init('imp85290840'); 
				
				IMP.request_pay({
			    pay_method : payment,
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '보호할개후원',
				amount : fundPay,
/*				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',*/
				buyer_postcode : '123-456'
				
				}, function(rsp) {
				if ( rsp.success ) {
/* 				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num; */
			    $('form').attr("method","POST").attr("action","/funding/addFund").submit();	
				
				} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
				}
				
				});
    	});
	      
		
		
	   }	      
 
 
   $(function() {
      
         //============= 후원 Event  처리 =============   
         $( "#btn-fund" ).on("click" , function() {
        	 fncPayment();
        	 //fncAddFunding();
            });
         
         //============= 취소 Event  처리 =============
          $( "#btn-cancel" ).on("click" , function() {
               history.go(-1);
            });

            
   });   
               
   
   </script>
   
      
</body>

</html>