<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, loginRegister.*"%>
<!DOCTYPE HTML>
<html>
<head>

<script type="text/javascript">
	function check(email) {
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		document.location.href="addrbook_control.jsp?action=edit&ab_id="+email+"&upasswd="+pwd;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록:목록화면</title>

</head>
<jsp:useBean id="data" scope="request" class="java.util.ArrayList" />

<body>
<div align="center"> 
<H2>주소록:목록화면</H2>
<HR>
<form>
<a href="addrbook_form.jsp">주소록 등록</a><P>

		<table border="1">
			<tr><th>번호</th><th>이 름</th><th>전화번호</th><th>생 일</th><th>회 사</th><th>메 모</th></tr>
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
			  </tr>
			 <%
				}
			 %>
		</table>
</form>

</div>
</body>
</html>