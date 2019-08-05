<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="848949930774-4ka6kl79kq1fv7h3q89leonj9ki1o6v7.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js"></script>
    
	<link rel="shortcut icon" href="/resources/file/others/favicon.png">
	<link rel="icon" href="/resources/file/others/favicon.png">  
	
    <!-- Global Stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
    <link href="/resources/newTemplate/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/animate/animate.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/style.css">
   
  	<style type="text/css">
 		
 		@font-face {
    		font-family: 'YouandiModernTR';
   		 	font-style: normal;
    		font-weight: normal;
    		src: url(/resources/font/Youandi_Modern_TextRegular.woff) format('woff');
		}
    	
    	#mainNav, body, .nav-link, .dropdown-item, .navbar-brand, h2, h3, h4, p, a, th, td {
    		font-family: 'YouandiModernTR', sans-serif !important;
    	} 	
		
		.navbar-brand{
			font-weight: bold;
		}
		
		.swal-button {
		  background-color: #f04f23;
		  border: 1px  #f04f23;
		}
		
		.swal-button:hover {
		  background-color: #f04f23;
		  border: 1px  #f04f23;
		}
		
		.swal-button--cancel {
		    color: white;
		    background-color: #f04f23;
		}
		
		html {
	 		scroll-behavior: smooth;
		}
		
		
  	</style>
  </head>
  
<body id="page-top">
<!--====================================================
                    LOGIN OR REGISTER
======================================================-->

<section id="reportModal">

							<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="report-modal" class="modal fade" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
											<div class="hero-wrap hero-bread" 
											style="padding-bottom: 10px; padding-top : 20px; display: inline-block;">
												<div class="container">
													<div class="row no-gutters slider-text align-items-center justify-content-center">
														<div class="col-md-12 ftco-animate text-center" style="padding-left: 125px;">
															<p class="breadcrumbs">
																<span class="mr-6"><a href="#">SendReport</a></span>
															</p>
															<font size="7">신고작성</font>
														</div>
													</div>
												</div>
											</div>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" class="form-horizontal sendReport" id="reportForm">
                                            <input type="hidden" name="reporterNick" id="reporterNick" value="${ sessionScope.user.nickname }">
                                                <div class="row form-group">
                                                    <label class="col-lg-4 control-label">신고대상</label>
                                                    <div class="col-lg-8">
                                                        <input type="text" placeholder="" id="reportedNick" name="reportedNick" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <label class="col-lg-4 control-label">신고유형</label>
                                                    <div class="col-lg-8">
                                                        <select name="reportCategory" id="reportCategory" class="form-control" style="width: 150px; height: 35px" maxLength="20">
															<option value="비속어">비속어사용</option>
															<option value="사기">사기행위</option>
															<option value="음란행위">음란행위</option>
															<option value="혐오표현">혐오표현</option>
															<option value="기타">기타</option>
														</select>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <label class="col-lg-4 control-label">신고내용</label>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col-lg-12">
                                                        <textarea rows="10" cols="30" class="form-control" id="reportContent" name="reportContent" placeholder="1000자 이내로 입력해주세요"></textarea>
                                                    </div>
                                                </div>

                                                <br/>
                                                <br/>
                                                <br/>
									            <div id="attach" class="form-group">
									                <span class="label label-primary " ><label class="waves-effect waves-teal btn-flat" for="uploadReportInputBox">사진등록</label></span>&nbsp;(최대 3장까지 업로드 가능합니다.)
									                <input id="uploadReportInputBox" style="display: none" type="file" value="등록" name="filedata"  />
									            </div>                                              	
<!--                                            미리보기 영역 -->
                                                <div class="form-group">
									            	<div id="preview" class="col-md-3" align="center" style='display:inline; min-width:600px;'></div> 
									            </div>
                                               <br/>
                                               <br/>
                                               <br/>
                                                
                                                <div class="row form-group">
                                                    <div class="offset-lg-2 col-lg-12" align="right" style="padding-right: 0;">
                                                        <button class="btn btn-send ml-3 submit" type="submit" id="submit">Send</button>
                                                        <button class="btn btn-reset ml-3 reset" name="reset">Reset</button>
                                                    </div>
                                                </div>
                                                <input type="hidden" class="form-control" id="reportMultiFile" name="reportMultiFile" >	
                                            </form>
                                        </div>
                                    </div>
                                    /.modal-content
                                </div>
                                /.modal-dialog
                            </div>

