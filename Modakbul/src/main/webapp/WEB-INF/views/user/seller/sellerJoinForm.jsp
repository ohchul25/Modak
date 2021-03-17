<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zxx">

<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Yatriiworld - Travel and Tours Booking Template</title>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">
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
    <script type="text/javascript">
function chkS(){
	
	var SELLER_COMPANY_NUM = $("#SELLER_COMPANY_NUM").val();
		console.log(SELLER_COMPANY_NUM);
		chkSCM(SELLER_COMPANY_NUM);
}

function chkSCM(SELLER_COMPANY_NUM){
	$.ajax({
		url : "/modak/getCPN.mo",
		type : "POST",
		data : { "SELLER_COMPANY_NUM" : SELLER_COMPANY_NUM },
		success:function(data){
			if(data){
				alert("인증 성공 하였습니다.");
				$('#cpnbtn').attr('disabled', true);
				$('#cpnbtn').attr('class', 'main-btn1');
				$('#subBtn').attr('disabled', false);
				$('#subBtn').attr('class', 'nir-btn');
				$('#SELLER_COMPANY_NUM').attr('readOnly', true);
				$('#cpnbtn').attr('value', '인증완료');
			}else{
				alert("인증 실패 하였습니다.");
			}
		}
	})
}

</script>
</head>
<body>

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
                            <a class="navbar-brand" href="index.html">
                                <img src="images/logo-white.png" alt="image">
                                <img src="images/logo.png" alt="image">
                            </a>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="navbar-collapse1 d-flex align-items-center" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav" id="responsive-menu">
                                <li class="dropdown submenu">
                                    <a href="index.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Home <i class="icon-arrow-down" aria-hidden="true"></i></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="index.html">Homepage Default</a></li>
                                        <li><a href="index-1.html">Homepage 1</a></li>
                                        <li><a href="index-2.html">Homepage 2</a></li>
                                        <li><a href="index-3.html">Homepage 3</a></li>
                                        <li><a href="index-flight.html">Homepage Flight</a></li>
                                        <li><a href="index-car.html">Homepage Car</a></li>
                                        <li><a href="index-train.html">Homepage Train</a></li>
                                        <li><a href="index-search.html">Homepage Search</a></li>
                                    </ul>
                                </li>

                                <li><a href="about.html">About Us</a></li>
                                <li class="submenu dropdown active">
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
                                    <a href="blog-home.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Blogs <i class="icon-arrow-down" aria-hidden="true"></i></a> 
                                    <ul class="dropdown-menu">
                                        <li><a href="blog-list.html">Blog List</a></li>
                                        <li><a href="blog-grid.html">Blog Grid</a></li>
                                        <li><a href="blog-full.html">Blog Fullwidth</a></li>
                                        <li><a href="blog-left.html">Blog Left</a></li>
                                        <li><a href="blog-list.html">Blog Right</a></li>
                                        <li><a href="blog-masonry.html">Blog Masonry</a></li>
                                        <li><a href="blog-single.html">Blog Single</a></li>
                                        <li><a href="blog-single-full.html">Blog Single Full</a></li>
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
                            <div class="header_sidemenu">
                                <div class="mhead">
                                    <span class="menu-ham">
                                        <a href="#" class="cart-icon d-flex align-items-center ml-1"><i class="icon-basket-loaded"></i><span class="cart-label">3</span></a>
                                    </span>
                                </div>
                            </div>
                        </div><!-- /.navbar-collapse -->  

                        <div class="register-login">
                            <a href="#" class="mr-2" data-toggle="modal" data-target="#register"><i class="icon-user mr-1"></i> Register</a>
                            <a href="#" data-toggle="modal" data-target="#login"><i class="icon-login mr-1"></i> Login</a>
                        </div>   
                        <div id="slicknav-mobile"></div>
                    </div>
                </div><!-- /.container-fluid --> 
            </nav>
        </div>
        <!-- Navigation Bar Ends -->
    </header>
    <!-- header ends -->

    <!-- BreadCrumb Starts -->  
    <section class="breadcrumb-main pb-0" style="background-image: url(images/bg/bg8.jpg);">
        <div class="breadcrumb-outer pt-10">
            <div class="container">
                <div class="breadcrumb-content d-md-flex align-items-center pt-10">
                    <h2 class="mb-0">SignUp</h2>
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Seller SignUp</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="dot-overlay"></div>
    </section>
    <!-- BreadCrumb Ends --> 


    <!-- login Starts -->
    <section class="login">
   		<form:form action="sellerJoin.mo" method="post" modelAttribute="MoUserSellerVO" role="joinForm" name="joinForm">
        <div class="container">
            <div class="row">
               <div class="col-lg-6 col-md-12 col-xs-12">
                    <div class="login-content border p-4">
                        <h4 class="">기본정보 입력</h4>
                        <form>
                            <div class="form-group">
                                <label class="">ID</label>
                                <input type="text" name="SELLER_ID">
                            </div>
                            <div class="form-group">
                                <label class="">PASSWORD</label>
                                <input type="password" name="SELLER_PW">
                            </div>
                            <div class="form-group">
                                <label class="">PASSWORD CHECK</label>
                                <input type="password">
                            </div>
                              <div class="form-group">
                                <label class="">핸드폰번호</label>
                                <input type="tel" name="SELLER_TEL">
                            </div>
                            <div class="form-group">
                                <label class="">EMAIL</label>
                                <input type="email" name="SELLER_EMAIL">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-xs-12">
                    <div class="login-content border p-4">
                        <h4 class="">사업자정보 입력</h4>
                        <form>
                            <div class="form-group">
                                <label class="">대표자명</label>
                                <input type="text" name="SELLER_NAME">
                            </div>
                            <div class="form-group">
                                <label class="">사업자 주소</label>
                                <input type="email">
                            </div>
                            <div class="form-group">
                                <label class="">사업자 등록번호</label>
                                <table frame="void">
                                <tr><td style="border-right: hidden"><input type="text" id="SELLER_COMPANY_NUM" name="SELLER_COMPANY_NUM"></td><td>
                                <input type="button" class="main-btn" id="cpnbtn" value="인증하기" onclick='chkS()'></td>
								</table>
                            </div>
                        </form>
                        <div class="login-social text-center mb-2">
                            <p class=""><strong>SNS SignUp</strong></p>
                            <a href="#" class="btn-facebook"><i class="fab fa-facebook" aria-hidden="true"></i> Naver</a>
                            <a href="#" class="btn-twitter"><i class="fab fa-twitter" aria-hidden="true"></i> Kakao</a>
                        </div>
                        <div class="form-btn text-center">
                        <input type="submit" class="nir-btn1" id="subBtn" value="가입하기" disabled="disabled">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form:form>
    </section>
    <!-- Login Ends -->

    <!-- footer starts -->
    <footer style="background-image:url(images/bg/bg3.jpg);" class="pt-10">
        <div class="footer-upper pb-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 mb-4">
                        <div class="footer-links">
                            <img src="images/logo-white.png" alt="">
                            <p class="mt-3">
                                In ut odio libero, at vulputate urna. Nulla tristique mi a massa convallis cursus. Nulla eu mi magna
                            </p>
                            <ul>
                                <li><strong>PO Box:</strong> +47-252-254-2542</li>
                                <li><strong>Location:</strong> Collins Street, sydney, Australia</li>
                                <li><strong>Email:</strong> info@Yatriiworld.com</li>
                                <li><strong>Website:</strong> www.Yatriiworld.com</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-12 col-xs-12 mb-4">
                        <div class="footer-links">
                            <h4 class="white">Company</h4>
                            <ul>
                                <li><a href="about-us.html">About Us</a></li>
                                <li><a href="#">Delivery Information</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Terms &amp; Conditions</a></li>
                                <li><a href="#">Customer Service</a></li>
                                <li><a href="#">Return Policy</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-12 col-xs-12 mb-4">
                        <div class="footer-links">
                            <h4 class="white">Services</h4>
                            <ul>
                                <li><a href="#">Payment</a></li>
                                <li><a href="#">Feedback</a></li>
                                <li><a href="#">Contact us</a></li>
                                <li><a href="#">Our Service</a></li>
                                <li><a href="#">FAQ</a></li>
                                <li><a href="#">Site map</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 mb-4">
                        <div class="footer-links">
                            <h4 class="white">Newsletter</h4>
                            <p>Want to be notified when we launch a new template or an udpate. Just sign up and we'll send you a notification by email.</p>
                            <div class="newsletter-form">
                                <form>
                                    <input type="email" placeholder="Enter your email">
                                    <input type="submit" class="nir-btn mt-2 w-100" value="Subscribe">
                                </form>
                            </div> 
                        </div>     
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-payment">
            <div class="container">
                <div class="footer-pay d-md-flex align-items-center justify-content-between pt-2 pb-2">
                    <div class="footer-payment-nav">
                        <ul class="d-md-flex align-items-center">
                            <li class="mr-2">We Support:</li>
                            <li class="mr-2"><i class="fab fa-cc-mastercard"></i></li>
                            <li class="mr-2"><i class="fab fa-cc-paypal"></i></li>
                            <li class="mr-2"><i class="fab fa-cc-stripe"></i></li>
                            <li class="mr-2"><i class="fab fa-cc-visa"></i></li>
                            <li class="mr-2"><i class="fab fa-cc-discover"></i></li>
                        </ul>
                    </div>
                    <div class="footer-payment-nav mb-0">
                        <ul>
                            <li>
                                <select>
                                    <option>English (United States)</option>
                                    <option>English (United States)</option>                                
                                    <option>English (United States)</option>
                                    <option>English (United States)</option>
                                    <option>English (United States)</option>
                                </select>
                            </li>
                            <li>
                                <select>
                                    <option>$ USD</option>
                                    <option>$ USD</option>
                                    <option>$ USD</option>
                                    <option>$ USD</option>
                                    <option>$ USD</option>
                                </select>
                            </li>
                        </ul>
                    </div>
                </div>    
            </div>
        </div>
        <div class="footer-copyright pt-2 pb-2">
            <div class="container">
                <div class="copyright-inner d-md-flex align-items-center justify-content-between">
                    <div class="copyright-text">
                        <p class="m-0 white">2020 Yatriiworld. All rights reserved.</p>
                    </div>
                    <div class="social-links">
                        <ul>  
                            <li><a href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fab fa-linkedin" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>    
            </div>
        </div>
        <div class="overlay"></div>
    </footer>
    <!-- footer ends -->
    
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
                            <h3 class="pink mb-1">Register</h3>  
                            <p>Access thousands of online classes in design, business, and more!</p>                  
                        </div>
                        <div class="login-form text-center">
                            <form>
                                <div class="form-group">
                                    <input type="text" placeholder="Enter Full Name">
                                </div>
                                <div class="form-group">
                                    <input type="email" placeholder="Enter email address">
                                </div>
                                <div class="form-group">
                                    <input type="password" placeholder="Enter password">
                                </div>
                                <div class="form-group">
                                    <input type="password" placeholder="Confirm password">
                                </div>
                            </form>
                            <div class="form-btn">
                                <a href="#" class="nir-btn">Register</a>
                            </div>
                            <div class="form-group mb-0 form-checkbox mt-3">
                                <input type="checkbox"> By clicking this, you are agree to to<a href="#" class=""> our terms of use</a> and <a href="#" class="">privacy policy</a> including the use of cookies
                            </div>
                        </div>
                        <div class="login-social border-t mt-3 pt-2 mb-3">
                            <p class="mb-2">OR continue with</p>
                            <a href="#" class="btn-facebook"><i class="fab fa-facebook" aria-hidden="true"></i> Facebook</a>
                            <a href="#" class="btn-twitter"><i class="fab fa-twitter" aria-hidden="true"></i> Twitter</a>
                            <a href="#" class="btn-google"><i class="fab fa-google" aria-hidden="true"></i> Google</a>
                        </div>
                        <div class="sign-up">
                            <p class="m-0">Already have an account? <a href="login.html" class="pink">Login</a></p>
                        </div>                
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- login Modal -->
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
                            <h3 class="pink">Login</h3>                    
                        </div>
                        <div class="login-form">
                            <form>
                                <div class="form-group">
                                    <input type="email" placeholder="Enter email address">
                                </div>
                                <div class="form-group">
                                    <input type="password" placeholder="Enter password">
                                </div>
                            </form>
                            <div class="form-btn">
                                <a href="#" class="nir-btn">LOGIN</a>
                            </div>
                            <div class="form-group mb-0 form-checkbox mt-3">
                                <input type="checkbox"> Remember Me | <a href="#" class="">Forgot password?</a>
                            </div>
                        </div>
                        <div class="login-social border-t mt-3 pt-2 mb-3">
                            <p class="mb-2">OR continue with</p>
                            <a href="#" class="btn-facebook"><i class="fab fa-facebook" aria-hidden="true"></i> Facebook</a>
                            <a href="#" class="btn-twitter"><i class="fab fa-twitter" aria-hidden="true"></i> Twitter</a>
                        </div>
                        <div class="sign-up">
                            <p class="m-0">Do not have an account? <a href="login.html" class="pink">Sign Up</a></p>
                        </div>                
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- header side menu --> 
    <div class="header_sidemenu">
        <div class="header_sidemenu_in">
            <div class="menu">
                <div class="close-menu">
                    <i class="fa fa-times white"></i>
                </div>
                 <div class="m-contentmain">
                    <div class="cart-main">
                        <div class="cart-box">
                            <div class="popup-container">
                                <h5 class="p-3 mb-0 bg-pink white text-caps">My Carts(3 Items)</h5>
                                <div class="cart-entry d-flex align-items-center p-3">
                                    <a href="#" class="image">
                                        <img src="images/shop/shop1.jpg" alt="">
                                    </a>
                                    <div class="content">
                                        <a href="#" class="title font-weight-bold">Pullover Batwing</a>
                                        <p class="quantity m-0">Quantity: 3</p>
                                        <span class="price">$45.00</span>
                                    </div>
                                    <div class="button-x">
                                        <i class="icon-close"></i>
                                    </div>
                                </div>
                                <div class="cart-entry d-flex align-items-center p-3">
                                    <a href="#" class="image">
                                        <img src="images/shop/shop2.jpg" alt="">
                                    </a>
                                    <div class="content">
                                        <a href="#" class="title font-weight-bold">Pullover Batwing</a>
                                        <p class="quantity m-0">Quantity: 3</p>
                                        <span class="price">$90.00</span>
                                    </div>
                                    <div class="button-x">
                                        <i class="icon-close"></i>
                                    </div>
                                </div>
                                <div class="cart-entry d-flex align-items-center p-3">
                                    <a href="#" class="image">
                                        <img src="images/shop/shop6.jpg" alt="">
                                    </a>
                                    <div class="content">
                                        <a href="#" class="title font-weight-bold">Pullover Batwing</a>
                                        <p class="quantity m-0">Quantity: 3</p>
                                        <span class="price">$90.00</span>
                                    </div>
                                    <div class="button-x">
                                        <i class="icon-close"></i>
                                    </div>
                                </div>
                                <div class="summary-total">
                                    <div class="summary d-flex align-items-center justify-content-between">
                                        <div class="subtotal font-weight-bold">Delivery Charge</div>
                                        <div class="price-s">$10</div>
                                    </div>
                                    <div class="summary d-flex align-items-center justify-content-between">
                                        <div class="subtotal font-weight-bold">Sub Total</div>
                                        <div class="price-s">$200</div>
                                    </div>
                                    <div class="summary d-flex align-items-center justify-content-between">
                                        <div class="subtotal font-weight-bold">Discount</div>
                                        <div class="price-s">$2</div>
                                    </div>
                                    <div class="summary d-flex align-items-center justify-content-between">
                                        <div class="subtotal font-weight-bold">Total</div>
                                        <div class="price-s">$208</div>
                                    </div>
                                </div>
                                <div class="cart-buttons d-flex align-items-center justify-content-between">
                                    <a href="#" class="nir-btn">View Cart</a>
                                    <a href="#" class="nir-btn-black">Checkout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
            <div class="overlay hide"></div>
        </div>
    </div>

    <!-- *Scripts* -->
    <script src="./resources/js/jquery-3.5.1.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/plugin.js"></script>
    <script src="./resources/js/main.js"></script>
    <script src="./resources/js/custom-nav.js"></script>
</body>
</html>