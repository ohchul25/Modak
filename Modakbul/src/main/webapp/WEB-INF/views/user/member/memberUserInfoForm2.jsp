<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.modak.user.member.VO.MoUserMemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>My Page</title>

<script>
	
	function info_chk2(frm) {
		frm.action = 'memberpasswordcheck.mo';
		frm.submit();
		return true;
	}
</script>

</head>
<body style="background-color: #f0f5f3">
	<h2>내 정보 보기</h2>
	<form name="form1" method="post" action="memberupdate.mo">

		<table border="1" width="400px">
			<c:forEach var="list" items="${list}">
				<tr>
					<td>아이디</td>
					<!-- id는 수정이 불가능하도록readonly속성 추가-->
					<td><input name="MEMBER_ID" value="${list.MEMBER_ID}"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="MEMBER_PW"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input name="MEMBER_NAME" value="${list.MEMBER_NAME}"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input name="MEMBER_TEL" value="${list.MEMBER_TEL}"></td>
				</tr>
				<tr>
					<td>집 주소</td>
					<td><input name="MEMBER_LOC1" value="${list.MEMBER_LOC1}"></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input name="MEMBER_LOC2" value="${list.MEMBER_LOC2}"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input name="MEMBER_AGE" value="${list.MEMBER_AGE}"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input name="MEMBER_GENDER" value="${list.MEMBER_GENDER}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input name="MEMBER_EMAIL" value="${list.MEMBER_EMAIL}"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정">
						<input type="button" value="탈퇴"  onclick='return info_chk2(this.form);'>
						<div style="color: red;">${message}</div> 
						<a href="#" onClick="history.go(-1);return false;">취소</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>