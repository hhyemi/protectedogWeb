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
    <meta name="description" content="">
    <meta name="author" content="">

    <title>보호할개</title>


 	<!-- ToolBar Start /////////////////////////////////////-->
	 <jsp:include page="/layout/toolbar.jsp"></jsp:include>
   	<!-- ToolBar End /////////////////////////////////////-->   
</head><body>
<!--====================================================
                    LOGIN OR REGISTER
======================================================-->
    <section id="login">
      <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header" align="center">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span class="fa fa-times" aria-hidden="true"></span>
                      </button>
                  </div>
                  <div id="div-forms">
                      <form id="login-form">
                          <h3 class="text-center">Login</h3>
                          <div class="modal-body">
                              <label for="username">Username</label> 
                              <input id="login_username" class="form-control" type="text" placeholder="Enter username " required>
                              <label for="username">Password</label> 
                              <input id="login_password" class="form-control" type="password" placeholder="Enter password" required>
                              <div class="checkbox">
                                  <label>
                                      <input type="checkbox"> Remember me
                                  </label>
                              </div>
                          </div>
                          <div class="modal-footer text-center">
                              <div>
                                  <button type="submit" class="btn btn-general btn-white">Login</button>
                              </div>
                              <div>
                                  <button id="login_register_btn" type="button" class="btn btn-link">Register</button>
                              </div>
                          </div>
                      </form>
                      <form id="register-form" style="display:none;">
                          <h3 class="text-center">Register</h3>
                          <div class="modal-body"> 
                              <label for="username">Username</label> 
                              <input id="register_username" class="form-control" type="text" placeholder="Enter username" required>
                              <label for="register_email">E-mailId</label> 
                              <input id="register_email" class="form-control" type="text" placeholder="Enter eMail" required>
                              <label for="register_password">Password</label> 
                              <input id="register_password" class="form-control" type="password" placeholder="Password" required>
                          </div>
                          <div class="modal-footer">
                              <div>
                                  <button type="submit" class="btn btn-general btn-white">Register</button>
                              </div>
                              <div>
                                  <button id="register_login_btn" type="button" class="btn btn-link">Log In</button>
                              </div>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>
    </section>      

<!--====================================================
                         HOME
======================================================-->
    <section id="home">
      <div id="carousel" class="carousel slide carousel-fade" data-ride="carousel"> 
        <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="carousel-item active slides">
              <div class="overlay"></div>
              <div class="slide-1"></div>
                <div class="hero ">
                  <hgroup class="wow fadeInUp">
                      <h1>We Help <span ><a href="" class="typewrite" data-period="2000" data-type='[ " Business", " Startup"]'>
                        <span class="wrap"></span></a></span> </h1>        
                      <h3>The next big idea is waiting for its next big changer</h3>
                  </hgroup>
                  <button class="btn btn-general btn-green wow fadeInUp" role="button">Contact Now</button>
                </div>           
            </div> 
        </div> 
      </div> 
    </section> 

<!--====================================================
                        ABOUT
======================================================-->
    <section id="about" class="about">
      <div class="container">
        <div class="row title-bar">
          <div class="col-md-12">
            <h1 class="wow fadeInUp">We committed to helping</h1>
            <div class="heading-border"></div>
            <p class="wow fadeInUp" data-wow-delay="0.4s">Businessbox will deliver value to all the stakeholders and will attain excellence and leadership through such delivery of value. We will strive to support the stakeholders in all activities related to us. Businessbox provide great things.</p>
            <div class="title-but"><button class="btn btn-general btn-green" role="button">Read More</button></div>
          </div>
        </div>
      </div>  
      <!-- About right side withBG parallax -->
      <div class="container-fluid">
        <div class="row"> 
          <div class="col-md-4 bg-starship">
            <div class="about-content-box wow fadeInUp" data-wow-delay="0.3s">
              <i class="fa fa-snowflake-o"></i>
              <h5>Thoughts Leadership Platform</h5>
              <p class="desc">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
            </div>
          </div> 
          <div class="col-md-4 bg-chathams">
            <div class="about-content-box wow fadeInUp" data-wow-delay="0.5s">
              <i class="fa fa-circle-o-notch"></i>
              <h5>Corporate world Platform</h5>
              <p class="desc">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
            </div>
          </div> 
          <div class="col-md-4 bg-matisse">
            <div class="about-content-box wow fadeInUp" data-wow-delay="0.7s">
              <i class="fa fa-hourglass-o"></i>
              <h5>End to End Testing Platform</h5>
              <p class="desc">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
            </div>
          </div> 
        </div> 
      </div>       
    </section> 

