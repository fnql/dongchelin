<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ page import="java.util.*" %> 
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
<h2><%=session.getAttribute("datas") %></h2>
<h5><%=session.getAttribute("sessionID") %></h5>
<input type="text" readonly value="<%=session.getAttribute("my") %>"><br>
<button style="margin-top: 20px;" data-toggle="modal" data-target="#insertBlack" class="btn btn-danger">메뉴 추가</button>
</div>

<div class='left-box' style="clear:both;">
<h5>지난 한달간 먹은 메뉴 리스트</h5>

<div class="modal fade" id="insertBlack" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myModalLabel">어제 점심은? </h5>
      </div>
      <div class="modal-body">
        <input type="radio" id="eat" name="eat" value="시골집">시골집
    	<input type="radio" id="eat" name="eat" value="우마이">우마이<br>
    	<input type="radio" name="eat" value="전주식당">전주식당<br>
    	<input type="radio" name="eat" value="고척돈까스">고척돈까스<br>
    	<input type="radio" name="eat" value="닥터로빈">닥터로빈<br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="insertEat();">확인</button>
      </div>
    </div>
  </div></div>
<!-- 먹은 음식 제대로 안들어감, 페이지로드시 회원정보 날아감 --> 
<%
	String data = session.getAttribute("sdata").toString();
	String vi = data.substring(1,data.length()-1);
	String[] vis = vi.split(",");
	Random ran = new Random();
%>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="js/app.js"></script>
</body>
</html>