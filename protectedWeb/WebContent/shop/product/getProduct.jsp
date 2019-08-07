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
	<title>보호할개 · 스토어</title>
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
.form-group2 {
	padding-left: 420px;
	padding-right: 100px;
}
.form-group3 {
	padding-left: 465px;
	padding-right: 100px;
}
table {
	color: black;
	align: center;
}
</style>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->

</head>
<body>
	<!--================Header Menu Area =================-->

	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">

					<input type="hidden" name="price" value="${product.prodNo}" />

					<p />
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">

							<c:forEach var="i" begin="0" end="${fn:length(file)-1}" step="1">
								<c:if test="${i eq 0}">
									<li data-target="#carouselExampleIndicators"
										data-slide-to="${i}" class="active">
								</c:if>
								<c:if test="${!(i eq 0)}">
									<li data-target="#carouselExampleIndicators"
										data-slide-to="${i}">
								</c:if>
							</c:forEach>

						</ol>
						<div class="carousel-inner">


							<c:forEach var="name" items="${file}" varStatus="status">
								<c:if test="${status.first}">
									<c:set var="className" value="carousel-item active" />
								</c:if>
								<c:if test="${!(status.first)}">
									<c:set var="className" value="carousel-item" />
								</c:if>
								<div class="${className}">
									<img class="d-block w-100"
										src="/resources/file/fileShop/${product.mainFile}"
										height="450px;" />
										<input type="hidden" value="${product.prodNo}"/>
								</div>
							</c:forEach>

						</div>
					</div>

				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<div>
								<input type="hidden" value="${product.prodNo}" />
								<h3>${product.prodName}</h3>
								<del>
									<h6>
									<c:if test="${product.price > product.discountPrice}">
									<fmt:formatNumber value="${product.price}" pattern="#,###" />
										원</c:if>
										
									</h6>
								</del>

								<h2>
									<fmt:formatNumber value="${product.discountPrice}"
										pattern="#,###" />
									원
								</h2>

								<ul class="list">
									
								</ul>
								<p>
									원산지 : ${product.country}<br /> 제조사 : ${product.company}<br />
								</p>

								<input type="hidden" value="${product.prodNo }" />
								<form name="addcart">
								<input type="hidden" value="${product.prodNo }" />
								<input type="hidden" value="${user.id}"/>
								<table>
									<thead>
										<tr>
						
											<th><font size="2"> &nbsp;수량선택은 구매페이지에서 가능합니다</font></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											
										</tr>
									</tbody>
								</table>
								</form>

										
									<input type="hidden" name="prodNo" value="${product.prodNo}"/>
									<input type="hidden" name="discountPrice" value="${product.discountPrice}"/><br/>
<br/><br/><br/>
							<div class="action">
                <div class="title-but"><button class="btn btn-default" id="addorder" align="right">구매</button>
<!--                 <button class="btn btn-general btn-white" role="button"id="cartplus"><i class="fa fa-cart-plus"></i> 장바구니에 담기</button></div> -->
                </div>
              </div>
							 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	 <!--================Product Description Area =================-->
 <section class="product_description_area">
      <div class="container">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
          <li class="nav-item">
            <a
              class="nav-link active"
              id="home-tab"
              data-toggle="tab"
              href="#home"
              role="tab"
              aria-controls="home"
              aria-selected="true"
              >상품상세정보</a
            >
          </li>
<!--           <li class="nav-item"> -->
<!--             <a -->
<!--               class="nav-link" -->
<!--               id="profile-tab" -->
<!--               data-toggle="tab" -->
<!--               href="#profile" -->
<!--               role="tab" -->
<!--               aria-controls="profile" -->
<!--               aria-selected="false" -->
<!--               >상품 문의</a -->
<!--             > -->
<!--           </li> -->
<!--           <li class="nav-item"> -->
<!--             <a -->
<!--               class="nav-link" -->
<!--               id="contact-tab" -->
<!--               data-toggle="tab" -->
<!--               href="#contact" -->
<!--               role="tab" -->
<!--               aria-controls="contact" -->
<!--               aria-selected="false" -->
<!--               >배송/교환/반품</a -->
<!--             > -->
<!--           </li> -->
<!--           <li class="nav-item"> -->
<!--             <a -->
<!--               class="nav-link" -->
<!--               id="review-tab" -->
<!--               data-toggle="tab" -->
<!--               href="#review" -->
<!--               role="tab" -->
<!--               aria-controls="review" -->
<!--               aria-selected="false" -->
<!--               >구매후기</a -->
<!--             > -->
<!--           </li> -->
        </ul>
        <div class="tab-content" id="myTabContent">
          <div
            class="tab-pane fade show active"
            id="home"
            role="tabpanel"
            aria-labelledby="home-tab"
          >
            <p>
              ${product.prodDetail}
              
              <c:forEach var="name" items="${file}" varStatus="status">

							<c:if test="${!(status.first)}">
								<img class="d-block w-100"
									src="/resources/file/fileShop/${name.fileName}" />
							</c:if>

						</c:forEach>
            </p>
          </div>
          <div
            class="tab-pane fade"
            id="profile"
            role="tabpanel"
            aria-labelledby="profile-tab"
          >
            <div class="table-responsive">
              <table class="table">
                <tbody>
                  <tr>
                    <td>
