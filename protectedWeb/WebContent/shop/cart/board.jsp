
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
<link href="/css/styles.css">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">
.box {
	width: 94%;
	margin: 1%;
	display: inline-block;
	font-size: 0.96em;
	background-color:#E6E6E6;
	padding: 8px 8px;
	box-sizing: border-box;
	border-radius: 8px;
	color: #21637D;
	border: 1px solid #A8DCFF;
}
</style>
</head>
<body>

	<br>
	<div class="container">
		<h4>Q&A 글 조회</h4>
		<div class="pull-right mb5">
			<a href="/board" class="btn btn-info"> <span
				class="glyphicon glyphicon-user"></span> 목록으로
			</a>
		</div>
		<table class="table table-bordered mt5 table-hover">
			<tr>
				<th class="success" style="width: 15%">글번호</th>
				<td>게시판 디자인 테스트</td>
				<th class="success" style="width: 15%">작성자</th>
				<td>게시판티자인</td>
				<th class="success" style="width: 15%">시간</th>
				<td>게시판 디자인</td>
			</tr>
			<tr>
				<th class="success" style="width: 15%">제목</th>
				<td colspan="5">ㄹㅇㄴㄹㄴㅇㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ</td>
			</tr>
			<tr>
				<th class="success" style="width: 15%">내용</th>
				<td colspan="5">ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹ</td>
			</tr>
		</table>


		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<button class="btn btn-warning" disabled>수정하기</button>
				<button onclick="confirm('삭제하시겠습니까?')" class="btn btn-danger"
					disabled>삭제하기</button>
			</div>
		</div>
		<div class="row"></div>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>