</section>


    <!--Global JavaScript -->
    <script src="/resources/newTemplate/js/jquery/jquery.min.js"></script>
    <script src="/resources/newTemplate/js/popper/popper.min.js"></script>
    <script src="/resources/newTemplate/js/bootstrap/bootstrap.min.js"></script>
    <script src="/resources/newTemplate/js/wow/wow.min.js"></script>
    <script src="/resources/newTemplate/js/owl-carousel/owl.carousel.min.js"></script>
	
    <!-- Plugin JavaScript -->
    <script src="/resources/newTemplate/js/jquery-easing/jquery.easing.min.js"></script> 
    <script src="/resources/newTemplate/js/custom.js"></script> 
    <script src="/resources/prodmenu/js/jquery.animateNumber.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

    
    <!-- fontawesome key -->
    <script src="https://kit.fontawesome.com/e26616618e.js"></script>
    
    <!-- sweetalter CDN -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <script type="text/javascript">

		
		//========== AddReport 처리==========
		function fncAddReport(){
			//Form 유효성 검증
			var content = $("input[name='reportContent']").val();
// 			alert("1");

			
// 			if(reportContent == null || reportContent.length<1){
// 				alert("내용을 입력해 주세요.");
// 				return;
// 			}
			
// 			if(reportContent.length>1000){
// 				alert("내용은 1천자 미만으로 작성해 주세요.")
// 				return;
// 			}
		   
          $(function() {     
            var form = $('#reportForm')[0];
            var formData = new FormData(form);
//             alert("2")

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
	                url : '/Images/json/imageupload/RP',
	                dataType : 'JSON',
	                data : formData,
	                success : function(result) {
// 	                	alert("3")
// 	                	alert(result);
	                    if (result === -1) {
	                        alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
	                        // 이후 동작 ...
	                    } else if (result === -2) {
	                        alert('파일이 10MB를 초과하였습니다.');
	                        // 이후 동작 ...
	                    } else {
	                        alert('이미지 업로드 성공');
	                    }
	                },
					error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
           		});
                
                $.ajax({
                	method : 'POST',
                	enctype : 'multipart/form-data',
                	headers : {
                		"Accept" : "application/json",
                		"Content-Type" : "application/json"
                	},
                	url : '/report/json/addReport',
                	dataType : 'JSON',
                	data : JSON.stringify({
                		reportedNick : $('#reportedNick').val(),
                		reporterNick : $('#reporterNick').val(),
                		reportCategory : $('#reportCategory').val(),
                		reportContent : $('#reportContent').val(),
                		file : $('#reportMultiFile').val(),
                	}),
                	success : function(JSONData){
//                 		alert("5");
                		console.log(JSON.stringify(JSONData));
                	}
                });
        });
			
// 			$(".sendReport").attr("method", "POST").attr("action", "/report/addReport").attr("enctype","multipart/form-data");
// 			alert("4")
// 			alert("신고가 완료되었습니다.");
	          swal({
	              text: "제한길이를 초과하였습니다.",
	              dangerMode: true,
	              buttons: {
	                   catch: {
	                      text: "확인"
	                   }
	            },            
	         }).then((A) => {
	              if (A) {
	              	$('#report-modal').modal("hide");
	              }
	         });
		}
		
		   //============= "다중파일업로드 파일명만 저장해서 value" =============   
		   function fnAddFile(fileNameArray) {
		         $("#reportMultiFile").val(fileNameArray)    
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
		                     
		                    //3장 이상 업로드시
		                     if(Object.keys(files).length>=3){
		                        alert("사진은 3장까지만 업로드 가능합니다.");
		                        delete files[imgNum];
		                     }else{
		               // 3장 이하 
		                     $("#preview").append(
		                                     "<div class=\"preview-box\" value=\"" + imgNum +"\"  style='display:inline;float:left;width:100px' >"
		                                             + "<"+imgSelectName+" class=\"thumbnail\" src=\"" + img.target.result + "\"\/ width=\"80px;\" height=\"80px;\"/>"
		                                             + "<br/>"
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
			
			$("textarea[name=reportContent]").keyup(function(){
                var byteText = $(this).val();
                var byteNum = 0;
                
                for(var i = 0; i < byteText.length ; i++) {
                   byteNum += ( byteText.charCodeAt(i) > 127 ) ? 3 : 1;
                   if(byteNum > 3000) {     
                    swal({
                            text: "제한길이를 초과하였습니다.",
                            dangerMode: true,
                            buttons: {
                                 catch: {
                                    text: "확인"
                                 }
                          },            
                       }).then((willDelete) => {
                            if (willDelete) {
                               $(this).val($(this).val().substr(0,i-1));
                               $("input[name=id]").focus();
                            }
                       });
                   }
                }
			})
		
	</script>	
  
  
</body>
</html>