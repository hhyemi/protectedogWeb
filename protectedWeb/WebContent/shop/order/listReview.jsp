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


</head>
<body>

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
							<h4>김길동씨</h4>
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i>
						</div>
					</div>
					<table>
						<tbody>
							<tr>
								<td>
									<p class="excerpt">
										강장공장 공장장은 강공장장은가 안깐? 글자수 테스트 리뷰 더보기를 위한 글자수 테스트중입니다. 퐁당폳앙 글자수
										테스트 중입니다 글자수 테스트 중입니다. 글자수 테스트 중입니다 글자수 테스트중입니다 글자수 테스트중입니다
										글자수 테스트중입니다. 글자수 테스트 중입니다. 글자수 글자수 말이요강장공장 공장장은 강공장장은가 안깐? 글자수
										테스트 리뷰 더보기를 위한 글자수 테스트중입니다. 퐁당폳앙 글자수 테스트 중입니다 글자수 테스트 중입니다.
										글자수 테스트 중입니다 글자수 테스트중입니다 글자수 테스트중입니다 글자수 테스트중입니다. 글자수 테스트
										중입니다. 글자수 글자수 말이요 <img
											src="/resources/file/fileMarket/d28c5848607433aa91bc6b3d02eac6b3b509e0b7889d0dcdffff156d08c032d5.jpg">
									</p>
								</td>
							</tr>
						</tbody>
					</table>

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

