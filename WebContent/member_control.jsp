<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="loginRegister.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="member" class="loginRegister.Member"/>
<jsp:setProperty name="member" property="*"/> 
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	MemberBean mb = MemberBean.getInstance();

	// 파라미터에 따른 요청 처리
	// 주소록 목록 요청인 경우

	if(action.equals("list")) {
		ArrayList<Member> datas = mb.getDBList();
		request.setAttribute("data", datas);
		pageContext.forward("memberList.jsp");
	}
	// 주소록 등록 요청인 경우
	else if(action.equals("insert")) {		
		if(mb.insertDB(member)) {
%>
			<script>alert("회원가입이 완료되었습니다.");</script>
<%
			response.sendRedirect("module/login.jsp");
		}
		else
			throw new Exception("DB 입력오류");
	}

	//업데이트할 회원 정보 가져오기
	else if(action.equals("getUserinfo")){
		Member info = mb.getDB(session.getAttribute("sessionID"));
		if (info != null) {
			request.setAttribute("userInfo", info);
			pageContext.forward("module/modifyMember.jsp");
		}
		else
			throw new Exception("등록된 회원정보를 찾을 수 없습니다.");
	}
	
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
			if(mb.updateDB(member)) {
				response.sendRedirect("addrbook_control.jsp?action=list");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(mb.deleteDB(member.getEmail())) {
			response.sendRedirect("addrbook_control.jsp?action=list");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>