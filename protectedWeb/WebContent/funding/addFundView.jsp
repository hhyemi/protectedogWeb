<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


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
		padding-left:170px;
		padding-right:100px;
		}
		.form-form{
	    padding-left:15px;	
		}
		.form-group2{
		padding-left:450px;
		padding-right:100px;
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
	          	<p ><span class="mr-2">Support</span> <span>Fund</span></p>
	            <font size="7">후원하기</font><br/> 후원 시 <strong  style="color:#f04f23">환불이 불가</strong>하니 참고하시길 바랍니다.	
	          </div>
	        </div>
	      </div>
	    </div>
		
		<br/>
				<!-- form Start /////////////////////////////////////-->
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
		<form id ="uploadForm" class="form-horizontal">
		  <div class="form-group">
			<h5><b>후원금액</b></h5>
			해당 게시글에 후원하실금액은 ( <strong style="color:#f04f23">최대 300만원</strong> )입니다. <p/>
		    <div class="row form-form"  >
		      <input type="text" class="form-control" id="fundPay" name="fundPay" placeholder="0" style="width:600px; height:35px;" >&ensp; 원을 후원합니다.
		    </div>
		  </div>
			<br/>
		  <div class="form-group">
				<h5><b>후원결제방법</b></h5>
				* 브라우저 환경에 따라 결제창 실행 시간이 길어질 수 있습니다. (Explorer 11 권장)<br/>
				* 브라우저 설정에서 팝업창이 제한되어있는지 확인해 주세요.<br/><br/>
			    <div class="row form-form "  >
			    <label class="btn btn-default " style="background-color: #f56740; padding: 3px; border-radius: 3px; color: #ffffff" > <input type="radio" name="paymentCode" value="card">&nbsp;신용카드</label>
			     &emsp;
			     <label class="btn btn-default " style="background-color: #f56740; padding: 3px; border-radius: 3px; color: #ffffff" > <input type="radio" name="paymentCode" value="trans">&nbsp;계좌이체</label>		     
			     &emsp;
			     <label class="btn btn-default " style="background-color: #f56740; padding: 3px; border-radius: 3px; color: #ffffff" > <input type="radio" name="paymentCode" value="samsung">&nbsp;삼성페이</label>		     
		         &emsp;
			     <label class="btn btn-default " style="background-color: #f56740; padding: 3px; border-radius: 3px; color: #ffffff" > <input type="radio" name="paymentCode" value="vbank">&nbsp;가상계좌</label>		     
		         &emsp;
			     <label class="btn btn-default " style="background-color: #f56740; padding: 3px; border-radius: 3px; color: #ffffff" > <input type="radio" name="paymentCode" value="phone">&nbsp;휴대폰결제</label>		     
			 			 			 		 
			    </div>
			 </div>        
        	 <input type="hidden" name="postNo" value="${funding.postNo }"  />
		  <br/><br/>
		  
	          	<div class="col-md-12" style="padding-left:170px;padding-right: 170px">
	          	
					<p><button  type="button" class="btn btn-default py-3 px-4 col-md-12" id="btn-fund">후원</button></p>
					<div>
						<div class="col-md-12">
							<div  align="right">
								<p><a href="#" ><font color="gray" id="btn-cancel">취소</font></a></p>
							</div>
						</div>
					</div>
					
	          </div>

		  <br/><br/><br/><br/><br/><br/><br/><br/>
		</form>
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

   //============= 등록버튼 눌렀을때 함수 =============      
   function fncAddFunding(){


      $('form').attr("method","POST").attr("action","/funding/addFunding").attr("enctype","multipart/form-data").submit();
   }
   
   //3자리 단위마다 콤마 생성
   function addCommas(x) {
       return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   }
    
   //모든 콤마 제거
   function removeCommas(x) {
       if(!x || x.length == 0) return "";
       else return x.split(",").join("");
   }
   
   //============= 아임포트 결제 Event  처리 ============        
   function fncPayment(){
	   
	   
	      //Form 유효성 검증   
	   var payment = null;
	   var fundPay = $('input[name="fundPay"]').val();	
       $('input[name="fundPay"]').val(removeCommas($('input[name="fundPay"]').val()));
       var fundPay2 = removeCommas($('input[name="fundPay"]').val());
       
	      if(fundPay == null || fundPay.length<1){
			  swal({
		           text: "후원금액을 입력해주세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },			   
		      }).then((willDelete) => {
		           if (willDelete) {
		 	          $('input[name="fundPay"]').focus();
		           }
		      });

	          return;
	       } 

	      if(fundPay > 3000000){
			  swal({
		           text: "후원금액은 300만원이하로 입력해주세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },			   
		      }).then((willDelete) => {
		           if (willDelete) {
		 	          $('input[name="fundPay"]').focus();
		           }
		      });	    	  

	         return;
	      }	      
	      
	      if(!($('input[name="paymentCode"]').is(':checked'))){
			  swal({
		           text: "결제방법을 선택해주세요.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },			   
		      });
	          return;
	       }
	      	   
	     $(function() {
	    	 
		      $("input[name='paymentCode']:checked").each(function() {
		    	   payment = $(this).val(); 
		      });
		      
				IMP.init('imp85290840'); 
				
				IMP.request_pay({
			    pay_method : removeCommas(payment),
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '보호할개후원',
				amount : fundPay2,
				buyer_email : '${user.email}',
				buyer_name : '${user.userName}',
				buyer_tel : '${user.phone}',
				buyer_addr : '${user.userAddr}',
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
					var msg = '';
					msg += rsp.error_msg;
					  swal({
				           text: msg,
				           dangerMode: true,
				           buttons: {
									 catch: {
									 	text: "확인"
									 }
						   },			   
				      }); 
					 
					}
					
					});

				
				
    	});
		
	   }	      
	     $(document).ready(function() {
	      
		        //============= 후원금액 =============
	             $('#fundPay').keyup(function(){
	            	 
	            	 //입력시 콤마 적용
	            	 $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));        	 

	                 //후원목표금액 길이초과
	                 if (removeCommas($(this).val()).length > 7 ) {

	       			  swal({
	       		           text: "300만원이하로 입력해주세요.",
	       		           dangerMode: true,
	       		           buttons: {
	       							 catch: {
	       							 	text: "확인"
	       							 }
	       				   },			   
	       		      });	                	 
	                     $(this).val(removeCommas($(this).val()).substr(0, 7));
	                     
	                     $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));  

	                 }
	             });				
	     });
 
 
   $(function() {
      
         //============= 후원 Event  처리 =============   
         $( "#btn-fund" ).on("click" , function() {
        	 fncPayment();
            });
         
         //============= 취소 Event  처리 =============
          $( "#btn-cancel" ).on("click" , function() {
               history.go(-1);
            });

            
   });   
               
   
   </script>
   
      
</body>

</html>