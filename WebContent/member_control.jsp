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

	//업데이트할 회원 정보 가져오기
	else if(action.equals("getUserinfo")){
		Member info = mbc.getDB((String)session.getAttribute("sessionID"));
		if (info != null) {
			request.setAttribute("userInfo", info);
//			pageContext.forward("module/modifyMember.jsp");         //todo
		}
		else
			throw new Exception("등록된 회원정보를 찾을 수 없습니다.");
	}

	// 주소록 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		Member mem = mbc.getDB(member.getEmail());
		if(!request.getParameter("upasswd").equals("1234")) {
			out.println("<script>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("mb",mem);
			pageContext.forward("addrbook_edit_form.jsp");
		}
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