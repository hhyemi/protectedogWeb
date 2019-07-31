<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/12.3.0/classic/ckeditor.js"></script> -->
<script src="https://cdn.ckeditor.com/4.12.1/standard-all/ckeditor.js"></script>
<!--  CSS -->
<style>
#editor {
	min-height: 600px;
	max-width: 1130px;
	margin-left: 15px;
	text-align: left;
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

.ck.ck-editor {
	min-width: 95%;
}

.ck-editor__editable {
	text-align: left;
	min-height: 300px;
	min-width: 95%;
}

label {
	background-color: #3e6dad;
	color: white;
	border-radius: 10px;
}
</style>

<!--  JavaScript  -->
<script type="text/javascript">
function fncAddInfo(){
	
	var postTitle = $("#postTitle").val();
	var postContent = CKEDITOR.instances.editor1.getData();
	console.log("postTitle : " + postTitle + "\n" +
				"postContent : " + postContent + "\n" );
	
	if(postTitle.length < 1 && postTitle == ""){
		swal({
			  title: "제목을 입력해주세요"
		});
		
		$("#postTitle").focus();
		
		return;
	}
	
	if(postContent.length < 1 && postContent == ""){
		swal({
			  title: "내용을 입력해주세요"
		});
		
		$(CKEDITOR.instances.editor1).focus();
	}
	
	//$("form[name=detailForm]").attr("method","POST").attr("action","/info/addInformation").attr("enctype","multipart/form-data").submit();
	
}

$(function () {
	
	$("#reset").on("click", function(){
		$("form")[0].reset();
	});
	
	$("button.btn.btn-primary").on("click", function(){
		fncAddInfo();
	});
	
	
	
});

	</script>

</head>

<body>

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	
	<div class="container">
		<div class="hero-wrap hero-bread" style="padding-bottom: 20px; padding-top : 10px;">
			<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/index.jsp">정보공유</a></span>
					</p>
					<h1 class="mb-0 bread">견종백과</h1>
				</div>
			</div>
		</div>
	</div>

		<div style="border: 1px solid #d7dade; padding: 3px;">

			<form class="form-horizontal" name="detailForm">

				<div class="row">
					<div class="col-xs-12 col-md-12">
						<input type="text" class="form-control" name="postTitle"
							id="postTitle" style="height: 50px; font-size: 20px" placeholder="제목을 입력해 주세요." />
					</div>
				</div>

				<!-- 			<div class="row"> -->
				<!-- 				<div class="col-xs-4 col-md-2"> -->
				<!-- 					<strong>이미지</strong> -->
				<!-- 				</div> -->
				<!-- 			</div> -->

				<br />

<!-- 				<div class="row"> -->
<!-- 					<div class="col-xs-12 col-md-12"> -->
<!-- 						<div class="body"> -->
<!-- 							첨부 버튼 -->
<!-- 							<div id="attach"> -->
<!-- 								<label class="waves-effect waves-teal btn-flat" -->
<!-- 									for="uploadInputBox">사진첨부</label> <input id="uploadInputBox" -->
<!-- 									style="display: none" type="file" name="filedata" multiple /> -->
<!-- 							</div> -->

<!-- 							미리보기 영역 -->
<!-- 							<div id="preview" class="content"></div> -->

<!-- 							multipart 업로드시 영역 -->
<!--  							<div id="uploadForm" style="display: none;"></div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

				<div class="postForm" align="center">

					<div id="toolbar-container" class="col-xs-12 col-md-12"></div>
					<textarea id="editor1" name="postContent" style="text-align: left;">
					
					</textarea>
				

				</div>
				
				<p>
				
				<input type="checkbox" class="googleMapCheck" value="hide">지도공유
		  
		  		<div class="form-group googleMap">
		   			<div class="col-sm-4">
		    				<div id="map" style="width: 1100px; height: 600px;"></div>
		     					<input type="hidden" class="form-control" id="route" name="route" style="width: 1100px;">
		      					<span id="pop"></span>
		    		</div>
		    		<p> 경로 수정을 원하시면 마커 위에서 마우스 우클릭을 해주시길 바랍니다.</p>
		  		</div>
			</form>
		</div>

		<hr />
		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-primary">등록</button>
				<a id="reset" class="btn btn-primary btn" role="button">취소</a>
			</div>
		</div>	
		
		<div class="row" style="height: 100px">
		
		</div>
	
	</div>
	
		<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script>
	
	//============= 구글 지도 =============
  var poly;
         var map;
         var markers = [];
          var infowindowF;
          var infowindowL;

         function initMap() {
            
              map = new google.maps.Map(document.getElementById('map'), {
                 zoom: 16,
                 center: {lat: 37.564, lng:  127.0017} 
              });
   
              poly = new google.maps.Polyline({
                 strokeColor: '#000000',
                 strokeOpacity: 0.5,
                 strokeWeight: 5,
                 map: map
              });
              
              infowindowF = new google.maps.InfoWindow();
              infowindowL = new google.maps.InfoWindow();
              
              map.addListener('click', addLatLng);
         }

         
         function addLatLng(event) {
            
              if (markers.length <5){
                  
                 var path = poly.getPath();
                  path.push(event.latLng);
                  
                   var marker = new google.maps.Marker({
                    position: event.latLng,
                    title: '#' + path.getLength(),
                    map: map
                   });
                   markers.push(marker);
                   
                 $( "#route ").val(  $( "#route ").val()+ event.latLng.toString()+"#"  );
                 
                 // pop up
                 infowindowF.setContent("출발");
                  infowindowF.open(map, markers[0]);
                  
                  if(markers.length > 1){
                    infowindowL.setContent("도착");
                     infowindowL.open(map, marker);
                     
//                      if(infowindowL.getPosition() != undefined){
//                        infowindowL.setContent("도착");
//                         infowindowL.open(map, marker);
//                      }
                  }
                 
              }else{
                 alert("5개까지 지정 가능함 dialog 추가");
             }
              
             
              if (marker != undefined){
                 
                  marker.addListener('rightclick', function() {
                     
                  for (var i = 0; i < markers.length; i++) {
                      if (markers[i] === marker) {
                        markers[i].setMap(null);
                        markers.splice(i, 1);
            
                        poly.getPath().removeAt(i);
                      }
                  }
                  
                  var test = "";
                  
                   for (var i = 0; i < markers.length; i++) {
                      test += markers[i].position+"#";
                      
                      //pop up
                       infowindowF.setContent("출발");
                        infowindowF.open(map, markers[0]);
                        
                        infowindowL.setContent("도착");
                        infowindowL.open(map, markers[markers.length-1]);
                   }
                   
                   $( "#route ").val(  test  );
                   
                  });
              }
         }
	
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
	
    	$(".googleMap").hide();
    	
    	$(".googleMapCheck").on("click",function(){
    		
    		if( $(this).val() == 'hide' ) {
    			$(".googleMap").show('slow');
    			$(this).val("show");
    			return;
    		}
    		
    		if( $(this).val() == "show") {
    			$(".googleMap").hide('slow');
    			$(this).val("hide");
    			return;
    		}
    	});
        $('#attach input[type=file]').change(function() {
            addPreview($(this)); //preview form 추가하기
        });
    }); 

</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap"></script>

</body>
</html>