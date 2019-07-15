 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
	
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../../resources/get/css/bootstrap.css" />
    <link rel="stylesheet" href="../../resources/get/css/icon/style.css" />
    <link rel="stylesheet" href="../../resources/get/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../../resources/get/css/themify-icons.css" />
    <link rel="stylesheet" href="../../resources/get/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="../../resources/get/css/simpleLightbox.css" />
    <link rel="stylesheet" href="../../resources/get/css/nice-select.css" />
    <link rel="stylesheet" href="../../resources/get/css/animate.css" />
    <link rel="stylesheet" href="../../resources/get/css/jquery-ui.css" />
    <!-- main css -->
    <link rel="stylesheet" href="../../resources/get/css/style.css" />
    <link rel="stylesheet" href="../../resources/get/css/responsive.css" />
  </head>

  <body>
    
    <!--================Header Menu Area =================-->

    

    <!--================Single Product Area =================-->
    <div class="product_image_area">
      <div class="container">
        <div class="row s_product_inner">
          <div class="col-lg-6">
            <div class="s_product_img">
              <div
                id="carouselExampleIndicators"
                class="carousel slide"
                data-ride="carousel"
              >
                <ol class="carousel-indicators">
                  <li
                    data-target="#carouselExampleIndicators"
                    data-slide-to="0"
                    class="active"
                  >
                    <img
                      src="images/get/img/product/single-product/s-product-s-2.jpg"
                      alt=""
                    />
                  </li>
                  <li
                    data-target="#carouselExampleIndicators"
                    data-slide-to="1"
                  >
                    <img
                      src="images/get/img/product/single-product/s-product-s-3.jpg"
                      alt=""
                    />
                  </li>
                  <li
                    data-target="#carouselExampleIndicators"
                    data-slide-to="2"
                  >
                    <img
                      src="images/get/img/product/single-product/s-product-s-4.jpg"
                      alt=""
                    />
                  </li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img
                      class="d-block w-100"
                      src="resources/get/img/10000.jpg"
                      alt="First slide"
                    />
                  </div>
                  <div class="carousel-item">
                    <img
                      class="d-block w-100"
                      src="resources/get/img/10000.jpg"
                      alt="Second slide"
                    />
                  </div>
                  <div class="carousel-item">
                    <img
                      class="d-block w-100"
                      src="resources/get/img/10000.jpg"
                      alt="Third slide"
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-5 offset-lg-1">
            <div class="s_product_text">
              <h3>${product.prodName}</h3>
              <h2>판매가 : ${product.price}</h2>
              <ul class="list">
                <li>
                  <a class="active" href="#">
                    <span>Category</span> : Adult</a
                  >
                </li>
                <li>
                   <a href="#"> <span>원산지</span> : ${product.country} &nbsp;&nbsp;${product.discountPrice}</a>
                </li>
                <li>
                   <a href="#"> <span>제조사</span> : ${product.company}</a>
                </li>
                <li>
                   <a href="#"> <span>기본적립금</span> :</a>
                </li>
              </ul>
              <p>
              </p>
              <div class="product_count" id>
                <label for="qty">수량 : </label>
                <input
                  type="text"
                  name="qty"
                  id="sst"
                  maxlength="20"
                  value="1"
                  title="Quantity:"
                  class="input-text qty"
                />
                <button
                  onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                  class="increase items-count"
                  type="button"
                >
                  <i class="lnr lnr-chevron-up"></i>
                </button>
                <button
                  onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                  class="reduced items-count"
                  type="button"
                >
                  <i class="lnr lnr-chevron-down"></i>
                </button>
              </div>
              <div class="card_area">
                <a class="main_btn" href="#">장바구니 담기</a>
                <a class="icon_btn" href="#">
                  <i class="lnr lnr lnr-diamond"></i>
                </a>
                <a class="icon_btn" href="#">
                  <i class="lnr lnr lnr-heart"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   <br><br><br/>
    <!--================End Single Product Area =================-->

   <jsp:include page="./getunder.jsp" />
    <!--================End Product Description Area =================-->

    <!--================ start footer Area  =================-->
    
    <!--================ End footer Area  =================-->

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
  </body>
</html>
