<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

        <nav class="side-navbar">
            <div class="sidebar-header d-flex align-items-center">
            	<c:if test="${ user.profile != null }">
                <div class="avatar"><img src="/resources/file/fileUser/${ user.profile }" alt="..." class="img-fluid rounded-circle"></div>
                </c:if>
                <c:if test="${ user.profile == null }">
                <div class="avatar"><img src="/resources/file/others/anonymous-250.jpg" alt="..." class="img-fluid rounded-circle"></div>
                </c:if>
                <div class="title">
                    <h1 class="h4">${ user.nickname }</h1>
                </div>
            </div>
            <hr>
            <!-- Sidebar Navidation Menus-->
            <ul class="list-unstyled">
                <li><a href="/users/getUsers?id=${ sessionScope.user.id }"><i class="icon-home"></i>내정보보기</a>

                </li>
                <li><a href="/message/listMessage?searchCondition=receive"><i class="fa fa-bar-chart"></i>쪽지함</a>

                </li>
                
                <c:if test="${ sessionScope.user.role eq 'admin' }">
                <li><a href="/report/listReport"><i class="fa fa-map-o"></i>신고글목록</a>
                </li>
                </c:if>
			</ul>
        </nav>

</body>
</html>