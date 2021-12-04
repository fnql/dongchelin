<%@ page contentType="text/html; charset=utf-8" %>
<%
		session.removeAttribute("sessionID");
		session.removeAttribute("datas");
		session.removeAttribute("ad");
		session.removeAttribute("my");
		session.removeAttribute("visi");
		response.sendRedirect("../index.jsp");
%>
