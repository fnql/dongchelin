<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./login.css">

<%-- 로그인저장 --%>  <%-- 오류 : 왜 저장이 안될까.. 어떻게 고치지.. --%>
    <script>
    window.onload = function() {
    	 
        if (getCookie("idsa")) { // getCookie함수로 idsa라는 이름의 쿠키를 불러와서 있을경우
        	document.loginInfo.id.value = getCookie("idsa"); //input 이름이 id인곳에 getCookie("idsa")값을 넣어줌
            document.loginInfo.idsave.checked = true; // 체크는 체크됨으로
        }
 
    }
 
    function setCookie(name, value, expiredays) //쿠키 저장함수
    {
        var todayDate = new Date();
        todayDate.setDate(todayDate.getDate() + expiredays);
        document.cookie = name + "=" + escape(value) + "; path=/; expires="
                + todayDate.toGMTString() + ";"
    }
 
    function getCookie(Name) { // 쿠키 불러오는 함수
        var search = Name + "=";
        if (document.cookie.length > 0) { // if there are any cookies
            offset = document.cookie.indexOf(search);
            if (offset != -1) { // if cookie exists
                offset += search.length; // set index of beginning of value
                end = document.cookie.indexOf(";", offset); // set index of end of cookie value
                if (end == -1)
                    end = document.cookie.length;
                return unescape(document.cookie.substring(offset, end));
            }
        }
    }
 
    function sendit() {
        if (document.loginInfo.idsave.checked == true) { // 아이디 저장을 체크 하였을때
            setCookie("idsa", document.loginInfo.id.value, 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
        } else { // 아이디 저장을 체크 하지 않았을때
            setCookie("idsa", document.loginInfo.id.value, 0); //날짜를 0으로 저장하여 쿠키삭제
        }
        document.loginInfo.submit(); //유효성 검사가 통과되면 서버로 전송. 
    }
    </script>
</head>
<body>
	<form id="loginForm" name="loginInfo" method="post" action="loginLogic.jsp">
		<div class="wrap">
			<div class="login">
				<h2>Log-in</h2>
				<div class="login_id">
					<h4>E-mail</h4>
					<input type="text" name="id" placeholder="Email" required>
					<%-- type email로 바꾸기 --%>
				</div>
				<div class="login_pw">
					<h4>Password</h4>
					<input type="password" name="password" placeholder="Password"
						required>
				</div>
				<div class="login_etc">
					<div class="checkbox">
						<input type="checkbox" name="idsave" id="saveOk"> Remember Me?
					</div>
					<div class="forgot_pw">
						<a href="signup.jsp">sign up</a>
					</div>
				</div>
				<input type="button" value="log in" class="submit" onclick="sendit()">
			</div>
		</div>
	</form>
	<%
		// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
	// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
	String msg = request.getParameter("msg");

	if (msg != null && msg.equals("0")) {
		out.println("<br>");
		out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
	} else if (msg != null && msg.equals("-1")) {
		out.println("<br>");
		out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
	}
	%>

 <%-- 아이디 저장 만들기 --%>

</body>
</html>