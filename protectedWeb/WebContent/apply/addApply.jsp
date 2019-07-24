 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

	<title>ADD APPLY</title>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <style type="text/css">
	    html {
	 	 scroll-behavior: smooth;
		}
	</style>
	
</head>
  
  
<body class="goto-here">
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread" id="h1">입양 신청</h1>
          </div>
        </div>
      </div>
    </div>
    
    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-8 ftco-animate">
			<form  action="#" class="billing-form">
	          	<div class="row align-items-end">
	          	
	          	
				<input type="hidden" name="id" value="${ apply.id }" >
				<input type="hidden" name="statusCode" value="1" >
				<input type="hidden" name="adoptNo" value="${ apply.adoptNo }" >
				
				<div class="col-md-12">
				
	          		<div class="cart-detail bg-light p-3 p-md-4">
	          			<h3 class="billing-heading mb-4"><strong>약관 동의</strong></h3>
	          			
						<div class="form-group">
							<div class="col-md-12"><strong>1. </strong>
								입양인은 입양동물에게 양질의 사료와 깨끗한 물을 공급하고, 적합하고 적절한 운동, 질병에 대한 예방접종, 정기 건강검진을 시행하는 등 꼭 필요한 복지를 제공할 의무가 있습니다.
							</div>
							<div class="col-md-12">
								<div class="radio" align="right">
								   <label><input type="checkbox" name="terms" class="mr-2">동의</label>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-12"><strong>2. </strong>
								만일 입양동물이 질병에 걸렸을 때 입양인은 신속하게 필요한 수의학적 치료를 받게 하고 성실하게 그 치료에 임할 것이며 만일 입양동물의 완치가 불가능하고 
								그 고통이 극심한 경우에는 이를 단체에 통지하고 단체와의 협의 하에 대안을 강구하여야 하며 임의로 처리해서는 안 됩니다. 
								입양인은 입양동물이 자연사한 경우에도 즉시 이 사실을 단체에 통지할 의무가 있습니다.
							</div>
							<div class="col-md-12">
								<div class="radio" align="right">
								   <label><input type="checkbox" name="terms" class="mr-2">동의</label>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-12"><strong>3. </strong>
								입양 신청 후, 신청글은 수정하거나 삭제하실 수 없습니다.
							</div>
							<div class="col-md-12">
								<div class="radio" align="right">
								   <label><input type="checkbox" name="terms" class="mr-2">동의</label>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-12">
								<div class="radio" align="right">
								   <label><input type="checkbox" name="termsAll" class="mr-2"><strong>모두 동의</strong></label>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				
				
	   
	          	
	          	
	          	<div class="col-md-12"><br/><hr/><br/></div>
	          	
	          	
	          		<div class="col-md-12">
		                <div class="form-group">
		                	<label for="phone"><strong>연락처</strong>&nbsp;&nbsp;<span name="phone">연락처가 다를 경우 회원정보를 수정해주세요.</span></label>
		                	<input type="text" class="form-control" name="phone" value="${ apply.phone }" readonly>
		                </div>
	                </div>
    
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for=""><strong>직업을 선택하세요.</strong></label><br/>
	                		<div class="col-md-2"><input type="radio"  name="job" value="학생">학생</div>
	                		<div class="col-md-2"><input type="radio"  name="job" value="직장인">직장인</div>
	                		<div class="col-md-2"><input type="radio"  name="job" value="기타">기타</div>
	               		</div>
               		</div>
               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for=""><strong>거주지 유형을 선택하세요.</strong></label><br/>
	                		<div class="col-md-2"><input type="radio"  name="addr" value="주택">주택</div>
	                		<div class="col-md-2"><input type="radio"  name="addr" value="아파트">아파트</div>
	                		<div class="col-md-2"><input type="radio"  name="addr" value="빌라">빌라</div>
	                		<div class="col-md-2"><input type="radio"  name="addr" value="기타">기타</div>
	               		</div>
               		</div>
               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for=""><strong>동거인 여부를 선택하세요.</strong></label><br/>
	                		<div class="col-md-2"><input type="radio"  name="mate" value="있음">있음</div>
	                		<div class="col-md-2"><input type="radio"  name="mate" value="없음">없음</div>
	               		</div>
               		</div>
               		
               		<span name="mateAgree"></span>
               		
	            	<div class="col-md-12">
	              		<div class="form-group">
	                		<label for=""><strong>반려견 양육경험 여부를 선택하세요.</strong></label><br/>
	                		<div class="col-md-2"><input type="radio"  name="raise" value="있음">있음</div>
	                		<div class="col-md-5"><input type="radio"  name="raise" value="없음">없음</div>
	               		</div>
               		</div>
               		
               		<span name="currently"></span>
               		
               		<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="plan"><strong>반려견을 입양하게될 경우, 앞으로의 계획을 입력하세요.</strong>&nbsp;&nbsp;<span name="plan"></span></label>
	                  		<input type="text" class="form-control" name="plan" value="" placeholder="내용을 입력하세요.">
	               		</div>
               		</div>
               		
               		<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="pay"><strong>반려견을 입양하게될 경우, 1년간의 예상 비용과 그 이유를 입력하세요.</strong>&nbsp;&nbsp;<span name="pay"></span></label>
	                  		<input type="text" class="form-control" name="pay" value="" placeholder="내용을 입력하세요.">
	               		</div>
               		</div>
               		
               		<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="reason"><strong>반려견을 입양하고 싶은 이유를 입력하세요.</strong>&nbsp;&nbsp;<span name="reason"></span></label>
	                  		<input type="text" class="form-control" name="reason" value="" placeholder="내용을 입력하세요.">
	               		</div>
               		</div>
               		
               		<div class="col-md-12">
	              		<div class="form-group">
	                		<label for="situation"><strong>반려견을 입양하고 상황이 바뀔 경우, 어떻게 대처할 지 입력하세요.</strong>&nbsp;&nbsp;<span name="situation"></span></label>
	                  		<input type="text" class="form-control" name="situation" value="" placeholder="내용을 입력하세요.">
	               		</div>
               		</div>
               		
               		<div class="w-100"></div>
		            <div class="w-100"></div>
               		<div class="w-100"></div>
                
	            </div>
	          </form>
	          
	          <!-- END -->


	          <div class="row mt-5 pt-3 d-flex">
	          	<div class="col-md-12">
	          	
					<p><button class="btn btn-primary py-3 px-4 col-md-12">신청</button></p>
					
					<div class="form-group">
						<div class="col-md-12">
							<div class="radio" align="right">
								<p><a href="#" ><font color="gray">취소</font></a></p>
							</div>
						</div>
					</div>
					
	          	</div>
	          </div>
	          
	          
 <!-- 	/////////////////////////////////////////       dialog       ///////////////////////////////////////////////////////////////////// -->

			<div id="dialog-terms" title="">
			  <p align="center"><br/>약관에 모두 동의해야 신청할 수 있습니다.</p>
			</div>       
			<div id="dialog-job" title="">
			  <p align="center"><br/>직업을 선택하세요.</p>
			</div>       
			<div id="dialog-addr" title="">
			  <p align="center"><br/>거주지 유형을 선택하세요.</p>
			</div>       
			<div id="dialog-mate" title="">
			  <p align="center"><br/>동거인 여부를 선택하세요.</p>
			</div>       
			<div id="dialog-mateAgree" title="">
			  <p align="center"><br/>동거인 동의 여부를 선택하세요.</p>
			</div>       
			<div id="dialog-afterMateAgree" title="">
			  <p align="center"><br/>동거인 여부를 먼저 선택하세요.</p>
			</div>       
			<div id="dialog-raise" title="">
			  <p align="center"><br/>양육경험 여부를 선택하세요.</p>
			</div>       
			<div id="dialog-currently" title="">
			  <p align="center"><br/>현재 양육 여부를 선택하세요.</p>
			</div>      
			<div id="dialog-afterCurrently" title="">
			  <p align="center"><br/>양육경험 여부를 먼저 선택하세요.</p>
			</div>   
			<div id="dialog-confirm" title="">
			  <p align="left" id="confirm" ></p>
			</div>     
       
