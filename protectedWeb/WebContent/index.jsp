<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Core Stylesheets -->
	<link rel="stylesheet" href="/resources/newTemplate/css/shop.css">
    <title>보호할개</title>


 	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->   
</head><body>
<!--====================================================
                    LOGIN OR REGISTER
======================================================-->
<!--     <section id="login"> -->
<!--       <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;"> -->
<!--           <div class="modal-dialog"> -->
<!--               <div class="modal-content"> -->
<!--                   <div class="modal-header" align="center"> -->
<!--                       <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--                           <span class="fa fa-times" aria-hidden="true"></span> -->
<!--                       </button> -->
<!--                   </div> -->
<!--                   <div id="div-forms"> -->
<!--                       <form id="login-form"> -->
<!--                           <h3 class="text-center">Login</h3> -->
<!--                           <div class="modal-body"> -->
<!--                               <label for="username">Username</label>  -->
<!--                               <input id="login_username" class="form-control" type="text" placeholder="Enter username " required> -->
<!--                               <label for="username">Password</label>  -->
<!--                               <input id="login_password" class="form-control" type="password" placeholder="Enter password" required> -->
<!--                               <div class="checkbox"> -->
<!--                                   <label> -->
<!--                                       <input type="checkbox"> Remember me -->
<!--                                   </label> -->
<!--                               </div> -->
<!--                           </div> -->
<!--                           <div class="modal-footer text-center"> -->
<!--                               <div> -->
<!--                                   <button type="submit" class="btn btn-general btn-white">Login</button> -->
<!--                               </div> -->
<!--                               <div> -->
<!--                                   <button id="login_register_btn" type="button" class="btn btn-link">Register</button> -->
<!--                               </div> -->
<!--                           </div> -->
<!--                       </form> -->
<!--                       <form id="register-form" style="display:none;"> -->
<!--                           <h3 class="text-center">Register</h3> -->
<!--                           <div class="modal-body">  -->
<!--                               <label for="username">Username</label>  -->
<!--                               <input id="register_username" class="form-control" type="text" placeholder="Enter username" required> -->
<!--                               <label for="register_email">E-mailId</label>  -->
<!--                               <input id="register_email" class="form-control" type="text" placeholder="Enter eMail" required> -->
<!--                               <label for="register_password">Password</label>  -->
<!--                               <input id="register_password" class="form-control" type="password" placeholder="Password" required> -->
<!--                           </div> -->
<!--                           <div class="modal-footer"> -->
<!--                               <div> -->
<!--                                   <button type="submit" class="btn btn-general btn-white">Register</button> -->
<!--                               </div> -->
<!--                               <div> -->
<!--                                   <button id="register_login_btn" type="button" class="btn btn-link">Log In</button> -->
<!--                               </div> -->
<!--                           </div> -->
<!--                       </form> -->
<!--                   </div> -->
<!--               </div> -->
<!--           </div> -->
<!--       </div> -->
<!--     </section>       -->

<!--====================================================
                         HOME
======================================================-->
 <!-- CAROUSEL -->
    <section id="home-shop">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"
					class="active">
				</li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"
					class="active">
				</li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('https://images.squarespace-cdn.com/content/v1/53c5b010e4b0c3db71b3067c/1454110350784-40RPZEXV5HC5BIV6WGZU/ke17ZwdGBToddI8pDm48kB6N0s8PWtX2k_eW8krg04V7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1URWK2DJDpV27WG7FD5VZsfFVodF6E_6KI51EW1dNf095hdyjf10zfCEVHp52s13p8g/los-angeles-commercial-dog-photographer-for-pet-brands-1.jpg?format=2500w')">
					<div class="carousel-caption d-none d-md-block">
					<hgroup class="wow fadeInUp">
