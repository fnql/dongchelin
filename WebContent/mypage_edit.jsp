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
<form name=form1 method=post action=addrbook_control.jsp>
<input type=hidden name="mb_email" value="<%=mb.getEmail()%>">
<input type=hidden name="action" value="update">

<table border="1">
  <tr>
    <th>이 름</th>
    <td><input type="text" name="ab_name" value="<%=mb.getName() %>"></td>
  </tr>
  <tr>
    <th>password</th>
    <td><input type="text" name="ab_email" value="<%=mb.getPassword() %>"></td>
  </tr>
  <tr>
    <th>email</th>
    <td><input type="text" name="ab_email" value="<%=mb.getEmail() %>"></td>
  </tr>
    <tr>
    <th>성별</th>
    <td><input type="text" name="ab_tel" value="<%=mb.getMfx() %>"></td>
  </tr>
  <tr>
    <th>선호음식</th>
    <td><input type="text" name="ab_comdept" value="<%=mb.getBest()%>"></td>
  </tr>
  <tr>
    <th>자기소개</th>
    <td><input type="text" name="ab_memo" value="<%=mb.getMyself() %>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>

</div>
</body>
</html>