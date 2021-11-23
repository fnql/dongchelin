<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="loginRegister.*, java.util.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<% request.setCharacterEncoding("utf-8"); %>

<div id="navbar">
    <a href="/dongchelin/index.jsp">메인페이지</a>
    <a href="#">자유게시판</a>
    <a href="#">리뷰게시판</a>
    <a href="#">배달가능식당</a>
    <%
        if(session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
        { %>
        	<a href="/dongchelin/module/login.jsp">로그인</a>
        <%}
        else // 로그인 했을 경우
        {
        	if(session.getAttribute("ad") == null) {
    %>
    
    <h5>
    <form action="/dongchelin/module/logoutLogic.jsp" method="get">
			<p style = color:#a0e9ff;><%=session.getAttribute("datas") %>님
			<input type="submit" value="로그아웃"></p>
	</form>	
    </h5>
    <% } else{ %>
    <h5>
    <form action="/dongchelin/module/logoutLogic.jsp" method="get">
			<a href="/dongchelin/mypage.jsp" style = color:#a0e9ff;><%=session.getAttribute("datas") %>님
			<input type="submit" value="로그아웃"></a>
	</form>	
    </h5>
    <a href="admin.jsp">관리자</a>
    
    <% } }%> 
    
</div>
