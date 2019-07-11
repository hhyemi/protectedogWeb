<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>

<title>분양 | 실종 글 올리기</title>


<style>
#preview img {
    width: 100px;
    height: 100px;
}
#preview p {
    text-overflow: ellipsis;
    overflow: hidden;
}
/* .preview-box { */
/*     border: 1px solid; */
/*     padding: 5px; */
/*     border-radius: 2px; */
/*     margin-bottom: 10px; */
/* } */

</style>

	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	 


</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
<%-- 	<jsp:include page="/layout/toolbar.jsp" /> --%>
   	<!-- ToolBar End /////////////////////////////////////-->


	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 >실종 등록</h1>
		<br/>
		<!-- 첨부 버튼 -->
            <div id="attach">
                <label class="waves-effect waves-teal btn-flat" for="uploadInputBox">사진첨부</label>
                <input id="uploadInputBox" style="display: none" type="file" name="filedata"/>
<!--                 <input id="uploadInputBox" style="display: none" type="file" name="filedata" multiple /> -->
            </div>
            
            <!-- 미리보기 영역 -->
            <div id="preview" class="content" style='display:inline;min-width:1200px;'></div>
            
            
            <!-- multipart 업로드시 영역 -->
<!--             <form id="uploadForm" style="display: none;" ></form> -->
		
		<!-- form Start /////////////////////////////////////-->

<form class="form-horizontal">




      
            

<br/>
<br/>
<br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    
<input type="hidden" name="id" value="user03">
<input type="hidden" name="boardCode" value="${ param.boardCode }">
		
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">글제목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="postTitle" name="postTitle" placeholder="글제목"  >
		       <span id="idTest" > </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">글내용</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="postContent" name="postContent" placeholder="글내용">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" value="01121234567" placeholder="연락처" >
		     <span id="pwdTest" > </span>
		    </div>
		  </div>
		  
		  <c:if test=" ${param.boardCode eq 'AD'} ">
			<div class="form-group">
			    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">분양가능지역${param.boardCode.trim()}</label>
			    <div class="col-sm-4">
		    	 	<input type="text" class="form-control" id="adoptArea" name="adoptArea" placeholder="분양가능지역">
		   	 	</div>
		 	</div>
		 </c:if>
		  
		  
		  <div class="form-group">
		    <label for="prodQuantity" class="col-sm-offset-1 col-sm-3 control-label">
		     <c:if test=" ${param.boardCode.trim() eq 'AD'} ">발견위치</c:if>
		     <c:if test=" ${param.boardCode.trim() eq 'MS'} ">실종위치</c:if>
		    </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="location" name="location" placeholder="위치">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">견종</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogBreed" name="dogBreed" placeholder="견종">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">무게</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogWeight" name="dogWeight" placeholder="무게">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">크기</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogSize" name="dogSize" placeholder="크기">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">성별</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogGender" name="dogGender" placeholder="성별">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">
		     <c:if test=" ${param.boardCode eq 'AD'} ">책임비</c:if>
		     <c:if test=" ${param.boardCode eq 'MS'} ">사례비</c:if>
		    </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogPay" name="dogPay" placeholder="비용">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">개상태</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogStatus" name="dogStatus" placeholder="개상태">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">외모특징</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogChar" name="dogChar" placeholder="외모특징">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">개성격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogPersonality" name="dogPersonality" placeholder="개성격">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">
		     <c:if test=" ${param.boardCode eq 'AD'} ">발견일자</c:if>
		     <c:if test=" ${param.boardCode eq 'MS'} ">실종일자</c:if>
		    </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dogDate" name="dogDate" placeholder="일자">
		    </div>
		  </div>


		  <input type="hidden" value="dd">

		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등록</button>
<!-- 		      <button type="button" class="btn btn-default"  >취소</button> -->
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->




<!-- 	<script type="text/javascript" src="/resources/events.js"></script> -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script> -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css">
	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <script>
    
    
//     $(function() {
// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 		$( "button:contain('등록')" ).on("click" , function() {
// 			fncAddAdopt();
// 		});
// 	});

// function fncAddAdopt(){
	//Form 유효성 검증
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;
	
// 	var name=$("input[name='prodName']").val();
// 	var detail=$("input[name='prodDetail']").val();
// 	var manuDate=$("input[name='manuDate']").val();
// 	var price=$("input[name='price']").val();
// 	var prodQuantity=$("input[name='prodQuantity']").val();

// 	if(name == null || name.length<1){
// 		alert("상품명은 반드시 입력하여야 합니다.");
// 		return;
// 	}
// 	if(detail == null || detail.length<1){
// 		alert("상품상세정보는 반드시 입력하여야 합니다.");
// 		return;
// 	}
// 	if(manuDate == null || manuDate.length<1){
// 		alert("제조일자는 반드시 입력하셔야 합니다.");
// 		return;
// 	}
// 	if(price == null || price.length<1){
// 		alert("가격은 반드시 입력하셔야 합니다.");
// 		return;
// 	}
// 	if(prodQuantity == null || prodQuantity.length<1){
// 		alert("수량은 반드시 입력하셔야 합니다.");
// 		return;
// 	}
// 	if(prodQuantity <= 0){
// 		alert("수량은 1개 이상 입력해주세요.");
// 		return;
// 	}

// 	$("form").attr("method" , "POST").attr("action" , "/adopt/addAdopt").attr("enctype","multipart/form-data").submit();
// }





	
	$( "button:contains('등록')" ).on("click" , function() {
// 		$("form").attr("method" , "POST").attr("action" , "/adopt/addAdopt").attr("enctype","multipart/form-data").submit();
		$("form").attr("method" , "POST").attr("action" , "/adopt/addAdopt").submit();

// 		$(self.location).attr("method" , "POST").attr("action","/adopt/addAdopt").submit();
// 		 fncAddProduct();
	});

	

	

