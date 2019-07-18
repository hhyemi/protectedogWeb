<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	
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
       body{
             border:0px; border-spacing:0px;
        }
    </style>
 <script type="text/javascript">
 <script type="text/javascript">
	//============= "등록"  Event 연결 =============
	
	$("#addproduct").on("click", function(){
		 self.location = "/shop/product/addProduct.jsp"

	
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

</script> 
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" /> 
   	<!-- ToolBar End /////////////////////////////////////-->
	
	       <h1 align="center">관리자 <small>상품 등록내역 조회<button class="mdl-button mdl-js-button mdl-button--primary" id="addProduct">
  상품등록
</button></small></h1><br/>
	       
	       <!-- Primary-colored flat button -->

	
		<!--  table Start /////////////////////////////////////-->
      <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" align="center">
   
      <thead>
    <tr>
      <th class ="mdl-data-table__cell--non-numeric" align="center" >No</th>
            <th align="left">상품번호</th>
            <th align="left">상품명 </th>
            <th align="left">상품가격</th>
            <th align="left">제조사</th>
            <th align="left">원산지</th>
             <th align="left">상품제조일자</th>
             <th align="left">상품등록일</th>
             <th align="left">재고수량</th>
             <th align="left">상품코드</th>
             <th align="left">할인액</th>
    </tr>
        </thead>
        
			<tbody>
	<c:set var="i" value="0"/>
		<c:forEach var = "product" items="${list}">
		<c:set var="i" value="${i+1}" />
    <tr>
      <td class="mdl-data-table__cell--non-numeric" align="center">${product.prodNo}</td>
      <td align="center">${product.prodName}</td>
      <td align="center">${product.price}</td>
      <td align="center">${product.company}</td>
       <td align="center">${product.country}</td>
        <td align="center">${product.manuDate}</td>
         <td align="center">${product.regDate}</td>
          <td align="center">${product.quantity }</td>
          <td align="center">${product.prodCode }</td>
          <td align="center">${product.discountPrice }</td>
           
        
    </tr>
    	</c:forEach>
  </tbody>
	</table>
	
</body>
</html>