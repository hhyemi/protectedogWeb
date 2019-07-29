<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    
    <title>보호할개</title>
    <link rel="shortcut icon" href="img/favicon.ico">
     
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    
    <!-- Core stylesheets -->
    <link rel="stylesheet" href="css/pages/404.css">
    
    <style type="text/css">
		
		#content {
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
    
    </style>

</head>

<body> 

<!--====================================================
                        PAGE CONTENT
======================================================--> 
<jsp:include page="/layout/toolbar.jsp"></jsp:include>
    <section class="hero-area">
        <div class="overlay"></div>
        <div class="container">
          <div class="row">
            <div class="col-md-12">
                <div class="block text-center">
                	<br/><br/><br/><br/><br/><br/><br/>
                	<img src="/resources/file/others/error.png" alt="logo" height="40px" width="40px"><br/>
                    <p><h2>페이지를 찾을 수 없습니다.</h2></p>
                    <div align="center" id="content">
                    	<div id="item">
                    		<p align="left">
                    			방문하시려는 페이지의 주소가 잘못 입력되었거나,<br/>
                    			페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br/>
                    			입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.<br/><br/>
                    		</p>
                    	</div>
                    </div>
                    
                    <button class="btn btn-default">이전 페이지로</button> 
                    
                </div>
            </div>
          </div>  
        </div>
    </section>
    
    <!--Global Javascript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
	    $( "button:contains('이전 페이지로')" ).on("click" , function() {
	    	window.history.back();
		});
    </script>
</body>

</html>