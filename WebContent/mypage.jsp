<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">
</head>
<jsp:useBean id="mb" scope="request" class="loginRegister.Member" />
<body>
<jsp:include page="module/top.jsp" flush="false" />
[<a href="member_control.jsp?action=edits&email=<%=session.getAttribute("sessionID") %>">수정</a>]
<div>
<img src="img/default.png" alt="기본프로필" style="float:left;">
<h2><%=mb.getName()%></h2>
<h5><%=mb.getEmail()%></h5>
<input type="text" readonly value="<%=mb.getMyself() %>">
</div>

<div class='left-box' style="clear:both;">
<h5>지난 한달간 먹은 메뉴 리스트</h5>
<script language=javascript>
var name = "<%= session.getAttribute("sdata") %>" ;
</script>
<canvas id="myChart"></canvas>
</div>
<div class='right-box'>
<h5>쉬는날</h5>
<div class="husic">
    <p>월화수목금</p>
</div>
<h5>최애 식당</h5>
<a href="freetext.jsp">내가 쓴 리뷰</a>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="js/app.js"></script>
</body>
</html>