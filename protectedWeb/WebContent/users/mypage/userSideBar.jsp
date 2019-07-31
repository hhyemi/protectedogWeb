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
                <li> <a href="index.html"><i class="icon-home"></i>Home</a></li>
                <li><a href="#apps" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Apps </a>
                    <ul id="apps" class="collapse list-unstyled">
                        <li><a href="calendar.html">Calendar</a></li> 
                        <li><a href="email.html">Email</a></li> 
                        <li><a href="media.html">Media</a></li> 
                        <li><a href="invoice.html">Invoice</a></li> 
                    </ul>
                </li>
                <li> <a href="chart.html"> <i class="fa fa-bar-chart"></i>Chart </a></li>
                <li><a href="#forms" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-building-o"></i>Forms </a>
                    <ul id="forms" class="collapse list-unstyled">
                        <li><a href="basic-form.html">Basic Form</a></li> 
                        <li><a href="form-layouts.html">Form Layouts</a></li> 
                    </ul>
                </li>
                <li> <a href="maps.html"> <i class="fa fa-map-o"></i>Maps </a></li>
                <li><a href="#pages" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-file-o"></i>Pages </a>
                    <ul id="pages" class="collapse list-unstyled">
                        <li><a href="faq.html">FAQ</a></li> 
                        <li><a href="empty.html">Empty</a></li> 
                        <li><a href="gallery.html">Gallery</a></li> 
                        <li><a href="login.html">Log In</a></li> 
                        <li><a href="register.html">Register</a></li> 
                        <li><a href="search-result.html">Search Result</a></li> 
                        <li><a href="404.html">404</a></li> 
                    </ul>
                </li>
                <li> <a href="tables.html"> <i class="icon-grid"></i>Tables </a></li> 
                <li><a href="#elements" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-globe"></i>UI Elements </a>
                    <ul id="elements" class="collapse list-unstyled">
                        <li><a href="ui-buttons.html">Buttons</a></li> 
                        <li><a href="ui-cards.html">Cards</a></li> 
                        <li><a href="ui-progressbars.html">Progress Bar</a></li> 
                        <li><a href="ui-timeline.html">Timeline</a></li>  
                    </ul>
                </li>
            </ul><span class="heading">Extras</span>
            <ul class="list-unstyled"> 
                <li> <a href="#"> <i class="icon-picture"></i>Demo </a></li>
            </ul>
        </nav>

</body>
</html>