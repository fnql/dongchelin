<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="shop.css">
    <link rel="stylesheet" 
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
  crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/module/top.jsp" flush="false" />
	<h1>시골집</h1>
	
    <div class='left-box'>
      	<iframe src="https://map.kakao.com/?sName=+동양미래대학교+&eName=+고척동시골집&target=walk" id="the_iframe" onload="calcHeight();" frameborder="0" scrolling="no" style="overflow-x:hidden; overflow:auto; width:100%; min-height:500px;">
	</iframe>

        <br>
        <h2>한줄 리뷰</h2> <p style="margin-left: 20px;">어머니의 손맛을 느낄 수 있는집</p>
    </div>
    <div class='right-box'>
	    <h2>동슐랭 별점</h2> <img src="../img/star3.png" style="margin-bottom:70px;'">
	    <h2>추천 메뉴</h2> <ul><li>백반 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.7</li><li>누룽지탕 &nbsp;&nbsp;0.5</li><li>닭도리탕 &nbsp;&nbsp;2.5</li></ul>
	    <h2 style="margin-top: 70px;">추천 경로</h2> <p style="margin-left: 20px; margin-bottom: 100px;">5호관 출발 시 1분 소요</p>
        <a href="review.jsp"><h2>리뷰 글 검색</h2></a>
    </div>
	
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abb0c5392e88307fec21ccc5d3ef776a"></script>
    <script src="shop.js"></script>
</body>
</html>