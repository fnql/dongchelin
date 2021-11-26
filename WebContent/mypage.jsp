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
<body>
<jsp:include page="module/top.jsp" flush="false" />
[<a href=mypage_edit.jsp>수정</a>]
<div>
<img src="img/default.png" alt="기본프로필" style="float:left;">
<h2>이름</h2>
<h5>이메일</h5>
<input type="text" readonly value="자기소개 칸">
</div>

<div class='left-box' style="clear:both;">
    <h5>지난 한달간 먹은 메뉴 리스트</h5>
    <ul class="graph">
  	<li class="graph-bar bar1" graph-val="30" style="height:30%""></li>
  	<li class="graph-bar bar2" graph-val="80"></li>
  	<li class="graph-bar bar3" graph-val="60"></li>
  	<li class="graph-bar bar4" graph-val="30"></li>   
</ul>
</div>
<div class='right-box'>
<h5>쉬는날</h5>
<div class="husic">
    <p>월화수목금</p>
</div>
<h5>최애 식당</h5>
<a href="freetext.jsp">내가 쓴 리뷰</a>
</div>

<script type="text/javascript" src="js/app.js"></script>
</body>
</html>