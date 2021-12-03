<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="loginRegister.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="shop" class="loginRegister.Shop"/>
<jsp:useBean id="sb" class="loginRegister.ShopBean"/> 
<jsp:setProperty name="shop" property="*"/> 
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");
	String eat = request.getParameter("eat");

	// 주소록 등록 요청인 경우
	if(action.equals("insert")) {
		shop.setEmail(session.getAttribute("sessionID").toString());
		if(sb.insertDB(shop)) {
			response.sendRedirect("visit_control.jsp?action=list");
		}
		else{
			%><script>
				alert("다시 입력해주세요");
				history.back();
				</script><%
		}
			
	}
	else if(action.equals("list")) {
		ArrayList<String> sdatas = sb.getDBList();
		session.setAttribute("sdata", sdatas);
		System.out.print(sdatas);
		pageContext.forward("index.jsp");
	}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
			if(sb.updateDB(shop)) {
				//session.setAttribute("datas", member.getName());
				response.sendRedirect("index.jsp");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {
		String mailck =  shop.getEmail();
		if(sb.deleteDB(shop.getEmail())) {
			System.out.print(mailck);
			System.out.println((String)session.getAttribute("sessionID"));
			if(mailck.equals((String)session.getAttribute("sessionID"))){
				response.sendRedirect("/dongchelin/module/logoutLogic.jsp");
			}
			else
				response.sendRedirect("index.jsp");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>