<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
  <head>
<link href="img/logo.png" rel="shortcut icon" type="image/x-icon">
  <meta charset="UTF-8">
  <title>동슐랭</title>
  <!-- 부트스트랩 css 사용 -->
  
  <link rel="stylesheet" 
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
  crossorigin="anonymous">
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
  </head>
  <body>
  <header class="main-header" >
    <jsp:include page="module/top.jsp" flush="false" />
    <div class="headImg">
      <img src="img/place303su.jpg" style="height: 600px; width: 100%;" />
      <div class="headText">
        <h1 id="dong">동슐랭</h1>
        <p style="font-size:30px">솔직한 리뷰, 믿을 수 있는 평점!</p>
        <form method=post action=member_control.jsp>
          <input type=hidden name="action" value="search">
        	<input type="text" placeholder="맛집 검색" name="sa" class="inin">
        	<input class="btn btn-primary" type="submit" value="검색" onclick="trackEvent('CLICK_KEYWORD_SEARCH');">    
        </form>
      </div>
      
      <h4 id="clock">00:00:00</h4>
    </div>
  </header>

    <hr>
    <h1 id="pla">동슐랭 선정 맛집</h1>
    <table  style="width: 90%; margin-left: 5%;">
      <tr>
        <td style="width: 30%;"><img alt="우마이" src="img/우마이.jpg" style="height: 400px; width: 100%;" /><h1 size="5">우마이 &ensp;<img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img src="img/전가복.jpg" style="height: 400px; width: 100%;" /><h1>전가복 &ensp;<img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img src="img/홍콩반점1.jpg" style="height: 400px; width: 100%;" /><h1><a href="shop/hong.jsp">홍콩반점</a> <img src="img/star3.png"></h1></td>
      <tr>
    </table>
    <hr>
    <h1 id="pla">한식 TOP3</h1>
    <table  style="width: 90%; margin-left: 5%;">
      <tr>
        <td style="width: 30%;"><img alt="토마토김밥" src="img/토마토김밥.jpg".jpg" style="height: 400px; width: 100%;" /><h1>토마토김밥<img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="부대통령" src="img/부대통령.jpg" style="height: 400px; width: 100%;" /><h1>부대통령    <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="시골집" src="img/sigol.png" style="height: 400px; width: 100%;" /><h1><a href="shop/sigol.jsp">시골집 &ensp;</a><img src="img/star3.png"></h1></td>
      <tr>
    </table>
    <hr>
    <h1 id="pla">중식 TOP3</h1>
    <table  style="width: 90%; margin-left: 5%;">
      <tr>
        <td style="width: 30%;"><img alt="하우마라" src="img/하우마라.jpg" style="height: 400px; width: 100%;" /><h1>하우마라   <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="전가복 " src="img/전가복.jpg" style="height: 400px; width: 100%;" /><h1>전가복 &ensp;<img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="홍콩반점" src="img/홍콩반점1.jpg" style="height: 400px; width: 100%;" /><h1>홍콩반점   <img src="img/star3.png"></h1></td>
      <tr>
    </table>
    <hr>
    <h1 id="pla">일식 TOP3</h1>
    <table  style="width: 90%; margin-left: 5%;">
      <tr>
        <td style="width: 30%;"><img alt="우마이 " src="img/우마이.jpg" style="height: 400px; width: 100%;" /><h1>우마이 &ensp;<img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="고척돈까스" src="img/고척돈까스.jpg" style="height: 400px; width: 100%;" /><h1>고척돈까스<img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="홍콩반점" src="img/홍콩반점1.jpg" style="height: 400px; width: 100%;" /><h1>홍콩반점<img src="img/star3.png"></h1></td>
      <tr>
    </table>
    <hr>
    <h1 id="pla">데이트 추천 식당</h1>
    <table  style="width: 90%; margin-left: 5%;">
      <tr><td style="width: 30%;"><img alt="우마이" src="img/303.jpg" style="height: 400px; width: 100%;" /><h1>303PLACE<img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img src="img/닐리.jpg" style="height: 400px; width: 100%;" /><h1>닐리 &ensp;&ensp;&ensp;<img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img src="img/김떡비.jpg" style="height: 400px; width: 100%;" /><h1>김떡비 &ensp;<img src="img/star3.png"></h1></td>
      <tr>
    </table>
    <jsp:include page="module/foot.jsp" flush="false" />


    
    <!--  부트스트랩 js 사용 제일 하단 위치-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="js/clock.js"></script>
    <script type="text/javascript" src="js/app.js"></script>
    
    </body>

    </html>