<%@page import="org.springframework.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zxx">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>MODAKBUL</title>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/resources/images/favicon.png">
    <!-- Bootstrap core CSS -->
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!--Custom CSS-->
    <link href="./resources/css/style.css" rel="stylesheet" type="text/css">
    <!--Plugin CSS-->
    <link href="./resources/css/plugin.css" rel="stylesheet" type="text/css">
    <!--Flaticons CSS-->
    <link href="./resources/fonts/flaticon.css" rel="stylesheet" type="text/css">
    <!--Font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

    <link rel="stylesheet" href="./resources/fonts/line-icons.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript">


function loginValidation(frm){
   var MEMBER_ID = $("#MEMBER_ID").val();
   var MEMBER_PW = $("#MEMBER_PW").val();
   console.log("하하하아아아");
   if(!MEMBER_ID){
      alert("아이디를 입력하세요.");
      $("#MEMBER_ID").focus();
      return false;
   }else if(!MEMBER_PW){
      alert("비밀번호를 입력하세요.");
      $("#MEMBER_PW").focus();
      return false;
   }else {
	   console.log("아하하하하하");
	   frm.action = '/modak/member/mLogin.mo';
	   frm.submit();
	   return true;
   }
   
}

function loginValidation2(frm){
	var SELLER_ID = $("#SELLER_ID").val();
	var SELLER_PW = $("#SELLER_PW").val();
	
	if(!SELLER_ID){
		alert("아이디를 입력하세요.");
		$("#SELLER_ID").focus();
		return false;
	}else if(!SELLER_PW){
		alert("비밀번호를 입력하세요.");
		$("#SELLER_PW").focus();
		return false;
	}else {
		   frm.action = '/modak/member/mLogin.mo';
		   frm.submit();
		   return true;
	}
	
}

function changeMethod(){
   $.ajax({
      url : "memberlogin.mo",
      type : 'GET',
      dataType : 'html',
      success:function(data){
         $("#signUp").html(data);
      }
   })
}

function enterKeyCheck(){
   
 if(event.keyCode == 13)
     {
    loginValidation();
     }
}

</script>