<!-- 	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->      
	          
	          
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

    <jsp:include page="/layout/footer.jsp"></jsp:include>
    
    
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

  <script src="/resources/prodmenu/js/jquery.min.js"></script>
  <script src="/resources/prodmenu/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/prodmenu/js/popper.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.easing.1.3.js"></script>
  <script src="/resources/prodmenu/js/jquery.waypoints.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.stellar.min.js"></script>
  <script src="/resources/prodmenu/js/owl.carousel.min.js"></script>
  <script src="/resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/prodmenu/js/aos.js"></script>
  <script src="/resources/prodmenu/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/prodmenu/js/bootstrap-datepicker.js"></script>
  <script src="/resources/prodmenu/js/scrollax.min.js"></script>
  <script src="/resources/prodmenu/js/main.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="/resources/events.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>

 	  

	
	$( function() {
	    $( "#dialog-terms" ).dialog({
	    	  autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  $("input[name=terms]:checkbox").prop('checked', false).focus();
		    	  }
		      }
	    });
	});
	
	$( function() {
	    $( "#dialog-job" ).dialog({
	    	  autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  $("input[name=job]:radio").prop('checked', false).focus();
		    	  }
		      }
	    });
	});
	
	$( function() {
	    $( "#dialog-addr" ).dialog({
	    	  autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  $("input[name=addr]:radio").prop('checked', false).focus();
		    	  }
		      }
	    });
	});
	
	$( function() {
	    $( "#dialog-mate" ).dialog({
	    	  autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  $("input[name=mate]:radio").prop('checked', false).focus();
		    	  }
		      }
	    });
	});
	
	$( function() {
	    $( "#dialog-mateAgree" ).dialog({
	    	  autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  $("input[name=mateAgree]:radio").prop('checked', false).focus();
		    	  }
		      }
	    });
	});
	
	$( function() {
	    $( "#dialog-afterMateAgree" ).dialog({
	    	  autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  $("input[name=afterMateAgree]:radio").prop('checked', false).focus();
		    	  }
		      }
	    });
	});
	
	$( function() {
	    $( "#dialog-raise" ).dialog({
	    	  autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  $("input[name=raise]:radio").prop('checked', false).focus();
		    	  }
		      }
	    });
	});
	
	$( function() {
	    $( "#dialog-currently" ).dialog({
	    	  autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  $("input[name=currently]:radio").prop('checked', false).focus();
		    	  }
		      }
	    });
	});
	
	$( function() {
	    $( "#dialog-afterCurrently" ).dialog({
	    	  autoOpen: false,
		      width: 350,
		      height: 180,
		      modal: true,
		      buttons: {
		    	  닫기: function(){
		    		  $( this ).dialog( "close" );
		    		  $("input[name=afterCurrently]:radio").prop('checked', false).focus();
		    	  }
		      }
	    });
	});
	
	
	$( function() {
	    $( "#dialog-confirm" ).dialog({
	    	  autoOpen: false,
		      width: 470,
		      height: 500,
		      modal: true,
		      buttons: {
		        	신청: function() {
		        		$("form").attr("method" , "POST").attr("action" , "/apply/addApply").submit();
		        	},
		        	취소: function() {
		          		$( this ).dialog( "close" );
		        	}
		      }
	    });
	});

