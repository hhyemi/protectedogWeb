<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://cdn.ckeditor.com/ckeditor5/12.3.0/classic/ckeditor.js"></script>

<!--  CSS -->
<style>
@font-face {
	font-family: ng;
	src: url(NanumGothic.eot);
	src: local(※), url(NanumGothic.woff) format(‘woff’);
}

body {
	font-family: '나눔고딕', 'NanumGothic', ng
}

body {
	padding-top: 50px;
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
function fncUpdateBoard(){
	
	var postContent = $("#editor").text();
	$("form[name=detailForm]").attr("method","POST").attr("action","/info/updateInfo").attr("enctype","multipart/form-data").submit();
	
}

$(function () {
	
	$("#reset").on("click", function(){
		$("form")[0].reset();
	});
	
	$("button.btn.btn-primary").on("click", function(){
		fncUpdateBoard();
	});
	
	
	
});

	</script>

</head>

<body>

	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<div class="container">
		<h3 class=" text-info">글 수정</h3>

		<hr>

		<div style="border: 1px solid #d7dade; padding: 3px;">

			<form class="form-horizontal" name="detailForm">

				<input type="hidden" name="postNo" value="${board.postNo}">
				<div class="row">
					<div class="col-xs-12 col-md-12">
						<input type="text" class="form-control" name="postTitle"
							id="postTitle" style="height: 50px; font-size: 20px"
							placeholder="${board.postTitle}" />
					</div>
				</div>

				<!-- 			<div class="row"> -->
				<!-- 				<div class="col-xs-4 col-md-2"> -->
				<!-- 					<strong>이미지</strong> -->
				<!-- 				</div> -->
				<!-- 			</div> -->

				<br />

				<div class="row">
					<div class="col-xs-12 col-md-12">
						<div class="body">
							<!-- 첨부 버튼 -->
							<div id="attach">
								<label class="waves-effect waves-teal btn-flat"
									for="uploadInputBox">사진첨부</label> <input id="uploadInputBox"
									style="display: none" type="file" name="filedata" multiple />
							</div>

							<!-- 미리보기 영역 -->
							<div id="preview" class="content" align="center"
								style="display: inline; min-width: 600px;"></div>

							<!-- multipart 업로드시 영역 -->
							<div id="uploadForm" style="display: none;"></div>
						</div>
					</div>
				</div>

				<hr />

				<div id="ckEditor" align="center">

					<div id="toolbar-container" align="center"
						class="col-xs-12 col-md-12"></div>
					<textarea class="col-xs-12 col-md-12" id="editor"
						name="postContent" style="text-align: left;">
						${board.postContent}
					</textarea>
				</div>
				
					            	<div class="col-md-12">
	            	<br/>
                		<label><strong>
	                		수정하실 경우 지도를 우클릭하고 마커를 다시 생성해주세요.
                		</strong></label>
               		</div>
               		
               		
               		
		            <div class="col-md-12">
		              	<div class="form-group">
		                	<div id="mapArea" style="width: wrap; height: 300px;"></div><br/>
		                  	<input type="text" class="form-control" id="route" name="route"  value="${ board.route }">
		               	</div>
	               </div>
			</form>
		</div>

		<hr />
		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-primary">수정</button>
				<a id="reset" class="btn btn-primary btn" role="button">취소</a>
			</div>
		</div>



	</div>
	
			<jsp:include page="/layout/footer.jsp"></jsp:include>
			
	<script>
	
	
	// =============================== 구글 지도 ============================================
		
          
          var poly;
         var map;
         var marker;
         var markers = [];
         var route = $('#route').val();
         var routeTest = [];
         var routeMark = [];
          var infowindowF;
          var infowindowL;
         
         //마커가 하나라도 있을때
         if (route.indexOf("#") != -1){
               var routeArray = route.split("#");
               
               for ( i=0; i<routeArray.length-1; i++){
                routeTest[i] = routeArray[i].substring( routeArray[i].indexOf("(")+1, routeArray[i].indexOf(",") )+","+ (routeArray[i].substring( routeArray[i].indexOf(",")+1, routeArray[i].indexOf(")") )).trim() ;
                routeMark[i] = "marker"+i.toString();
               }        
         }
         
         function initMap() {
              map = new google.maps.Map(document.getElementById('map'), {
                 zoom: 16,
                 center: { lat: parseFloat(routeTest[0].substring( 0, routeTest[0].indexOf(",") )   ) ,
                      lng: parseFloat(routeTest[0].substring( routeTest[0].indexOf(",")+1, routeTest[0].length )) }
            });
   
              poly = new google.maps.Polyline({
                 strokeColor: '#000000',
                 strokeOpacity: 0.5,
                 strokeWeight: 5,
                 map: map
              });
              
              var aaa = "";
              
              for ( i=0; i<routeTest.length; i++){
                
                 var path = poly.getPath();
   
                  path.push(new google.maps.LatLng(    parseFloat(routeTest[i].substring( 0, routeTest[i].indexOf(",") )),
                                          parseFloat(routeTest[i].substring( routeTest[i].indexOf(",")+1, routeTest[i].length ))));

                marker= routeMark[i];
            
                marker = new google.maps.Marker({
                    position: {lat: parseFloat(routeTest[i].substring( 0, routeTest[i].indexOf(",") )), 
                     lng: parseFloat(routeTest[i].substring( routeTest[i].indexOf(",")+1, routeTest[i].length )) },
                   title: '#' + path.getLength(),
                   map: map
                });
                
                markers.push(marker);
                
             }
   
              infowindowF = new google.maps.InfoWindow();
              infowindowL = new google.maps.InfoWindow();
              infowindowF.setContent("출발");
               infowindowF.open(map, markers[0]);
               infowindowL.setContent("도착");
               infowindowL.open(map, markers[markers.length-1]);
   
              map.addListener('click', addLatLng);
              map.addListener('rightclick', function() {
                 for (var i = markers.length-1; i >=0; i--) {
                    markers[i].setMap(null);
                    markers.splice(i, 1 );
                    poly.getPath().removeAt(i);
                    $( "#route ").val( '' );
                  }
                 });
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
  	        
//////////////////////////////////////////////////////////////////////////////////////////////////////////////	        
	  	      	

	      //  ================================ CKEditor ============================================== 
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
	
	 $(document).ready(function() {

         //============= 사진미리보기 =============
         $('#attach input[type=file]').change(function() {
            addPreview($(this)); //preview form 추가하기
        });
	 });
         
	function fncUpdateInfo(){
	         
	      //============= 다중파일업로드 AJAX =============
	    	  
	    	  var title = $("#postTitle").val();
	      
	      	  if(title.length < 1 || title == null ){
	      		  alert("제목을 입력해 주세요");
	      	  }
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
	                url : '/Images/json/imageupload/IS',
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


	      $('form').attr("method","POST").attr("action","/info/updateInfo").attr("enctype","multipart/form-data").submit();
	   }
	   
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
	                     
	                     var previewId = "";             
	                     if(imgNum==0){
	                        previewId = "start";
	                     }else{
	                        previewId = "startNo";   
	                     }
	                    //8장 이상 업로드시
	                     if(Object.keys(files).length>=8){
	                        alert("사진은 8장까지만 업로드 가능합니다.");
	                        delete files[imgNum];
	                     }else{
	               // 8장 이하 
	               
	               			document.querySelector( '#editor' ).addEventListener( 'click', () => {
                	    const editorData = editor.getData();     	           
                		} );
	               
	               		 editor.setData(editor.getData()+"<p><"+imgSelectName+" src='" + img.target.result + "' style='min-width:100%'/></p><p/>");
	          
	                     $("#preview").append(
	                                     "<div class=\"preview-box\"  id="+previewId+"  value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px' >"
	                                             + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"120px;\" height=\"120px;\"/>"
	                                             + "<a href=\"#\" value=\""
	                                             + imgNum
	                                             + "\" onclick=\"deletePreview(this)\">"
	                                             + "   삭제" + "</a>" + "</div>");

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
</script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaDu7bjQpGLN3nKnUfulB3khHE-iGQap0&callback=initMap" async defer></script>
  

</body>
</html>