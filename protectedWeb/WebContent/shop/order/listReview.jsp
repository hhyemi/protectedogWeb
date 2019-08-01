<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Bootstrap CSS -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/get/css/bootstrap.css" />
<link rel="stylesheet" href="/resources/get/css/icon/style.css" />
<link rel="stylesheet" href="/resources/get/css/font-awesome.min.css" />
<link rel="stylesheet" href="/resources/get/css/themify-icons.css" />
<link rel="stylesheet" href="/resources/get/css/owl.carousel.min.css" />
<link rel="stylesheet" href="/resources/get/css/simpleLightbox.css" />
<link rel="stylesheet" href="/resources/get/css/nice-select.css" />
<link rel="stylesheet" href="/resources/get/css/animate.css" />
<link rel="stylesheet" href="/resources/get/css/jquery-ui.css" />
<!-- main css -->
<link rel="stylesheet" href="/resources/get/css/style.css" />
<link rel="stylesheet" href="/resources/get/css/responsive.css" />
<!-- KAKAO -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<style>

/* normal formating */
#table {
	margin: 0 auto;
	width: 680px;
	font-family: arial;
	font-size: 12px;
	color: #333;
}

#table .row {
	margin: 15px 0 5px 0;
	border-bottom: 1px dotted #c4c4c4;
}

#table .img {
	width: 160px;
	height: 100px;
	float: left;
}

#table .img img {
	width: 160px;
	height: 100px;
	border: 2px solid #333;
}

#table .desc {
	width: 500px;
	height: 120px;
	float: right;
}

#table .desc a {
	color: #2a8cba;
	text-decoration: none;
}

#table .desc span {
	width: 50px;
}

#table h2 {
	font-size: 20px;
	margin: 0 0 5px 0;
	padding: 0;
}

#table h2 a {
	text-decoration: none;
}

.clear {
	clear: both
}
</style>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->
	<!--================Header Menu Area =================-->

	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">

			<div class="review_list">
				<div class="review_item">
					<div class="media">
						<div class="d-flex">
							<img src="img/product/single-product/review-1.png" alt="" />
						</div>
						<div class="media-body">
							<h4>Blake Ruiz</h4>
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
					</div>
					<table>
						<tbody>
							<tr>
							<td>
								<p class="excerpt">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit, sed do eiusmod tempor incididunt ut labore et
									dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
									exercitation ullamco laboris nisi ut aliquip ex ea commodoClass
									aptent taciti sociosqu ad litora torquent per conubia nostra,
									per inceptos himenaeos. Sed molestie augue sit amet leo
									consequat posuere. Vestibulum ante ipsum primis in faucibus
									orci luctus et ultrices posuere cubilia Curae; Proin vel ante a
									orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet,
									consectetur adipiscing elit. Vivamus luctus urna sed urna.</p>
					</td></tr></tbody></table>

					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>



	<!-- SCRIPT -->
	<script>
		$(function() {

			// Grab all the excerpt class
			$('.excerpt').each(function() {

				// Run formatWord function and specify the length of words display to viewer
				$(this).html(formatWords($(this).html(), 30));

				// Hide the extra words
				$(this).children('span').hide();

				// Apply click event to read more link
			}).click(function() {

				// Grab the hidden span and anchor
				var more_text = $(this).children('span.more_text');
				var more_link = $(this).children('a.more_link');

				// Toggle visibility using hasClass
				// I know you can use is(':visible') but it doesn't work in IE8 somehow...
				if (more_text.hasClass('hide')) {
					more_text.show();
					more_link.html(' &raquo; hide');
					more_text.removeClass('hide');
				} else {
					more_text.hide();
					more_link.html(' &laquo; more');
					more_text.addClass('hide');
				}

				return false;

			});
		});

		// Accept a paragraph and return a formatted paragraph with additional html tags
		function formatWords(sentence, show) {

			// split all the words and store it in an array
			var words = sentence.split(' ');
			var new_sentence = '';

			// loop through each word
			for (i = 0; i < words.length; i++) {

				// process words that will visible to viewer
				if (i <= show) {
					new_sentence += words[i] + ' ';

					// process the rest of the words
				} else {

					// add a span at start
					if (i == (show + 1))
						new_sentence += '... <span class="more_text hide">';

					new_sentence += words[i] + ' ';

					// close the span tag and add read more link in the very end
					if (words[i + 1] == null)
						new_sentence += '</span><a href="#" class="more_link"> &raquo; more</a>';
				}
			}

			return new_sentence;

		}
	</script>

</body>
</html>

