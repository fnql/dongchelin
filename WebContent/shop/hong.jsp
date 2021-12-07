<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/dongchelin/img/logo.png" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="shop.css">
    <link rel="stylesheet" 
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
  crossorigin="anonymous">
  <link rel="preconnect" href="https://fonts.googleapis.com">
</head>
<body>
	<jsp:include page="/module/top.jsp" flush="false" />
	<h1>시골집</h1>
	
    <div class='left-box'>
      	<!--  <iframe src="https://map.kakao.com/?sName=+동양미래대학교+&eName=+고척동시골집&target=walk" id="the_iframe" onload="calcHeight();" frameborder="0" scrolling="no" style="overflow-x:hidden; overflow:auto; width:100%; min-height:500px;">
	</iframe>-->
		<div id="slideShow">
		 <ul class="slides">
		  <li><img src="/dongchelin/img/ho1.jpg" alt="ㅁㅁ"></li>
		   <li><img src="/dongchelin/img/ho2.jpg" alt=""></li>
		   <li><img src="/dongchelin/img/ho3.jpg" alt=""></li>
		   <li><img src="/dongchelin/img/ho7.jpg" alt=""></li> 
		 </ul> <p class="controller"> 
		      <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
		       <span class="prev">&lang;</span> <span class="next">&rang;</span> 
		       </p> 
		  </div> 

        <br>
        <h2>한줄 리뷰</h2> <p style="margin-left: 20px; font-family: 'Yeon Sung', cursive; font-size:30px">어머니의 손맛을 느낄 수 있는집</p>
    </div>
    <div class='right-box'>
	    <h2>동슐랭 별점</h2> <img src="../img/star3.png" style="margin-bottom:70px;'">
	    <h2>추천 메뉴</h2> <ul><li>백반 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.7</li><li>누룽지탕 &nbsp;&nbsp;0.5</li><li>닭도리탕 &nbsp;&nbsp;2.5</li></ul>
	    <h2 style="margin-top: 70px;">추천 경로</h2> <p style="margin-left: 20px; margin-bottom: 100px;">5호관 출발 시 1분 소요</p>
        <form method="post" name="search" action="/dongchelin/gesi/list.jsp">
				<table class="pull-right">
					<tr>
						<td><input type="text" class="form-control"
							name="searchField" maxlength="100" value="shop" style="display:none"></td>
						<td><input type="text" class="form-control"
							name="searchText" maxlength="100" value="시골집" style="display:none"></td>
						<td><button type="submit" class="btn btn-success">리뷰 글 검색</button></td>
					</tr>

				</table>
			</form>
    </div>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abb0c5392e88307fec21ccc5d3ef776a"></script>
    <script src="shop.js"></script>
</body>
</html>