<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<title>보호할개 · 분양실종</title>
<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  bootstrap CDN  -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- CKEditor CDN -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/12.3.0/classic/ckeditor.js"></script> -->
<script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script>

<!--  CSS -->
<style>
.ck.ck-editor {	min-width: 95%;}
.ck-editor__editable {text-align: left;min-height: 300px;min-width: 95%;}
.fa-exclamation-circle{color:#f04f23}
/* label {background-color: #3e6dad;color: white;border-radius: 10px;} */
</style>

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>	
	
</head>

<body>
	
	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 상단 디자인  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<div class="container">
		<div class="hero-wrap hero-bread"
			style="padding-bottom: 60px; padding-top: 60px;">
			<div class="container">
				<div class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-9 ftco-animate text-center">
						<p>
							<span class="mr-2">Adopt Missing</span> <span>Review</span>
						</p>
						<font size="7">후기 등록</font>
					</div>
				</div>
			</div>
		</div>

		<div style="border: 1px solid #d7dade; padding: 3px;">

			<form class="form-horizontal" name="detailForm">

				<div class="row">
					<div class="col-xs-12 col-md-12">
						<input type="text" class="form-control" name="postTitle"
							id="postTitle" style="height: 50px; font-size: 20px" placeholder="제목을 입력해 주세요." maxlength="20"/>
					</div>
				</div>

				<br />

				<div class="postForm" align="center">

					<div id="toolbar-container" class="col-xs-12 col-md-12"></div>
					<textarea id="editor1" name="postContent" style="text-align: left;">
					
					</textarea>
				

				</div>
				

			</form>
		</div>

		<hr />
		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-default">등록</button>
				<button id="back" class="btn btn-default">취소</button>
			</div>
		</div>	
		
		<div class="row" style="height: 100px">
		
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
	
	
	
	function fncAddAR(){
		
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
			
			if( postContent.indexOf('<img') == -1 ){
				swal({
					  title: "사진을 한 장 이상 등록하세요."
				});
				
				$(CKEDITOR.instances.editor1).focus();
				return;
			}
			
		}
		
		

		$("form[name=detailForm]").attr("method","POST").attr("action","/adoptReview/addAdoptReview").attr("enctype","multipart/form-data").submit();
		
	}

	$(function () {
		
		$("#back").on("click", function(){
			history.go(-1);
		});
		
		$("button.btn.btn-default").on("click", function(){
			fncAddAR();
		});
		
		
		
	});



	
	let editor;

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
		        },
		        {
		        	name : 'max',
		        	items:['Maximize', 'ShowBlocks']
		        },
		        {
		        	name : 'fontSize',
		        	items:['Styles','Format','Font','FontSize']
		        },
		        {
		        	name : 'sourceView',
		        	items:['Source','-','Save','NewPage','Preview','-','Templates']
		    	},
		        {
		        	name : 'align',
		        	items:['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock']
		    	},
		      ],
		      height: 630,
		      cloudServices_uploadUrl: 'https://33333.cke-cs.com/easyimage/upload/',
		      // Note: this is a token endpoint to be used for CKEditor 4 samples only. Images uploaded using this token may be deleted automatically at any moment.
		      // To create your own token URL please visit https://ckeditor.com/ckeditor-cloud-services/.
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
	
    	
        $('#attach input[type=file]').change(function() {
            addPreview($(this)); //preview form 추가하기
        });
    }); 

</script>

</body>
</html>