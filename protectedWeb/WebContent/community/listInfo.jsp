<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script
	src="https://cdn.ckeditor.com/ckeditor5/12.2.0/decoupled-document/ckeditor.js"></script>
<title>Insert title here</title>
<style type="text/css">

	@font-face{ 
		font-family:ng; 
		src:url(NanumGothic.eot); 
		src:local(※), url(NanumGothic.woff) format(‘woff’); 
	}
	
	body{font-family:'나눔고딕', 'NanumGothic', ng}

	#toolbar-container{
		max-width: 960px;
		max-height:  600px;
	}
	
	#editor{
		min-height: 600px;
		max-height: 960px;
		max-width : 960px;
		
		text-align: left;
		
	}
	
	.postTitle{
		height: 30px;
		width: 960px;
		
		border-radius: 5px;
	}
	
	hr{
		max-width: 960px;
	}
	
</style>
</head>





<div class="postForm" align="center">

<input type="text" name="postTitle" class="postTitle" placeholder="제목쓰던가말던가 쳇 ;;"/> <br/>

<div id="toolbar-container"></div>
	
<div id="editor">
	<p>글을 작성하시려면 여기를 클릭해주십쇼</p>
</div>

<button>등록</button>
</div>
<script>
    DecoupledEditor
        .create( document.querySelector( '#editor' ) )
        .then( editor => {
            const toolbarContainer = document.querySelector( '#toolbar-container' );

            toolbarContainer.appendChild( editor.ui.view.toolbar.element );
        } )
        .catch( error => {
            console.error( error );
        } );
</script>

</body>
</html>