<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<%	
	String memLogin = (String)session.getAttribute("memLogin");
	String id = (String)session.getAttribute("memId");
	String pw = (String)session.getAttribute("memPw");
	String check = (String)session.getAttribute("memSave");
	String idStr=null, pwStr=null, checkStr=null;
	if(check==null){
		idStr=""; pwStr=""; checkStr="";
	} else{
		idStr=id; pwStr=pw;checkStr="checked";
	}
	if(memLogin==null){ %>
	<form action="module/loginProcess.jsp" method="get">
	아이디: <input type="text" name="id" size="get" value=<%=idStr %>>
	비밀번호: <input type="password" name="pw" size="10" value=<%=pwStr %>>
	<input type="submit" value="로그인"><br>
	<input type="checkbox" name="idSave" value="c1" <%=checkStr %> >아이디/비번 저장
	</form>
	
<%
	} else{
		out.print(id+"님, ");
		%>
	<form action="module/logoutProcess.jsp" method="get">
		<input type="submit" value="로그아웃">
	</form>
	<% } %>
