 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>보호할개 · 후기</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
    <style type="text/css">
    	html {
	 	 scroll-behavior: smooth;
		}
		
    	#editor {
			min-height: 600px;
			max-width: 1130px;
			margin-left: 15px;
			text-align: left;
		}
		.ck.ck-editor {
			min-width: 95%;
		}
		
		.ck-editor__editable {
			text-align: left;
			min-height: 300px;
			min-width: 95%;
		}
		#preview img {
			width: 100px;
			height: 100px;
		}
		
		#preview p {
			text-overflow: ellipsis;
			overflow: hidden;
		}
		
		.preview-box {
			padding: 5px;
			border-radius: 2px;
			margin-bottom: 10px;
		}
		
		.waves-effect>span {
			background-color: #f04f23;
			border-radius: 3px;
			padding: 3px;
			color: white;
		}
    
    </style>
    <jsp:include page="/layout/toolbar.jsp"></jsp:include>
  </head>
  <body class="goto-here">
	

    <div class="hero-wrap hero-bread" style="padding-bottom: 60px; padding-top : 60px;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p ><span class="mr-2">Add</span> <span>AdoptReview</span></p>
            <font size="7">후기등록</font>
          </div>
        </div>
      </div>
    </div>
    
    

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-8 ftco-animate">
			<form  class="billing-form" name="detailForm">
	          	<div class="row align-items-end">
	          	
	          	
				<input type="hidden" name="boardCode" value="AR" >
<%-- 				<input type="hidden" name="id" value="${user.id }" > --%>
				<input type="hidden" name="delCode" value="1" >
<%-- 				<input type="hidden" name="nickName" value="${user.nickname}" > --%>
<%-- 				<input type="hidden" name="phone" value="${user.phone }" > --%>
<!-- 				<input type="hidden" class="form-control" id="multiFile" name="multiFile" > -->
				
<!-- 				<div class="col-md-12"> -->
<!-- 	          		<div class="cart-detail bg-light p-3 p-md-4"> -->
<!-- 						<div class="form-group"> -->
<!-- 							<div class="col-md-12"><p align="center"><strong>후기글을 등록하면 15일간은 삭제하실 수 없습니다.</strong></p></div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
	          	
	          	<div class="col-md-12"><br/><hr/><br/></div>
	          	
	          		<div class="col-md-12">
		                <div class="form-group">
		                	<h5><strong>글 제목</strong></h5>&nbsp;&nbsp;<span name="postTitle"></span>
		                	<input type="text" class="form-control" name="postTitle" placeholder="제목을 입력하세요.">
		                </div>
	                </div>

	                <div class="col-md-12"></div>
	                
	                
	                <div class="col-md-12"><br/>
	                <div class="row">
					<div class="col-xs-12 col-md-12">
						<div class="body">
							<!-- 첨부 버튼 -->
							<div id="attach">
								<label class="waves-effect waves-teal btn-flat"
									for="uploadInputBox"><span><strong>사진첨부</strong></span></label> <input id="uploadInputBox"
									style="display: none" type="file" name="filedata" multiple />
							</div>

							<!-- 미리보기 영역 -->
							<div id="preview" class="content"></div>

							<!-- multipart 업로드시 영역 -->
 							<div id="uploadForm" style="display: none;"></div>
						</div>
					</div>
				</div>
</div>
			
		            
		            <div class="col-md-12"><br/></div>
	
               		<div class="col-md-12">
		                <div class="form-group">
<!-- 		                	<label for="postContent"><strong>글내용</strong></label>&nbsp;&nbsp;<span name="postContent"></span> -->
<!-- 		                	<input type="text" class="form-control" name="postContent" value="dd" placeholder="내용을 입력하세요."> -->
<!-- 		                	<textarea  class="form-control"  name="postContent"  rows="10"  placeholder="내용을 입력하세요."></textarea> -->
		               
		                 <div class="postForm" align="center">
						<div id="toolbar-container" class="col-xs-12 col-md-12"></div>
						<textarea id="editor" name="postContent" style="text-align: left;"></textarea>
					</div>
		               
		                </div>
	                </div>
	                
	                
               		
               		<div class="w-100"></div>
		            <div class="w-100"></div>
                
	            </div>
	          </form>
	          
	          <!-- END -->


	          <div class="row mt-5 pt-3 d-flex">
	          	<div class="col-md-12">
					<p><button class="btn btn-default py-3 px-4 col-md-12">등록</button></p>
					
					<div class="form-group">
						<div class="col-md-12">
							<div class="radio" align="right">
								<p><a href="#" ><font color="gray">취소</font></a></p>
							</div>
						</div>
					</div>
	          	</div>
	          </div>
	          
	               
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
    
    
  
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  스크립트 시작  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!--   <script type="text/javascript" src="/resources/events.js"></script> -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/12.3.0/classic/ckeditor.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
  <script>
  
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
    	        
					var imgSelectName = "img";

					if(fileNameExtension === 'mp4' || fileNameExtension === 'avi'){
						imgSelectName = "iframe";
					}	                        
                

                var reader = new FileReader();
                reader.onload = function(img) {
                    //div id="preview" 내에 동적코드추가.
                    //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                    var imgNum = previewIndex++;
                    
                    var previewId = "";
                   
                    if(imgNum==0){
                    	previewId = "start";
                    }else{
                    	previewId = "startNo";	
                    }
                	
                	document.querySelector( '#editor' ).addEventListener( 'click', () => {
                	    const editorData = editor.getData();     	           
                	} );
                	
//                 	alert(img.target.result);
                    editor.setData(editor.getData()+"<p><"+imgSelectName+" src='" + img.target.result + "' style='min-width:100%'/></p><p/>");		
                
                    
                    $("#preview").append(
                    		"<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px' >"
                            + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"120px;\" height=\"120px;\"/><br\/>"
                            + "<span value=\""
                            + imgNum
                            + "\" onclick=\"deletePreview(this)\">"
                            + "삭제" + "</span>" + "</div> ");
                    files[imgNum] = file;
                    
                    fileNameArray[imgNum]=file.name;
                    fnAddFile(fileNameArray);
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
        $("#preview .preview-box[value=" + imgNum + "]").remove();
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
	});
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   ↑ 파일업로드      ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■


	var boardCode = $( 'input[name=boardCode]' ).val().trim();
	