<!--                       <h1>protectedog <span ><a href="" class="typewrite" data-period="2000" data-type='[ " 보호할개", " 분양, 실종"," 스토리펀딩"," 정보공유"," 스토어"]'> -->
                        <span class="wrap"></span></a></span> </h1>        
                      <h3></h3>
                  </hgroup>
						<h3></h3>

					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('https://images.squarespace-cdn.com/content/v1/53c5b010e4b0c3db71b3067c/1454110459316-4PP6W716GBF23FCZT741/ke17ZwdGBToddI8pDm48kB6N0s8PWtX2k_eW8krg04V7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1URWK2DJDpV27WG7FD5VZsfFVodF6E_6KI51EW1dNf095hdyjf10zfCEVHp52s13p8g/purina-animal-photographer.jpg?format=2500w')">
					<div class="carousel-caption d-none d-md-block">
						<h3></h3>
					</div>
				</div>
			</div>
			<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('/resources/newTemplate/img/shop/shop-banner-2.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3></h3>
					</div>
				</div>
			</div>
			<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('/resources/newTemplate/img/shop/shop-banner-2.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>스토어</h3>
					</div>
				</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
	
<div class="hero ">
                  <hgroup class="wow fadeInUp">
                      <h1>보호할개 <span ><a href="" class="typewrite" data-period="1000" data-type='[ " 분양실종", " 스토리펀딩", "정보공유", "스토어"]'>
                        <span class="wrap"></span></a></span> </h1>        
                      <h3></h3>
                  </hgroup>
                  
                </div>      
<!--====================================================
                        OFFER1
======================================================-->
    <section id="comp-offer">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.2s">
            <h2>분양.실종</h2>
            <div class="heading-border-light"></div> 
            <button class="btn btn-general btn-green" role="button">See Curren Offers</button>
            <button class="btn btn-general btn-white" role="button">Contact Us Today</button>
          </div>
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.4s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-11.jpg" class="img-fluid" alt="...">
              </div>
              <h3>Business Management</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC. </p>
              <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Learn More</a>
            </div>
          </div>          
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.6s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-13.jpg" class="img-fluid" alt="...">
              </div>              
              <h3>Leadership Development</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC. </p>
              <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Learn More</a>
            </div>
          </div>
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.8s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-14.jpg" class="img-fluid" alt="...">
              </div>
              <h3>Social benefits and services</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC. </p>
              <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Learn More</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- ================================================================= -->
    
    <!--====================================================
                        OFFER
======================================================-->
    <section id="comp-offer">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.2s">
            <h2>스토리펀딩</h2>
            <div class="heading-border-light"></div> 
            <button class="btn btn-general btn-green" role="button">See Curren Offers</button>
            <button class="btn btn-general btn-white" role="button">Contact Us Today</button>
          </div>
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.4s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-11.jpg" class="img-fluid" alt="...">
              </div>
              <h3>Business Management</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC. </p>
              <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Learn More</a>
            </div>
          </div>          
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.6s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-13.jpg" class="img-fluid" alt="...">
              </div>              
              <h3>Leadership Development</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC. </p>
              <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Learn More</a>
            </div>
          </div>
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.8s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-14.jpg" class="img-fluid" alt="...">
              </div>
              <h3>Social benefits and services</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC. </p>
              <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Learn More</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--====================================================
                   SERVICE-HOME
======================================================--> 
    <section id="service-h">
        <div class="container-fluid">
          <div class="row" >
            <div class="col-md-6" >
              <div class="service-himg" > 
                <iframe src="https://www.youtube.com/embed/3P1YGPZp6Ik?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
              </div>
            </div>
            <div class="col-md-6 wow fadeInUp" data-wow-delay="0.3s">
              <div class="service-h-desc">
                <h2>정보공유</h2>
                <div class="heading-border-light"></div> 
                <p>비트캠프 118기 #Protected조 GIT MANAGER 박 은우 입니다.</p>  
              <div class="service-h-tab"> 
                <nav class="nav nav-tabs" id="myTab" role="tablist">
                  <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-expanded="true">HOT개</a>
                  <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile">사용된 기술</a> 
          
                </nav>
                <div class="tab-content" id="nav-tabContent">
                  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                  	<p>Nulla est ullamco ut irure incididunt nulla Lorem Lorem minim irure officia enim reprehenderit. Magna duis labore cillum sint adipisicing exercitation ipsum. Nostrud ut anim non exercitation velit laboris fugiat cupidatat. Commodo esse dolore fugiat sint velit ullamco magna consequat voluptate minim amet aliquip ipsum aute. exercitation ipsum. Nostrud ut anim non exercitation velit laboris fugiat cupidatat. Commodo esse dolore fugiat sint velit ullamco magna consequat voluptate minim amet aliquip ipsum aute. </p>
                  </div>
                  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <p>Nulla est ullamco ut irure incididunt nulla Lorem Lorem minim irure officia enim reprehenderit. Magna duis labore cillum sint adipisicing exercitation ipsum. Nostrud ut anim non exercitation velit laboris fugiat cupidatat. Commodo esse dolore fugiat sint velit ullamco magna consequat voluptate minim amet aliquip ipsum aute</p>
                  </div> 
                  </div> 
                </div>
              </div>
              </div>
            </div>
          </div>
        </div>  
    </section>

<!--====================================================
                      CLIENT
======================================================-->
    <!--====================================================
                        OFFER 스토어
======================================================-->
    <section id="comp-offer">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.2s">
            <h2>스토어</h2>
            <div class="heading-border-light"></div> 
            <button class="btn btn-general btn-green" role="button">See Curren Offers</button>
            <button class="btn btn-general btn-white" role="button">Contact Us Today</button>
          </div>
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.4s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-11.jpg" class="img-fluid" alt="...">
              </div>
              <h3>Business Management</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC. </p>
              <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Learn More</a>
            </div>
          </div>          
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.6s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-13.jpg" class="img-fluid" alt="...">
              </div>              
              <h3>Leadership Development</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC. </p>
              <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Learn More</a>
            </div>
          </div>
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.8s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-14.jpg" class="img-fluid" alt="...">
              </div>
              <h3>Social benefits and services</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC. </p>
              <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Learn More</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    

    <!--================ start footer Area  =================-->
    <!-- footer Start /////////////////////////////////////-->
	 <jsp:include page="/layout/footer.jsp"></jsp:include>
   	<!-- footer End /////////////////////////////////////-->  
    <!--================ End footer Area  =================-->
  </body>

</html>
