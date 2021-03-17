<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원 가입</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

      if (!MEMBER_ID) {
         alert("아이디 입력은 필수입니다.");
         $("#MEMBER_ID").focus();
      } else if (!MEMBER_PW) {
         alert("비밀번호 입력은 필수입니다.");
         $("#MEMBER_PW").focus();
      } else if (!userPwCheck) {
         alert("비밀번호 확인 입력은 필수입니다.");
         $("#passwordCheck").focus();
      } else if (MEMBER_PW != userPwCheck) {
         alert("비밀번호가 맞지 않습니다.");
         $("#userPwCheck").focus();
      } else if (!MEMBER_NAME) {
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
      } else if (idChkVal == "N") {
         alert("중복확인 버튼을 눌러주세요.");
         $("#idChk").focus();
      } else if (idChkVal == "Y") {
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

      $.ajax({

         url : "/modak/member/memberjoin.mo",
         type : 'POST',
         data : $("#registerform").serialize(),
         success : function(data) {
            if (data == 1) {
               alert("회원가입이 완료됐습니다.");
               location.href = "/modak/"
            } else if (data == 2) {
               alert("이미 존재하는 아이디입니다.");
               return false;
            }
         }

      })
   }
   
   /* 다음 주소 연동 */
   function execution_daum_address(){
      
      new daum.Postcode({
           oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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

<body style="background-color: #f0f5f3">
   <form id="registerform">
   <c:choose>
   		<c:when test="${beforeID }">
   		<div class="fieldlabel">
         <label for="MEMBER_ID">*아이디</label>
      </div>
      <div class="formfield">
         <input type="text" id="MEMBER_ID" name="MEMBER_ID" maxlength="20"
            value="${beforeID }" readonly="readonly">
      </div>
      <div class="fieldlabel">
         <label for="MEMBER_PW">*패스워드</label>
      </div>
      <div class="formfield">
         <input type="password" id="MEMBER_PW" name="MEMBER_PW" maxlength="20"
            autocomplete="off" disabled="disabled">
      </div>

      <div class="fieldlabel">
         <label for="passwordCheck">패스워드확인</label>
      </div>
      <div class="formfield">

         <input type="password" id="passwordCheck" name="passwordCheck"
            maxlength="20" autocomplete="off" disabled="disabled">
      </div>
   		
   		</c:when>
   	<c:otherwise>
   	<div class="fieldlabel">
         <label for="MEMBER_ID">*아이디</label>
      </div>
      <div class="formfield">
         <input type="text" id="MEMBER_ID" name="MEMBER_ID" maxlength="20"
            value="">
      </div>
      <button class="idChk" type="button" id="idChk" onclick="fn_idChk();"
         value="N">중복확인</button>

      <div class="fieldlabel">
         <label for="MEMBER_PW">*패스워드</label>
      </div>
      <div class="formfield">
         <input type="password" id="MEMBER_PW" name="MEMBER_PW" maxlength="20"
            autocomplete="off">
      </div>

      <div class="fieldlabel">
         <label for="passwordCheck">패스워드확인</label>
      </div>
      <div class="formfield">

         <input type="password" id="passwordCheck" name="passwordCheck"
            maxlength="20" autocomplete="off">
      </div>
   	
   	</c:otherwise>
   </c:choose>
      
      <div class="fieldlabel">
         <label for="MEMBER_NAME">*이름</label>
      </div>
      <div class="formfield">
         <input type="text" id="MEMBER_NAME" name="MEMBER_NAME" maxlength="20"
            value="">
      </div>

      <div class="fieldlabel">
         <label for="MEMBER_TEL">*전화번호</label>
      </div>
      <div class="formfield">
         <input type="text" id="MEMBER_TEL" name="MEMBER_TEL" maxlength="20"
            value="">
      </div>

      <div class="fieldlabel">
         <label for="MEMBER_LOC1">*우편번호</label>
      </div>
      <div class="formfield">
         <input class="MEMBER_LOC1" id="MEMBER_LOC1" name="MEMBER_LOC1" readonly="readonly">
      </div>
      <input type="button" value="주소찾기" onclick="execution_daum_address()" />
         
      <div class="clearfix"></div>

      <div class="fieldlabel">
         <label for="MEMBER_LOC2">*상세주소</label>
      </div>
      <div class="formfield">
         <input type="text" class="MEMBER_LOC2" id="MEMBER_LOC2" name="MEMBER_LOC2">
      </div>
      
   

      <div class="fieldlabel">
         <label for="MEMBER_AGE">*나이</label>
      </div>
      <div class="formfield">
         <input type="text" id="MEMBER_AGE" name="MEMBER_AGE" maxlength="20"
            value="">
      </div>

      <div class="fieldlabel">
         <label for="MEMBER_GENDER">*성별</label>
      </div>
      <div class="formfield">
         <label><input type="radio" id="MEMBER_GENDER"
            name="MEMBER_GENDER" value="남자" checked />남자</label> <label><input
            type="radio" id="MEMBER_GENDER" name="MEMBER_GENDER" value="여자" />여자</label>
         <label><input type="radio" id="MEMBER_GENDER"
            name="MEMBER_GENDER" value="선택안함" />선택안함</label>
      </div>

      <div class="fieldlabel">
         <label for="MEMBER_EMAIL">*이메일</label>
      </div>
      <div class="formfield">
         <input type="text" id="MEMBER_EMAIL" name="MEMBER_EMAIL" value="" autocomplete="off">
      </div>
		<input type="hidden" name="MEMBER_SNS" value="modak">
      <div class="btnfield">
         <input type="button" value="회원가입" onclick="signUpValidation()">
         <input type="button" value="취소" a href="#"
            onClick="history.go(-1);return false;" />
      </div>
   </form>
</body>
</html>