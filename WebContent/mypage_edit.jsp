<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="loginRegister.*" %>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" 
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
  crossorigin="anonymous">
<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 수정</title>
</head>

<jsp:useBean id="mb" scope="request" class="loginRegister.Member" />

<body>
<jsp:include page="module/top.jsp" flush="false" />
<div align="center">
<H2>마이페이지 수정</H2>
<HR>
[<a href=mypage.jsp>마이페이지로</a>] <p>
<form name=form1 method=post action=member_control.jsp>
<input type=hidden name="mb_email" value="<%=mb.getEmail()%>">
<input type=hidden name="action" value="update">

<table border="1">
  <tr>
    <th>이 름</th>
    <td><input type="text" name="name" size="10" maxlength="10" value="<%=mb.getName() %>" required></td>
  </tr>
  <tr>
    <th>password</th>
    <td><input type="text" name="password" value="<%=mb.getPassword() %>"></td>
  </tr>
  <tr>
    <th>email</th>
    <td><input type="text" name="email" value="<%=mb.getEmail() %>" readonly></td>
  </tr>
    <tr>
    <th>성별</th>
    <td>
    	<input type="radio" name="mfx" value="male">남자
    	<input type="radio" name="mfx" value="female" checked>여자<br/></td>
  </tr>
  <tr>
    <th>선호음식</th>
    <td>
        <input type="checkbox" name="best" value="한식" onclick="check_only(this)" checked>한식
        <input type="checkbox" name="best" value="중식" onclick="check_only(this)">중식
       	<input type="checkbox" name="best" value="일식" onclick="check_only(this)">일식
    </td>
  </tr>
  <tr>
    <th>자기소개</th>
    <td><input type="text" name="myself" value="<%=mb.getMyself() %>" size="30" maxlength="20"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>

</div>
</body>
</html>