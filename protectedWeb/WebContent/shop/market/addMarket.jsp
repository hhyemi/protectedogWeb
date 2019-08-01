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
   <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	    <title>보호할개 · 후원신청</title>
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
    <link rel="stylesheet" href="/resources/get/css/bootstrap.css" />


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
			                url : '/Images/json/imageupload/MK',
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
							"action", "/market/addMarket").attr("enctype","multipart/form-data").submit();
					fncAddProduct();
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

		 		var prodName=$("input[name='prodName']").val();
		 	 	//var name = document.detailForm.prodName.value;
		 	 	var price=$("input[name='price']").val();
		 		//var detail = document.detailForm.prodDetail.value;
		 		var city=$("input[name='city']").val();
		 		//var manuDate = document.detailForm.manuDate.value;
		 		var postTitle=$("input[name='postTitle']").val();
		 		//var price = document.detailForm.price.value;
		 		var postContent=$("input[name='postContent']").val();
		 		//var price = document.detailForm.price.value;

		 		if(prodName == null || prodName.length<1){
		 			alert("상품명은 반드시 입력하여야 합니다.");
		 			return;
		 		}

		 		if(price == null || price.length<1){
		 			alert("판매가격은 반드시 입력하셔야 합니다..");
		 			return;
		 		}
		 		if(city == null || price.length<1){
		 			alert("판매자 거주지는 필수 입력사항입니다.");
		 			return;
				}
		 		if(postTitle == null || manuDate.length<1){
		 			alert("글 제목을 입력해주세요");
		 			return;
		 		}
		 		if(postContent == null || manuDate.length<1){
		 			alert("글 내용을 입력해주세요");
		 			return;
		 		}
	}

// 		//$("form[name='addForm']").attr("method", "POST").attr("action","/product/addProduct").submit;
// 	}

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
	<body class="goto-here">
    <div class="hero-wrap hero-bread" style="padding-bottom: 30px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2"><a href="index.html">protected</a></span> <span>Market</span></p>
            <font size="7">보호마켓 상품등록</font>
          </div>
        </div>
      </div>
    </div>
	<br/><p/>
	<!--//////////////////////////// Sub Toolbar end/////////////////////////////-->

	<!-- ///////////////////////////body navigation tag/////////////////////////// -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-8 ftco-animate">

					<!-- ///////////////////////////body navigation tag/////////////////////////// -->

					<!--////////////////////////// form tag Start /////////////////////////////////-->
					<form class="billing-form" name="addForm">
						<h3 class="mb-4 billing-heading">
						등록정보를 입력해주세요</h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">판매자</label> <input type="text"
										class="form-control" name="id" id="id"
										placeholder="" value="${sessionScope.user.id }" readonly>
								</div>
							</div>

<!-- 							<div class="col-md-6"> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label for="firstname">연락처</label> <input type="text" -->
<!-- 										class="form-control" name="phone" id="phone" -->
<!-- 										placeholder="상품명을 입력해주세요" value="테스트"> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">상품명</label> <input type="text"
										class="form-control" name="prodName" id="prodName"
										placeholder="상품명을 입력해주세요" value="테스트">
								</div>
							</div>
							<br/>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">판매가격</label> <input type="text"
										class="form-control" name="price" id="price"
										placeholder="판매가격을 입력해주세요">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">판매자 거주지</label> <input type="text"
										class="form-control" name="city" id="city"
										placeholder="ex)서울시 강남구">
								</div>
							</div>
							
							
							   <!-- 첨부 버튼 -->
            <div id="attach" class="form-group">
                <span class="label label-primary " ><label class="waves-effect waves-teal btn-flat" for="uploadInputBox">사진등록</label></span>&nbsp;&nbsp;맨앞 이미지는 대표이미지입니다. (최대 8장까지 업로드 가능합니다.)
                <input id="uploadInputBox" style="display: none" type="file" value="등록" name="filedata"  />
            </div>
           <br/>
            
            <!-- 미리보기 영역 -->
            <div class="form-group">
            <div id="preview" class="col-md-3" align="center" style='display:inline; min-width:600px;'></div> 
            </div>
		    <input type="hidden" class="form-control" id="multiFile" name="multiFile" >
		    
		    <hr />
							<div class="col-md-12">
								<div class="form-group">
									<label for="firstname"></label> <input type="text"
										class="form-control" name="postTitle" id="postTitle"
										placeholder="제목을 입력해주세요">
								</div>								
								<div class="col-md-13">
									<div class="form-group">
										<label for="streetaddress"></label>
										<textarea class="form-control" rows="11" name="postContent"
											placeholder="내용을 입력해주세요"></textarea>
									</div>
								</div>
							</div>
							</div>
							<div class="w-100"></div>
						
						<p align="center">
							<button class="btn btn-default" id="addproduct">등록하기</button>
							&nbsp;<button class="btn btn-default" id="addproduct">취소하기</button>
						</p>
						
						
					</form>
					<!-- ////////////////////////////form tag end //////////////////////////////-->
				</div>
			</div>
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