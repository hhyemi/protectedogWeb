<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
        
        #personalpic{
        width : 100px;
        
        }
        
        #reviewfirst{
        font-size : 12px;
        }
        
        
        #grade{
        text-align:righet;
        }
        
        #reviewpic{
        width : 100px;
        align: right;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/review/listReview").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 //$( "button.btn.btn-default" ).on("click" , function() {
			//	fncGetUserList(1);
			//});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?userId="+$(this).text().trim();
			});
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
	
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>Review</h3>
	    </div>	
      <!--  review Start  /////////////////////////////////////-->
      <div class="container"id="reviewfirst">
      <img src="../resources/prodmenu/images/person_4.jpg" class="img-circle" id="personalpic" align="left"><br>&nbsp;&nbsp;&nbsp;스캇
      
      <br>&nbsp;&nbsp;&nbsp; 2019년06월
      <div class="rating">
													<p class="text-right">
														<a href="#"><span class="ion-ios-star-outline"></span></a>
														<a href="#"><span class="ion-ios-star-outline"></span></a>
														<a href="#"><span class="ion-ios-star-outline"></span></a>
														<a href="#"><span class="ion-ios-star-outline"></span></a>
														<a href="#"><span class="ion-ios-star-outline"></span></a>
													</p>
												</div>
      <br clear="left">
  <p class="text-right"><img src="../resources/get/img/10000.jpg" alt="..." class="img-rounded" id="reviewpic" align="right"></p>    
      물품에 대한 리뷰를 씁니다. 물품이나 정보에 대한 리뷰를 기입합니다 물품에 대한 리뷰를 씁니다. 물품이나 정보에 대한 리뷰를 기입합니다 물품에 대한 리뷰를 씁니다. 물품이나 정보에 대한 리뷰를 기입합니다 물품에 대한 리뷰를 씁니다. 
      물품이나 정보에 대한 리뷰를 기입합니다물품에 대한 리뷰를 씁니다. 물품이나 정보에 대한 리뷰를 기입합니다물품에 대한 리뷰를 씁니다. 물품이나 정보에 대한 리뷰를 기입합니다물품에 대한 리뷰를 씁니다. 
      물품이나 정보에 대한 리뷰를 기입합니다           ▼ 펼치기
      <br clear="left">
      <br>
      <hr>
      
     <!--////////////////////////////////////review End //////// -->
     
      <!--  review Start  /////////////////////////////////////-->
      <div class="container"id="reviewfirst">
      <img src="../resources/prodmenu/images/person_4.jpg" class="img-circle" id="personalpic" align="left"><br>&nbsp;&nbsp;&nbsp;스캇
      
      <br>&nbsp;&nbsp;&nbsp; 2019년06월
      <div class="rating">
													<p class="text-right">
														<a href="#"><span class="ion-ios-star-outline"></span></a>
														<a href="#"><span class="ion-ios-star-outline"></span></a>
														<a href="#"><span class="ion-ios-star-outline"></span></a>
														<a href="#"><span class="ion-ios-star-outline"></span></a>
														<a href="#"><span class="ion-ios-star-outline"></span></a>
													</p>
												</div>
      <br clear="left">
  <p class="excerpt"><img src="../resources/get/img/10000.jpg" alt="..." class="img-rounded" id="reviewpic" align="right">    
      사각형의내부의사각형의내부의사각형의내부의사각형의내부의사각형 사각이난원운동의사각이난원운동의사각이난원 비누가통과하는혈관의비눗내를투시하는사람 지구를모형으로만들어진
      지구의를모형으로만들어진지구 거세된양말(그여인의이름은워어즈였다) 빈혈면포,당신의얼굴빛깔도참새다리같습네다 평행사변형대각선방향을추진하는막대한중량 마르세이유의봄을해람한코티의향수의맞이한동양의가을
      쾌청의공중에붕유하는Z백호.회충양약이라고씌어져있다 옥상정원.원후를흉내내이고있는마드모아젤 v만곡된직선을직선으로질주하는낙체공식 시계문자반에?에내리워진일개의침수된황혼 도어-의내부의도어-의내부의조롱의내부의카나리아의내부의감살문호의내부의인사
      식당의문깐에방금도달한자웅과같은붕우가헤어진다 잉크가엎질러진각설탕이삼륜차에적하(積荷)된다 명함을짓밟는군용장화.가구를질구하는조화분연 위에서내려오고밑에서올라가고위에서내려오고밑에서올라간사람은
      밑에서올라가지아니한위에서내려오지아니한밑에서올라가지아니한위에서내려오지아니한사람 저여자의하반은저남자의상반에흡사하다(나는애련한후에애련하는나) 사각이난케이스가걷기시작이다(소름이끼치는일이다)
      라지에터의근방에서승천하는굳바이 바깥은우중.발광어류의군집이동 </p>          
      
      <br clear="left">
      <br>
      <hr>
      
     <!--////////////////////////////////////review End //////// -->
     
     <!-- 접기 start///////////////////////////////////////////////// -->
     
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
      
      
      
      
      

      
      </div>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	</div>
 	  <!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
    
    <!--================ start footer Area  =================-->
    <!-- footer Start /////////////////////////////////////-->
	 <jsp:include page="/layout/footer.jsp"></jsp:include>
   	<!-- footer End /////////////////////////////////////-->  
    <!--================ End footer Area  =================-->
	
</body>

</html>