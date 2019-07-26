<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>보호할개 · 동물병원</title>
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ckeditor 사용 CSS-->
<script
	src="https://cdn.ckeditor.com/ckeditor5/12.3.0/classic/ckeditor.js"></script>
<style>
		.starR {
			background:
				url('http://miuu227.godohosting.com/images/icon/ico_review.png')
				no-repeat right 0;
			background-size: auto 100%;
			width: 20px;
			height: 20px;
			display: inline-block;
			text-indent: -9999px;
			cursor: pointer;
		}
		
		.starR.on {
			background-position: 0 0;
		}
		
		.ck.ck-editor {
			min-width: 740px;
		}
		
		.ck-editor__editable {
			text-align: left;
			min-height: 200px;
			min-width: 740px;
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

	<div class="container">
		<form id="uploadForm" class="form-horizontal">
			<div class="hero-wrap hero-bread"
				style="padding-bottom: 0px; padding-top: 10px;">
				<div class="container">
					<div
						class="row no-gutters slider-text align-items-center justify-content-center">
						<div class="col-md-9 ftco-animate text-center">
							<p class="breadcrumbs">
								<span class="mr-2"><a href="/index.jsp">Animal
										Hospital</a></span>
							</p>
							<h1 class="mb-0 bread">동물병원</h1>
						</div>
					</div>
				</div>
			</div>
			<br />
			<p />
			<div id="map" style="width: 100%; height: 350px;"></div>
			<br /> <font size="6" color="#252236">${placeList.placeName}</font> <br />
			<p/><hr/>
			<h1>도로명주소</h1>
			${placeList.placeAddr } <br />
			<br />
			<h1>지번주소</h1>
			${placeList.placeJIAddr } <br />
			<br />
			<h1>연락처</h1>
			<font size="4" color="#d65a5a">${placeList.placeTel}</font> <br />
			<p/><hr/>
			<h1>동물병원후기</h1>
			<p />
			사용자 후기 [ ${resultPage.totalCount}건 ] &ensp;

			<!-- Button trigger modal -->
				<c:if test="${user == null }">
				<button type="button" class="btn btn-primary" id="nonMember">후기등록</button>
				</c:if>
				<c:if test="${user != null }">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">후기등록</button>
				</c:if>
				<p/>
				<p>후기 평균 평점 :&ensp; 
					  <span class="evgStarR" >☆</span>
					  <span class="evgStarR" >☆</span>
					  <span class="evgStarR">☆</span>
					  <span class="evgStarR">☆</span>
					  <span class="evgStarR">☆</span>			
				</p>

				<div id="ListDiv" >
				  <c:forEach var="review" items="${list}">
				  <div style="background-color: #f0f0f0; padding-left:20px"   >
				  			<hr/>
							  <h3>${review.postTitle}</h3>
							  <b>${review.nickname }</b>
							  
							  &emsp;${review.regDate }
							&emsp;
							<c:if test="${review.grade eq 1 }">
									<strong class="text-danger">★☆☆☆☆</strong> <strong>1</strong>
							</c:if>
							<c:if test="${review.grade eq 2}">
									<strong class="text-danger">★★☆☆☆</strong> <strong>2</strong>
							</c:if>
							<c:if test="${review.grade eq 3 }">
									<strong class="text-danger">★★★☆☆</strong> <strong>3</strong>
							</c:if>
							<c:if test="${review.grade eq 4}">
									<strong class="text-danger">★★★★☆</strong> <strong>4</strong>
							</c:if>
							<c:if test="${review.grade eq 5}">
									<strong class="text-danger">★★★★★</strong> <strong>5</strong>
							</c:if>	
							${review.postContent }
							더보기<i class="glyphicon glyphicon-menu-down"></i>
			        
			          </div></c:forEach>
          					
				</div>				
				<hr/>	
				<!-- Modal -->
				<div class="modal fade bs-example-modal-lg" id= "myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
				    <div class="modal-content ">
				      <div class="modal-header">
				        <h4 class="modal-title" id="myModalLabel" style="padding-left:20px">동물병원 후기</h4>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				      </div>
				      <div class="modal-body">
							<div class="starRev" style="padding-left:20px">
							  <span class="starR" >1</span>
							  <span class="starR" >2</span>
							  <span class="starR">3</span>
							  <span class="starR">4</span>
							  <span class="starR">5</span>
							  <font size="4" color="#000000" id = "starText">0/5 평가해주세요</font>
						   </div>
						<p/>				      
						  <div class="row" style="padding-left:35px">
							 <input type="text" id="postTitle" name="postTitle"  placeholder="후기제목을 작성해주세요." style="width:740px; height:35px;">		
						  </div>
						  <p/>					      
						  <div class="row" style="padding-left:35px">
							 <textarea id="postContent" name="postContent" style="text-align: left;"  placeholder="후기내용을 작성해주세요." ></textarea>
					      </div>	
							<p/>
			            <!-- 첨부 버튼 -->
			            <div id="attach" class="form-group" style="padding-left:35px">
			                <span class="label label-primary " ><label class="waves-effect waves-teal btn-flat" for="uploadInputBox">사진등록</label></span>&nbsp;&nbsp;최대 3장까지 업로드 가능합니다.
			                <input id="uploadInputBox" style="display: none" type="file" value="등록" name="filedata"  />
			            </div>
			           <br/>

			            <!-- 미리보기 영역 -->
			            <div class="form-group" style="padding-left:35px">
			            <div id="preview" class="col-md-3" align="center" style='display:inline; min-width:600px;'></div> 
			            </div>
				   
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-primary" id="btn-add"> 등록</button>
				  </div>
				</div>
				
	   
	     <br/>
	   </div></div>
		 <input type="hidden" id="hospitalName"  name="hospitalName" value="${placeList.placeName}" />	
		 <input type="hidden" id="grade" name="grade"  />	
		 <input type="hidden" class="form-control" id="multiFile" name="multiFile" >
		 
		</form>
		<p/>
	</div>

	<br />
	<br />

	<!--================ start footer Area  =================-->
	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!-- footer End /////////////////////////////////////-->
	<!--================ End footer Area  =================-->
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=153d14a106a978cdc7a42f3f236934a6&libraries=services"></script>
	<script>
	
	   //============= 등록버튼 눌렀을때 함수 =============      
	   function fncAddReview(){
	      
	      //Form 유효성 검증
		  $('textarea').val(editor.getData());
	      var grade = $("#grade").val();	  
	      var postTitle = $("input[name=postTitle]").val();
	      var postContent = $('textarea').val()
		
	      if(grade == ''){
	         alert("평가점수는 반드시 입력하여야 합니다.");
	         return;
	      }	      
	      if(postTitle == null || postTitle.length<1){
	          alert("후기제목은 반드시 입력하셔야 합니다.");
	          $('input[name="postTitle"]').focus();
	          return;
	       }
	      if(postContent == ''){
	         alert("후기내용은 반드시 입력하여야 합니다.");
	         $("textarea[name=postContent]").focus();
	         return;
	      }
      
	      //============= 다중파일업로드 AJAX =============
          $(function() {     
            var form = $('#uploadForm')[0];
            var formData = new FormData(form);

            for (var index = 0; index < 100; index++) {
                formData.append('files',files[index]);
            }
                //////////////파일저장///////////////
                $.ajax({
                type : 'POST',
                enctype : 'multipart/form-data',
                processData : false,
                contentType : false,
                cache : false,
                timeout : 600000,
                url : '/Images/json/imageupload/HP',
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
                

                //////////////리뷰등록///////////////          
	   		        $.ajax({
	   		        	url : "/review/json/addHospitalReview/",
	   		            method :  "POST" ,
	   		            dataType : "json" ,   		 
	   					headers : {
	   						"Accept" : "application/json",
	   						"Content-Type" : "application/json"
	   					},
	   		        	data : JSON.stringify({
	   		        		grade : $("#grade").val(),
	   		        		postTitle : $("input[name=postTitle]").val(),
	   		        		postContent : $('textarea').val(),
	   		        		file : $("#multiFile").val(),
	   		        		hospitalName : $("#hospitalName").val()
	   					}),
	   					
	   		             success : function(JSONData) {
	   		            	//alert(JSONData.grade);
	   		            	$('#myModal').modal("hide");
	   	
	   		            }  
	   			  });                
        });
	      
	     // $('form').attr("method","POST").attr("action","/funding/addVoting").attr("enctype","multipart/form-data").submit();
	   }	

	   //============= "Editor" =============   
		let editor;

		ClassicEditor
		    .create( document.querySelector( '#postContent' ),{
		    
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
		                     if(Object.keys(files).length>=3){
		                        alert("사진은 3장까지만 업로드 가능합니다.");
		                        delete files[imgNum];
		                     }else{
		               // 8장 이하 
		                     $("#preview").append(
		                                     "<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px' >"
		                                             + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"120px;\" height=\"120px;\"/>"
		                                             + "<span href=\"#\" value=\""
		                                             + imgNum
		                                             + "\" onclick=\"deletePreview(this)\">"
		                                             + "   삭제" + "</span>");

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
		       
		   //============= "MAP" =============     
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		//주소로 좌표를 검색합니다
		geocoder.addressSearch('${placeList.placeAddr}', function(result,
				status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
		
		 //============= "별점" =============     
		$('.starRev span').hover(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  
			  var sNum = $(this).parent().children('span.starR.on').length;
			  var sText = null;
			  if(sNum==1){
				  sText = "1/5 별로예요"
			  }else if (sNum==2){
				  sText = "2/5 조금 아쉬워요";				  
			  }else if(sNum ==3){
				  sText = "3/5 보통이에요";
			  }else if(sNum==4){
				  sText = "4/5 좋아요";
			  }else{
				  sText = "5/5 최고예요";
			  }

			  $("#starText").text(sText);
			  $("#grade").val(sNum);
			  return false;
			});

		
		   $(function() {
		         //============= 비회원일때 후기모달 Event  처리 =============   
		         $( "#nonMember" ).on("click" , function() {   
		        	alert("로그인이 필요합니다.")
		        });		      
		         //============= 등록 Event  처리 =============   
		         $( "#btn-add" ).on("click" , function() {   
		        	fncAddReview();
		        });

		            
		   });   
	</script>
</body>
</html>