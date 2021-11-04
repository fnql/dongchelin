<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>동슐랭</title>
    <!-- 부트스트랩 css 사용 -->
    <link rel="stylesheet" 
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
    crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
      <div id="navbar">
        <a href="#home">맛집추천</a>
        <a href="#news">자유게시판</a>
        <a href="#contact">리뷰게시판</a>
        <a href="#contact">배달가능식당</a>
        <a href="#contact">로그인*마이페이지</a>
      </div>
    <header class="main-header">
      <div class="lb-text">
      
        <h1 id="dong">동슐랭</h1>
        <p>솔직한 리뷰, 믿을 수 있는 평점!</p>
        <input type="text" placeholder="맛집 검색">
        <input class="btn btn-primary" type="submit" value="검색" onclick="trackEvent('CLICK_KEYWORD_SEARCH');">
        </div>
        <img src="img/place303su.jpg" style="height: 600px; width: 100%;" />
    
    </header>
    <hr>
    <h1 id="pla">동슐랭 선정 맛집</h1>
    <table  style="width: 90%; margin-left: 5%;">
      <tr>
        <td style="width: 30%;"><img alt="우마이" src="img/우마이.jpg" style="height: 400px; width: 100%;" /><h1>우마이   <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img src="img/전가복.jpg" style="height: 400px; width: 100%;" /><h1>전가복    <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img src="img/홍콩반점1.jpg" style="height: 400px; width: 100%;" /><h1>홍콩반점   <img src="img/star3.png"></h1></td>
      <tr>
    </table>
    <hr>
    <h1 id="pla">한식 TOP3</h1>
    <table  style="width: 90%; margin-left: 5%;">
      <tr>
        <td style="width: 30%;"><img alt="토마토김밥" src="img/토마토김밥.jpg".jpg" style="height: 400px; width: 100%;" /><h1>토마토김밥   <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="부대통령" src="img/부대통령.jpg" style="height: 400px; width: 100%;" /><h1>부대통령    <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="시골집" src="img/시골집.jpg" style="height: 400px; width: 100%;" /><h1>시골집   <img src="img/star3.png"></h1></td>
      <tr>
    </table>
    <hr>
    <h1 id="pla">중식 TOP3</h1>
    <table  style="width: 90%; margin-left: 5%;">
      <tr>
        <td style="width: 30%;"><img alt="하우마라" src="img/하우마라.jpg" style="height: 400px; width: 100%;" /><h1>하우마라   <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="전가복" src="img/전가복.jpg" style="height: 400px; width: 100%;" /><h1>전가복    <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="홍콩반점" src="img/홍콩반점1.jpg" style="height: 400px; width: 100%;" /><h1>홍콩반점   <img src="img/star3.png"></h1></td>
      <tr>
    </table>
    <hr>
    <h1 id="pla">일식 TOP3</h1>
    <table  style="width: 90%; margin-left: 5%;">
      <tr>
        <td style="width: 30%;"><img alt="우마이" src="img/우마이.jpg" style="height: 400px; width: 100%;" /><h1>우마이   <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="고척돈까스" src="img/고척돈까스.jpg" style="height: 400px; width: 100%;" /><h1>고척돈까스    <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img alt="-" src="img/홍콩반점1.jpg" style="height: 400px; width: 100%;" /><h1>-   <img src="img/star3.png"></h1></td>
      <tr>
    </table>
    <hr>
    <h1 id="pla">데이트 추천 식당</h1>
    <table  style="width: 90%; margin-left: 5%;">
      <tr><td style="width: 30%;"><img alt="우마이" src="img/303.jpg" style="height: 400px; width: 100%;" /><h1>303PLACE <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img src="img/닐리.jpg" style="height: 400px; width: 100%;" /><h1>닐리    <img src="img/star3.png"></h1></td>
        <td style="width: 30%;"><img src="img/김떡비.jpg" style="height: 400px; width: 100%;" /><h1>김떡비   <img src="img/star3.png"></h1></td>
      <tr>
    </table>
    <h1>시간 추가</h1>
    
    
    
    
    <!--  부트스트랩 js 사용 제일 하단 위치-->
    <script type="text/javascript" src="js/app.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" 
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
    crossorigin="anonymous"></script>
    </body>
    </html>