// $(function() {		
// 	$( "#dogDate" ).datepicker({
// 		dateFormat: 'yy-mm-dd',
//         prevText: '이전 달',
//         nextText: '다음 달',
//         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
//         monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
//         dayNames: ['일', '월', '화', '수', '목', '금', '토'],
//         dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
//         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
//         showMonthAfterYear: true,
//         yearSuffix: '년'

// 	});
// }); 

        //임의의 file object영역
        var files = {};
        var previewIndex = 0;
 
        // image preview 기능 구현
        // input = file object[]
        function addPreview(input) {
            if (input[0].files) {
                //파일 선택이 여러개였을 시의 대응
                for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                    var file = input[0].files[fileIndex];
 
                    if (validation(file.name))
                        continue;
 
                    var reader = new FileReader();
                    reader.onload = function(img) {
                        //div id="preview" 내에 동적코드추가.
                        //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                        var imgNum = previewIndex++;
//                         alert(img.target.result);
                       
                        var b64 = img.target.result;
                        
                            

                           
                        
                        
                        
                        
                        $("#preview")
                                .append(
                                        "<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:200px' >"
                                                + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
                                                + "<p>"
                                                + file.name
                                                + "</p><span id=\"test\"></span>"
                                                + "<a href=\"#\" value=\""
                                                + imgNum
                                                + "\" onclick=\"deletePreview(this)\">"
                                                + "삭제" + "</a>" + "</div> ");
                        
                        
                        b64 = b64.replace('data:image/jpeg;base64,', ''); // remove content type
                        request = {
                          "requests":[
                            {
                              "image":{ "content": b64 },
                              "features":[
                                {
                                  // if you want to detect more faces, or detect something else, change this
                                  "type":"WEB_DETECTION",
                                  "maxResults":1
                                }
                              ]
                            }
                          ]
                        };
                        
                        $.ajax({
                          method: 'POST',
                          url: 'https://vision.googleapis.com/v1/images:annotate?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0',
                          contentType: 'application/json',
                          data: JSON.stringify(request),
                          processData: false,
                          success: function(data){
//                           	console.log("확인 : "+data);
//                           	console.log("확인111 : "+JSON.stringify(data));
                          	
                          	var test = data.responses[0].webDetection.bestGuessLabels[0];
                          	console.log("확인1111111 : "+test.label);
//                             output = data;
//                             var faceData = data.responses[0].faceAnnotations[0];
//                             console.log('joy: ' + faceData.joyLikelihood);
//                             console.log('sorrow: ' + faceData.sorrowLikelihood);
//                             console.log('anger: ' + faceData.angerLikelihood);
//                             console.log('surprise: ' + faceData.surpriseLikelihood);
                       		$( "#dogBreed" ).val(test.label);
//                        		$( "#test" ).html(test.label.replace(/ /gi, "") );
                          },
                          error: function (data, textStatus, errorThrown) {
                            console.log('error: ' + data);
                          }
                        })

                        files[imgNum] = file;
                    };
                    reader.readAsDataURL(file);
                }
                

  
            } else
                alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
        }
 
        //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
        function deletePreview(obj) {
            var imgNum = obj.attributes['value'].value;
            delete files[imgNum];
            $("#preview .preview-box[value=" + imgNum + "]").remove();
            resizeHeight();
        }
 
        //client-side validation
        //always server-side validation required
        function validation(fileName) {
            fileName = fileName + "";
            var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
            var fileNameExtension = fileName.toLowerCase().substring(
                    fileNameExtensionIndex, fileName.length);
            if (!((fileNameExtension === 'jpg')
                    || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
                alert('jpg, gif, png 확장자만 업로드 가능합니다.');
                return true;
            } else {
                return false;
            }
        }
 
        $(document).ready(function() {
            //submit 등록. 실제로 submit type은 아니다.
//             $('.submit a').on('click',function() {                        
//                 var form = $('#uploadForm')[0];
//                 var formData = new FormData(form);
    
//                 for (var index = 0; index < Object.keys(files).length; index++) {
//                     //formData 공간에 files라는 이름으로 파일을 추가한다.
//                     //동일명으로 계속 추가할 수 있다.
//                     formData.append('files',files[index]);
//                 }
 
                //ajax 통신으로 multipart form을 전송한다.
//                 $.ajax({
//                     type : 'POST',
//                     enctype : 'multipart/form-data',
//                     processData : false,
//                     contentType : false,
//                     cache : false,
//                     timeout : 600000,
//                     url : '/imageupload',
//                     dataType : 'JSON',
//                     data : formData,
//                     success : function(result) {
//                         //이 부분을 수정해서 다양한 행동을 할 수 있으며,
//                         //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
//                         //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
//                         if (result === -1) {
//                             alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
//                             // 이후 동작 ...
//                         } else if (result === -2) {
//                             alert('파일이 10MB를 초과하였습니다.');
//                             // 이후 동작 ...
//                         } else {
//                             alert('이미지 업로드 성공');
//                             // 이후 동작 ...
//                         }
//                     }
//                     //전송실패에대한 핸들링은 고려하지 않음
//                 });
//             });
            // <input type=file> 태그 기능 구현
            $('#attach input[type=file]').change(function() {
                addPreview($(this)); //preview form 추가하기
            });
        });
    </script>


</body>
</html>