//////////////////////    ↑  dialog        ////////////////////////////////////////////////	
	
	$( 'input[name=termsAll]').on('click', function(){
	    if (  $("input[name=termsAll]:checkbox").prop("checked")  ) {
		    $("input[name=terms]:checkbox").prop("checked", "checked");
		}else{
		    $("input[name=terms]:checkbox").prop('checked', false);
		}
	});
	
	$( "input[name=terms]:checkbox" ).on('click', function(){
		if($("input[name=terms]:checkbox:checked").length == 3){
			$("input[name=termsAll]:checkbox").prop("checked", "checked");
		}else{
			$("input[name=termsAll]:checkbox").prop("checked", false);
		}
	});
	
	$( "input[name=mateAgree]" ).on('click', function(){
		if( $('input[name=mate]').length != 1 ){
			$('#dialog-afterMateAgree').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
			$('#dialog-afterMateAgree').dialog( "open" );
			$( "input[name=mateAgree]").prop('checked', false);
		}
	});
	
	$( "input[name=currently]" ).on('click', function(){
		if( $('input[name=raise]').length != 1 ){
			$('#dialog-afterCurrently').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
			$('#dialog-afterCurrently').dialog( "open" );
			$( "input[name=currently]").prop('checked', false);
		}
	});
	
	$( "input[name=mate]" ).on('click', function(){
		if( $(this).val() == "없음" ){
			$( 'input[name=mateAgree]').attr('disabled', true);
			$( "input[name=mateAgree]").prop('checked', false);
			$( '#divMateAgree').hide('blind','slow');
		}else{
			$( 'input[name=mateAgree]').attr('disabled', false);
			if( $('#divMateAgree').length = 1 ){
				$( '#divMateAgree').remove();
			}
			var divMateAgree = "<div class=\"col-md-12\" id=\"divMateAgree\">"
	      		+"<div class=\"form-group\">"
	    		+"<label for=\"\"><strong>동거인의 동의 여부를 선택하세요.<\/strong></label><br/>"
	    		+"<div class=\"col-md-12\"><input type=\"radio\"  name=\"mateAgree\" value=\"동의\">동의<\/div>"
	    		+"<div class=\"col-md-12\"><input type=\"radio\"  name=\"mateAgree\" value=\"동의하지 않음\">동의하지 않음<\/div>"
	    		+"<\/div><\/div>";
			$( 'span[name=mateAgree]').append(divMateAgree).hide().show('blind','slow');
		}
	});
	
	$( "input[name=raise]" ).on('click', function(){
		if( $(this).val() == "없음" ){
			$( 'input[name=currently]').attr('disabled', true);
			$( "input[name=currently]").prop('checked', false);
			$( '#divCurrently').hide('blind','slow');
		}else{
			$( 'input[name=currently]').attr('disabled', false);
			if( $('#divCurrently').length = 1 ){
				$( '#divCurrently').remove();
			}
			var divCurrently = "<div class=\"col-md-12\" id=\"divCurrently\">"
			      			+"<div class=\"form-group\">"
			        		+"<label for=\"\"><strong>현재 양육여부를 선택하세요.<\/strong></label><br/>"
			        		+"<div class=\"col-md-12\"><input type=\"radio\"  name=\"currently\" value=\"양육 중\">양육 중<\/div>"
			        		+"<div class=\"col-md-12\"><input type=\"radio\"  name=\"currently\" value=\"양육하고 있지 않음\">양육하고 있지 않음<\/div>"
			       			+"<\/div><\/div>";
			$( 'span[name=currently]').append(divCurrently).hide().show('blind','slow');
		}
	});
	
