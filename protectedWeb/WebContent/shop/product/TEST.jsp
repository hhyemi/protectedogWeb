<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
img.bg {
	/* 브라우저의 크기에 맞게 전체 화면에 맞춘다. */
	min-height: 100%;
	min-width: 1024px;
	/* 크기를 화면전체로 지정해준다. */
	width: 100%;
	height: auto;
	/* 스크롤해도 배경이미지는 고정 */
	position: fixed;
	/* absolute;로 하면 배경도 스크롤 되지만 부자연스러워 진다. */
	top: 0;
	left: 0;
}

@media screen and (max-width: 1024px) {
	/* 그림을 브라우저의 중앙에 맞춘다. -512는 1024 의 반값으로 중앙정렬을
위한 것이다. */
	img.bg {
		left: 50%;
		margin-left: -512px;
	}
}

div#container {
	/* relative; 가 필수, 안하면 화면이 커지지 않는다. */
	position: relative;
}

#font { color: #ffffff}


/* fade in 효과*/
.bg{
    animation: fadein 2s;
    -moz-animation: fadein 2s; /* Firefox */
    -webkit-animation: fadein 2s; /* Safari and Chrome */
    -o-animation: fadein 2s; /* Opera */
}
@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity:0;
    }
    to {
        opacity: 1;
    }
    
</style>
</head>
<body>

	<img class="bg"
		src="/resources/img/bg-img/los-angeles-commercial-dog-photographer-for-pet-brands-23.jpg"
		alt="" />
	<div id="container">
	<br/>
	&nbsp;&nbsp;<img src="/resources/file/others/favicon.png" alt="logo" height="40px" width="40px">&ensp;<span id="font">보호할개</span>
	</div>


</body>
</html>

