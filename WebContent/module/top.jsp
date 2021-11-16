<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="loginRegister.*, java.util.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<% request.setCharacterEncoding("utf-8"); %>
<div id="navbar">
    <a href="#">맛집추천</a>
    <a href="#">자유게시판</a>
    <a href="#">리뷰게시판</a>
    <a href="#">배달가능식당</a>
    <%
        if(session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
        { %>
        	<a href="module/login.jsp">로그인</a>
        <%}
        else // 로그인 했을 경우
        {
        	if(session.getAttribute("ad") == null) {
    %>
    
    <h5>
        <font color=#a0e9ff><%=session.getAttribute("datas") %></font>님
    </h5>
    <input type="button" value="로그아웃" onclick="logoutPro()" />
    
    <% } else{ %>
    	<h5>
        <font color=#a0e9ff><%= session.getAttribute("datas") %></font>님
    </h5>
    <input type="button" value="로그아웃" onclick="logoutPro()" />
    <a href="admin.jsp">관리자</a>
    	
    <% } }%> 
    
</div>
<%
		session.removeAttribute("MEMBERID");
		response.sendRedirect("02loginForm.jsp");
%>
