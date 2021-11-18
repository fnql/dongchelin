<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, loginRegister.*"%>
<!DOCTYPE HTML>
<html>
<head>

<script type="text/javascript">
	function check(email) {
			}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저목록</title>

</head>
<jsp:useBean id="data" scope="request" class="java.util.ArrayList" />

<body>
<div align="center"> 
<H2>유저목록</H2>
<HR>
<form>
<a href="index.jsp">메인페이지</a><P>
		<table border="1">
			<tr><th>이메일</th><th>비밀번호</th><th>성별</th><th>별명</th><th>선호</th><th>자기소개</th><th>보안</th></tr>
			<%
				for(Member  mb : (ArrayList<Member>)data) {
			%>
			  <tr>
			   <td><a href="javascript:check(<%=mb.getEmail()%>)"><%=mb.getEmail() %></a></td>
				<td><%=mb.getPassword() %></td>
				<td><%=mb.getMfx() %></td>
				<td><%=mb.getName() %></td>
				<td><%=mb.getBest() %></td>
				<td><%=mb.getMyself() %></td>
				<td><%=mb.getAdmin() %></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</form>

</div>
</body>
</html>