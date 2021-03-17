<%@page import="org.springframework.http.HttpRequest"%>
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
<a href="test.mo">테스트</a>
<sec:authorize access="isAnonymous()">
비회원<br>
<a href="memberlogin.mo">로그인</a> ==> 회원로그인폼<br>
<a href="seller/sellerLogin.mo">판매자 로그인</a> ==> 회원로그인폼하고 합칠거<br>
<a href="member/memberjoinform.mo">일반회원가입</a> ==> 일반회원가입 페이지<br>
<a href="sellerJoin.mo">판매회원가입</a> ==> 판매회원가입 페이지<br>
<a href="naverLogin.mo">네이버 로그인</a> ==> 판매회원가입 페이지<br>
<a href="https://kauth.kakao.com/oauth/authorize?client_id=3bbb5c66249fe62abe5aac0a1136258b&redirect_uri=http://localhost:8088/modak/kakaocall.mo&response_type=code">카카오로그인</a>
</sec:authorize>

<br>
	<sec:authorize access="hasRole('ROLE_MEMBER')">
	<br> 회원 로그인
	<br>
		${memberID } 님 안녕하세요 :)<br>
		<a href="member/memberinfo.mo">내 정보보기</a>
		<br>
		<a href="logouts.mo">로그아웃</a>
		<br>
	</sec:authorize>


<sec:authorize access="hasRole('ROLE_SELLER')" >
판매자 로그인<br>
${sellerID } 님 안녕하세요 :)<br>
<a href="/modak/seller/sellerMain.mo">기업정보 보기</a><br>
<a href="logouts.mo">로그아웃</a><br>
</sec:authorize>
<br>




<%-- <sec:authorize access="hasRole('ROLE_SELLER')">
<sec:authentication property="denyAll()" var="user"/> 
<c:set var="usernum" value="${user.username}" />
타입 : ${user} <br>
ID : ${user.username} <br>
PW : ${user.password}
NUM : ${user.SELLER_NUM}
</sec:authorize> --%>

</body>
</html>