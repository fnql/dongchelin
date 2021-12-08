<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="loginRegister.*, java.util.*" %>

<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<body>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("euc-kr"); 
        
        // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
        String id= request.getParameter("id");
        String pw = request.getParameter("password");
        
        // DB에서 아이디, 비밀번호 확인
        MemberBean dao = new MemberBean();
        Member loginMem = new Member();
        Shop shop = new Shop();
        ShopBean shopDao = new ShopBean();
        int check = dao.loginCheck(id, pw);
        
        // URL 및 로그인관련 전달 메시지
        String msg = "";
        String nickName = "";
        String level = "";
        String visitShop ="";
        String my = "";
        String best = "";
        
        if(check == 1)    // 로그인 성공
        { 
            // 세션에 현재 아이디 세팅
            loginMem = dao.getDB(id);
            shop = shopDao.getDB(id);
            nickName = loginMem.getName();
            level = loginMem.getAdmin();
            my = loginMem.getMyself();
            visitShop = shop.getVisit();
            best = loginMem.getBest();
            session.setAttribute("visi", visitShop);
            session.setAttribute("datas", nickName);
            session.setAttribute("my", my);
            session.setAttribute("sessionID", id);
            session.setAttribute("bf", best);
            if (level.equals("admin")){
            	session.setAttribute("ad", level);
            }
            msg = "../index.jsp";
        }
        else if(check == 0) // 비밀번호가 틀릴경우
        {
            msg = "login.jsp?msg=0";
        }
        else    // 아이디가 틀릴경우
        {
            msg = "login.jsp?msg=-1";
        }
         
        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect(msg);
    %>
</body>
</html>