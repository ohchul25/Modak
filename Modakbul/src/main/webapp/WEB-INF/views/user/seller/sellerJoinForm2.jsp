<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

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
				$('#subBtn').attr('disabled', false);
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
	<form:form action="sellerJoin.mo" method="post" modelAttribute="MoUserSellerVO"
	role="joinForm" name="joinForm">
		<label>아이디 : </label><input type="text" name="SELLER_ID">
		<br><label>비밀번호 : </label><input type="password" name="SELLER_PW">
		<br><label>이름 : </label><input type="text" name="SELLER_NAME">
		<br><label>전화번호 : </label><input type="tel" name="SELLER_TEL">
		<br><label>이메일 : </label><input type="email" name="SELLER_EMAIL">
		<br><label>사업자번호 : </label><input type="text" id="SELLER_COMPANY_NUM" name="SELLER_COMPANY_NUM">
		<input type="button" id="cpnbtn" value="인증하기" onclick='chkS()'>
		<br><input type="submit" id="subBtn" value="가입" disabled="disabled">
	</form:form>

</body>
</html>