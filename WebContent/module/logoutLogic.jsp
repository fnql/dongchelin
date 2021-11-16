<%@ page contentType="text/html; charset=utf-8" %>
<%
		session.removeAttribute("sessionID");
		session.removeAttribute("datas");
		session.removeAttribute("ad");
		response.sendRedirect("../index.jsp");
%>
