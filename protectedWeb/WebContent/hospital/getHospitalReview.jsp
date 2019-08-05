<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" > -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->

<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
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
	min-width: 700px;
}

.ck-editor__editable {
	text-align: left;
	min-height: 200px;
	min-width: 700px;
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
				style="padding-bottom: 30px; padding-top: 60px;">
				<div class="container">
					<div
						class="row no-gutters slider-text align-items-center justify-content-center">
						<div class="col-md-9 ftco-animate text-center">
							<p>
								<span class="mr-2">Animal</span> <span>Hospital</span>
							</p>
							<font size="7">동물병원 검색</font>
						</div>
					</div>
				</div>
			</div>
			<br />
			<p />

			<br />
			<p />
			<div id="map" style="width: 100%; height: 350px;"></div>
			<br /> <font size="6"><b>${placeList.placeName}</b></font> <br />
			<p />
			<hr />
			<font size="6">도로명주소</font><br /> ${placeList.placeAddr } <br /> <br />
			<font size="6">지번주소</font><br /> ${placeList.placeJIAddr } <br /> <br />
			<font size="6"  id="scroll">연락처</font><br /> <font size="4" color="#d65a5a">${placeList.placeTel}</font>
			<br />
			<p />
			<hr />
			<font size="6" >동물병원후기</font><br /> <font id="reviewNum">사용자 후기 [
			${resultPage.totalCount}건 ]</font> &ensp;

			<!-- Button trigger modal -->
			<c:if test="${user == null }">
				<button type="button" class="btn btn-default" id="nonMember">후기등록</button>
			</c:if>
			<c:if test="${user != null }">
				<button type="button" class="btn btn-default" onclick="show2()">후기등록</button>
			</c:if>
			<br /> 후기 평균 평점 :&ensp;
			<c:if test="${avgGrade eq 1 }">
				<strong class="text-danger">★☆☆☆☆</strong>
			</c:if>
			<c:if test="${avgGrade eq 2}">
				<strong class="text-danger">★★☆☆☆</strong>
			</c:if>
			<c:if test="${avgGrade eq 3 }">
				<strong class="text-danger">★★★☆☆</strong>
			</c:if>
			<c:if test="${avgGrade eq 4}">
				<strong class="text-danger">★★★★☆</strong>
			</c:if>
			<c:if test="${avgGrade eq 5}">
				<strong class="text-danger">★★★★★</strong>
			</c:if>


			<div id="ListDiv">
				<c:forEach var="review" items="${list}">

					<div style="background-color: #f7f7f7; padding-left: 20px"
						id="${review.postNo }">
						<hr />

						<c:if test="${user.id eq review.id || user.id eq 'admin'}">
							<div class="row" style="position: relative; height: 35px;">
								<div class="col-xs-8 col-md-8"
									style="position: absolute; left: 0px; bottom: 0px;">
									<font size="5">${review.postTitle}</font>
								</div>
								<div class="col-xs-4 col-md-4" align="right"
									style="position: absolute; right: 0px; bottom: 0px;">
									<button type="button" class="btnUpdate btn btn-default">수정</button>
									<button type="button" class="btnDelete btn btn-default">삭제</button>
									&emsp; <input type="hidden" value="${review.postNo }" />
								</div>
							</div>
						</c:if>
						<c:if test="${!(user.id eq review.id) && !(user.id eq 'admin')}">
							<font size="5">${review.postTitle}</font>
							<br />
						</c:if>
						<br /> <b>${review.nickname }</b> &emsp;${review.regDate } &emsp;
						<c:if test="${review.grade eq 1 }">
							<strong class="text-danger">★☆☆☆☆</strong>
							<strong>1</strong>
						</c:if>
						<c:if test="${review.grade eq 2}">
							<strong class="text-danger">★★☆☆☆</strong>
							<strong>2</strong>
						</c:if>
						<c:if test="${review.grade eq 3 }">
							<strong class="text-danger">★★★☆☆</strong>
							<strong>3</strong>
						</c:if>
						<c:if test="${review.grade eq 4}">
							<strong class="text-danger">★★★★☆</strong>
							<strong>4</strong>
						</c:if>
						<c:if test="${review.grade eq 5}">
							<strong class="text-danger">★★★★★</strong>
							<strong>5</strong>
						</c:if>
						<p>
							${review.postContent }

							<c:forEach var="file" items="${file}">
								<c:if test="${file.postNo == review.postNo }">
									<img src="/resources/file/fileHospital/${file.fileName}"
										height="100px;" width="100px"
										onclick="show('${review.postNo}')">
								</c:if>
							</c:forEach>
							<br />&emsp;
					</div>

				</c:forEach>

				<div class="modal fade" id="myModal" role="dialog">

					<div class="modal-dialog">

						<div class="modal-content"
							style="max-width: 700px; max-height: 505px; min-width: 700px; min-height: 505px;">

							<div id="carouselExampleIndicators" class="carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">

									<c:forEach var="i" begin="0" end="2" step="1">
										<c:if test="${i eq 0}">
											<li data-target="#carouselExampleIndicators"
												data-slide-to="${i}" class="active">
										</c:if>
										<c:if test="${!(i eq 0)}">
											<li data-target="#carouselExampleIndicators"
												data-slide-to="${i}">
										</c:if>
									</c:forEach>

								</ol>
								<!-- Wrapper for slides -->
								<div class="carousel-inner"></div>
							</div>

						</div>
					</div>
				</div>

			</div>
			<hr />
			<!-- Modal -->
			<div class="modal fade bs-example-modal-lg" id="myModal2"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content ">
						<div class="modal-header">
							<font size="6" class="modal-title" id="myModal2Label"
								style="padding-left: 20px">
								</font>
								
			          <div class="col-md-9 ftco-animate text-center">
			          	<p ><span class="mr-2">Hospital</span> <span>Review</span></p>
			            <font size="7">
			            	동물병원후기
			            </font>
			          </div>							
								
								
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="starRev" style="padding-left: 20px">
								<span class="starR" id="oneStar">1</span> <span class="starR"
									id="twoStar">2</span> <span class="starR" id="threeStar">3</span>
								<span class="starR" id="fourStar">4</span> <span class="starR"
									id="fiveStar">5</span> <font size="4" color="#000000"
									id="starText">0/5 평가해주세요</font>
							</div>
							<p />
							<div class="row" style="padding-left: 35px">
								<input type="text" id="postTitle" name="postTitle"
									placeholder="후기제목을 작성해주세요." style="width: 740px; height: 35px;">
							</div>
							<p />
							<div class="row" style="padding-left: 35px">
								<textarea id="postContent" name="postContent"
									style="text-align: left;" placeholder="후기내용을 작성해주세요."></textarea>
							</div>
							<p />
							<!-- 첨부 버튼 -->
							<div id="attach" class="form-group" style="padding-left: 20px">
								<span class="label label-primary "><label
									class="waves-effect waves-teal btn-flat" for="uploadInputBox"
									style="background-color: #f6957b; padding: 3px; border-radius: 3px; color: #ffffff">사진등록</label></span>&nbsp;&nbsp;
								최대 <b>3장</b>까지 업로드 가능합니다. <input id="uploadInputBox"
									style="display: none" type="file" value="등록" name="filedata" />
							</div>
							<br />

							<!-- 미리보기 영역 -->
							<div class="form-group" style="padding-left: 35px">
								<div id="preview" class="col-md-3" align="center"
									style='display: inline; min-width: 600px;'></div>
							</div>

						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-default" id="btn-add">등록</button>
							<input type="hidden" id="hideenPostNo" name="hiddenPostNo" />
						</div>
					</div>


					<br />
				</div>
			</div>
			<input type="hidden" id="placeName" name="placeName"
				value="${placeList.placeName}" /> <input type="hidden"
				id="placeAddr" name="placeAddr" value="${placeList.placeAddr}" /> <input
				type="hidden" id="placeJIAddr" name="placeJIAddr"
				value="${placeList.placeJIAddr}" /> <input type="hidden"
				id="placeTel" name="placeTel" value="${placeList.placeTel}" /> <input
				type="hidden" id="grade" name="grade" />  <input
				type="hidden" id="currentPage" name="currentPage" value="" />
			<input type="hidden" id="multiFile" name="multiFile" />
		    <input type="hidden" id="deleteFile" name="deleteFile" />
 			<input type="hidden" id="pageCheck" name="pageCheck"  value="${pageCheck }"/>		
 				    		  
		</form>
		<p />
		<br/>
	<div style="padding-left: 480px">
			<!-- PageNavigation Start... -->
			<jsp:include page="../common/pageNavigator_new.jsp" />
			<!-- PageNavigation End... -->
	</div>
	
	</div>

	<br />
	<br />
	<!--================ start footer Area  =================-->
	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!-- footer End /////////////////////////////////////-->
	<!--================ End footer Area  =================-->


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=153d14a106a978cdc7a42f3f236934a6&libraries=services"></script>
	<script type="text/javascript">

	//=============    검색 / page 두가지 경우 모두  Event  처리 =============
	function fncGetList(currentPage) {
	   	
	   	$("#currentPage").val(currentPage)
	  	$("form").attr("method" , "POST").attr("action" , "/review/getHospitalReview").submit();
	  
	   //	$(this).addClass('active'); 

	   	
	}

	   //============= "다중파일업로드 파일명만 저장해서 value" =============   
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
	                     
	                    //3장 이상 업로드시
	                     if(Object.keys(files).length>=3){
	                    	 swal("사진은 3장까지만 업로드 가능합니다.", " ");
	                        delete files[imgNum];
	                     }else{
	               // 3장 이하 
	                     $("#preview").append(
	                                     "<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px' >"
	                                             + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"120px;\" height=\"120px;\"/>"
	                                             + "<span href=\"#\" value=\""
	                                             + imgNum
	                                             + "\" onclick=\"deletePreview(this)\">"
	                                             + "   &ensp;삭제" + "</span>");

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
				  swal({
			           text: "jpg, gif, png, avi, mp4 확장자만 등록 가능합니다.",
			           dangerMode: true,
			           buttons: {
								 catch: {
								 	text: "확인"
								 }
					   },			   
			      }); 
	             return true;
	         } else {
	             return false;
	         }
	     }	
	     
	       $(document).ready(function() {
	    	   var pageCheck = false;
	    	  //alert($("#pageCheck").val())
	    	   pageCheck = $("#pageCheck").val();
	           //============= 페이징 스크롤이동 =============	    	   
	    	   if(${pageCheck} ){
	    		 //  alert("??")
	    		var offset = $('#scroll').offset(); 
	    		 $('html').animate({scrollTop : offset.top}, 1);
	    	   }
	    	   
	           //============= 사진미리보기 =============
	           $('#attach input[type=file]').change(function() {
	              addPreview($(this)); //preview form 추가하기
	          });
	       });
	   		   	
	
	   //============= 등록버튼 눌렀을때 함수 =============      
	   function fncAddReview(){
	      
	      //Form 유효성 검증
		  $('textarea').val(editor.getData());
	      var grade = $("#grade").val();	  
	      var postTitle = $("input[name=postTitle]").val();
	      var postContent = $('textarea').val()
		
	      if(grade == ''){
	    	  swal("평가점수를 입력해주세요.", " ");
	         return;
	      }	      
	      if(postTitle == null || postTitle.length<1){
	    	  swal("후기제목을 입력해주세요.", " ");
	          $('input[name="postTitle"]').focus();
	          return;
	       }
	      if(postContent == ''){
	    	  swal("후기내용을 입력해주세요.", " ");
		         $(".ck-editor__editable").focus();
		         return;
		  }
	      
	      //============= 다중파일업로드 AJAX =============
          $(function() {     
            var form = $('#uploadForm')[0];
            var formData = new FormData(form);
            
            if(files[0]!=null){

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
                
            }
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
	   		        		hospitalName : $("#placeName").val()
	   					}),
	   					
	   		             success : function(JSONData) {
	   		            	 
		   		        		$("#multiFile").val("");
		   						$("#uploadInputBox").val('');
		   						for (var i = 0; i < 10; i++) {
			   					    delete files[i];
			   					    delete fileNameArray[i];									
		   						}
	   		            	 
	   		            	 var review = JSONData.review;
                             var file = JSONData.file;
	   		            	 
	   		            	 
	   		            	 var user = JSONData.user;
	   		            	 
		   		            	$('#myModal2').modal("hide");
		   		            	
	   		            	var display = "<div style=\"background-color: #f7f7f7; padding-left:20px\" id=\""+review.postNo+"\" ><hr/>";
	
	   		            	if(user.id==review.id){
	   		            		display +=  "<div class=\"row\" style=\"position:relative;height:35px;\">"+
					   						 "<div class=\"col-xs-8 col-md-8\" style=\"position:absolute; left:0px; bottom:0px;\" > <font size=\"5\" >"+
					   						 review.postTitle+"</font></div>"+
					 					  	"<div class=\"col-xs-4 col-md-4\" align=\"right\" style=\"position:absolute; right:0px; bottom:0px; \" >"+ 
					 					  	"<button  type=\"button\" class=\"btnUpdate btn btn-default\" >수정</button>"+
					 						"<button type=\"button\" class=\"btnDelete btn btn-default\">삭제</button> &emsp;"+
					 						"<input type=\"hidden\" value=\""+review.postNo+"\" /></div> </div>";
					 
	   		            	}else{
	   						 display += "<font size=\"5\" >"+review.postTitle+"</font><br/><br/>";
	
	   		            	}
	   		                 display +=  "<b>"+review.nickname+"</b>"+
											" &emsp;"+review.regDate+"&emsp;";
	   		    
							if(review.grade==1){
								display += 	"<strong class=\"text-danger\">★☆☆☆☆</strong> <strong>1</strong>";								
							}else if(review.grade==2){
								display += 	"<strong class=\"text-danger\">★★☆☆☆</strong> <strong>2</strong>";			
							}else if(review.grade==3){
								display += 	"<strong class=\"text-danger\">★★★☆☆</strong> <strong>3</strong>";											
							}else if(review.grade==4){
								display += 	"<strong class=\"text-danger\">★★★★★☆</strong> <strong>4</strong>";											
							}else if(review.grade==5){
								display += 	"<strong class=\"text-danger\">★★★★★</strong> <strong>5</strong>";										
							}
							   display += "<p>"+review.postContent;
							  
							
						
							$.each(file, function(index, file){   

								if(file.postNo == review.postNo){
									display += 	"<img src=\"/resources/file/fileHospital/"+file.fileName+"\" height=\"100px;\" width=\"100px\" > ";  											
								}   
							});
							
									display += "<br/>&emsp;";
							
									
									
							   
							$("#ListDiv").prepend(display);
							$("#reviewNum").text("사용자 후기 [ ${resultPage.totalCount+1}건 ]");

	   		        		$("input[name=postTitle]").val("");
	   		        		editor.setData("");
	   		        		$("#deleteFile").val("");
	   		        		$("#starText").text("0/5 평가해주세요");
	   						$('.starRev span').parent().children('span').removeClass('on');
	   						$("#preview").children().remove();
							
						
		         //============= 수정 Event  처리 =============   
		         $( ".btnUpdate" ).on("click" , function() {  
		        	 
		        		$("#multiFile").val("");
   		        		$("#deleteFile").val("");
			   		  $("#preview").children().remove();
		        	 
		        	var postNo = $(this).parent().children("input").val();
			   		 $.ajax({
				        	url : "/review/json/getReview/"+postNo,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							error:function(request,status,error){
	                           alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	                          },
							success : function(JSONData , status) {
								var review = JSONData.review;
								var file = JSONData.file;
					
								$("#postTitle").val(review.postTitle);
								editor.setData(review.postContent);
								$("#hideenPostNo").val(postNo);
							
						    	var sText = null;
						    	
	  						     $('#oneStar').addClass('on');
	  						     
								 if(review.grade==1){
									 
									 sText = "1/5 별로예요"
									 
								  }else if (review.grade==2){
									  
									  $('#twoStar').addClass('on');										  
									 sText = "2/5 조금 아쉬워요";
									 
								  }else if(review.grade ==3){
									  
									  $('#twoStar').addClass('on');
								  	  $('#threeStar').addClass('on');
									  sText = "3/5 보통이에요";
									  
								  }else if(review.grade==4){
									  
									  $('#twoStar').addClass('on');
								  	  $('#threeStar').addClass('on');
									  $('#fourStar').addClass('on');		  	  
									  sText = "4/5 좋아요";
									  
								  }else{
									  $(".starRev span").addClass('on').prevAll('span').addClass('on');									  
									  sText = "5/5 최고예요";
									  
								  }

								  $("#starText").text(sText);
								  $("#grade").val(review.grade);

								  for (let name of file) {

									  $("#preview").append("<div class=\"preview-box2\" value=\""+name.fileName+"\"  style='display:inline;float:left;width:140px' >"+
					                     					"<img class=\"thumbnail\" src=\"/resources/file/fileHospital/"+name.fileName+"\"  width=\"130px;\" height=\"115px;\"/>"+
					                            			"<span href=\"#\" value=\""+name.fileName+"\"  onclick=\"deletePreview2(this)\"><br/><font color=\"#f04f23\"> 삭제</font></span></div>");     
								}
								   $( "#btn-add" ).html("수정");
								   $("#myModal2").modal('show');
							 	   
								   
								   $( "#btn-add" ).on("click" , function() {
									   //alert($(this).text())

									   if($(this).text()=="수정"){
											  
					   		        $.ajax({
					   		        	url : "/review/json/updateHospitalReview/",
					   		            method :  "POST" ,
					   		            dataType : "json" ,   		 
					   					headers : {
					   						"Accept" : "application/json",
					   						"Content-Type" : "application/json"
					   					},
					   		        	data : JSON.stringify({
					   		        		grade : $("#grade").val(),
					   		        		postTitle : $("input[name=postTitle]").val(),
					   		        		postContent : editor.getData(),
					   		        		multiFile : $("#multiFile").val(),
					   		        		hospitalName : $("#placeName").val(),
					   		        		deleteFile : $("#deleteFile").val(),  
					   		        		postNo : $(this).parent().children("input").val()
					   					}),
					   					
					   		             success : function(JSONData) {
   	 
					   		            }  
					   			    });   	
								   }
					   		             $("#myModal2").modal("hide"); 
					   		         
					   		             window.location.reload(true);
					   		          
								 });
		
							}
							
					});
		        });	
		         

					         $( ".btnDelete" ).on("click" , function() {  
					 	 		swal({
						            title: "정말 삭제 하시겠습니까 ?",
						            icon: "warning",
						            buttons: ["취소", "확인"],
						            dangerMode: true,
						          })
						          .then((willDelete) => {
						            if (willDelete) {
						              swal("삭제가 완료되었습니다!", {
						                icon: "success",
						              }).then((value) => {
					        	 //alert($(this).parent().children("input").val())
						        	 var str = $(this).parent().children("input").val();
				                  $.ajax({
									        	url : "/review/json/delHospitalReview/"+str,
												method : "GET" ,
												dataType : "json" ,
												headers : {
													"Accept" : "application/json",
													"Content-Type" : "application/json"
												},
												error:function(request,status,error){
						                            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
						                           },
												success : function(JSONData , status) {
												
													if(JSONData==1){
				           								$("div[id=" + str + "]").remove();
														}
											}
										});		      
						              });
						            }
						          });
					        	 
					        });		
					         
	   		            }  
	   			  });                
        });

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
		        		$("#login-modal").modal('show');  	
		        });		      
		         //============= 등록 Event  처리 =============   
		         $( "#btn-add" ).on("click" , function() {  
		        	 //alert($(this).text())
		        	 if($(this).text()=="등록"){
		        		fncAddReview();
		        	 }
// 		        	 files = null;	
		        });
		         //============= 수정 Event  처리 =============   
		         $( ".btnUpdate" ).on("click" , function() {  
		        		$("#multiFile").val("");
   		        		$("#deleteFile").val("");
			   		  $("#preview").children().remove();	        	 
		        	var postNo = $(this).parent().children("input").val();
			   		 $.ajax({
				        	url : "/review/json/getReview/"+postNo,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							error:function(request,status,error){
	                           alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	                          },
							success : function(JSONData , status) {
								var review = JSONData.review;
								var file = JSONData.file;
					
								$("#postTitle").val(review.postTitle);
								editor.setData(review.postContent);
								$("#hideenPostNo").val(postNo);
							
						    	var sText = null;
						    	
	  						     $('#oneStar').addClass('on');
	  						     
								 if(review.grade==1){
									 
									 sText = "1/5 별로예요"
									 
								  }else if (review.grade==2){
									  
									  $('#twoStar').addClass('on');										  
									 sText = "2/5 조금 아쉬워요";
									 
								  }else if(review.grade ==3){
									  
									  $('#twoStar').addClass('on');
								  	  $('#threeStar').addClass('on');
									  sText = "3/5 보통이에요";
									  
								  }else if(review.grade==4){
									  
									  $('#twoStar').addClass('on');
								  	  $('#threeStar').addClass('on');
									  $('#fourStar').addClass('on');		  	  
									  sText = "4/5 좋아요";
									  
								  }else{
									  $(".starRev span").addClass('on').prevAll('span').addClass('on');									  
									  sText = "5/5 최고예요";
									  
								  }

								  $("#starText").text(sText);
								  $("#grade").val(review.grade);

								  for (let name of file) {

									  $("#preview").append("<div class=\"preview-box2\" value=\""+name.fileName+"\"  style='display:inline;float:left;width:140px' >"+
					                     					"<img class=\"thumbnail\" src=\"/resources/file/fileHospital/"+name.fileName+"\"  width=\"130px;\" height=\"115px;\"/>"+
					                            			"<span href=\"#\" value=\""+name.fileName+"\"  onclick=\"deletePreview2(this)\"><br/><font color=\"#f04f23\"> 삭제</font></span></div>");     
								}
								   $( "#btn-add" ).html("수정");
								   $("#myModal2").modal('show');
							 	   
								   
								   $( "#btn-add" ).on("click" , function() {
									   //alert($(this).text())

									   if($(this).text()=="수정"){
											  
					   		        $.ajax({
					   		        	url : "/review/json/updateHospitalReview/",
					   		            method :  "POST" ,
					   		            dataType : "json" ,   		 
					   					headers : {
					   						"Accept" : "application/json",
					   						"Content-Type" : "application/json"
					   					},
					   		        	data : JSON.stringify({
					   		        		grade : $("#grade").val(),
					   		        		postTitle : $("input[name=postTitle]").val(),
					   		        		postContent : editor.getData(),
					   		        		multiFile : $("#multiFile").val(),
					   		        		hospitalName : $("#placeName").val(),
					   		        		deleteFile : $("#deleteFile").val(),  
					   		        		postNo : $(this).parent().children("input").val()
					   					}),
					   					
					   		             success : function(JSONData) {
   	 
					   		            }  
					   			    });   	
								   }
					   		             $("#myModal2").modal("hide");  	
					   		          window.location.reload(true);
								 });
		
							}
							
					});
		        });
					   		          
		         //============= 삭제 Event  처리 =============   
		         $( ".btnDelete" ).on("click" , function() {  
			 	 		swal({
				            title: "정말 삭제 하시겠습니까 ?",
				            text: "당신의 소중한 한마디가 사라지게 됩니다.",		
				            icon: "warning",
				            buttons: ["취소", "확인"],
				            dangerMode: true,
				          })
				          .then((willDelete) => {
				            if (willDelete) {
				              swal("삭제가 완료되었습니다!", {
				                icon: "success",
				              }).then((value) => {
			        	 //alert($(this).parent().children("input").val())
				        	 var str = $(this).parent().children("input").val();
		                  $.ajax({
							        	url : "/review/json/delHospitalReview/"+str,
										method : "GET" ,
										dataType : "json" ,
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										error:function(request,status,error){
				                            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				                           },
										success : function(JSONData , status) {
										
											if(JSONData==1){	
		           								$("div[id=" + str + "]").remove();
												}
									}
								});		      
				              });
				            }
				          });
			        	 
			        });	        
		            
		   });
			function show(str){

		   		 $.ajax({
					        	url : "/review/json/getReview/"+str,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								error:function(request,status,error){
		                            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		                           },
								success : function(JSONData , status) {
									
									var file = JSONData.file;
									
									var display="";
									
									$.each(file, function(index, file){   

									if(index==0){
								      display += "<div class=\"carousel-item active\">"
									             +"<img class=\"d-block w-100\" src=\"/resources/file/fileHospital/"+file.fileName+"\" style=\"max-width:700px; max-height:503px; min-width:700px; min-height:503px;\"></div>"										
									}else{
									      display += "<div class=\"carousel-item\">"
									             +"<img class=\"d-block w-100\" src=\"/resources/file/fileHospital/"+file.fileName+"\"  style=\"max-width:700px; max-height:503px; min-width:700px; min-height:503px;\"></div>"		
									}
										
									});
									
									$(".carousel-inner").html(display)
								}
								
						});
	
			    //modal을 띄워준다.  

// 			    $("#myModal").modal('show');

			    $("#myModal").modal('show').css({
			        'margin-top': function () { //vertical centering
			            return +($(this).height() / 8);
			        },
			        'margin-left': function () { //Horizontal centering
			            return -($(this).width() / 8);
			        }
			    });
			}
			
			function show2(){
				
        		$("input[name=postTitle]").val("");
        		editor.setData("");
        		$("#multiFile").val("");
        		$("#deleteFile").val("");
        		$("#starText").text("0/5 평가해주세요");
				$('.starRev span').parent().children('span').removeClass('on');
				$("#preview").children().remove();		
			    $("#myModal2").modal('show');

			  }		
	
			



	</script>
</body>
</html>