<!--====================================================
                        OFFER
======================================================-->
    <section id="comp-offer">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.2s">
            <h2>What We Offer</h2>
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
                     WHAT WE DO
======================================================-->
    <section class="what-we-do bg-gradiant">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
            <h3>What we Do</h3>
            <div class="heading-border-light"></div> 
            <p class="desc">We partner with clients to put recommendations into practice. </p>
          </div>
          <div class="col-md-9">
            <div class="row">
              <div class="col-md-4  col-sm-6">
                <div class="what-we-desc">
                  <i class="fa fa-briefcase"></i>
                  <h6>Workspace</h6>
                  <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. </p>
                </div>
              </div>
              <div class="col-md-4  col-sm-6">
                <div class="what-we-desc">
                  <i class="fa fa-shopping-bag"></i>
                  <h6>Storefront</h6>
                  <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. </p>
                </div>
              </div>
              <div class="col-md-4  col-sm-6">
                <div class="what-we-desc">
                  <i class="fa fa-building-o"></i>
                  <h6>Apartments</h6>
                  <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. </p>
                </div>
              </div>
              <div class="col-md-4  col-sm-6">
                <div class="what-we-desc">
                  <i class="fa fa-bed"></i>
                  <h6>Hotels</h6>
                  <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. </p>
                </div>
              </div>
              <div class="col-md-4  col-sm-6">
                <div class="what-we-desc">
                  <i class="fa fa-hourglass-2"></i>
                  <h6>Concept</h6>
                  <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. </p>
                </div>
              </div>
              <div class="col-md-4  col-sm-6">
                <div class="what-we-desc">
                  <i class="fa fa-cutlery"></i>
                  <h6>Restaurant</h6>
                  <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>      
    </section> 

<!--====================================================
                      STORY
======================================================--> 
    <section id="story">
        <div class="container">
          <div class="row title-bar">
            <div class="col-md-12">
              <h1 class="wow fadeInUp">Our Success Tranformation Story</h1>
              <div class="heading-border"></div> 
            </div>
          </div>
        </div>  
        <div class="container-fluid">
          <div class="row" >
            <div class="col-md-6" >
              <div class="story-himg" >
                <img src="img/image-4.jpg" class="img-fluid" alt="">
              </div>
            </div>
            <div class="col-md-6">
              <div class="story-desc">
                <h3>How to grow world with Us</h3>
                <div class="heading-border-light"></div> 
                <p>Everyone defines success differently â as much as there are people, there are different opinions. Number one in our priority list is the success of our students, alumni and their employers. We work hard in the name of the success of our alumni â being among the best and holding the high employment rate. Many desktop publishing packages and web page editors now use Lorem Ipsum.. </p>
                <p>You can find some thoughts on success from our students and alumni here â every story is unique, but this is what success is. Everybody sees it differently. Many desktop publishing packages and web page editors now use Lorem Ipsum.</p>
                <p class="text-right" style="font-style: italic; font-weight: 700;"><a href="#">Businessbox</a></p>
                <div class="title-but"><button class="btn btn-general btn-green" role="button">Read More</button></div>
              </div>
            </div>
          </div>
        </div>  
        <div class="container">
          <div class="row">
            <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.1s"> 
              <div class="story-descb">
                  <img src="img/news/news-10.jpg" class="img-fluid" alt="...">
                  <h6>Virtual training systems</h6>
                  <p>Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>
                  <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Read More</a>
              </div>
            </div>
            <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.3s"> 
              <div class="story-descb">
                  <img src="img/news/news-2.jpg" class="img-fluid" alt="...">
                  <h6>Design planning</h6>
                  <p>Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>
                  <a href=""><i class="fa fa-arrow-circle-o-right"></i> Read More</a>
              </div>
            </div>
            <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.5s"> 
              <div class="story-descb">
                  <img src="img/news/news-8.jpg" class="img-fluid" alt="...">
                  <h6>Remote condition monitoring</h6>
                  <p>Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>
                  <a href=""><i class="fa fa-arrow-circle-o-right"></i> Read More</a>
              </div>
            </div>                        
          </div>
        </div>  
    </section>

