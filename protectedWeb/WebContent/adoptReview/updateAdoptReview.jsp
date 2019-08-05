<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>보호할개 · 분양실종 후기</title>

<!-- jqeury CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ckEditor CDN -->
<script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script>

<!--  CSS -->
<style>
#preview img {width: 100px;height: 100px;}
#preview p {text-overflow: ellipsis;overflow: hidden;}

.preview-box {padding: 5px;border-radius: 2px;margin-bottom: 10px;}
.ck.ck-editor {min-width: 95%;}
.ck-editor__editable {text-align: left;min-height: 300px;min-width: 95%;}

label {background-color: #3e6dad;color: white;border-radius: 10px;}
</style>

<jsp:include page="/layout/toolbar.jsp"></jsp:include>
</head>

<body>
	
	<div class="hero-wrap hero-bread"
			style="padding-bottom: 60px; padding-top: 60px;">
			<div class="container">
				<div class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-9 ftco-animate text-center">
						<p>
							<span class="mr-2">Adopt Missing</span> <span>Review</span>
						</p>
						<font size="7">후기 수정</font>
					</div>
				</div>
			</div>
		</div>
	
	<br/>
	
	<div class="container">

		<div style="border: 2px solid #d7dade; padding: 3px;">

			<form class="form-horizontal" name="detailForm">

				<input type="hidden" name="postNo" value="${board.postNo}">
				<div class="row">
					<div class="col-xs-12 col-md-12">
						<input type="text" class="form-control" name="postTitle"
							id="postTitle" style="height: 50px; font-size: 20px"
							value="${board.postTitle}" />
					</div>
				</div>

				<br/>

				<div id="ckEditor" align="center">

					<div id="toolbar-container" align="center"
						class="col-xs-12 col-md-12"></div>
					<textarea class="col-xs-12 col-md-12" id="editor1"
						name="postContent" style="text-align: left;">
						${board.postContent}
					</textarea>
				</div>
				
			</form>
		</div>

		<hr />
		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-default" id="updateBtn">수정</button>
				<button id="reset" class="btn btn-default" role="button">취소</button>
			</div>
		</div>



	</div>
	
			<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!--  JavaScript  -->
	<script type="text/javascript">
	
	$( "input[name=postTitle]" ).keyup(function( ) {

		if($("input[name=postTitle]").val().length > 20 ){
			swal({
		           text: "제한 길이를 초과하였습니다.",
		           dangerMode: true,
		           buttons: {
							 catch: {
							 	text: "확인"
							 }
				   },
		     });
			$("input[name=postTitle]").val($("input[name=postTitle]").val().toString().substring(0,20));
		}
	});
	
	
	function fncUpdateBoard(){

		
		var postTitle = $("#postTitle").val();
		var postContent = CKEDITOR.instances.editor1.getData();
		console.log("postTitle : " + postTitle + "\n" +
					"postContent : " + postContent + "\n" );
// 		console.log(typeof postContent);
		
		if(postTitle.length < 1 || postTitle == ""){
			swal({
				  title: "제목을 입력하세요."
			});
			
			$("#postTitle").focus();
			return;
		} else {
			if(postContent.length < 1 || postContent == ""){
				swal({
					  title: "내용을 입력하세요."
				});
				
				$(CKEDITOR.instances.editor1).focus();
				return;
			}
			
			if(  postContent.indexOf('<img') == -1 ){
				swal({
					  title: "사진을 한 장 이상 등록하세요."
				});
				
				$(CKEDITOR.instances.editor1).focus();
				return;
			}
			
		}
		
		
		
		
		$("form[name=detailForm]").attr("method","POST").attr("action","/adoptReview/updateAdoptReview").attr("enctype","multipart/form-data").submit();
		
	}

	$(function () {
		
		$("#reset").on("click", function(){
			history.go(-1);
		});
		
		$("#updateBtn").on("click", function(){
			fncUpdateBoard();
		});

	});
	
	 //  ================================ CKEditor ============================================== 
	CKEDITOR.addCss('figure[class*=easyimage-gradient]::before { content: ""; position: absolute; top: 0; bottom: 0; left: 0; right: 0; }' +
      'figure[class*=easyimage-gradient] figcaption { position: relative; z-index: 2; }' +
      '.easyimage-gradient-1::before { background-image: linear-gradient( 135deg, rgba( 115, 110, 254, 0 ) 0%, rgba( 66, 174, 234, .72 ) 100% ); }' +
      '.easyimage-gradient-2::before { background-image: linear-gradient( 135deg, rgba( 115, 110, 254, 0 ) 0%, rgba( 228, 66, 234, .72 ) 100% ); }');

    CKEDITOR.replace('editor1', {
    	language: 'ko',
      extraPlugins: 'autogrow',
      autoGrow_minHeight: 200,
      autoGrow_maxHeight: 600,
      autoGrow_bottomSpace: 50,
      removePlugins: 'resize',
      
      extraPlugins: 'easyimage',
      removePlugins: 'image',
      removeDialogTabs: 'link:advanced',
      toolbar: [{
          name: 'document',
          items: ['Undo', 'Redo']
        },
        {
          name: 'styles',
          items: ['Format']
        },
        {
          name: 'basicstyles',
          items: ['Bold', 'Italic', 'Strike', '-', 'RemoveFormat']
        },
        {
          name: 'paragraph',
          items: ['NumberedList', 'BulletedList']
        },
        {
          name: 'links',
          items: ['Link', 'Unlink']
        },
        {
          name: 'insert',
          items: ['EasyImageUpload']
        }
      ],
      height: 630,
      cloudServices_uploadUrl: 'https://33333.cke-cs.com/easyimage/upload/',
      cloudServices_tokenUrl: 'https://33333.cke-cs.com/token/dev/ijrDsqFix838Gh3wGO3F77FSW94BwcLXprJ4APSp3XQ26xsUHTi0jcb1hoBt',
      easyimage_styles: {
        gradient1: {
          group: 'easyimage-gradients',
          attributes: {
            'class': 'easyimage-gradient-1'
          },
          label: 'Blue Gradient',
          icon: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/gradient1.png',
          iconHiDpi: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/hidpi/gradient1.png'
        },
        gradient2: {
          group: 'easyimage-gradients',
          attributes: {
            'class': 'easyimage-gradient-2'
          },
          label: 'Pink Gradient',
          icon: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/gradient2.png',
          iconHiDpi: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/hidpi/gradient2.png'
        },
        noGradient: {
          group: 'easyimage-gradients',
          attributes: {
            'class': 'easyimage-no-gradient'
          },
          label: 'No Gradient',
          icon: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/nogradient.png',
          iconHiDpi: 'https://ckeditor.com/docs/ckeditor4/4.12.1/examples/assets/easyimage/icons/hidpi/nogradient.png'
        }
      },
      easyimage_toolbar: [
        'EasyImageFull',
        'EasyImageSide',
        'EasyImageGradient1',
        'EasyImageGradient2',
        'EasyImageNoGradient',
        'EasyImageAlt'
      ]
    });


	
	     
	 $(document).ready(function() {

         //============= 사진미리보기 =============
         $('#attach input[type=file]').change(function() {
            addPreview($(this)); //preview form 추가하기
        });
	 });
 

</script>
 

</body>
</html>