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
#postTitle{
	padding-left: 120px;
	padding-right:120px;}
#id{
	padding-left: 80px;
	padding-right:80px;
}
#no{
	padding-left: 50px;
	padding-right:50px;
}
	

	</style>
<script type="text/javascript">
	
</script>
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<h1 align="center">
		상품 <small>Q & A
			<button class="mdl-button mdl-js-button mdl-button--primary">
				문의하기</button>
		</small>
	</h1><BR/>

	<!-- Primary-colored flat button -->


	<!--  table Start /////////////////////////////////////-->

		<table class="mdl-data-table mdl-js-data-table mdl-shadow--4dp" align="center">
  <thead>
    <tr>

		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric" align="center" id="no">글번호</th>
				<th align="left">질문형태</th>
				<th align="left" id="postTitle">글제목</th>
				<th align="left" id="id">문의자</th>
				<th align="left">등록일</th>

			</tr>
		</thead>

		<tbody>
			<c:set var="i" value="0" />
			<c:forEach var="product" items="${list}">
				<c:set var="i" value="${i+1}" />
				<tr>
					<td class="mdl-data-table__cell--non-numeric" align="center"></td>
					<td align="center"></td>



				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>