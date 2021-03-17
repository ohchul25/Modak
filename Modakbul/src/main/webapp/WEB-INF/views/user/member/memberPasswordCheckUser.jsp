<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    function test() {
      var p1 = document.getElementById('password1').value;
      var p2 = document.getElementById('password2').value;


          if( p1 != p2 ) {
            alert("비밀번호불일치");
            return false;
          } else{
            alert("비밀번호가 일치합니다");
            return true;
          }
    }
  </script>
</head>
<body>
 <form name="check" method="post" action="memberquitnotice.mo">
    비밀번호 : <input type="password" id="password1" name="MEMBER_PW">
    비밀번호확인 : <input type="password" id="password2">
    <input type="submit" onclick="test()" value="확인">
  </form>

  
</body>
</html>