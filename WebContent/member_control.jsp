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
		else
			throw new Exception("DB 입력오류");
	}
	// 주소록 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		Member mem = mbc.getDB(member.getEmail());
		request.setAttribute("mb",mem);
		pageContext.forward("mypage_edit.jsp");
	}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
			if(mbc.updateDB(member)) {
				response.sendRedirect("addrbook_control.jsp?action=list");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(mbc.deleteDB(member.getEmail())) {
			response.sendRedirect("addrbook_control.jsp?action=list");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>