<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 

<script type="text/javascript">
function info_chk2(frm) {
    frm.action = '/modak/seller/dropChkPwd.mo';
    frm.submit();
    return true;
 }
</script>

</head>

<body>

<sec:authentication property="principal" var="user"/>
<c:set var="sellernum" value="${user.username}" /> 

<form action="/modak/seller/sellerUpdate.mo" method="post" role="infoForm">
	<table>
<tr>
<td>
<input type="hidden" name="SELLER_NUM" value="${sellernum} ">
<input name="SELLER_ID" value="${info.SELLER_ID }" readonly="readonly">
</td><td>
<input type="text" name="SELLER_PW">
</td><td>
<input name="SELLER_NAME" value="${info.SELLER_NAME }">
</td><td>
<input name="SELLER_TEL" value="${info.SELLER_TEL }">
</td><td>
<input name="SELLER_EMAIL" value="${info.SELLER_EMAIL }">
</td><td>
<input name="SELLER_COMPANY_NUM" value="${info.SELLER_COMPANY_NUM }" readonly="readonly">
</td>
</tr>
	</table>
	${message }
<input type="submit" value="수정" >
<input type="button" value="탈퇴" onclick='return info_chk2(this.form);'>
	</form>


</body>
</html>