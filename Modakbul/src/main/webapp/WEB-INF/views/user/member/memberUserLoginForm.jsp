<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function loginValidation(){
   var MEMBER_ID = $("#MEMBER_ID").val();
   var MEMBER_PW = $("#MEMBER_PW").val();
   
   if(!MEMBER_ID){
      alert("아이디를 입력하세요.");
      $("#MEMBER_ID").focus();
      return false;
   }else if(!MEMBER_PW){
      alert("비밀번호를 입력하세요.");
      $("#MEMBER_PW").focus();
      return false;
   }else {
      $('#signUp').submit();
   }
   
}

function changeMethod(){
   $.ajax({
      url : "memberlogin.mo",
      type : 'GET',
      dataType : 'html',
      success:function(data){
         $("#signUp").html(data);
      }
   })
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
<div id="change">아아</div>
<form action="${pageContext.request.contextPath}/member/mLogin.mo" id="signUp" class="signUp" method="post">
   <h1 class="signUpTitle">로그인</h1>
   <input type="text" id="MEMBER_ID" name="MEMBER_ID" class="signUpInput" placeholder="ID" autofocus onkeyup="enterKeyCheck()">
   <input type="password" id="MEMBER_PW" name="MEMBER_PW" class="signUpInput" placeholder="Password" onkeyup="enterKeyCheck()">
   <input type="button" value="로그인" onclick="loginValidation()" class="loginButton">
   <input type="button" value="회원가입" onclick="location.href='/modak/sellerLoginchk.mo'" class="signUpButton">
   <input type="button" value="개인회원로그인" onclick="changeMethod()" class="signUpButton">
   <input type="submit" value="가입">
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</body>
</html>