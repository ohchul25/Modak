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

	<jsp:include page="/WEB-INF/views/header.jsp" />


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

														<table frame="void">
															<div class="form-group">
																<label for="MEMBER_ID">아이디 *</label>
															</div>
															<div class="form-group">
																<!-- id는 수정이 불가능하도록readonly속성 추가-->
																<input type="text" name="MEMBER_ID"
																	value="${info.SELLER_ID }" readonly="readonly">
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
																<input type="text" name="MEMBER_NAME"
																	value="${info.SELLER_NAME }">
															</div>

															<div class="form-group">
																<label for="MEMBER_TEL">전화번호 *</label>
															</div>
															<div class="form-group">
																<input type="text" name="MEMBER_TEL"
																	value="${info.SELLER_TEL }">
															</div>

															<div class="form-group">
																<label for="MEMBER_LOC1">우편번호*</label>
															</div>
															<div class="form-group">
																<input class="MEMBER_LOC1" type="text"
																	name="MEMBER_LOC1" id="MEMBER_LOC1"
																	value="${list.MEMBER_LOC1}">
															</div>

															<input type="button" value="주소찾기"
																onclick="execution_daum_address()" class="nir-btn" />

															</div>
															<div class="form-group">
																<label for="MEMBER_LOC2">상세주소*</label>
															</div>

															<div class="form-group">
																<input class="MEMBER_LOC2" type="text"
																	name="MEMBER_LOC2" id="MEMBER_LOC2"
																	value="${list.MEMBER_LOC2}">
															</div>

															<div class="form-group">
																<label for="MEMBER_GENDER">사업자번호*</label>
															</div>
															<div class="form-group">
																<input type="text" name="MEMBER_GENDER"
																	value="${info.SELLER_COMPANY_NUM }">
															</div>

															<div class="form-group">
																<label for="MEMBER_EMAIL">이메일*</label>
															</div>
															<div class="form-group">
																<input type="text" name="MEMBER_EMAIL"
																	value="${info.SELLER_EMAIL }">
															</div>

															<div class="form-btn">
																<input type="button" value="수정" class="nir-btn"
																	onclick='return info_chk4(this.form);'> <input
																	type="button" value="탈퇴" class="nir-btn-black"
																	onclick='return info_chk2(this.form);'> <input
																	type="button" value="취소" class="nir-btn" a href="./"
																	onClick="history.go(-1);return false;" />
																<div style="color: red;">${message}</div>

															</div>
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

</body>
</html>