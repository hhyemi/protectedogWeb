 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link href="/css/styles.css">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
        
        /* normal formating */
#table {
	margin:0 auto; 
	width:680px; 
	font-family:arial; 
	font-size:12px; 
	color:#333;
}

	#table .row {
		margin:15px 0 5px 0; 
		border-bottom:1px dotted #c4c4c4;
	}

	#table .img {
		width:160px; 
		height:100px; 
		float:left;
	}

	#table .img img {
		width:160px; 
		height:100px; 
		border:2px solid #333;
	}

	#table .desc {
		width:500px; 
		height:120px; 
		float:right;
	}
	
	#table .desc a {
		color:#2a8cba; 
		text-decoration:none;
	}
		
	#table .desc span {
		width:50px;
	}

	#table h2 {
		font-size:20px; 
		margin:0 0 5px 0; 
		padding:0;
	}
#table h2 a {text-decoration:none;}
.clear {clear:both}
     </style>
        <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function () {

		// Grab all the excerpt class
		$('.excerpt').each(function () {
		
			// Run formatWord function and specify the length of words display to viewer
			$(this).html(formatWords($(this).html(), 30));
			
			// Hide the extra words
			$(this).children('span').hide();
		
		// Apply click event to read more link
		}).click(function () {

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
				if (i == (show + 1)) new_sentence += '... <span class="more_text hide">';		

				new_sentence += words[i] + ' ';
			
				// close the span tag and add read more link in the very end
				if (words[i+1] == null) new_sentence += '</span><a href="#" class="more_link"> &raquo; more</a>';
			} 		
		} 

		return new_sentence;

	}	
	</script>
	
</head>

<body>

<div class="row">
	<div class="img">
		<a href="http://www.link.com"><img src="images.gif" alt="" /></a>
	</div>
	<div class="desc">
		<h2><a href="http://www.link.com/">리뷰테스트</a></h2>
		<p class="excerpt"></p>
	</div>
	<div class="clear"></div>
	</div>
	

</body>

</html>