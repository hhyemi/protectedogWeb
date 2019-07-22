<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">
	<head>
		<meta charset="EUC-KR">
		
		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

		<!--  ///////////////////////// CSS ////////////////////////// -->
			<style>
		       body > div.container{
		        	border: 3px solid #D6CDB7;
		            margin-top: 10px;
		        }
		    </style>

		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
  		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	</head>
	
	<body>
	
		<jsp:include page="/layout/toolbar.jsp" />
		
		<div class="container">
		
			<h1 class="bg-primary text-center">신 고 하 기</h1>
			
			<form id ="uploadForm" class="form-horizontal">
			<input type="hidden" id="reporterId" name="reporterId" value="${ sessionScope.user.id }"/>
			
 				<div class="form-group">
 					<div class="col-sm-2">
 						<p>신고대상</p>
 					</div>
 					<div class="col-sm-10">
 						<c:if test='${ param.id != null }'>
							<input type="text" readonly="readonly" class="form-control" name="reportedId" value="${ param.id }">
						</c:if>
						<input type="text" class="form-control" name="reportedId" value="${ param.id }">
					</div>
				</div>
						
				<br/>
				<br/>
				<br/>		
								
				<div class="form-group">
					
					<div class="col-sm-2">
						<p>신고유형</p>
					</div>
					<div class="col-sm-10" style="float:left">
						<select name="reportCategory" class="form-control" 
							style="width: 150px; height: 35px" maxLength="20">
							<option value="비속어">비속어사용</option>
							<option value="사기">사기행위</option>
							<option value="음란행위">음란행위</option>
							<option value="혐오표현">혐오표현</option>
							<option value="기타">기타</option>
						</select>
					
					</div>
				
				</div>
				
				<br/>
				<br/>
				<br/>
				<hr/>
				<br/>
				
				<div class="form-group">
					<textarea class="form-control" rows="20" placeholder="1000자 미만으로 작성해주세요" 
					id="reportContent" name="reportContent" value="" required></textarea>
				</div>
				<br/>
				<br/>
				<hr/>
				<br/>
				<br/>
				
            <div id="attach" class="form-group">
                <span class="label label-primary " ><label class="waves-effect waves-teal btn-flat" for="uploadInputBox">사진등록</label></span>&nbsp;(최대 3장까지 업로드 가능합니다.)
                <input id="uploadInputBox" style="display: none" type="file" value="등록" name="filedata"  />
            </div>
            
			<!-- 미리보기 영역 -->
            <div class="form-group">
            	<div id="preview" class="col-md-3" align="center" style='display:inline; min-width:600px;'></div> 
            </div>
			<br/>
				
				

				<br/>
				<br/>
				<br/>
				<hr/>
				
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-4 text-center">
						<input type="submit" id="submit" class="btn btn-primary" value="등록">
						<a class="btn btn-primary btn" href="#" role="button">취소</a>
					</div>
				</div>
				
				<br/>
				<br/>
				<br/>
				<br/>
				
			<input type="hidden" class="form-control" id="multiFile" name="multiFile" >	
			</form>
	
		</div>
	
	<!-- JavaScript 시작 -->
	<script type="text/javascript">
		
		function fncAddReport(){
			//Form 유효성 검증
			var content = $("input[name='reportContent']").val();

			
// 			if(reportContent == null || reportContent.length<1){
// 				alert("내용을 입력해 주세요.");
// 				return;
// 			}
			
// 			if(reportContent.length>1000){
// 				alert("내용은 1천자 미만으로 작성해 주세요.")
// 				return;
// 			}
		   

			
			$("#uploadForm").attr("method", "POST").attr("action", "/report/addReport").attr("enctype","multipart/form-data");

			alert("신고가 완료되었습니다.");
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
		                     
		                    //8장 이상 업로드시
		                     if(Object.keys(files).length>=3){
		                        alert("사진은 3장까지만 업로드 가능합니다.");
		                        delete files[imgNum];
		                     }else{
		               // 8장 이하 
		                     $("#preview").append(
		                                     "<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:140px' >"
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
		     

		       $(document).ready(function() {

		          //============= 사진미리보기 =============
		          $('#attach input[type=file]').change(function() {
		             addPreview($(this)); //preview form 추가하기
		         });
		       });
		
			$(function(){
				$('#submit').on('click',function(){
// 					alert("ssss");
					fncAddReport();
				});
			});
			
			
			$(function(){
				$('a[href="#"]').on('click',function(){
					$("form")[0].reset;
				});
			});


	
		
		
		</script>
	</body>

</html>
