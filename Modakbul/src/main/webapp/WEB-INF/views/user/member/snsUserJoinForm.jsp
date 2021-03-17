<%@page import="kr.co.modak.user.member.VO.SnsVO"%>
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
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">

<title>SNS LOGIN</title>

<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
   function signUpValidation() {

      var MEMBER_ID = $("#MEMBER_ID").val();
      var MEMBER_PW = $("#MEMBER_PW").val();
      var userPwCheck = $("#passwordCheck").val();
      var MEMBER_NAME = $("#MEMBER_NAME").val();
      var MEMBER_TEL = $("#MEMBER_TEL").val();
      var MEMBER_LOC1 = $("#MEMBER_LOC1").val();
      var MEMBER_LOC2 = $("#MEMBER_LOC2").val();
      var MEMBER_AGE = $("#MEMBER_AGE").val();
      var MEMBER_GENDER = $("#MEMBER_GENDER").val();
      var MEMBER_EMAIL = $("#MEMBER_EMAIL").val();
      var idChkVal = $("#idChk").val();

      if (!MEMBER_NAME) {
         alert("이름 입력은 필수입니다.");
         $("#MEMBER_NAME").focus();
      } else if (!MEMBER_EMAIL) {
         alert("이메일 입력은 필수입니다.");
         s
         $("#MEMBER_EMAIL").focus();
      } else if (!MEMBER_TEL) {
         alert("전화번호 입력은 필수입니다.");
         s
         $("#MEMBER_TEL").focus();
      } else {
         signUp()
      }
   }

   function fn_idChk() {
      $.ajax({
         url : "/modak/member/idChk.mo",
         type : "post",
         dataType : "json",
         data : {
            "MEMBER_ID" : $("#MEMBER_ID").val()
         },
         success : function(data) {
            if (data == 1) {
               alert("중복된 아이디입니다.");
            } else if (data == 0) {
               $("#idChk").attr("value", "Y");
               alert("사용가능한 아이디입니다.");
            }
         }
      })
   }

   function signUp() {
      var MEMBER_ID = $("#MEMBER_ID").val();
      var MEMBER_PW = $("#MEMBER_PW").val();
      $.ajax({

         url : "/modak/member/memberjoin.mo",
         type : 'POST',
         data : $("#registerform").serialize(),
         success : function(data) {
            if (data == 1) {
               alert("회원가입이 완료됐습니다.");
               sessionStorage.clear();
               console.log("하하");
               location.href = "/modak/snsJoinLogin.mo?ID="+MEMBER_ID+"&PW="+MEMBER_PW;
            } else if (data == 2) {
               alert("이미 존재하는 아이디입니다.");
               return false;
            }
         }

      })
   }

   /* 다음 주소 연동 */
   function execution_daum_address() {

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

   function chkS() {

      var MEMBER_TEL = $("#MEMBER_TEL").val();
      console.log(MEMBER_TEL);
      chkSCM(MEMBER_TEL);
   }

   function chkSCM(MEMBER_TEL) {
      $.ajax({
         url : "/modak/membersendsms.mo",
         type : "POST",
         data : {
            "MEMBER_TEL" : MEMBER_TEL
         },
         success : function(data) {
            alert("인증번호전송");
            $('#cnpbtn').attr('disabled', true);
            $('#submitNum').attr('disabled', false);
            $('#subBtn').attr('disabled', false);
         }
      });
   }

   function chkU() {

      var NUM = $("#submitNum").val();
      console.log(NUM);
      chkSCMU(NUM);
   }

   function chkSCMU(NUM) {
      $.ajax({
         url : "/modak/memberoksms.mo",
         type : "POST",
         data : {
            "NUM" : NUM
         },
         success : function(data) {
            if (data == 1) {
               alert("인증 성공 하였습니다.");
               $('#cnpbtn').attr('value', "인증완료");
               $('#submitNum').attr('disabled', true);
               $('#subBtn').attr('readOnly', true);
            } else if (data == 0) {
               alert("인증 실패 하였습니다.");
            }
         }
      });
   }
</script>
</head>
<body>

   <jsp:include page="/WEB-INF/views/header.jsp" />

   <!-- BreadCrumb Starts -->
   <section class="breadcrumb-main pb-2"
      style="background-image: url(images/bg/bg8.jpg);">
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
                              <li class="active"><a href="dashboard-my-profile.html"><i
                                    class="sl sl-icon-user"></i> 회원가입</a></li>
                              <li><a href="dashboard-reviews.html"><i
                                    class="sl sl-icon-star"></i> 예약하기</a></li>
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
                                 <h4 class="gray">SNS SIGN UP</h4>
                                 <div class="dashboard-list-static">



                                    <!-- Details -->
                                    <div class="my-profile">

                                       <form id="registerform">


                                          <div class="form-group">
                                             <label for="MEMBER_ID">아이디 *</label>
                                          </div>
                                          <div class="form-group">
                                             <input type="text" id="MEMBER_ID" maxlength="20"
                                                value="${beforeID }" disabled="disabled"> <input
                                                type="hidden" id="MEMBER_ID" name="MEMBER_ID"
                                                maxlength="20" value="${beforeID }">
                                          </div>
                                          <div class="form-group">
                                             <label for="MEMBER_PW">*패스워드</label>
                                          </div>
                                          <div class="form-group">
                                             <input type="password" id="MEMBER_PW" maxlength="20"
                                                autocomplete="off" disabled="disabled"> <input
                                                type="hidden" id="MEMBER_PW" name="MEMBER_PW"
                                                maxlength="20" autocomplete="off" value="">
                                          </div>

                                          <div class="form-group">
                                             <label for="passwordCheck">패스워드확인</label>
                                          </div>
                                          <div class="form-group">

                                             <input type="password" id="passwordCheck"
                                                name="passwordCheck" maxlength="20" autocomplete="off"
                                                disabled="disabled">
                                          </div>

                                          <div class="form-group">
                                             <label for="MEMBER_NAME">*이름</label>
                                          </div>
                                          <div class="form-group">
                                             <input type="text" id="MEMBER_NAME" name="MEMBER_NAME"
                                                maxlength="20" value="${snsvo.name }"
                                                readonly="readonly">
                                          </div>

                                          <div class="form-group">
                                             <label for="MEMBER_TEL">*전화번호</label>
                                          </div>
                                          <div class="form-group">
                                             <input type="text" id="MEMBER_TEL" name="MEMBER_TEL"
                                                maxlength="20" value=""> <input type="button"
                                                name="MEMBER_TEL" id="cnpbtn" value="번호인증"
                                                onclick="chkS();" class="main-btn p-2 pl-3 pr-3" /> <input
                                                type="text" name="NUM" id="submitNum"
                                                disabled="disabled" /> <input type="button" id="subBtn"
                                                value="확인" onclick='chkU()' disabled="disabled"
                                                class="main-btn p-2 pl-3 pr-3" />
                                          </div>

                                          <div class="form-group">
                                             <label for="MEMBER_LOC1">*우편번호</label>
                                          </div>
                                          <div class="form-group">
                                             <input class="MEMBER_LOC1" id="MEMBER_LOC1"
                                                name="MEMBER_LOC1" readonly="readonly">
                                          </div>
                                          <input type="button" value="주소찾기"
                                             onclick="execution_daum_address()"
                                             class="main-btn p-2 pl-3 pr-3" />

                                          <div class="clearfix"></div>

                                          <div class="form-group">
                                             <label for="MEMBER_LOC2">*상세주소</label>
                                          </div>
                                          <div class="form-group">
                                             <input type="text" class="MEMBER_LOC2" id="MEMBER_LOC2"
                                                name="MEMBER_LOC2">
                                          </div>

                                          <div class="form-group">
                                             <label for="MEMBER_AGE">*나이</label>
                                          </div>
                                          <div class="form-group">
                                             <input type="text" id="MEMBER_AGE" name="MEMBER_AGE"
                                                maxlength="20" value="">
                                          </div>

                                          <div class="form-group">
                                             <label for="MEMBER_GENDER">*성별</label>
                                          </div>
                                          <div class="form-group">
                                             <label><input type="radio" id="MEMBER_GENDER"
                                                name="MEMBER_GENDER" value="남자" checked />남자</label> <label><input
                                                type="radio" id="MEMBER_GENDER" name="MEMBER_GENDER"
                                                value="여자" />여자</label> <label><input type="radio"
                                                id="MEMBER_GENDER" name="MEMBER_GENDER" value="선택안함" />선택안함</label>
                                          </div>

                                          <div class="form-group">
                                             <label for="MEMBER_EMAIL">*이메일</label>
                                          </div>

                                          <div class="form-group">
                                             <input type="text" id="MEMBER_EMAIL" name="MEMBER_EMAIL"
                                                value="${snsvo.email }" autocomplete="off"
                                                readonly="readonly">
                                          </div>
                                          <input type="hidden" name="MEMBER_SNS"
                                             value="${snsvo.MEMBER_SNS}">
                                          <div class="form-btn">
                                             <input type="button" value="회원가입"
                                                class="main-btn p-2 pl-3 pr-3"
                                                onclick="signUpValidation()"> <input
                                                type="button" value="취소" class="main-btn p-2 pl-3 pr-3"
                                                a href="#" onClick="history.go(-1);return false;">
                                          </div>
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

      <!-- footer starts -->
      <footer style="background-image: url(images/bg/bg3.jpg);"
         class="pt-10 ">
         <div class="footer-upper pb-5">
            <div class="container">
               <div class="row">
                  <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 mb-4">
                     <div class="footer-links">
                        <img src="images/logo-white.png" alt="">
                        <p class="mt-3">In ut odio libero, at vulputate urna. Nulla
                           tristique mi a massa convallis cursus. Nulla eu mi magna</p>
                        <ul>
                           <li><strong>PO Box:</strong> +47-252-254-2542</li>
                           <li><strong>Location:</strong> Collins Street, sydney,
                              Australia</li>
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
                        <p>Want to be notified when we launch a new template or an
                           udpate. Just sign up and we'll send you a notification by
                           email.</p>
                        <div class="newsletter-form">
                           <form>
                              <input type="email" placeholder="Enter your email"> <input
                                 type="submit" class="nir-btn mt-2 w-100" value="Subscribe">
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="footer-payment">
            <div class="container">
               <div
                  class="footer-pay d-md-flex align-items-center justify-content-between pt-2 pb-2">
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
                        <li><select>
                              <option>English (United States)</option>
                              <option>English (United States)</option>
                              <option>English (United States)</option>
                              <option>English (United States)</option>
                              <option>English (United States)</option>
                        </select></li>
                        <li><select>
                              <option>$ USD</option>
                              <option>$ USD</option>
                              <option>$ USD</option>
                              <option>$ USD</option>
                              <option>$ USD</option>
                        </select></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <div class="footer-copyright pt-2 pb-2">
            <div class="container">
               <div
                  class="copyright-inner d-md-flex align-items-center justify-content-between">
                  <div class="copyright-text">
                     <p class="m-0 white">2020 Yatriiworld. All rights reserved.</p>
                  </div>
                  <div class="social-links">
                     <ul>
                        <li><a href="#"><i class="fab fa-facebook"
                              aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter"
                              aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-instagram"
                              aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-linkedin"
                              aria-hidden="true"></i></a></li>
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

</body>
</html>