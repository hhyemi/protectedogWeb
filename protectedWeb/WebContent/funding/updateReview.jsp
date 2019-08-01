<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		    <title>보호할개 · 후원신청</title>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	    <link rel="stylesheet" href="/resources/get/css/bootstrap.css" />
	
	<!-- ckeditor 사용 CSS-->
	<script
		src="https://cdn.ckeditor.com/ckeditor5/12.3.0/classic/ckeditor.js"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

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
		.ck.ck-editor {
			max-width: 700px;
		}
		
		.ck-editor__editable {
			text-align: left;
			min-height: 300px;
			max-width: 700px;
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
	          	<p ><span class="mr-2">support</span> <span>review</span></p>
	            <font size="7">후원후기수정</font><br/> 후기를 <strong style="color: #f04f23">상세하게</strong>작성해주세요.
	          </div>
	        </div>
	      </div>
	    </div>
		<br/><p/>		
	

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
			      <br/>
             	  <!--  table End /////////////////////////////////////--> 			
		<!-- form Start /////////////////////////////////////-->
		<form id ="uploadForm" class="form-horizontal">
		
		  <div class="form-group">
			<h4 class=>후기제목</h4><p/>		
		    <div class=>
		      <input type="text" class="form-control" value="${funding.reviewTitle}" id="reviewTitle" name="reviewTitle" placeholder="제목을 입력해주세요." style="width:700px; height:35px;">		
		    </div>
		  </div>
		  <br/>
		  <div class="form-group">
			<h4 class=>후기내용</h4><p/>		
			    <div>
			    	<textarea id="editor" name="reviewContent" style="text-align: left;" placeholder="내용을 입력해주세요." >
					  ${funding.reviewContent}
					</textarea>
			    
			    </div>
			  </div>
			<br/>
            <!-- 첨부 버튼 -->
            <div id="attach" class="form-group">
                <span class="label label-primary " ><label class="waves-effect waves-teal btn-flat" for="uploadInputBox"style="background-color: #f6957b; padding: 3px; border-radius: 3px; color: #ffffff">사진등록</label></span>&nbsp;&nbsp;맨앞 이미지는 대표이미지입니다. (최대 <b>10장</b>까지 업로드 가능합니다.)
                <input id="uploadInputBox" style="display: none" type="file" value="등록" name="filedata"  />
            </div>
           <br/>
            
            <!-- 미리보기 영역 -->
            <div class="form-group">
       		<div class="row">
            <div id="preview" class="col-md-12" align="center" style='display:inline; min-width:100px;'>

				<c:forEach var="name" items="${file}" varStatus="status">            
				<div class="preview-box2" value="${name.fileName}"  style='display:inline;float:left;width:140px' >
                     <img class="thumbnail" src="/resources/file/fileSF/${name.fileName}"  width="120px;" height="120px;"/>
                            <span href="#" value="${name.fileName}"  onclick="deletePreview2(this)"><br/><font color="#f04f23"> 삭제</font></span></div>     
                </c:forEach>           
       		</div>
            </div></div>
            
		    <input type="hidden" name="postNo" value="${funding.postNo }" />		    	
		    <input type="hidden" id="multiFile" name="multiFile" />
		    <input type="hidden" id="deleteFile" name="deleteFile" />		
		  <br/><br/>
		  <div class="form-group text-center">
	  			<button type="button" id="btn-update" class="btn btn-default">수정</button>
	  			<button type="button" id="btn-cancel" class="btn btn-default">취소</button>
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

   //============= 수정버튼 눌렀을때 함수 =============      
   function fncUpdateReview(){
      
      //Form 유효성 검증
 	  $('textarea').val(editor.getData());
      var reviewTitle = $('input[name="reviewTitle"]').val();
      var reviewContent = $('textarea').val()
      
      if(reviewTitle == null || reviewTitle.length<1){
         alert("글제목은 반드시 입력하여야 합니다.");
         $('input[name="reviewTitle"]').focus();
         return;
      }
      if(reviewContent == ''){
    	  swal("글내용을 입력해주세요.", " ");
	         $(".ck-editor__editable").focus();
	         return;
	      }
      
      swal({
          title: "수정하시겠습니까?",
          icon: "warning",
          buttons: true,
          dangerMode: true,
        })
        .then((willDelete) => {
          if (willDelete) {   
              swal("수정이 완료되었습니다!", {
	                icon: "success",
	              }).then((value) => {     
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
                url : '/Images/json/imageupload/SF',
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


      $('form').attr("method","POST").attr("action","/funding/updateReview").attr("enctype","multipart/form-data").submit();
	              });
          }
       
     });
}

   //============= "Editor" =============   
	let editor;

	ClassicEditor
	    .create( document.querySelector( '#editor' ),{
	    
      	toolbar : [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ],
      	heading: {
              options: [
                  { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                  { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                  { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' }
              ]
          }
	    	
	    })
	    .then( newEditor => {
	        editor = newEditor;
	    } )
	    .catch( error => {
	        console.error( error );
	    } );
	
   //============= "다중파일업로드 파일명만 저장해서 insert할 value" =============   
   function fnAddFile(fileNameArray) {
         $("#multiFile").val(fileNameArray)    
   }   

   //============= "다중파일업로드 파일명만 저장해서 delete할 value" =============   
   function fnDeleteFile(deletefileNameArray) {
         $("#deleteFile").val(deletefileNameArray)    
   }   
   
   
   //============= "다중파일업로드"  Event 처리 및  연결 =============      

       //임의의 file object영역
     var files = {};
     var previewIndex = 0;
     var fileNameArray = new Array();
     //원래있던사진 삭제할 array
     var deletefileNameArray = new Array();
     
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
         resizeHeight();
     }
     //=============원래있던사진들 삭제버튼누를때 =============
     function deletePreview2(obj) {
         var imgName = obj.attributes['value'].value;
         deletefileNameArray.push(imgName);
         fnDeleteFile(deletefileNameArray);
         $("#preview .preview-box2[value=\"" + imgName + "\"]").remove();
         resizeHeight();
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

          
           //============= 글제목 길이 입력 검증 =============
             $('#postTitle').keyup(function(){
            	 var byteText = $(this).val();
              	 var byteNum = 0;
            	 
                  for(var i = 0; i < byteText.length ; i++) {
                     byteNum += ( byteText.charCodeAt(i) > 127 ) ? 2 : 1;
                  }
                  if(byteNum > 30) {              	 
                      alert('제한길이 초과');
                      $(this).val($(this).val().substr(0, $(this).attr('maxlength')));
                  }
             });

             
     }); 
   
   $(function() {
      
         //============= 수정 Event  처리 =============   
         $( "#btn-update" ).on("click" , function() {
        	 fncUpdateReview();
            });
         
         //============= 취소 Event  처리 =============
          $( "#btn-cancel" ).on("click" , function() {
               history.go(-1);
            });
            
   });   
               
   
   </script>
   
      
</body>

</html>