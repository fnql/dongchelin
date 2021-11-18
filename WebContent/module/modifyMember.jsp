<%@ page import="loginRegister.Member" %>
<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head><title>동슐랭 회원가입</title></head>
<body>
<p><h2 align="center">동슐랭 회원가입</h2></p>

<%-- 여기 페이지 추가하기 --%>
<FORM  action="member_control.jsp?action=update" method="post">
<table width="50%" height="80" border="1" align="center" cellpadding="5" cellspacing="0" bordercolor="777999">
    <tr>
        <td colspan="2" align="center" bgcolor="skyblue">
            <div style="font-weight: bold; font-size: 18px">회원정보수정
            </div>
        </td>
    </tr>
    <tr>
        <td bgcolor="#afeeee" align="center">
            <div style="font-weight: bold;">아이디</div>
        </td>
        <td>
    	<input type="text" name="memberid" size="12" maxlength="12" value="<%= ((Member)request.getParameter("userInfo")).getEmail()%>" disabled>   
        </td> 
    </tr>
    <tr>
        <td bgcolor="#afeeee" align="center"><div style="font-weight: bold;">비밀번호</div>
        </td>
        <td><input type="password" name="password" size="12" maxlength="12">
            4~12자의 영문 대소문자와 숫자로만 입력
        </td>
    </tr>
    <tr>
        <td bgcolor="#afeeee" align="center"><div style="font-weight: bold;">이름</div>
        </td>
        <td><input type="text" name="my_name" size="10" maxlength="10"></td>
    </tr>
    <tr>
        <td bgcolor="#afeeee" align="center"><div style="font-weight: bold;">메일주소</div></td>
        <td><input type="text" name="email" size="30" maxlength="30">
            예)dongyang@naver.com
        </td>
    </tr>

    <%-- 추가 정보 --%>
    <tr align="center">
        <td colspan="2" bgcolor="skyblue">
            <div style="font-weight: bold; font-size: 18px">
            	추가 정보 입력
            </div>
		</td>
    </tr>
    <tr>
        <td bgcolor="#afeeee" align="center"><div style="font-weight: bold;">선호 식당</div></td>
        <td><FORM name=chkForm action="" method=post >
        		<input type="checkbox" name="chk" value="KOREA" onclick="check_only(this)">한식
        		<input type="checkbox" name="chk" value="CHINA" onclick="check_only(this)">중식
       	 		<input type="checkbox" name="chk" value="JAPAN" onclick="check_only(this)">일식
        	</FORM>
        </td>
    </tr>
    <tr>
        <td bgcolor="#afeeee" align="center"><div style="font-weight: bold;">자기소개</div></td>
        <td><input type="text" name="my_name" size="60" maxlength="10"></td>
    </tr>
</table>
    <p align="center">
    	<input type="submit" value="회원정보수정">
    </FORM>
</body>
</html>