//////////////////////     ↑      check box         ////////////////////////////////////////////////



	$( "input[name=plan]" ).keyup(function( ) {
		if($("input[name=plan]").val().length > 300 ){
			$("span[name=plan]").text('300자까지 입력할 수 있습니다.');
		}else{
			$("span[name=plan]").text('');
		}
	});

	$( "input[name=pay]" ).keyup(function( ) {
		if($("input[name=pay]").val().length > 300 ){
			$("span[name=pay]").text('300자까지 입력할 수 있습니다.');
		}else{
			$("span[name=pay]").text('');
		}
	});

	$( "input[name=reason]" ).keyup(function( ) {
		if($("input[name=reason]").val().length > 300 ){
			$("span[name=reason]").text('300자까지 입력할 수 있습니다.');
		}else{
			$("span[name=reason]").text('');
		}
	});

	$( "input[name=situation]" ).keyup(function( ) {
		if($("input[name=situation]").val().length > 300 ){
			$("span[name=situation]").text('300자까지 입력할 수 있습니다.');
		}else{
			$("span[name=situation]").text('');
		}
	});
	
//////////////////////       ↑  글자수체크         ////////////////////////////////////////////////

	
	// 등록버튼 누르고
	function fncAddApply(){
		
		// 약관 동의
		if( $("input:checkbox:checked").length != 4){
			$('#dialog-terms').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
			$('#dialog-terms').dialog( "open" );
			return;
		}
		// 직업체크
		if( $("input[name=job]:radio:checked").length != 1){
			$('#dialog-job').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
			$('#dialog-job').dialog( "open" );
			return;
		}
		// 거주지체크
		if( $("input[name=addr]:checked").length != 1){
			$('#dialog-addr').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
			$('#dialog-addr').dialog( "open" );
			return;
		}
		// 동거인여부체크
		if( $("input[name=mate]:checked").length != 1){
			$('#dialog-mate').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
			$('#dialog-mate').dialog( "open" );
			return;
		}else{
			// 동거인있음에 체크했는데 동의여부체크 안했을 경우
			if( $( "input[name=mate]:checked" ).val() == 1 ){
				if( $("input[name=mateAgree]:checked").length != 1){
					$('#dialog-mateAgree').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
					$('#dialog-mateAgree').dialog( "open" );
					return;
				}
			}
		}
		// 양육여부체크
		if( $("input[name=raise]:checked").length != 1){
			$('#dialog-raise').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
			$('#dialog-raise').dialog( "open" );
			return;
			  
		}else{
			// 양육경험있음에 체크했는데 현재양육여부체크 안했을 경우
			if( $( "input[name=raise]:checked" ).val() == 1 ){
				if( $("input[name=currently]:checked").length != 1){
					$('#dialog-currently').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
					$('#dialog-currently').dialog( "open" );
					return;
				}
			}
		}
		// 입력 안했을 경우 || 길이제한 넘었을 경우
		if( $("input[name=plan]").val() == '' || $("input[name=plan]").val().length > 300 ){
			$("input[name=plan]").focus();
			return;
		}
		if( $("input[name=pay]").val() == '' || $("input[name=pay]").val().length > 300 ){
			$("input[name=pay]").focus();
			 return;
		}
		if( $("input[name=reason]").val() == '' || $("input[name=reason]").val().length > 300 ){
			$("input[name=reason]").focus();
			return;
		}
		if( $("input[name=situation]").val() == '' || $("input[name=situation]").val().length > 300 ){
			$("input[name=situation]").focus();
			return;
		}

    	
    	var job = $("input[name=job]:checked").val();
    	var addr = $("input[name=addr]:checked").val();
    	var mate = $("input[name=mate]:checked").val();
    	var mateAgree = $("input[name=mateAgree]:checked").val();
    	var raise = $("input[name=raise]:checked").val();
    	var currently = $("input[name=currently]:checked").val();
    	var plan = $("input[name=plan]").val();
    	var pay = $("input[name=pay]").val();
    	var reason = $("input[name=reason]").val();
    	var situation = $("input[name=situation]").val();
    	var confirmHTML;
    	
    	
    	if( $("input[name=mate]:checked").val() == "없음" && $("input[name=raise]:checked").val() == "있음" ){
    		confirmHTML = '<strong>[직업]<\/strong> : '+job
						+'<br\/><strong>[거주지 유형]<\/strong> : '+addr
						+'<br\/><strong>[동거인 여부]<\/strong> : '+mate
						+'<br\/><strong>[양육경험]<\/strong> : '+raise
						+'<br\/><strong>[현재 양육 여부]<\/strong> : '+currently
						+'<br\/><strong>[앞으로의 계획]<\/strong> : '+plan
						+'<br\/><strong>[1년 예상비용]<\/strong> : '+pay
						+'<br\/><strong>[입양신청 이유]<\/strong> : '+reason
						+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+situation 
						+'<br\/><br\/><br\/><strong>신청 후 <u>조회, 수정, 삭제<\/u>는 불가능합니다. 신청하시겠습니까?<\/strong>';
    		
    	}else if($("input[name=mate]:checked").val() == "없음" &&  $("input[name=raise]:checked").val() == "없음"  ) {
    		confirmHTML = '<strong>[직업]<\/strong> : '+job
						+'<br\/><strong>[거주지 유형]<\/strong> : '+addr
						+'<br\/><strong>[동거인 여부]<\/strong> : '+mate
						+'<br\/><strong>[양육경험]<\/strong> : '+raise
						+'<br\/><strong>[앞으로의 계획]<\/strong> : '+plan
						+'<br\/><strong>[1년 예상비용]<\/strong> : '+pay
						+'<br\/><strong>[입양신청 이유]<\/strong> : '+reason
						+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+situation 
						+'<br\/><br\/><br\/><strong>신청 후 <u>조회, 수정, 삭제<\/u>는 불가능합니다. 신청하시겠습니까?<\/strong>';
    	}else if($("input[name=mate]:checked").val() == "있음" &&  $("input[name=raise]:checked").val() == "없음"  ) {
    		confirmHTML = '<strong>[직업]<\/strong> : '+job
						+'<br\/><strong>[거주지 유형]<\/strong> : '+addr
						+'<br\/><strong>[동거인 여부]<\/strong> : '+mate
						+'<br\/><strong>[동의 여부]<\/strong> : '+mateAgree
						+'<br\/><strong>[양육경험]<\/strong> : '+raise
						+'<br\/><strong>[앞으로의 계획]<\/strong> : '+plan
						+'<br\/><strong>[1년 예상비용]<\/strong> : '+pay
						+'<br\/><strong>[입양신청 이유]<\/strong> : '+reason
						+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+situation 
						+'<br\/><br\/><br\/><strong>신청 후 <u>조회, 수정, 삭제<\/u>는 불가능합니다. 신청하시겠습니까?<\/strong>';
    	}else{
    		confirmHTML = '<strong>[직업]<\/strong> : '+job
						+'<br\/><strong>[거주지 유형]<\/strong> : '+addr
						+'<br\/><strong>[동거인 여부]<\/strong> : '+mate
						+'<br\/><strong>[동의 여부]<\/strong> : '+mateAgree
						+'<br\/><strong>[양육경험]<\/strong> : '+raise
						+'<br\/><strong>[현재 양육 여부]<\/strong> : '+currently
						+'<br\/><strong>[앞으로의 계획]<\/strong> : '+plan
						+'<br\/><strong>[1년 예상비용]<\/strong> : '+pay
						+'<br\/><strong>[입양신청 이유]<\/strong> : '+reason
						+'<br\/><strong>[상황에 따른 대처]<\/strong> : '+situation 
						+'<br\/><br\/><br\/><strong>신청 후 <u>조회, 수정, 삭제<\/u>는 불가능합니다. 신청하시겠습니까?<\/strong>';
    	}
    	
    	if( mateAgree == '' ){
    		$("input[name=mateAgree]:checked").val('X');
    	}
    	if( currently == '' ){
    		$("input[name=currently]:checked").val('X');
    	}
    	
		$('#cfHTML').remove();
		$('#confirm').html( confirmHTML );
		$('#dialog-confirm').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
		$('#dialog-confirm').dialog( "open" );
				
	}
	
    
    $(function() {
		$( "button:contains('신청')" ).on("click" , function() {
			fncAddApply();
		});
		
		$( "a:contains('취소')" ).on("click" , function() {
			self.location = "/adopt/getAdopt?postNo=${apply.adoptNo}"
		});
	 });	
      
      
    </script>
  
  
  </body>
</html>