<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
<head>

<!--  meta  -->
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  ETC CDN -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
<!--  bootstrap CDN  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery JS -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  CSS -->
<style>
</style>

<title>정보공유</title>

<!-- JavaScript -->
<script type="text/javascript">

	$(function(){
		
		$(document).ready(function(){
			listNews();
		});
		
		$(document).on("click",".go",function(){
			
			window.open($(this).children("input").val(),"new","width=800, height=600o, top=100, left=100");
		});
	});
	
	function listNews(){
		
		$.ajax({
			url : "/News/json/listNews/",
			method : "POST",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=euc-kr",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json;charset=euc_kr"
			},
			success : function(JSONData, status) {
				
				console.log(JSON.stringify(JSONData));
				
				var list = JSONData.items;
					
				$.each(list, function(index, items) {
					
					console.log("index : " + index );
					console.log("items : " + JSON.stringify(items) );
					
					$(".newsListArea").append(
							"<h4>"
							+ "<span>"							
							+ "<a href='#' class='go'>"+items.title +" <small> &nbsp;새창으로</small>"
							+ "<input type='hidden' name='link' value='"+items.link+"'>"
							+"</a>"
							+ "<span>"
							+ "</h4>"
							+ "<h4>"+items.pubDate+"</h4>"
							+ "<div>"+items.description+"</div>"
							
							
					);
					
					
				});
					
				//alert("success");
				
			},
			error : function(request, status, error){	
			
				alert("error");

				
			}
		});
	}
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="newsListArea" align="left">
	
	</div>
	
	<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