<!--====================================================
                  COMPANY THOUGHT
======================================================-->
    <div class="overlay-thought"></div>
    <section id="thought" class="bg-parallax thought-bg">
      <div class="container">
        <div id="thought-desc" class="row title-bar title-bar-thought owl-carousel owl-theme">
          <div class="col-md-12 ">
            <div class="heading-border bg-white"></div>
            <p class="wow fadeInUp" data-wow-delay="0.4s">Businessbox will deliver value to all the stakeholders and will attain excellence and leadership through such delivery of value. We will strive to support the stakeholders in all activities related to us. Businessbox provide great things.</p>
            <h6>John doe</h6>
          </div>
          <div class="col-md-12 thought-desc">
            <div class="heading-border bg-white"></div>
            <p class="wow fadeInUp" data-wow-delay="0.4s">Ensuring quality in Businessbox is an obsession and the high quality standards set by us are achieved through a rigorous quality assurance process. Quality assurance is performed by an independent team of trained experts for each project. </p>
            <h6>Tom John</h6>
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
                <iframe src="https://www.youtube.com/embed/754f1w90gQU?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
              </div>
            </div>
            <div class="col-md-6 wow fadeInUp" data-wow-delay="0.3s">
              <div class="service-h-desc">
                <h3>We are Providing great Services</h3>
                <div class="heading-border-light"></div> 
                <p>Businessbox offer the full spectrum of services to help organizations work better. Everything from creating standards of excellence to training your people to work in more effective ways.</p>  
              <div class="service-h-tab"> 
                <nav class="nav nav-tabs" id="myTab" role="tablist">
                  <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-expanded="true">Developing</a>
                  <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile">Training</a> 
                  <a class="nav-item nav-link" id="my-profile-tab" data-toggle="tab" href="#my-profile" role="tab" aria-controls="my-profile">Medical</a> 
                </nav>
                <div class="tab-content" id="nav-tabContent">
                  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"><p>Nulla est ullamco ut irure incididunt nulla Lorem Lorem minim irure officia enim reprehenderit. Magna duis labore cillum sint adipisicing exercitation ipsum. Nostrud ut anim non exercitation velit laboris fugiat cupidatat. Commodo esse dolore fugiat sint velit ullamco magna consequat voluptate minim amet aliquip ipsum aute. exercitation ipsum. Nostrud ut anim non exercitation velit laboris fugiat cupidatat. Commodo esse dolore fugiat sint velit ullamco magna consequat voluptate minim amet aliquip ipsum aute. </p></div>
                  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <p>Nulla est ullamco ut irure incididunt nulla Lorem Lorem minim irure officia enim reprehenderit. Magna duis labore cillum sint adipisicing exercitation ipsum. Nostrud ut anim non exercitation velit laboris fugiat cupidatat. Commodo esse dolore fugiat sint velit ullamco magna consequat voluptate minim amet aliquip ipsum aute</p>
                  </div> 
                  <div class="tab-pane fade" id="my-profile" role="tabpanel" aria-labelledby="my-profile-tab">
                    <p>Nulla est ullamco ut irure incididunt nulla Lorem Lorem minim irure officia enim reprehenderit. Magna duis labore cillum sint adipisicing exercitation ipsum. Nostrud ut anim non exercitation velit laboris fugiat cupidatat. Commodo esse dolore fugiat sint velit ullamco magna consequat voluptate minim amet aliquip ipsum aute</p>
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
    <section id="client" class="client">
      <div class="container">
        <div class="row title-bar">
          <div class="col-md-12">
            <h1 class="wow fadeInUp">Our Client Say</h1>
            <div class="heading-border"></div>
            <p class="wow fadeInUp" data-wow-delay="0.4s">We committed to helping you maintain your Brand Value.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-sm-12">
            <div class="client-cont wow fadeInUp" data-wow-delay="0.1s">
              <img src="img/client/avatar-6.jpg" class="img-fluid" alt="">
              <h5>Leesa len</h5>
              <h6>DSS CEO & Cofounder</h6>
              <i class="fa fa-quote-left"></i>
              <p>The Businessbox service - it helps fill our Business, and increase our show up rate every single time.</p>
            </div>
          </div>
          <div class="col-md-6 col-sm-12">
            <div class="client-cont wow fadeInUp" data-wow-delay="0.3s">
              <img src="img/client/avatar-2.jpg" class="img-fluid" alt="">
              <h5>Dec Bol</h5>
              <h6>TEMS founder</h6>
              <i class="fa fa-quote-left"></i>
              <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece.</p>
            </div>
          </div>
        </div>
      </div>        
    </section>  

