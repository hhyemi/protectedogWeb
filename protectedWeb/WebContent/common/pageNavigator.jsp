<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		<a style="font-size: 30px">¢¸</a>
</c:if>		
<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
		<a href="javascript:fncGetList('${ resultPage.currentPage-1}')" style="font-size: 30px">¢¸ </a>
</c:if>

<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
	<a href="javascript:fncGetList('${ i }');" style="font-size: 30px">&nbsp;${ i }&nbsp;</a>
</c:forEach>

<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
		<a style="font-size: 30px">¢º</a>
</c:if>
<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
		<a href="javascript:fncGetList('${resultPage.endUnitPage+1}')" style="font-size: 30px"> ¢º</a>
</c:if>