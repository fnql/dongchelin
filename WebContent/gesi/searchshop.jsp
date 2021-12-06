<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ page import="board.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-2022-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/dongchelin/css/style.css">
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">
</head>
<body>
<%
						DAO bbsDAO = new DAO();
						ArrayList<VO> list = bbsDAO.getSearch(request.getParameter("searchField"),
								request.getParameter("searchText"));
						if (list.size() == 0) {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('검색결과가 없습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getNum()%></td>
						<%--현재 게시글에 대한 정보 --%>
						<td><a href="view.jsp?idx=<%=list.get(i).getNum()%>&pg=1"><%=list.get(i).getTitle() %></a></td>
						<td><%=list.get(i).getName()%></td>
						<td><%=list.get(i).getHit()%></td>
					</tr>
					<br>
					<%
						}
					%>
</body>
</html>