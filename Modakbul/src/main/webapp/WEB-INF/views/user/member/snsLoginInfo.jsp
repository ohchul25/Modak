<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function(){

	$("#frm").submit();

});

</script>
</head>
<body>
<form id="frm" name="frm" action="/modak/nLogin.mo" method="POST">
	<input type="hidden" id="param1" name="ID" value="${ID}">
	<input type="hidden" id="param2" name="PW" value="${PW}">
</form>
</body>
</html>