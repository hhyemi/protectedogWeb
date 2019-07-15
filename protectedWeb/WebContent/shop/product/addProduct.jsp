<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	<!-- ////////////////////달력 /////////////////////////////-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//============= "등록"  Event 연결 =============
	$(function() {
		 $( "#addbutton" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
			fncAddProduct();
		});
	});	

	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		 $( "#canclebutton" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
				$("form")[0].reset();
		});
	});	

	function fncAddProduct(){
		//Form 유효성 검증
		
		var prodName=$("input[name='prodName']").val();
	 	//var name = document.detailForm.prodName.value;
	 	var price=$("input[name='price']").val();
		//var detail = document.detailForm.prodDetail.value;
		var manuDate=$("input[name='manuDate']").val();
		//var manuDate = document.detailForm.manuDate.value;
		var company=$("input[name='company']").val();
		//var price = document.detailForm.price.value;
		var country=$("input[name='country']").val();
		//var price = document.detailForm.price.value;
		var discountPrice=$("input[name='discountPrice']").val();
		//var price = document.detailForm.price.value;
		var quantity=$("input[name='quantity']").val();
		//var price = document.detailForm.price.value;
		var prodDatail=$("input[name='prodDetail']").val();
		//var price = document.detailForm.price.value;
	
		if(name == null || prodName.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(prcie == null || price.length<1){
			alert("상품가격을 입력해주세요");
			return;
		}
		if(company == null || company.length<1){
			alert("상품 제조사를 입력해주세요");
			return;
		}
		if(country == null || country.length<1){
			alert("원산지를 입력해주세요.");
			return;
		}
		if(discountPrice == null || discountPrice.length<1){
			alert("상품 할인가를 입력해주세요");
			return;
		}
		if(price == null || quantity.length<1){
			alert("상품수량을 입력해주세요");
			return;
		}
		if(price == null || prodDetail.length<1){
			alert("상품 상세정보를 입력해주세요");
			return;
		}
		
		$("form").attr("method", "POST").attr("action" , "/shop/Product/addProduct").submit();
	}
	
	$(function() {
		$( "#manuDate" ).datepicker({
				dateFormat: "yy-mm-dd"
		});
	});




</script>
</head>

<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<h2>DOG SHOP | <small>상품등록</small></h2>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label" >상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명을 반드시 입력해주세요">
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger"></strong>
		      </span>
		    </div>
		   </div>
	
		     <!--  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		     <input type="file" class="form-control" id="fileName" name="fileName" placeholder="이미지를 등록해주세요">
		    </div>
		    </div>-->
		  
		    
		    <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가 	격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="상품가격을 입력해주세요">
		    </div>
		    </div>
		    
		    <div class="form-group">
		    <label for="discountPrice" class="col-sm-offset-1 col-sm-3 control-label">할인가</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="discountPrice" name="discoutPrice" placeholder="할인액을 입력해주세요">
		    </div>
		    </div>
		    
		    
		    <div class="form-group">
		    <label for="country" class="col-sm-offset-1 col-sm-3 control-label">재고수량</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="quantity" name="quantity" placeholder="재고수량을 입력해주세요">
		    </div>
		    </div>
		    
		     <div class="form-group">
		    <label for="country" class="col-sm-offset-1 col-sm-3 control-label">원산지</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="country" name="country" placeholder="원산지를 입력해주세요">
		    </div>
		    </div>
		    
		     <div class="form-group">
		    <label for="company" class="col-sm-offset-1 col-sm-3 control-label">제조사</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="company" name="company" placeholder="제조사를 입력해주세요">
		    </div>
		    </div>
		    
		    <div class="form-group">
			<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		     		<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="상품제조일자를 입력해주세요" readonly>
			</div>
			</div>
<br>
		    
		    <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <textarea class="form-control" rows="3" placeholder="상품상세내역을 기입해주세요" id="prodDetail" name="prodDetail"></textarea>
		    </div>
		    </div>
		    
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-default btn-lg" id="addbutton">등 &nbsp;록</button>
			  <a class="btn btn-default btn-lg" href="#" role="button" id="canclebutton">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>