<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->

<!DOCTYPE html>
<html>

<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>보호할개 : 메시지함 </title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/apps/email.css">
    
    <jsp:include page="/layout/toolbar.jsp"></jsp:include>
</head>

<body> 

<!--====================================================
                         MAIN NAVBAR
======================================================-->        
    <header class="header">
        
    </header>

<!--====================================================
                        PAGE CONTENT
======================================================-->
    <div class="page-content d-flex align-items-stretch">

        <!--***** SIDE NAVBAR *****-->
		<jsp:include page="/users/mypage/userSideBar.jsp"></jsp:include>

            <!--***** MAILBOX *****-->     
            <div class="row" id="emails">
                <div class="mail-box">
                    <aside class="sm-side"> 
                        <div class="inbox-body">
                            <a href="#messageModal" data-toggle="modal" title="Compose" class="btn btn-compose"> 쪽지작성 </a>
                            <!-- Modal -->
                            
                            <!-- /.modal -->
                        </div>
                        <ul class="inbox-nav inbox-divider">
                            <li class="active">
                                <a href="#"><i class="fa fa-inbox"></i> Inbox <span class="label label-danger pull-right">2</span></a>
                            </li>
                            <li>
                                <a href="/message/listSendMessage"><i class="fa fa-envelope-o"></i> Sent Mail</a>
                            </li>
                            <li>
                                <a href="/message/listReceiveMessage"><i class="fa fa-envelope-o"></i> Received Mail</a>
                            </li>
<!--                             <li> -->
<!--                                 <a href="#"><i class="fa fa-bookmark-o"></i> Important</a> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <a href="#"><i class=" fa fa-external-link"></i> Drafts <span class="label label-info pull-right">30</span></a> -->
<!--                             </li> -->
                            <li>
                                <a href="#"><i class=" fa fa-trash-o"></i> Trash</a>
                            </li>
                        </ul>  
                    </aside>
                    <aside class="lg-side"> 
                        <div class="inbox-body">
                            <div class="mail-option"> 
                                <div class="btn-group hidden-phone">
                                    <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false">
                                         <input type="checkbox" class="mail-checkbox mail-group-checkbox"> All 
                                         <i class="fa fa-angle-down "></i>
                                     </a>
                                    <ul class="dropdown-menu drop-inbox">
                                        <li><a href="#"><i class="fa fa-pencil"></i> All</a></li>
                                        <li><a href="#"><i class="fa fa-ban"></i> None</a></li>
                                        <li><a href="#"><i class="fa fa-book"></i> Read</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#"><i class="fa fa-trash-o"></i> Unread</a></li>
                                    </ul>
                                </div>
                                <div class="btn-group">
                                    <a data-original-title="Refresh" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips">
                                     <i class=" fa fa-refresh"></i>
                                 </a>
                                </div>
                                <div class="btn-group hidden-phone">
                                    <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false">
                                     More
                                     <i class="fa fa-angle-down "></i>
                                 </a>
                                    <ul class="dropdown-menu drop-inbox">
                                        <li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
                                        <li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
                                    </ul>
                                </div>
                                <div class="btn-group">
                                    <a data-toggle="dropdown" href="#" class="btn mini blue">
                                     Move to
                                         <i class="fa fa-angle-down "></i>
                                    </a>
                                    <ul class="dropdown-menu drop-inbox">
                                        <li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
                                        <li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
                                    </ul>
                                </div>
                                <ul class="unstyled inbox-pagination">
                                    <li><span>1-50 of 234</span></li>
                                    <li>
                                        <a class="np-btn" href="#"><i class="fa fa-angle-left  pagination-left"></i></a>
                                    </li>
                                    <li>
                                        <a class="np-btn" href="#"><i class="fa fa-angle-right pagination-right"></i></a>
                                    </li>
                                </ul>
                            </div>
                            <table class="table table-inbox table-hover">
								<thead>
									<tr align="center">
									    <td class="inbox-small-cells" width="50px">
                                            <input type="checkbox" class="mail-checkbox">
                                        </td>
										<th width="100px">보낸사람</th>
										<th width="300px" class="text-center">제목</th>
										<th width="200px" align="center" class="text-center">보낸일시</th>
										<th width="200px" align="center" class="text-center">받은일시</th>
										<th width="75px">더보기</th>				
									</tr>
								</thead>
                                <tbody>
                                	<c:set var="i" value="0" />
									<c:forEach var="message" items="${list}">
                                    <tr class="">
                                        <td class="inbox-small-cells" width="50px">
                                            <input type="checkbox" class="mail-checkbox">
                                        </td>
                                        <td class="view-message dont-show" width="100px">${ message.senderId }</td>
                                        <td class="view-message text-center" width="300px"> ${ message.messageTitle } </td>
                                        <td class="view-message text-right" width="200px"> 
											<fmt:formatDate value="${ message.sendDate }" pattern="yy.MM.dd hh:mm:ss"/>
										</td>
                                        <td class="view-message text-right" width="200px">
                                        <c:if test="${ message.messageStatus == 0 }">
                                        	읽지 않음
                                        </c:if>
                                        <c:if test="${ message.messageStatus != 0 }">
                                        	<fmt:formatDate value="${ message.receiveDate }" pattern="yy.MM.dd hh:mm:ss"/>
                                        </c:if>
                                        </td>
                                        <td class="view-message text-center" width="75px">더보기</td>
                                    </tr>
									</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </aside>
                </div>
            </div> 

        </div>
    </div> 
    
    <jsp:include page="/common/modal/modalMessage.jsp"></jsp:include>

    <!--Global Javascript -->
    <script src="/resources/newTemplate/admin/js/jquery.min.js"></script>
    <script src="/resources/newTemplate/admin/js/popper/popper.min.js"></script>
    <script src="/resources/newTemplate/admin/js/tether.min.js"></script>
    <script src="/resources/newTemplate/admin/js/bootstrap.min.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.cookie.js"></script>
    <script src="/resources/newTemplate/admin/js/jquery.validate.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/chart.min.js"></script> 
    <script src="/resources/newTemplate/admin/js/front.js"></script> 
    
    <!--Core Javascript -->
    <script>

    </script>
    
</body>

</html>