<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="loginRegister.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="member" class="loginRegister.Member"/>
<jsp:useBean id="mbc" class="loginRegister.MemberBean"/> 
<jsp:setProperty name="member" property="*"/> 
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");
	String mail = request.getParameter("email");
	String sr = request.getParameter("sa");
	

	// 파라미터에 따른 요청 처리
	// 주소록 목록 요청인 경우

	if(action.equals("list")) {
		ArrayList<Member> datas = mbc.getDBList();
		request.setAttribute("data", datas);
		pageContext.forward("member_list.jsp");
	}
	// 주소록 등록 요청인 경우
	else if(action.equals("insert")) {	
		if(mbc.insertDB(member)) {
			response.sendRedirect("module/login.jsp");
		}
		else{
			%><script>
				alert("이미 존재하는 아이디입니다.");
				history.back();
				</script><%
		}
			
	}
	// 주소록 수정 페이지 요청인 경우
	else if(action.equals("edits")) {
		Member mem = mbc.getDB(mail);
		request.setAttribute("mb",mem);
		pageContext.forward("mypage_edit.jsp");
	}
	else if(action.equals("edit")) {
		Member mem = mbc.getDB(mail);
		request.setAttribute("mb",mem);
		pageContext.forward("visit_control.jsp?action=list");
	}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
			if(mbc.updateDB(member)) {
				//session.setAttribute("datas", member.getName());
				response.sendRedirect("index.jsp");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {
		String mailck =  member.getEmail();
		if(mbc.deleteDB(member.getEmail())) {
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
	else if(action.equals("search")) {
		if (sr.equals("시골집") || sr.equals("시골")|| sr.equals("tlrhf")|| sr.equals("tlrhfwlq")){
			response.sendRedirect("/dongchelin/shop/sigol.jsp");
		}
		else if(sr.equals("홍콩반점") || sr.equals("홍콩")|| sr.equals("ghdzhd")|| sr.equals("ghdzhdqkswja")) {
			response.sendRedirect("/dongchelin/shop/hong.jsp");
		}
		else{
			response.sendRedirect("/dongchelin/index.jsp");
		}
}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
	
%>