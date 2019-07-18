<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


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

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	border: 0px;
	border-spacing: 0px;
}

#title {
	width: 800px;
	/* 	 position:absolute; */
	/*     top:50%; left:50%; */
	/*     transform: translate(-50%, -50%); */
}

#postContent {
	width: 800px;
	/* 	 position:absolute; */
	/*     top:50%; left:50%; */
	/*     transform: translate(-50%, -50%); */
}

#qnaCode {
	width: 200px;
	position: absolute;
	/* 	top:50%; left:50%;  */
	left: 300px;
	textsize: 2;
}
</style>
<!-- ////////////////////java Script////////////////////////////// -->
<script type="text/javascript">
	//============= "등록"  Event 연결 =============
	$(function() {

		$("#addContent").on("click", function() {
			fncAddProduct();
		});
	});
	

	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$("a[href='#' ]").on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			$("form")[0].reset();
		});
	});

	function fncAddProduct() {
		//Form 유효성 검증

		$("form").attr("method", "POST").attr("action" , "/product/addProduct").submit();
	});
});	
</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<h1 align="center">
		상품 <small>문의하기 </small>
	</h1>
	<br />

	<!-- Primary-colored flat button -->
	<p align="center">
		<input type="text" class="form-control" name="postTitle" id="title"><BR />
		<textarea class="form-control" rows="6" id="postContent"
			name="postContent"></textarea>
	</p>
	<select class="form-control" id="qnaCode" name="qnaCode">
		<option>--------------------------</option>
		<option id="1">배송</option>
		<option id="2">상품</option>
		<option id="3">반품</option>
		<option id="4">교환</option>
		<option id="5">환불</option>
	</select>
	<br />
	<p align="center">
		<button type="button" class="btn btn-primary btn-lg" id="addContent">등록하기</button>
		<button type="button" class="btn btn-default btn-lg" href="#">취소</button>
	</p>


</body>
</html>