<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.modak.user.member.VO.MoUserMemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zxx">

<head>



<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Yatriiworld - Travel and Tours Booking Template</title>
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/images/favicon.png">
<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<!--Custom CSS-->
<link href="../resources/css/style.css" rel="stylesheet" type="text/css">
<!--Plugin CSS-->
<link href="../resources/css/plugin.css" rel="stylesheet" type="text/css">
<!--ashboard CSS-->
<link href="../resources/css/dashboard.css" rel="stylesheet"
	type="text/css">
<!--Flaticons CSS-->
<link href="../resources/fonts/flaticon.css" rel="stylesheet"
	type="text/css">
<!--Icons CSS-->
<link href="../resources/css/icons.css" rel="stylesheet" type="text/css">
<!--Font Awesome-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

<link rel="stylesheet" href="../resources/fonts/line-icons.css"
	type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">
	function info_chk2(frm) {
		frm.action = 'memberpasswordcheck.mo';
		frm.submit();
		return true;
	}
	
	function info_chk4(frm) {
		frm.action = 'memberupdate.mo';
		frm.submit();
		return true;
	}
	
	function execution_daum_address() {

		var MEMBER_LOC1 = $("#MEMBER_LOC1").val();
		var MEMBER_LOC2 = $("#MEMBER_LOC2").val();	
		
		
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.

				} else {
					addr += ' ';
				}

				$(".MEMBER_LOC1").val(data.zonecode);
				$(".MEMBER_LOC2").val(addr);
			}
		}).open();
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
					<div
						class="navbar-flex d-flex align-items-center justify-content-between w-100 pb-2 pt-2">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<a class="navbar-brand" href="./"> <img
								src="<%=request.getContextPath()%>/resources/images/modak4.png"
								alt="image">
							</a>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="navbar-collapse1 d-flex align-items-center"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav" id="responsive-menu">
								<li class="dropdown submenu active"><a href="./"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Home <i
										class="icon-arrow-down" aria-hidden="true"></i></a>
									<ul class="dropdown-menu">
										<li><a href="./">Homepage Default</a></li>

									</ul></li>


								<li class="submenu dropdown"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Pages <i
										class="icon-arrow-down" aria-hidden="true"></i></a>
									<ul class="dropdown-menu">
										<li><a href="booking.html">Booking</a></li>
										<li><a href="confirmation.html">Confirmation</a></li>
										<li class="submenu dropdown"><a href="gallery.html"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false">Gallery<i
												class="fa fa-angle-right" aria-hidden="true"></i></a>
											<ul class="dropdown-menu">
												<li><a href="gallery.html">Gallery</a></li>
												<li><a href="gallery1.html">Gallery Masonry</a></li>
											</ul></li>
										<li class="submenu dropdown"><a href="404.html"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false">Error<i
												class="fa fa-angle-right" aria-hidden="true"></i></a>
											<ul class="dropdown-menu">
												<li><a href="404.html">Error Page 1</a></li>
												<li><a href="404-1.html">Error Page 2</a></li>
											</ul></li>
										<li class="submenu dropdown"><a href="comingsoon.html"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false">Comming Soon<i
												class="fa fa-angle-right" aria-hidden="true"></i></a>
											<ul class="dropdown-menu">
												<li><a href="comingsoon.html">Coming Soon 1</a></li>
												<li><a href="comingsoon-1.html">Coming Soon 2</a></li>
											</ul></li>
										<li class="submenu dropdown"><a href="#"
											class="dropdown-toggle" data-toggle="dropdown" role="button"
											aria-haspopup="true" aria-expanded="false">Shop <i
												class="fa fa-angle-right" aria-hidden="true"></i></a>
											<ul class="dropdown-menu">
												<li><a href="shop-grid1.html">Right Grid</a></li>
												<li><a href="shop-list1.html">Right List</a></li>
												<li><a href="shop-detail.html">Shop Single One</a></li>
												<li><a href="cart.html">Cart</a></li>
												<li><a href="checkout.html">Checkout</a></li>
												<li><a href="login.html">Account</a></li>
												<li><a href="wishlist.html">Wishlist</a></li>
												<li><a href="forgot-password.html">Forgot Password</a></li>
											</ul></li>
										<li><a href="faq.html">Faq</a></li>
										<li><a href="testimonial.html">Testimonials</a></li>
										<li><a href="pricing.html">Pricing</a></li>
									</ul></li>

								<li class="submenu dropdown"><a href="destination.html"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Destination <i
										class="icon-arrow-down" aria-hidden="true"></i></a>
									<ul class="dropdown-menu">
										<li><a href="destination-list.html">Destination List</a></li>
										<li><a href="destination-grid.html">Destination Grid</a></li>
										<li><a href="destination-full.html">Destination
												Fullwidth</a></li>
										<li><a href="destination-left.html">Destination Left</a></li>
										<li><a href="destination-list.html">Destination Right</a></li>
										<li><a href="destination-masonry.html">Destination
												Masonry</a></li>
										<li class="submenu dropdown"><a
											href="destination-single.html" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-haspopup="true"
											aria-expanded="false">Destination Single<i
												class="fa fa-angle-right" aria-hidden="true"></i></a>
											<ul class="dropdown-menu">
												<li><a href="destination-single.html">Destination
														Single 1</a></li>
												<li><a href="destination-single1.html">Destination
														Single 2</a></li>
												<li><a href="destination-single-full.html">Destination
														Single Full</a></li>
											</ul></li>
									</ul></li>

								<li class="submenu dropdown"><a href="dashboard.html"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">Dashboard <i
										class="fa fa-angle-down" aria-hidden="true"></i></a>
									<ul class="dropdown-menu">
										<li><a href="dashboard.html">Dashboard</a></li>
										<li><a href="dashboard-my-profile.html">User Profile</a></li>
										<li><a href="dashboard-list.html">User Wishlist</a></li>
										<li><a href="dashboard-messages.html">User Messages</a></li>
										<li><a href="dashboard-history.html">Booking History</a></li>
										<li><a href="dashboard-add-new.html">Add New</a></li>
										<li><a href="dashboard-list.html">Tour List</a></li>
										<li><a href="dashboard-reviews.html">Dashboard
												Reviews</a></li>
									</ul></li>
								<li><a href="contact.html">Contact Us</a></li>
							</ul>
							<a href="#" class="cart-icon d-flex align-items-center ml-1"><i
								class="icon-basket-loaded"></i><span class="cart-label">3</span></a>
						</div>
						<!-- /.navbar-collapse -->
						<sec:authorize access="isAnonymous()">
							<div class="register-login">
								<a href="member/memberjoinform.mo" class="mr-2"><i
									class="icon-user mr-1"></i> SIGN UP</a> <a href="#"
									data-toggle="modal" data-target="#login"><i
									class="icon-login mr-1"></i> LOGIN</a>
							</div>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_MEMBER')">
							<div class="register-login">
								<a href="memberinfo.mo" class="mr-2"><i
									class="icon-user mr-1"></i> MY PAGE</a> 
									<a href="logouts.mo"><i
									class="icon-login mr-1"></i> LOGOUT</a>
							</div>
						</sec:authorize>
						<div id="slicknav-mobile"></div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>
		<!-- Navigation Bar Ends -->
	</header>
	<!-- header ends -->
	
	<br>
	<br>
	<br>
	
	<!-- BreadCrumb Starts -->
	<section class="breadcrumb-main pb-2"
		style="background-image: url(./resources/images/bg/bg8.jpg);">
		<div class="dot-overlay"></div>
	</section>
	<!-- BreadCrumb Ends -->

	<!-- Dashboard -->
	<div id="dashboard" class="pt-10 pb-10">
		<div class="container">
			<div class="dashboard-main">
				<div class="row">
					<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
						<div class="dashboard-sidebar">

							<!-- Responsive Navigation Trigger -->
							<a href="#" class="dashboard-responsive-nav-trigger"><i
								class="fa fa-reorder"></i> Dashboard Navigation</a>
							<div class="dashboard-nav">
								<div class="dashboard-nav-inner">
									<ul>
										<li class="active"><a href="memberinfo.mo"><i
												class="sl sl-icon-user"></i>MY PROFILE</a></li>
										<li class="active"><a href="#"><i
												class="sl sl-icon-user"></i>MY RESERVATION</a></li>
										<li class="active"><a href="#"><i
												class="sl sl-icon-user"></i>MY REVIEW</a></li>

									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
						<div class="dashboard-content">
							<div class="dashboard-form mb-4">
								<div class="row">

									<!-- Profile -->
									<div class="col-lg-6 col-md-6 col-xs-12 padding-right-30">
										<div class="dashboard-list">
											<h4 class="gray">MY PROFILE</h4>
											<div class="dashboard-list-static">



												<!-- Details -->
												<div class="my-profile">

													<form name="form1">
													
														<table frame= "void">
														<c:forEach var="list" items="${list}">
															<div class="form-group">
																<label for="MEMBER_ID">아이디 *</label>
															</div>
															<div class="form-group">
																<!-- id는 수정이 불가능하도록readonly속성 추가-->
																<input type="text" name="MEMBER_ID" value="${list.MEMBER_ID}" readonly="readonly">
															</div>
															<br>
															
															<div class="form-group">
																<label for="MEMBER_PW">비밀번호 *</label>
															</div>
															<div class="form-group">
																<input type="password" name="MEMBER_PW">
															</div>
															
															<div class="form-group">
																<label for="MEMBER_NAME">이름 *</label>
															</div>
															<div class="form-group">
																<input type="text" name="MEMBER_NAME" value="${list.MEMBER_NAME}">
															</div>
															
															<div class="form-group">
																<label for="MEMBER_TEL">전화번호 *</label>
															</div>
															<div class="form-group">
																<input type="text" name="MEMBER_TEL" value="${list.MEMBER_TEL}">
															</div>
															
															<div class="form-group">
																<label for="MEMBER_LOC1">우편번호*</label>
															</div>
															<div class="form-group">
																<input class="MEMBER_LOC1" type="text" name="MEMBER_LOC1" id="MEMBER_LOC1" value="${list.MEMBER_LOC1}">
															</div>
															
															<input type="button" value="주소찾기"
															onclick="execution_daum_address()" class="nir-btn" />
															
															</div>
															<div class="form-group">
																<label for="MEMBER_LOC2">상세주소*</label>
															</div>
															
															<div class="form-group">
																<input class="MEMBER_LOC2" type="text" name="MEMBER_LOC2" id="MEMBER_LOC2" value="${list.MEMBER_LOC2}">
															</div>
															
															<div class="form-group">
																<label for="MEMBER_AGE">나이*</label>
															</div>
															<div class="form-group">
																<input type="text" name="MEMBER_AGE" value="${list.MEMBER_AGE}">
															</div>
															
															<div class="form-group">
																<label for="MEMBER_GENDER">성별*</label>
															</div>
															<div class="form-group">
																<input type="text" name="MEMBER_GENDER" value="${list.MEMBER_GENDER}">
															</div>
															
															<div class="form-group">
																<label for="MEMBER_EMAIL">이메일*</label>
															</div>
															<div class="form-group">
																<input type="text" name="MEMBER_EMAIL" value="${list.MEMBER_EMAIL}">
															</div>
															
															<input type="hidden" name="MEMBER_SNS" value="modak">
															
															<div class="form-btn">
																<input type="button" value="수정" class="nir-btn" onclick='return info_chk4(this.form);'> 
																<input type="button" value="탈퇴"  class="nir-btn-black" onclick='return info_chk2(this.form);'>
																<input type="button" value="취소"  class="nir-btn" a href="./" onClick="history.go(-1);return false;" />
															<div style="color: red;">${message}</div> 
																
															</div>
														</c:forEach>
														</table>
													</form>
												</div>
											</div>
										</div>


									</div>
								</div>



							</div>
						</div>
					</div>
				</div>
				<!-- Content / End -->
			</div>
		</div>
	</div>
		<!-- Dashboard / End -->



		<!-- Back to top start -->
		<div id="back-to-top">
			<a href="#"></a>
		</div>
		<!-- Back to top ends -->

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
									<h5 class="p-3 mb-0 bg-pink white text-caps">My Carts(3
										Items)</h5>
									<div class="cart-entry d-flex align-items-center p-3">
										<a href="#" class="image"> <img
											src="images/shop/shop1.jpg" alt="">
										</a>
										<div class="content">
											<a href="#" class="title font-weight-bold">Pullover
												Batwing</a>
											<p class="quantity m-0">Quantity: 3</p>
											<span class="price">$45.00</span>
										</div>
										<div class="button-x">
											<i class="icon-close"></i>
										</div>
									</div>
									<div class="cart-entry d-flex align-items-center p-3">
										<a href="#" class="image"> <img
											src="images/shop/shop2.jpg" alt="">
										</a>
										<div class="content">
											<a href="#" class="title font-weight-bold">Pullover
												Batwing</a>
											<p class="quantity m-0">Quantity: 3</p>
											<span class="price">$90.00</span>
										</div>
										<div class="button-x">
											<i class="icon-close"></i>
										</div>
									</div>
									<div class="cart-entry d-flex align-items-center p-3">
										<a href="#" class="image"> <img
											src="images/shop/shop6.jpg" alt="">
										</a>
										<div class="content">
											<a href="#" class="title font-weight-bold">Pullover
												Batwing</a>
											<p class="quantity m-0">Quantity: 3</p>
											<span class="price">$90.00</span>
										</div>
										<div class="button-x">
											<i class="icon-close"></i>
										</div>
									</div>
									<div class="summary-total">
										<div
											class="summary d-flex align-items-center justify-content-between">
											<div class="subtotal font-weight-bold">Delivery Charge</div>
											<div class="price-s">$10</div>
										</div>
										<div
											class="summary d-flex align-items-center justify-content-between">
											<div class="subtotal font-weight-bold">Sub Total</div>
											<div class="price-s">$200</div>
										</div>
										<div
											class="summary d-flex align-items-center justify-content-between">
											<div class="subtotal font-weight-bold">Discount</div>
											<div class="price-s">$2</div>
										</div>
										<div
											class="summary d-flex align-items-center justify-content-between">
											<div class="subtotal font-weight-bold">Total</div>
											<div class="price-s">$208</div>
										</div>
									</div>
									<div
										class="cart-buttons d-flex align-items-center justify-content-between">
										<a href="#" class="nir-btn">View Cart</a> <a href="#"
											class="nir-btn-black">Checkout</a>
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
		<script src="../resources/js/jquery-3.5.1.min.js"></script>
		<script src="../resources/js/bootstrap.min.js"></script>
		<script src="../resources/js/plugin.js"></script>
		<script src="../resources/js/main.js"></script>
		<script src="../resources/js/custom-nav.js"></script>
		<script src="../resources/js/jpanelmenu.min.js"></script>
		<script src="../resources/js/dashboard-custom.js"></script>

		<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>