</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp"/>
<!-- Preloader -->
    <div id="preloader">
        <div id="status"></div>
    </div>
    <!-- Preloader Ends -->

    <!-- header starts -->
    <header class="main_header_area headerstye-1">
        <!-- Navigation Bar -->
        <div class="header_menu" id="header_menu">
            <nav class="navbar navbar-default">
                <div class="container">
                    <div class="navbar-flex d-flex align-items-center justify-content-between w-100 pb-2 pt-2">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <a class="navbar-brand" href="./">
                                <img src="<%= request.getContextPath() %>/resources/images/modak4.png" alt="image">
                            </a>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="navbar-collapse1 d-flex align-items-center" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav" id="responsive-menu">
                                <li class="dropdown submenu active">
                                    <a href="./" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Home <i class="icon-arrow-down" aria-hidden="true"></i></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="./">Homepage Default</a></li>
                                       
                                    </ul>
                                </li>

                              
                                <li class="submenu dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages <i class="icon-arrow-down" aria-hidden="true"></i></a> 
                                    <ul class="dropdown-menu">
                                        <li><a href="booking.html">Booking</a></li>
                                        <li><a href="confirmation.html">Confirmation</a></li>
                                        <li class="submenu dropdown">
                                            <a href="gallery.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gallery<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="gallery.html">Gallery</a></li>
                                                <li><a href="gallery1.html">Gallery Masonry</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu dropdown">
                                            <a href="404.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Error<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="404.html">Error Page 1</a></li>
                                                <li><a href="404-1.html">Error Page 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu dropdown">
                                            <a href="comingsoon.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Comming Soon<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="comingsoon.html">Coming Soon 1</a></li>
                                                <li><a href="comingsoon-1.html">Coming Soon 2</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Shop <i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="shop-grid1.html">Right Grid</a></li>
                                                <li><a href="shop-list1.html">Right List</a></li>
                                                <li><a href="shop-detail.html">Shop Single One</a></li>
                                                <li><a href="cart.html">Cart</a></li>
                                                <li><a href="checkout.html">Checkout</a></li>
                                                <li><a href="login.html">Account</a></li>
                                                <li><a href="wishlist.html">Wishlist</a></li>
                                                <li><a href="forgot-password.html">Forgot Password</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="faq.html">Faq</a></li>
                                        <li><a href="testimonial.html">Testimonials</a></li>
                                        <li><a href="pricing.html">Pricing</a></li>
                                    </ul> 
                                </li>

                                <li class="submenu dropdown">
                                    <a href="destination.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Destination <i class="icon-arrow-down" aria-hidden="true"></i></a> 
                                    <ul class="dropdown-menu">
                                        <li><a href="destination-list.html">Destination List</a></li>
                                        <li><a href="destination-grid.html">Destination Grid</a></li>
                                        <li><a href="destination-full.html">Destination Fullwidth</a></li>
                                        <li><a href="destination-left.html">Destination Left</a></li>
                                        <li><a href="destination-list.html">Destination Right</a></li>
                                        <li><a href="destination-masonry.html">Destination Masonry</a></li>
                                        <li class="submenu dropdown">
                                            <a href="destination-single.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Destination Single<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="destination-single.html">Destination Single 1</a></li>
                                                <li><a href="destination-single1.html">Destination Single 2</a></li>
                                                <li><a href="destination-single-full.html">Destination Single Full</a></li>
                                            </ul>
                                        </li>
                                    </ul> 
                                </li>

                                <li class="submenu dropdown">
                                    <a href="dashboard.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dashboard <i class="fa fa-angle-down" aria-hidden="true"></i></a> 
                                    <ul class="dropdown-menu">
                                        <li><a href="dashboard.html">Dashboard</a></li>
                                        <li><a href="dashboard-my-profile.html">User Profile</a></li>
                                        <li><a href="dashboard-list.html">User Wishlist</a></li>
                                        <li><a href="dashboard-messages.html">User Messages</a></li>
                                        <li><a href="dashboard-history.html">Booking History</a></li>
                                        <li><a href="dashboard-add-new.html">Add New</a></li>
                                        <li><a href="dashboard-list.html">Tour List</a></li>
                                        <li><a href="dashboard-reviews.html">Dashboard Reviews</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html">Contact Us</a></li>
                            </ul>
                            <a href="#" class="cart-icon d-flex align-items-center ml-1"><i class="icon-basket-loaded"></i><span class="cart-label">3</span></a>
                        </div><!-- /.navbar-collapse -->  
<sec:authorize access="isAnonymous()">
                        <div class="register-login">
                            <a href="#" class="mr-2" data-toggle="modal" data-target="#register"><i class="icon-user mr-1"></i> Register</a>
                            <a href="#" data-toggle="modal" data-target="#login"><i class="icon-login mr-1"></i> Login</a>
                        </div>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_MEMBER')">
                        <div class="register-login">
                        <label>${memberID } 님 안녕하세요 :)</label>
                            <a href="member/memberinfo.mo" class="mr-2" data-toggle="modal" data-target="#register"><i class="icon-user mr-1"></i> 내정보보기</a>
                            <a href="logouts.mo"><i class="icon-login mr-1"></i> 로그아웃</a>
                        </div>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_SELLER')">
                        <div class="register-login">
                        <label>${sellerID } 님 안녕하세요 :)</label>
                            <a href="/modak/seller/sellerMain.mo" class="mr-2" data-toggle="modal" data-target="#register"><i class="icon-user mr-1"></i>판매자정보보기</a>
                            <a href="logouts.mo" ><i class="icon-login mr-1"></i> 로그아웃</a>
                        </div>
