<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/dongchelin/img/logo.png" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="shop.css">
    <link rel="stylesheet" 
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
  crossorigin="anonymous">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="/module/top.jsp" flush="false" />
	<h1>홍콩반점</h1>
	
    <div class='left-box'>
      	
		<div id="slideShow">
		 <ul class="slides">
		  <li><img src="../img/ho1.jpg" alt="ㅁㅁ"></li>
		   <li><img src="../img/ho2.jpg" alt=""></li>
		   <li><img src="../img/ho3.jpg" alt=""></li>
		   <li><img src="../img/ho7.jpg" alt=""></li> 
		 </ul> <p class="controller"> 
		      <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
		       <span class="prev">&lang;</span> <span class="next">&rang;</span> 
		       </p> 
		  </div> 

        <br>
        <h2>한줄 리뷰</h2> <p style="margin-left: 20px; font-family: 'Yeon Sung', cursive; font-size:30px">탕수육이 최고 맛있는 가게</p>
    </div>
    <div class='right-box'>
	    <h2 style="margin-top: 10%;">동슐랭 별점</h2> <img src="../img/star3.png" style="margin-bottom:50px;'">
	    <h2>추천 메뉴</h2> <ul><li>짜장면 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.5</li><li>짬뽕 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.6</li><li>탕수육(소) &nbsp;&nbsp;1.3</li></ul>
	    <h2 style="margin-top: 50px;">추천 경로
	    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-xl">길찾기</button>
	    </h2>
	    <p style="margin-left: 20px; margin-bottom: 30px;">3호관 출발 시 5분 소요</p>
		<div class="wrap">
			<a href="javascript:search.submit();" href="#" class="button">리뷰검색</a>
		  </div>
        <form method="post" name="search" action="/dongchelin/gesi/list.jsp">
				<table class="pull-right">
					<tr>
						<td><input type="text" class="form-control"
							name="searchField" maxlength="100" value="shop" style="display:none"></td>
						<td><input type="text" class="form-control"
							name="searchText" maxlength="100" value="홍콩반점" style="display:none"></td>
					</tr>
				</table>
		</form>
    </div>
    

	<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <iframe src="https://map.kakao.com/?sName=+동양미래대학교+&eName=+홍콩반점고척동양대점&target=walk" id="the_iframe" onload="calcHeight();" frameborder="0" scrolling="no" style="overflow-x:hidden; overflow:auto; width:100%; min-height:500px;">
	</iframe>
    </div>
  </div>
</div>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="shop.js"></script>
</body>
</html>