// 	$( function() {
// 	    $( "#dialog-postTitle" ).dialog({
// 	    	autoOpen: false,
// 		      width: 350,
// 		      height: 180,
// 		      modal: true,
// 		      buttons: {
// 		    	  닫기: function(){
// 		    		  $( this ).dialog( "close" );
// 		    		  $("input[name=postTitle]").focus();
// // 		    		  jQuery($("input[name=postTitle]"))[0].scrollIntoView(true);
// 		    	  }
// 		      }
// 	    });
// 	});
	
	
// 	$( function() {
// 	    $( "#dialog-postContent, #dialog-postContentLength" ).dialog({
// 	    	autoOpen: false,
// 		      width: 350,
// 		      height: 180,
// 		      modal: true,
// 		      buttons: {
// 		    	  닫기: function(){
// 		    		  $( this ).dialog( "close" );
// 		    		  jQuery($("textarea[name=postContent]"))[0].scrollIntoView(true);
// 		    	  }
// 		      }
// 	    });
// 	});
	
	
// 	$( function() {
// 	    $( "#dialog-img" ).dialog({
// 	    	autoOpen: false,
// 		      width: 350,
// 		      height: 180,
// 		      modal: true,
// 		      buttons: {
// 		    	  닫기: function(){
// 		    		  $( this ).dialog( "close" );
// 		    		  jQuery($("input[name=postTitle]"))[0].scrollIntoView(true);
// 		    	  }
// 		      }
// 	    });
// 	});
	
	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■     ↑  dialog      ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■	

	$( "input[name=postTitle]" ).keyup(function( ) {
		if($("input[name=postTitle]").val().length > 15 ){
			$("span[name=postTitle]").text('15자까지 입력할 수 있습니다.');
		}else{
			$("span[name=postTitle]").text('');
		}
	});
	
	
	$( "textarea[name=postContent]" ).keyup(function( ) {
		if($("textarea[name=postContent]").text().length > 100 ){
			$("span[name=postContent]").text('100자까지 입력할 수 있습니다.');
		}else{
			$("span[name=postContent]").text('');
		}
	});

	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■      ↑  글자수체크           ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	// 등록버튼 누르고
	function fncAddAdoptReview(){

		  if( $("input[name=postTitle]").val().trim() == '' ||  $("input[name=postTitle]").val().length >15 ){
			  $("input[name=postTitle]").focus();
			  $('#dialog-postTitle').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
			  $('#dialog-postTitle').dialog( "open" );
			  return;
		  }
// 		  if( $(".preview-box").length == 0 ){
// 			  swal({
// 		           text: "이미지를 등록해주세요.",
// 		           dangerMode: true,
// 		           buttons: {
// 							 catch: {
// 							 	text: "닫기"
// 							 }
// 				   },
// 		      }).then((willDelete) => {
// 		           if (willDelete) {
// 		        	   jQuery($("input[name=postTitle]"))[0].scrollIntoView(true);
// 		           }
// 		      });
// 			  return;
// 	  	  }
// 		  if( $("textarea[name=postContent]").val().trim() == '' || $("textarea[name=postContent]").val().length > 100 ){
// 			  $('#dialog-postContent').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
// 			  $('#dialog-postContent').dialog( "open" );
// 			  return;
// 		  }
		  

		var postContent = $("#editor").text();
		$("form[name=detailForm]").attr("method" , "POST").attr("action" , "/adoptReview/addAdoptReview").attr("enctype","multipart/form-data").submit();
		
	}
	

    $(function() {
			$( "button:contains('등록')" ).on("click" , function() {
				$('textarea').val(editor.getData());
				
				if ( $('textarea').val().toString().indexOf('<img') != -1 ){
					swal({
				           text: "이미지를 등록해주세요.",
				           dangerMode: true,
				           buttons: {
									 catch: {
									 	text: "닫기"
									 }
						   },
				      }).then((willDelete) => {
				           if (willDelete) {
				        	   jQuery($("input[name=postTitle]"))[0].scrollIntoView(true);
				           }
				      });
				}
				
				fncAddAdoptReview();
			});
			
			$( "a:contains('취소')" ).on("click" , function() {
				self.location = "/adoptReview/listAdoptReview"
			});
	 });	
      
      
    </script>

  
  
  
  
  </body>
</html>