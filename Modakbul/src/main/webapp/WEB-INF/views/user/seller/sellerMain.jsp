<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authentication property="principal" var="user"/>
<c:set var="usernum" value="${user.username}" /> 
메인 페이지!
${usernum } 님 환영합니다!
<a href="/modak/seller/${usernum }/sellerInfo.mo">내기업정보</a>
리스폰스!!
</body>
</html>