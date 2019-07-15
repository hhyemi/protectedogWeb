<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
    <!-- jQuery UI toolTip 사용 CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip 사용 JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	   #btn-add{
		background: #fff;
        border:2px solid #29304d;
		color:#29304d;
		height:40px;
		width:150px;
		}
		#btn-cancel{
		background: #fff;
        border:2px solid #29304d;
		color:#29304d;
		height:40px;
		width:150px;
		}
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
    </style>

	</head>
	<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->
      
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container ">
		<div class="form-group">
		<div class="page-header text-center">	
		<font size=6>후원 신청 수정</font> 후원신청은 투표 <strong style="color:#225cba">1개</strong>이상 받을 시 <strong  style="color:#225cba">수정이 불가</strong>합니다.
	    </div>		
		</div>	
		
		<!-- form Start /////////////////////////////////////-->
		<form id ="uploadForm" class="form-horizontal">
		  <div class="form-group">
			<h4 >후원목표금액</h4>
			투표개수는 ( <strong style="color:#225cba">목표금액 X 0.001</strong> )표로 적용됩니다. ( 10만원 ~ 300만원까지 입력가능합니다. )<p/>
		    <div class="row form-form"  >
		      <input type="text" class="form-control" value="${funding.fundTargetPay }" id="fundTargetPay" name="fundTargetPay" placeholder="0" maxlength="7"  style="width:600px; height:35px;" >&ensp; 원
		    </div>
		  </div>
			<br/>
			
			<fmt:parseNumber var ="test" value="${funding.fundTargetPay*0.001}" integerOnly="true"/>
         
		  <div class="form-group" id="voteNum">
		    <font ><b>투표수 <strong style="color:#225cba">${test}</strong>표</b></font>
		  </div>
		  <div class="form-group" >
			후원게시글로 이동하려면 받아야 할 투표 수입니다.	
		  </div>
		  <br/>
                
		  <div class="form-group">
			<h4 >후원목표기간</h4>
			후원 받을기간을 입력하세요. ( 7일 ~ 30일까지 선택가능합니다. )<br/>
			투표가 마감되었을 때 시작 날부터의 기간입니다. 투표 기간은 <strong style="color:#225cba">30</strong>일로 고정됩니다.<p/>		
		    <div >
		      <select class="form-control" name="fundTargetDay" id="fundTargetDay"  style="width:700px; height:35px;">
		       	<c:forEach var ="i" begin="7" end ="30" step="1">
		       		<c:if test="${funding.fundTargetDay eq i }">
				  	<option value="${funding.fundTargetDay}" selected >${funding.fundTargetDay}</option>
		       		</c:if>
		       		<c:if test="${!(funding.fundTargetDay eq i) }">
		       		<option value="${i}" >${i}</option>
		       		</c:if>
				 </c:forEach>
				</select>
		    </div>
		  </div>
		  <br/>
		  <div class="form-group">
			<h4 class=>글제목</h4><p/>		
		    <div class=>
		      <input type="text" class="form-control" value="${funding.postTitle}" id="postTitle" name="postTitle" placeholder="제목을 입력해주세요." style="width:700px; height:35px;">		
		    </div>
		  </div>
		  <br/>
		  <div class="form-group">
			<h4 class=>글내용</h4><p/>		
			    <div class=>
			      <textarea name="postContent" class="form-control" rows="5"  placeholder="내용을 입력해주세요."  style="width:700px;">${funding.postContent}</textarea>
			    </div>
			  </div>
			<br/>
            <!-- 첨부 버튼 -->
            <div id="attach" class="form-group">
                <span class="label label-primary " ><label class="waves-effect waves-teal btn-flat" for="uploadInputBox">사진등록</label></span>&nbsp;&nbsp;맨앞 이미지는 대표이미지입니다. (최대 8장까지 업로드 가능합니다.)
                <input id="uploadInputBox" style="display: none" type="file" value="등록" name="filedata"  />
            </div>
           <br/>
            
            <!-- 미리보기 영역 -->
            <div class="form-group">
            <div id="preview" class="col-md-3" align="center" style='display:inline; min-width:600px;'>

				<c:forEach var="name" items="${file}" varStatus="status">            
				<div class="preview-box" value="${status.index}"  style='display:inline;float:left;width:140px' >
                     <img class="thumbnail" src="/resources/file/fileSF/${name.fileName}"  width="120px;" height="120px;"/>
                            <a href="#" value="${status.index}"  onclick="deletePreview2(this)">삭제</a></div>     
                </c:forEach>           
            

            
            </div> 
            </div>
		   <div class="form-group">
		   <br/>
			<h4>연락처</h4>
			문의받을 연락처를 입력해주세요.<p/>		
			 <div class="col-sm-3" style="padding:0; margin:0;">
		      <select class="form-control" name="phone1" id="phone1">
				  	<option value="010" ${ ! empty funding.phone1 && funding.phone1 == "010" ? "selected" : ""  } >010</option>
					<option value="011" ${ ! empty funding.phone1 && funding.phone1 == "011" ? "selected" : ""  } >011</option>
					<option value="016" ${ ! empty funding.phone1 && funding.phone1 == "016" ? "selected" : ""  } >016</option>
					<option value="018" ${ ! empty funding.phone1 && funding.phone1 == "018" ? "selected" : ""  } >018</option>
					<option value="019" ${ ! empty funding.phone1 && funding.phone1 == "019" ? "selected" : ""  } >019</option>
				</select>
		    </div>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="phone2" name="phone2" value="${ ! empty funding.phone2 ? funding.phone2 : ''}"  placeholder="변경번호">
		    </div>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="phone3" name="phone3" value="${ ! empty funding.phone3 ? funding.phone3 : ''}"   placeholder="변경번호">
		    </div>
		    <input type="hidden" name="phone"  />
		    <input type="hidden" id="multiFile" name="multiFile" >
		    <input type="hidden" id="deleteFile" name="deleteFile" >		    
		  </div>
        
		  <br/><br/>
		  <div class="form-group text-center">
	  			<button type="button" id="btn-add">등록</button>
	  			<button type="button" id="btn-cancel">취소</button>
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

   //============= 등록버튼 눌렀을때 함수 =============      
   function fncAddFunding(){
      
      //Form 유효성 검증

      var fundTargetPay = $('input[name="fundTargetPay"]').val();
      var postTitle = $('input[name="postTitle"]').val();
      var postContent = $('input[name="postContent"]').val();
      var phone2 = $('input[name="phone2"]').val();
      var phone3 = $('input[name="phone3"]').val();   
      var file = $("#multiFile").val();    
      
      if(fundTargetPay == null || fundTargetPay.length<1){
         alert("후원목표금액은 반드시 입력하여야 합니다.");
         $('input[name="fundTargetPay"]').focus();
         return;
      }
      if(fundTargetPay < 100000 || fundTargetPay > 3000000){
         alert("후원목표금액은 10만원이상 300만원이하로 입력하여야 합니다.")
         $('input[name="fundTargetPay"]').focus();
         return;
      }
      if(postTitle == null || postTitle.length<1){
         alert("글제목은 반드시 입력하여야 합니다.");
         $('input[name="postTitle"]').focus();
         return;
      }
/*       if(postContent == null || postContent.length<1){
         alert("글내용은 반드시 입력하셔야 합니다.");
         $('input[name="postContent"]').focus();
         return;
      } */
      if(file == null || file.length<1){
         alert("파일은 반드시 입력하셔야 합니다.");
         return;
      }
      if(phone2 == null || phone2.length<1){
         alert("휴대폰번호는 반드시 입력하셔야 합니다.");
         $('input[name="phone2"]').focus();
         return;
      }
      if(phone3 == null || phone3.length<1){
         alert("휴대폰번호는 반드시 입력하셔야 합니다.");
         $('input[name="phone3"]').focus();
         return;
      }
      
      var value = "";   
      if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
         var value = $("#phone1 option:selected").val() + "-" 
                        + $("input[name='phone2']").val() + "-" 
                        + $("input[name='phone3']").val();
      }
      $("input:hidden[name='phone']").val( value );
      
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
                url : '/funding/json/imageupload/',
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


      $('form').attr("method","POST").attr("action","/funding/addFunding").attr("enctype","multipart/form-data").submit();
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
     //=============원래있던사진들 삭제버튼누를때 =============
     function deletePreview2(obj) {
         var imgNum = obj.attributes['value'].value;
         //fnAddFile(fileNameArray);
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

          //============= 후원목표금액 =============
             $('#fundTargetPay').keyup(function(){
                
                 //후원목표금액 길이초과
                 if ($(this).val().length > $(this).attr('maxlength')-1) {
                     alert('제한길이 초과');
                     $(this).val($(this).val().substr(0, $(this).attr('maxlength')));
                 }
                 //후원목표금액 문자 입력 검증 (정규식사용)    
                var exp = /^[0-9]+$/;
                if($(this).val().match(exp)){
                  //금액에 따른 표개수
                  if($(this).val().match(exp)){
                    var inputed = Math.round($("input[name='fundTargetPay']").val()*0.001);         
                    $("#voteNum").children().remove();
                    $("#voteNum").append("<font><b>투표수 <strong  style=\"color:#225cba\">"+inputed+"</strong>표</b></font>");
                   }
                   return true;
                }else{
                  alert("숫자만 입력하세요.")
                  var val = $(this).val(); 
                  var len = val.length; 
                  $(this).val(val.substring(0,len-1));        
                }
               
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
           //============= 연락처 문자 입력 검증 (JavaScript 함수사용)=============
             $('#phone2').keyup(function(){
                var val = $(this).val(); 
            if(isNaN(val)){
                  alert("숫자만 입력하세요.")
                  var len = val.length; 
                  $(this).val(val.substring(0,len-1));        
                }            
             });
           
             $('#phone3').keyup(function(){
                var val = $(this).val(); 
            if(isNaN(val)){
                  alert("숫자만 입력하세요.")
                  var len = val.length; 
                  $(this).val(val.substring(0,len-1));        
                }            
             });
             
     }); 
   
   $(function() {
      
         //============= 등록 Event  처리 =============   
         $( "#btn-add" ).on("click" , function() {
            fncAddFunding();
            });
         
         //============= 취소 Event  처리 =============
          $( "#btn-cancel" ).on("click" , function() {
               history.go(-1);
            });
            
   });   
               
   
   </script>
   
      
</body>

</html>