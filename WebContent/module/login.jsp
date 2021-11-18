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
</head>
<body>
	<form name="loginInfo" method="post" action="loginLogic.jsp">
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
						<input type="checkbox" name="" id=""> Remember Me?
					</div>
					<div class="forgot_pw">
						<a href="signup.jsp">sign up</a>
					</div>
				</div>
				<input type="submit" value="log in" class="submit">
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
	<%-- 
	세션저장
	--%>
</body>
</html>