<!--====================================================
                    CONTACT HOME
======================================================-->
    <div class="overlay-contact-h"></div>
    <section id="contact-h" class="bg-parallax contact-h-bg">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="contact-h-cont">
              <h3 class="cl-white">Continue The Conversation</h3><br>
              <form>
                <div class="form-group cl-white">
                  <label for="name">Your Name</label>
                  <input type="text" class="form-control" id="name" aria-describedby="nameHelp" placeholder="Enter name"> 
                </div>  
                <div class="form-group cl-white">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"> 
                </div>  
                <div class="form-group cl-white">
                  <label for="subject">Subject</label>
                  <input type="text" class="form-control" id="subject" aria-describedby="subjectHelp" placeholder="Enter subject"> 
                </div>  
                <div class="form-group cl-white">
                  <label for="message">Message</label>
                  <textarea class="form-control" id="message" rows="3"></textarea>
                </div>  
                <button class="btn btn-general btn-white" role="button"><i fa fa-right-arrow></i>GET CONVERSATION</button>
              </form>
            </div>
          </div>
        </div>
      </div>         
    </section> 

<!--====================================================
                       NEWS
======================================================-->
    <section id="comp-offer">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3 col-sm-6  desc-comp-offer wow fadeInUp" data-wow-delay="0.2s">
            <h2>Latest News</h2>
            <div class="heading-border-light"></div> 
            <button class="btn btn-general btn-green" role="button">See More</button>
          </div>
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.4s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-1.jpg" class="img-fluid" alt="...">
              </div>
              <h3>Pricing Strategies for Product</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from Business box. </p>
              <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Learn More</a>
            </div>
          </div>
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.6s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-9.jpg" class="img-fluid" alt="...">
              </div>
              <h3>Design Exhibitions of 2017</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from Business box. </p>
              <a href="#"><i class="fa fa-arrow-circle-o-right"></i> Learn More</a>
            </div>
          </div>
          <div class="col-md-3 col-sm-6 desc-comp-offer wow fadeInUp" data-wow-delay="0.8s">
            <div class="desc-comp-offer-cont">
              <div class="thumbnail-blogs">
                  <div class="caption">
                    <i class="fa fa-chain"></i>
                  </div>
                  <img src="img/news/news-12.jpeg" class="img-fluid" alt="...">
              </div>
              <h3>Exciting New Technologies</h3>
              <p class="desc">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from Business box. </p>
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
