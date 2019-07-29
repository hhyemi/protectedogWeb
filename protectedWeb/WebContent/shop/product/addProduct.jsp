<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
   
<head>
<title> 상품 등록</title>
   <meta charset="UTF-8">
   
   <!-- 참조 : http://getbootstrap.com/css/   참조 -->
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
   <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
.container {
	width: 1000px;
	font-size :17px;
	margin-top: 10px;

}

</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//============= "등록"  Event 연결 =============
	$(function() {

		$("#addproduct").on(
				"click",
				function() {
					
				      //============= 다중파일업로드 AJAX =============
			          $(function() {     
			            var form = $('#uploadForm')[0];
			            var formData = new FormData(form);

			            for (var index = 0; index < 100; index++) {
			                formData.append('files',files[index]);
			            }
			                
			                $.ajax({
			                type : 'POST',
			                enctype : 'multipart/form-data',
			                processData : false,
			                contentType : false,
			                cache : false,
			                timeout : 600000,
			                url : '/Images/json/imageupload/Shop',
			                dataType : 'JSON',
			                data : formData,
			                success : function(result) {
			                    if (result === -1) {
			                        alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
			                        // 이후 동작 ...
			                    } else if (result === -2) {
			                        alert('파일이 10MB를 초과하였습니다.');
			                        // 이후 동작 ...
			                    } else {
			                        alert('이미지 업로드 성공');
			                    }
			                }
			            });
			        });
					
					//Debug..
					//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
					$("form[name='addForm']").attr("method", "POST").attr(
							"action", "/product/addProduct").submit();
					//fncAddProduct();
				});
	});

	//  	$(function() {

	// 		$("#addproduct").on("click", function() {
	// 			self.location = "/shop/product/addProduct"
	// 		});

	// 	});

	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$("a[href='#' ]").on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			$("form")[0].reset();
		});
	});

	function fncAddProduct() {
		//Form 유효성 검증

		// 		var prodName=$("input[name='prodName']").val();
		// 	 	//var name = document.detailForm.prodName.value;
		// 	 	var prodDetail=$("input[name='prodDetail']").val();
		// 		//var detail = document.detailForm.prodDetail.value;
		// 		var manuDate=$("input[name='manuDate']").val();
		// 		//var manuDate = document.detailForm.manuDate.value;
		// 		var price=$("input[name='price']").val();
		// 		//var price = document.detailForm.price.value;

		// 		if(prodName == null || prodName.length<1){
		// 			alert("상품명은 반드시 입력하여야 합니다.");
		// 			return;
		// 		}

		// 		if(manuDate == null || manuDate.length<1){
		// 			alert("제조일자는 반드시 입력하셔야 합니다.");
		// 			return;
		// 		}
		// 		if(price == null || price.length<1){
		// 			alert("가격은 반드시 입력하셔야 합니다.");
		// 			return;
		// 		}
		//$("form[name='addForm']").attr("method", "POST").attr("action","/product/addProduct").submit;
	}

	//============= 달력  =============
	$(function() {
		$("input[name='manuDate']").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	<!--//////////////////////////// Sub Toolbar Start/////////////////////////////-->
	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="#">admin</a></span> <span>page</span>
					</p>
					<h1 class="mb-0 bread">PROTECTED | SHOP 상품등록</h1>
				</div>
			</div>
		</div>
	</div>
	<br><br><br/>
	<!--//////////////////////////// Sub Toolbar end/////////////////////////////-->

	<!-- ///////////////////////////body navigation tag/////////////////////////// -->
	<section class="ftco-section">
		<div class="container">
			<form class="billing-form" name="addForm">
				<div class="row justify-content-center">
					<div class="col-xl-8 ftco-animate">

						<!-- ///////////////////////////body navigation tag/////////////////////////// -->

						<!--////////////////////////// form tag Start /////////////////////////////////-->

						<h3 class="mb-4 billing-heading">상품정보를 등록해주세요</h3>
						<div class="w-100"></div>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">상품명</label> <input type="text"
										class="form-control" name="prodName" id="prodName"
										placeholder="상품명을 입력해주세요">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">상품코드</label> <input type="text"
										class="form-control" name="prodCode" id="prodCode"
										placeholder="상품코드를 입력해주세요">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="lastname">가 격</label> <input type="text"
										class="form-control" name="price" id="price"
										placeholder="가격을 입력해주세요">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">원산지</label> <input type="text"
										class="form-control" name="country" id="country"
										placeholder="원산지를 입력해주세요">
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="streetaddress">제조사</label> <input type="text"
										class="form-control" name="company" id="company"
										placeholder="제조사를 입력해주세요">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="streetaddress">제조일</label> <input type="text"
										class="form-control" name="manuDate" id="manuDate"
										placeholder="제조일자를 입력해주세요">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="towncity">할인액</label> <input type="text"
										class="form-control" name="discountPrice" id="discountPrice"
										placeholder="상품의 할인가를 입력해주세요">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="postcodezip">재고수량</label> <input type="text"
										class="form-control" name="quantity" id="quantity"
										placeholder="상품의 입고수량을 입력해주세요">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="w-100"></div>
							
						
            <!-- 첨부 버튼 -->
            &nbsp;&nbsp;&nbsp;&nbsp;<div id="attach" class="form-group">
                <span class="label label-primary " ><label class="waves-effect waves-teal btn-flat" for="uploadInputBox">사진등록</label></span>&nbsp;&nbsp;맨앞 이미지는 대표이미지입니다. (최대 8장까지 업로드 가능합니다.)
                <input id="uploadInputBox" style="display: none" type="file" value="등록" name="filedata"  />
            </div>
           <br/>
            
            <!-- 미리보기 영역 -->
            <div class="form-group">
            <div id="preview" class="col-md-3" align="center" style='display:inline; min-width:600px;'></div> 
            </div>
		    <input type="hidden" class="form-control" id="multiFile" name="multiFile" >
						
						
						<div class="col-md-6">
								<div class="form-group">
									<label for="postcodezip">상세정보</label> <input type="text"
										class="form-control" name="prodDetail" id="prodDetail"
										placeholder="상품의 상세정보를 입력해주세요">
								</div>
							</div>
						</div>
						<p align="center">
							<a class="btn btn-primary py-3 px-4" id="addproduct">등록하기</a>
							&nbsp;<a href="#" class="btn btn-primary py-3 px-4">취소하기</a>
						</p>

						<!-- ////////////////////////////form tag end //////////////////////////////-->
					</div>
				</div>
			</form>
		</div>

	</section>




	<script src="../../resources/prodmenu/js/popper.min.js"></script>
	<script src="../../resources/prodmenu/js/bootstrap.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.easing.1.3.js"></script>
	<script src="../../resources/prodmenu/js/jquery.waypoints.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.stellar.min.js"></script>
	<script src="../../resources/prodmenu/js/owl.carousel.min.js"></script>
	<script src="../../resources/prodmenu/js/jquery.magnific-popup.min.js"></script>
	<script src="../../resources/prodmenu/js/aos.js"></script>
	<script src="../../resources/prodmenu/js/jquery.animateNumber.min.js"></script>
	<!-- 	<script src="./../resources/prodmenu/js/bootstrap-datepicker.js"></script> -->
	<script src="../../resources/prodmenu/js/scrollax.min.js"></script>
	<script src="../../resources/prodmenu/js/main.js"></script>
	<!-- ////////////////////달력 /////////////////////////////-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script>
	   //============= "다중파일업로드 파일명만 저장해서 value" =============   
	   function fnAddFile(fileNameArray) {
	         $("#multiFile").val(fileNameArray)    
	   }   
	   
	   //============= "다중파일업로드"  Event 처리 및  연결 =============      

	       //임의의 file object영역
	     var files = {};
	     var previewIndex = 0;
	     var fileNameArray = new Array();
	     // image preview 기능 구현
	     // input = file object[]
	     function addPreview(input) {
	         if (input[0].files) {
	             //파일 선택이 여러개였을 시의 대응
	             for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {

	                 var file = input[0].files[fileIndex];
	                
	                 if (validation(file.name))
	                     continue;

	                var fileName = file.name + "";   
	                var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	                var fileNameExtension = fileName.toLowerCase().substring(fileNameExtensionIndex, fileName.length);       
	                
	                //append할때 동영상 이미지 구분해주기
	               var imgSelectName = "img";
	               if(fileNameExtension === 'mp4' || fileNameExtension === 'avi'){
	                  imgSelectName = "iframe";
	               }                           

	                 var reader = new FileReader();
	                 reader.onload = function(img) {
	                     //div id="preview" 내에 동적코드추가.
	                     //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
	                     
	                     var imgNum = previewIndex++;
	                     
	                    //8장 이상 업로드시
	                     if(Object.keys(files).length>=8){
	                        alert("사진은 8장까지만 업로드 가능합니다.");
	                        delete files[imgNum];
	                     }else{
	               // 8장 이하 
	                     $("#preview").append(
	                                     "<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px' >"
	                                             + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"120px;\" height=\"120px;\"/>"
	                                             + "<span href=\"#\" value=\""
	                                             + imgNum
	                                             + "\" onclick=\"deletePreview(this)\">"
	                                             + "   삭제" + "</span>" + "</div>");

	                     files[imgNum] = file;
	                     fileNameArray[imgNum]=file.name;
	                     fnAddFile(fileNameArray);
	                     }

	                 };

	                 reader.readAsDataURL(file);
	             }
	         } else
	             alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	     }

	     //============= preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제 =============
	     function deletePreview(obj) {
	         var imgNum = obj.attributes['value'].value;
	         delete files[imgNum];
	         fileNameArray.splice(imgNum,1);
	         fnAddFile(fileNameArray);
	         $("#preview .preview-box[value=" + imgNum + "]").remove();
	         //resizeHeight();
	     }

	     //============= 파일 확장자 validation 체크 =============
	     function validation(fileName) {
	         fileName = fileName + "";
	         var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
	         var fileNameExtension = fileName.toLowerCase().substring(
	                 fileNameExtensionIndex, fileName.length);
	         if (!((fileNameExtension === 'jpg')|| (fileNameExtension === 'gif') || (fileNameExtension === 'png')||(fileNameExtension === 'avi')||(fileNameExtension === 'mp4'))) {
	             alert('jpg, gif, png, avi, mp4 확장자만 업로드 가능합니다.');
	             return true;
	         } else {
	             return false;
	         }
	     }
	     

	    	 
	         $(document).ready(function() {

	             //============= 사진미리보기 =============
	             $('#attach input[type=file]').change(function() {
	                addPreview($(this)); //preview form 추가하기
	            });
	     });
	     
	
	</script>

</body>
</html>