</sec:authorize>
                        <div id="slicknav-mobile"></div>
                    </div>
                </div><!-- /.container-fluid --> 
            </nav>
        </div>
        <!-- Navigation Bar Ends -->
    </header>
    <!-- header ends --> 
    
    <!-- banner starts -->
    <section class="banner overflow-hidden">
        <div class="slider slider1">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slide-inner">
                           <div class="slide-image" style="background-image:url(./resources/images/slider/camping1.png)"></div>
                           <div class="swiper-content1 container">
                                <h4 class="white">Choose The Best Destination</h4>
                                <h1 class="white mb-4">Make Your Trip Fun And Memorable Where You Want</h1>
                                <a href="#" class="per-btn">
                                    <span class="white">Discover</span>
                                    <i class="fa fa-arrow-right white"></i>
                                </a>
                            </div>
                            <div class="dot-overlay"></div>
                        </div> 
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-inner">
                            <div class="slide-image" style="background-image:url(./resources/images/slider/camping2.png)"></div>
                            <div class="swiper-content1 container">
                                <h4 class="white">Feel Free To Travel</h4>
                                <h1 class="white mb-4">Discover Your Beautiful <span>Travel</span> With Us</h1>
                                <a href="#" class="per-btn">
                                  <span class="white">Discover</span>
                                  <i class="fa fa-arrow-right white"></i>
                                </a>
                            </div>
                            <div class="dot-overlay"></div>
                        </div> 
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-inner">
                           <div class="slide-image" style="background-image:url(<%= request.getContextPath() %>/resources/images/slider/9.jpg)"></div>
                           <div class="swiper-content1 container">
                                <h4 class="white">Trip For Your Kids</h4>
                                <h1 class="white mb-4"><span>Sensation Ice Trip</span> Is Coming For Kids</h1>
                                <a href="#" class="per-btn">
                                  <span class="white">Discover</span>
                                  <i class="fa fa-arrow-right white"></i>
                                </a>
                            </div>
                            <div class="dot-overlay"></div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner ends -->

    <!-- form main starts -->
    <div class="form-main">
        <div class="container">
            <div class="form-content w-100"> 
                <h3 class="form-title text-center d-inline white">Find a Places</h3>
                <div class="d-lg-flex align-items-center justify-content-between">
                    <div class="form-group pr-4 m-0">
                        <div class="input-box">
                            <i class="fa fa-map-marker"></i>
                            <select class="niceSelect">
                                <option value="1">Your Destination</option>
                                <option value="2">Argentina</option>
                                <option value="3">Belgium</option>
                                <option value="4">Canada</option>
                                <option value="5">Denmark</option>
                            </select>
                        </div>                            
                    </div>
                    <div class="form-group pr-4 m-0">
                        <div class="input-box">
                            <i class="fa fa-calendar"></i>
                            <input id="date-range0" type="text" placeholder="Check In">
                        </div>                            
                    </div>

                    <div class="form-group pr-4 m-0">
                        <div class="input-box">
                            <i class="fa fa-calendar"></i>
                            <input id="date-range1" type="text" placeholder="Check Out">
                        </div>                            
                    </div>

                    <div class="form-group pr-4 m-0">
                        <div class="input-box">
                            <i class="fa fa-clock"></i>
                            <select class="niceSelect">
                                <option value="1">Total Duration</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>                             
                    </div>

                    <div class="form-group m-0">
                        <a href="#" class="nir-btn w-100"><i class="fa fa-search"></i> Check Availability</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- form main ends -->


  
    <!-- about-us ends -->

    <!-- Fav destination Starts -->
    <section class="trending destination pb-6 bg-grey pt-9">
        <div class="container">
            <div class="section-title text-center mb-5 pb-2 w-50 mx-auto">
                <h2 class="m-0">Find Your <span>Favourite Destination</span></h2>
                <p class="mb-0">Travel has helped us to understand the meaning of life and it has helped us become better people. Each time we travel, we see the world with new eyes.</p>
            </div>  
            <div class="trend-box">
                <div class="price-navtab text-center mb-4">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#historical">Historical</a></li>
                        <li><a data-toggle="tab" href="#weekend">Weekend</a></li>
                        <li><a data-toggle="tab" href="#holidays">Holidays</a></li>
                        <li><a data-toggle="tab" href="#special">Special Tour</a></li>
                    </ul>
                </div>
                <div class="tab-content">
                    <div id="historical" class="tab-pane fade in active">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending8.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">38 Reviews</span>
                                            </div>
                                            <h4><a href="#">Nepal Special Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 852 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> Nepal.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/1.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending11.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">38 Reviews</span>
                                            </div>
                                            <h4><a href="#">Canada New Year Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 615 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> Canada.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/2.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending12.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">25 Reviews</span>
                                            </div>
                                            <h4><a href="#">America Christmas Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 926 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> America.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/1.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="weekend" class="tab-pane fade">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending14.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">38 Reviews</span>
                                            </div>
                                            <h4><a href="#">Nepal Weekend Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 852 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> Nepal.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/1.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending13.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">38 Reviews</span>
                                            </div>
                                            <h4><a href="#">Canada Weekend Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 615 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> Canada.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/2.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending7.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">25 Reviews</span>
                                            </div>
                                            <h4><a href="#">America Weekend Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 926 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> America.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/1.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="holidays" class="tab-pane fade">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending2.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">38 Reviews</span>
                                            </div>
                                            <h4><a href="#">Nepal Holidays Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 852 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> Nepal.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/1.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending3.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">38 Reviews</span>
                                            </div>
                                            <h4><a href="#">Canada Holidays Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 615 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> Canada.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/2.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending4.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">25 Reviews</span>
                                            </div>
                                            <h4><a href="#">America Holidays Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 926 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> America.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/1.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="special" class="tab-pane fade">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending6.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">38 Reviews</span>
                                            </div>
                                            <h4><a href="#">Nepal Special Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 852 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> Nepal.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/1.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending5.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">38 Reviews</span>
                                            </div>
                                            <h4><a href="#">Canada Special Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 615 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> Canada.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/2.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 mb-4">
                                <div class="trend-item">
                                    <div class="trend-image">
                                        <img src="<%= request.getContextPath() %>/resources/images/trending/trending9.jpg" alt="image">
                                    </div>
                                    <div class="trend-content-main">
                                        <div class="trend-content">
                                            <div class="rating-main d-flex align-items-center pb-1">
                                                <div class="rating">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                </div>
                                                <span class="ml-2">25 Reviews</span>
                                            </div>
                                            <h4><a href="#">America Special Tour</a></h4>
                                            <p class="mb-0"><i class="fa fa-eye mr-1"></i> 926 Visiting Places <i class="fa fa-map-marker mr-1 ml-3"></i> America.</p>
                                        </div>
                                        <div class="trend-last-main">
                                            <p class="mb-0 trend-para">A wonderful little cottage right on the seashore - perfect for exploring.</p>
                                            <div class="trend-last d-flex align-items-center justify-content-between">
                                                <p class="mb-0 white d-flex align-items-center"><img src="<%= request.getContextPath() %>/resources/images/reviewer/1.jpg" class="d-author mr-2" alt=""> Thu Astudillo</p>
                                                <div class="trend-price">
                                                    <p class="price white mb-0"><a href="#"><i class="flaticon-like white"></i></a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </section>
    <!-- Fav destination Ends -->

   

    <!-- top deal starts -->
    <section class="top-deals bg-grey pt-9">
        <div class="container">
            <div class="section-title text-center mb-5 pb-2 w-50 mx-auto">
                <h2 class="m-0">Today's <span>Top Deal</span></h2>
                <p class="mb-0">Travel has helped us to understand the meaning of life and it has helped us become better people. Each time we travel, we see the world with new eyes.</p>
            </div> 
            <div class="row team-slider">
                <div class="col-lg-4 slider-item">
                    <div class="slider-image">
                        <img src="<%= request.getContextPath() %>/resources/images/new-deal/deal1.jpg" alt="image">
                    </div>
                    <div class="slider-content">
                        <h6 class="font-weight-normal"><i class="fa fa-map-marker-alt"></i> United Kingdom</h6>
                        <h4><a href="#">Earning Asiana Club Miles</a></h4>
                        <p>With upto 30% Off, experience Europe your way!</p>
                        <div class="deal-price">
                            <p class="price font-weight-bold pink mb-0">From <span>$250.00</span></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 slider-item">
                    <div class="slider-image">
                        <img src="<%= request.getContextPath() %>/resources/images/new-deal/deal2.jpg" alt="image">
                    </div>
                    <div class="slider-content">
                        <h6 class="font-weight-normal"><i class="fa fa-map-marker-alt"></i> Thailand</h6>
                        <h4><a href="#">Save big on hotels!</a></h4>
                        <p>With upto 30% Off, experience Europe your way!</p>
                        <div class="deal-price">
                            <p class="price font-weight-bold pink mb-0">From <span>$250.00</span></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 slider-item">
                    <div class="slider-image">
                        <img src="<%= request.getContextPath() %>/resources/images/new-deal/deal3.jpg" alt="image">
                    </div>
                    <div class="slider-content">
                        <h6 class="font-weight-normal"><i class="fa fa-map-marker-alt"></i> South Korea</h6>
                        <h4><a href="#">Experience Europe Your Way</a></h4>
                        <p>With upto 30% Off, experience Europe your way!</p>
                        <div class="deal-price">
                            <p class="price font-weight-bold pink mb-0">From <span>$250.00</span></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 slider-item">
                    <div class="slider-image">
                        <img src="<%= request.getContextPath() %>/resources/images/new-deal/deal4.jpg" alt="image">
                    </div>
                    <div class="slider-content">
                        <h6 class="font-weight-normal"><i class="fa fa-map-marker-alt"></i> Germany</h6>
                        <h4><a href="#">Earning Asiana Club Miles</a></h4>
                        <p>With upto 30% Off, experience Europe your way!</p>
                        <div class="deal-price">
                            <p class="price font-weight-bold pink mb-0">From <span>$250.00</span></p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- top deal ends -->

   <!-- footer starts -->
   <footer
      style="background-image:url(<%=request.getContextPath()%>/resources/images/bg/bg4.jpg);"
      class="pt-10 bg-navy">
      <div class="footer-upper pb-5">
         <div class="container">
            <div class="row">
               <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12 mb-4">
                  <div class="footer-links">
                     <div align="center">
                     <div class="credits">
                  
                     &copy;Copyright 2021 vs.All rights Reserved<br> 오형철, 윤보미, 김호, 김동휘, 안성재, 김소원, 오민지, 조예린, 방인재 
                     </div>
                     </div>
                  </div>
               </div>
               
               </div>
               
               
         </div>
      </div>
      </footer>
    
    <!-- Back to top start -->
    <div id="back-to-top">
        <a href="#"></a>
    </div>
    <!-- Back to top ends -->

    <!-- search popup -->
    <div id="search1">
        <button type="button" class="close">×</button>
        <form>
            <input type="search" value="" placeholder="type keyword(s) here" />
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>

 <!-- Register Modal -->
    <div class="modal fade" id="register" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bordernone p-0">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body p-0">
                    <div class="login-content p-4 text-center">
                        <div class="login-title section-border">
                            <h3 class="pink">판매회원로그인</h3>                    
                        </div>
                        <div class="login-form">
                            <form action="/modak/seller/sLogin.mo" id="signUp" class="signUp" method="post">
                                <div class="form-group">
                                    <input type="text" id="SELLER_ID" name="SELLER_ID" class="signUpInput" placeholder="ID" autofocus onkeyup="enterKeyCheck()">
                                </div>
                                <div class="form-group">
                                    <input type="password" id="SELLER_PW" name="SELLER_PW" class="signUpInput" placeholder="Password" onkeyup="enterKeyCheck()">
                                </div>
                            <div class="form-btn">
                               <input type="button" value="로그인" onclick='return loginValidation2(this.form);' class="nir-btn">
                            </div>
                            </form>
                            <div class="form-group mb-0 form-checkbox mt-3">
                                <input type="checkbox"> 아이디 기억하기 | <a href="#" class="">비밀번호를 잊어버리셨나요?</a>
                            </div>
                        </div>
                        <div class="login-social border-t mt-3 pt-2 mb-3">
                            <p class="mb-2"></p>
                            <div id="kakao_id_login" style="text-align: center"> 
                            <a href="https://kauth.kakao.com/oauth/authorize?client_id=3bbb5c66249fe62abe5aac0a1136258b&redirect_uri=http://localhost:8088/modak/kakaocall.mo&response_type=code"> 
                            <img width="223" src="./resources/images/kakao.png" /></a> </div>
                           
                        </div>
                        <div class="sign-up">
                            <p class="m-0">아직 회원이 아니신가요?<a href="sellerJoin.mo" class="pink">회원가입</a></p>
                        </div>                
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- login Modal -->
    
    <sec:authorize access="isAnonymous()">
    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bordernone p-0">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body p-0">
                    <div class="login-content p-4 text-center">
                        <div class="login-title section-border">
                            <h3 class="pink">개인회원로그인</h3>                    
                        </div>
                        <div class="login-form">
                            <form action="/modak/member/mLogin.mo" id="signUp" class="signUp" method="post">
                                <div class="form-group">
                                    <input type="text" id="MEMBER_ID" name="MEMBER_ID" class="signUpInput" placeholder="ID" autofocus onkeyup="enterKeyCheck()">
                                </div>
                                <div class="form-group">
                                    <input type="password" id="MEMBER_PW" name="MEMBER_PW" class="signUpInput" placeholder="Password" onkeyup="enterKeyCheck()">
                                </div>
                            <div class="form-btn">
                                <input type="button" value="로그인" onclick='return loginValidation(this.form);' class="nir-btn">
                            </div>
                            </form>
                            <div class="form-group mb-0 form-checkbox mt-3">
                                <input type="checkbox"> 아이디 기억하기 | <a href="#" class="">비밀번호를 잊어버리셨나요?</a>
                            </div>
                        </div>
                        <div class="login-social border-t mt-3 pt-2 mb-3">
                            <p class="mb-2"></p>
                            <div id="kakao_id_login" style="text-align: center"> 
                            <a href="https://kauth.kakao.com/oauth/authorize?client_id=3bbb5c66249fe62abe5aac0a1136258b&redirect_uri=http://localhost:8088/modak/kakaocall.mo&response_type=code"> 
                            <img width="223" src="./resources/images/kakao.png" /></a> </div>
                           
                        </div>
                        <div class="sign-up">
                            <p class="m-0">아직 회원이 아니신가요? <a href="member/memberjoinform.mo" class="pink">회원가입</a></p>
                        </div>                
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    </sec:authorize>
    
 
    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bordernone p-0">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body p-0">
                    <div class="login-content p-4 text-center">
                        <div class="login-title section-border">
                            <h3 class="pink">개인회원로그인</h3>                    
                        </div>
                        <div class="login-form">
                            <form action="/modak/member/mLogin.mo" id="signUp" class="signUp" method="post">
                                <div class="form-group">
                                    <input type="text" id="MEMBER_ID" name="MEMBER_ID" class="signUpInput" placeholder="ID" autofocus onkeyup="enterKeyCheck()">
                                </div>
                                <div class="form-group">
                                    <input type="password" id="MEMBER_PW" name="MEMBER_PW" class="signUpInput" placeholder="Password" onkeyup="enterKeyCheck()">
                                </div>
                            <div class="form-btn">
                                <input type="button" value="로그인" onclick='return loginValidation(this.form);' class="nir-btn">
                            </div>
                            </form>
                            <div class="form-group mb-0 form-checkbox mt-3">
                                <input type="checkbox"> 아이디 기억하기 | <a href="#" class="">비밀번호를 잊어버리셨나요?</a>
                            </div>
                        </div>
                        <div class="login-social border-t mt-3 pt-2 mb-3">
                            <p class="mb-2"></p>
                            <div id="kakao_id_login" style="text-align: center"> 
                            <a href="https://kauth.kakao.com/oauth/authorize?client_id=3bbb5c66249fe62abe5aac0a1136258b&redirect_uri=http://localhost:8088/modak/kakaocall.mo&response_type=code"> 
                            <img width="223" src="./resources/images/kakao.png" /></a> </div>
                           
                        </div>
                        <div class="sign-up">
                            <p class="m-0">아직 회원이 아니신가요? <a href="login.html" class="pink">회원가입</a></p>
                        </div>                
                    </div>
                </div>
                
            </div>
        </div>
    </div>


    <!-- *Scripts* 
    <script src="./resources/js/jquery-3.5.1.min.js"></script>-->
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/plugin.js"></script>
    <script src="./resources/js/main.js"></script>
    <script src="./resources/js/custom-swiper.js"></script>
    <script src="./resources/js/custom-nav.js"></script>
    <script src="./resources/js/custom-date.js"></script>
</body>
</html>