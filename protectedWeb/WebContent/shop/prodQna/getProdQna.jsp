<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- ////////////	Bootsrap, css ///////////////////////// -->

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container row">
        <div class="page-hearder col-md-offset-3" align=center">
        </div>
        <div class="col-sm-offset-9">
                <form action="" method="get">
                    <select name="search" id="">
                        <option value="writer">작성자</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchkeyword" id="search">
                    <input class="btn btn-sm btn-default" type="submit" value="검색">
                </form>
            </div>
        <div class="col-md-10 col-md-offset-3">
            <table class="table table-striped ">
                <tr class="text-center">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회</th>
                </tr>
                <tr>
                    <td class="col-sm-1">1</td>
                    <td><a href="#">안녕하세요. 질문있어요.</a></td>
                    <td>아노미7</td>
                    <td>2017.09.01</td>
                    <td class="col-sm-1">10</td>
                </tr>
            </table>
        </div>
        <div class="btn-group col-md-offset-12">
          <a href="#" class="btn btn-md btn-default">글쓰기</a>
        </div>
    </div>
</body>

</html>