<%-- <jsp:include page="/prodQna/listProdQna?order=1"></jsp:include>   --%>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- TAB THREE START/////////////////////////////////////// -->
          <div
            class="tab-pane fade"
            id="contact"
            role="tabpanel"
            aria-labelledby="contact-tab"
          >
            <div class="row">
              <div class="col-lg-6">
                <div class="comment_list">
                  <div class="review_item">
                    <div class="media">
                      <div class="d-flex">
                        <img
                          src="img/product/single-product/review-1.png"
                          alt=""
                        />
                      </div>
                      <div class="media-body">
                        <h4>Blake Ruiz</h4>
                        <h5>12th Feb, 2017 at 05:56 pm</h5>
                        <a class="reply_btn" href="#">Reply</a>
                      </div>
                    </div>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                      sed do eiusmod tempor incididunt ut labore et dolore magna
                      aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                      ullamco laboris nisi ut aliquip ex ea commodo
                    </p>
                  </div>
                  <div class="review_item reply">
                    <div class="media">
                      <div class="d-flex">
                        <img
                          src="img/product/single-product/review-2.png"
                          alt=""
                        />
                      </div>
                      <div class="media-body">
                        <h4>Blake Ruiz</h4>
                        <h5>12th Feb, 2017 at 05:56 pm</h5>
                        <a class="reply_btn" href="#">Reply</a>
                      </div>
                    </div>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                      sed do eiusmod tempor incididunt ut labore et dolore magna
                      aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                      ullamco laboris nisi ut aliquip ex ea commodo
                    </p>
                  </div>
                  <div class="review_item">
                    <div class="media">
                      <div class="d-flex">
                        <img
                          src="img/product/single-product/review-3.png"
                          alt=""
                        />
                      </div>
                      <div class="media-body">
                        <h4>Blake Ruiz</h4>
                        <h5>12th Feb, 2017 at 05:56 pm</h5>
                        <a class="reply_btn" href="#">Reply</a>
                      </div>
                    </div>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                      sed do eiusmod tempor incididunt ut labore et dolore magna
                      aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                      ullamco laboris nisi ut aliquip ex ea commodo
                    </p>
                  </div>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="review_box">
                  <h4>Post a comment</h4>
                  <form
                    class="row contact_form"
                    action="contact_process.php"
                    method="post"
                    id="contactForm"
                    novalidate="novalidate"
                  >
                    <div class="col-md-12">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          id="name"
                          name="name"
                          placeholder="Your Full name"
                        />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <input
                          type="email"
                          class="form-control"
                          id="email"
                          name="email"
                          placeholder="Email Address"
                        />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          id="number"
                          name="number"
                          placeholder="Phone Number"
                        />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <textarea
                          class="form-control"
                          name="message"
                          id="message"
                          rows="1"
                          placeholder="Message"
                        ></textarea>
                      </div>
                    </div>
                    <div class="col-md-12 text-right">
                      <button
                        type="submit"
                        value="submit"
                        class="btn submit_btn"
                      >
                        Submit Now
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div
            class="tab-pane fade"
            id="review"
            role="tabpanel"
            aria-labelledby="review-tab"
          >
            <div class="row">
              <div class="col-lg-6">
                <div class="row total_rate">
                  <div class="col-6">
                    <div class="box_total">
                      <h5>Overall</h5>
                      <h4>4.0</h4>
                      <h6>(03 Reviews)</h6>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="rating_list">
                      <h3>Based on 3 Reviews</h3>
                      <ul class="list">
                        <li>
                          <a href="#"
                            >5 Star
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i> 01</a
                          >
                        </li>
                        <li>
                          <a href="#"
                            >4 Star
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i> 01</a
                          >
                        </li>
                        <li>
                          <a href="#"
                            >3 Star
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i> 01</a
                          >
                        </li>
                        <li>
                          <a href="#"
                            >2 Star
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i> 01</a
                          >
                        </li>
                        <li>
                          <a href="#"
                            >1 Star
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i> 01</a
                          >
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="review_list">
                  <div class="review_item">
                    <div class="media">
                      <div class="d-flex">
                        <img
                          src="img/product/single-product/review-1.png"
                          alt=""
                        />
                      </div>
                      <div class="media-body">
                        <h4>Blake Ruiz</h4>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </div>
                    </div>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                      sed do eiusmod tempor incididunt ut labore et dolore magna
                      aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                      ullamco laboris nisi ut aliquip ex ea commodo
                    </p>
                  </div>

              <div class="col-lg-6">
                <div class="review_box">
                  <h4>구매후기</h4>
                  <p>Your Rating:</p>
                  <ul class="list">
                    <li>
                      <a href="#">
                        <i class="fa fa-star"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-star"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-star"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-star"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-star"></i>
                      </a>
                    </li>
                  </ul>
                  <p>Outstanding</p>
                  <form
                    class="row contact_form"
                    action="contact_process.php"
                    method="post"
                    id="contactForm"
                    novalidate="novalidate"
                  >
                    <div class="col-md-12">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          id="name"
                          name="name"
                          placeholder="Your Full name"
                        />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <input
                          type="email"
                          class="form-control"
                          id="email"
                          name="email"
                          placeholder="Email Address"
                        />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          id="number"
                          name="number"
                          placeholder="Phone Number"
                        />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <textarea
                          class="form-control"
                          name="message"
                          id="message"
                          rows="1"
                          placeholder="Review"
                        ></textarea>
                      </div>
                    </div>
                    <div class="col-md-12 text-right">
                      <button
                        type="submit"
                        value="submit"
                        class="btn submit_btn"
                      >
                        Submit Now
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    

    <!--================End Product Description Area =================-->
	<!-- footer Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<!-- footer End /////////////////////////////////////-->

	<!--================ End footer Area  =================-->

	<!-- Optional JavaScript -->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../../resources/get/js/jquery-3.2.1.min.js"></script>
	<script src="../../resources/get/js/popper.js"></script>
	<script src="../../resources/get/js/bootstrap.min.js"></script>
	<script src="../../resources/get/js/stellar.js"></script>
	<script src="../../resources/get/js/simpleLightbox.min.js"></script>
	<script src="../../resources/get/js/jquery.nice-select.min.js"></script>
	<script src="../../resources/get/js/imagesloaded.pkgd.min.js"></script>
	<script src="../../resources/get/js/isotope-min.js"></script>
	<script src="../../resources/get/js/owl.carousel.min.js"></script>
	<script src="../../resources/get/js/jquery.ajaxchimp.min.js"></script>
	<script src="../../resources/get/js/mail-script.js"></script>
	<script src="../../resources/get/js/jquery-ui.js"></script>
	<script src="../../resources/get/js/jquery.waypoints.min.js"></script>
	<script src="../../resources/get/js/jquery.counterup.js"></script>
	<script src="../../resources/get/js/theme.js"></script>

	<script type="text/javascript">
	var prodNo = ${product.prodNo};
	
	
	//==================장바구니 추가 ===============================
	$(function() {
		$("#cartplus").on("click", function() {
			alert($("form[name='addcart']").html());
			$("form[name='addcart']").attr("method","POST").attr("action" , "/cart/addCart").submit();
		});
	});
		
		//============= 상품정보 GET/UPDATE Event  처리 =============
		$(function() {
			//manage//====================================================
			$("button:contains('확인')").on("click", function() {
				//Debug..
				console.log($("td.ct_btn01:contains('확인')").html());
				/* self.location = "/product/listProduct/manage" */
				self.location = "/product/listProduct"
			});
			$("button:contains('수정')").on("click", function() {
				//Debug..
				console.log($("button:contains('수정')").html());
				history.go(-1);
			});
			
			//구매하기//====================================================
			$("#addorder").on("click", function() {
				//Debug..
				self.location = "/order/addOrder?prodNo=${product.prodNo}"
			});
			$("button:contains('뒤로')").on("click", function() {
				//Debug..
				console.log($("button:contains('뒤로')").html());
				self.location = "/product/listProduct"
			});
		});
// 		//=============장바구니 이동========================================
		$(document).ready(function() {
 			const p = $("#price").data('price');
 			$("#quantity").change(function() {
 				const q = $(this).find(':selected').data('quantity');
 				const total = p * q;
				$("#total").text(total);
 			});
 		});
	</script>
</body>
</html>