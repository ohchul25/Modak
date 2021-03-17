<%@page import="org.springframework.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zxx">

<head>
    <title>MODAKBUL</title>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/resources/images/favicon.png">
    <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!--Custom CSS-->
    <link href="<%= request.getContextPath() %>/resources/css/style.css" rel="stylesheet" type="text/css">
    <!--Plugin CSS-->
    <link href="<%= request.getContextPath() %>/resources/css/plugin.css" rel="stylesheet" type="text/css">
    <!--Flaticons CSS-->
    <link href="<%= request.getContextPath() %>/resources/fonts/flaticon.css" rel="stylesheet" type="text/css">
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
		   frm.action = '/modak/seller/sLogin.mo';
		   frm.submit();
		   return true;
	}
	
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
    <!-- 전체 상품 -->                          
                                <li class="submenu dropdown">
                                    <a href="/modak/ProductCamplistMain.mo" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">전체상품 <i class="icon-arrow-down" aria-hidden="true"></i></a> 
                                    <ul class="dropdown-menu">
                                        <li class="submenu dropdown">
                                        </li>
                                    </ul>
                                </li>
    <!-- 추천 상품 -->                          
                                <li class="submenu dropdown">
                                    <a href="/modak/ProductCamplistReco.mo" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">추천상품 <i class="icon-arrow-down" aria-hidden="true"></i></a> 
                                    <ul class="dropdown-menu">
                                        <li class="submenu dropdown">
                                        </li>
                                    </ul> 
                                </li>
                            </ul>
                            <div class="header_sidemenu">
                                <div class="mhead">
                                    <span class="menu-ham">
                                        <a href="#" class="cart-icon d-flex align-items-center ml-1"><i class="icon-basket-loaded"></i><span class="cart-label">3</span></a>
                                    </span>
                                </div>
                            </div>
               </div><!-- /.navbar-collapse -->  
<sec:authorize access="isAnonymous()">
                        <div class="register-login">
                            <a href="#" class="mr-2" data-toggle="modal" data-target="#register"><i class="icon-user mr-1"></i> Seller Login</a>
                            <a href="#" data-toggle="modal" data-target="#login"><i class="icon-login mr-1"></i> User Login</a>
                        </div>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_MEMBER')">
                        <div class="register-login">
                        <label>${memberID } 님 안녕하세요 :)</label>
                            <a href="/modak/member/memberinfo.mo" class="mr-2" ><i class="icon-user mr-1"></i> MY PAGE</a>
                            <a href="logouts.mo"><i class="icon-login mr-1"></i> 로그아웃</a>
                        </div>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_SELLER')">
                        <div class="register-login">
                        <label>${sellerID } 님 안녕하세요 :)</label>
                            <a href="/modak/seller/sellerMain.mo" class="mr-2"><i class="icon-user mr-1"></i>판매자정보보기</a>
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
                                <h5 class="p-3 mb-0 bg-pink white text-caps">Like List ~ </h5>


<!-- 가져와서 돌릴 리스트 -->
                     <c:forEach var="likeList" items="${likeList}">
                                <input type="hidden" id="CAMPLIST_ID" value="${likeList.CAMPLIST_ID}">
                                
                                <div class="cart-entry d-flex align-items-center p-3">




<!--  캠핑장 아이디 -->
                                 <a href="https://www.google.com/search=${likeList.CAMPLIST_ID}" class="image">${likeList.CAMPLIST_ID}</a>



<!-- 캠핑장 세부정보 -->
                                    <div class="content">
                                        <a href="#" class="title font-weight-bold">${likeList.CAMPLIST_NAME}</a>
                                        <p class="quantity m-0">${likeList.CAMPLIST_ADD1}</p>
                                        <span class="price">${likeList.ROOMLIST_PRI1}~</span>
                                    </div>
                                    
                                    
                                    
<!-- 좋아요 하트버튼 -->                                 
                                    <div class="button-x">
                                        <input type="image" src="./resources/images/like_after.png" onclick="like_func()" width="20" height="20">
                                    </div>
                                </div>
                         </c:forEach>       
                                <div class="summary-total">
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

    <script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/plugin.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/custom-swiper.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/custom-nav.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/custom-date.js"></script>
</body>
</html>