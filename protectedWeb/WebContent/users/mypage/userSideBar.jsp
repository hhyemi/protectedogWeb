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
<!--                 <li><a href="index.html"><i class="icon-home"></i>내정보보기</a></li> -->
                <li><a href="/users/getUsers?id=${ sessionScope.user.id }"><i class="icon-home"></i>내정보보기</a>
<!--                     <ul id="apps" class="collapse list-unstyled"> -->
<!--                         <li><a href="calendar.html">Calendar</a></li>  -->
<!--                         <li><a href="email.html">Email</a></li>  -->
<!--                         <li><a href="media.html">Media</a></li>  -->
<!--                         <li><a href="invoice.html">Invoice</a></li>  -->
<!--                     </ul> -->
                </li>
<!--                 <li><a href="chart.html"> <i class="fa fa-bar-chart"></i>쪽지함</a></li> -->
                <li><a href="/message/listMessage?searchCondition=receive"><i class="fa fa-bar-chart"></i>쪽지함</a>
<!--                     <ul id="forms" class="collapse list-unstyled"> -->
<!--                         <li><a href="basic-form.html">Basic Form</a></li>  -->
<!--                         <li><a href="form-layouts.html">Form Layouts</a></li>  -->
<!--                     </ul> -->
                </li>
<!--                 <li><a href="maps.html"> <i class="fa fa-map-o"></i>마이페이지</a></li> -->
                <li><a href="#pages" aria-expanded="false" data-toggle="collapse"><i class="fa fa-map-o"></i>마이페이지</a>
                    <ul id="pages" class="collapse list-unstyled">
                        <li><a href="#">댓글이력조회</a></li> 
                        <li><a href="#">적립금내역조회</a></li> 
                        <li><a href="#">구매이력조회</a></li> 
                        <li><a href="#">후원이력조회</a></li> 
                        <li><a href="#">입양신청조회</a></li> 
                        <li><a href="#">관심목록조회</a></li> 
                        <li><a href="#">후기이력조회</a></li> 
                        <li><a href="#">쿠폰이력조회</a></li> 
                    </ul>
                </li>
<!--                 <li> <a href="tables.html"> <i class="icon-grid"></i>Tables </a></li>  -->
<!--                 <li><a href="#elements" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-globe"></i>UI Elements </a> -->
<!--                     <ul id="elements" class="collapse list-unstyled"> -->
<!--                         <li><a href="ui-buttons.html">Buttons</a></li>  -->
<!--                         <li><a href="ui-cards.html">Cards</a></li>  -->
<!--                         <li><a href="ui-progressbars.html">Progress Bar</a></li>  -->
<!--                         <li><a href="ui-timeline.html">Timeline</a></li>   -->
<!--                     </ul> -->
<!--                 </li> -->
<!--             </ul><span class="heading">Extras</span> -->
<!--             <ul class="list-unstyled">  -->
<!--                 <li> <a href="#"> <i class="icon-picture"></i>Demo </a></li> -->
<!--             </ul> -->
        </nav>

</body>
</html>