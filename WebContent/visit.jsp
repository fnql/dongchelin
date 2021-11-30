<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문 식당!</title>
</head>
<body>
<h3>어제 먹은 점심 식당을 골라주세요</h3>
<form method="post" action="index.jsp">
		<input type="radio" name="eat" value="시골집">시골집<br>
    	<input type="radio" name="eat" value="우마이">우마이<br>
    	<input type="submit" value="확인" onClick="window.close()">
</form>
</body>
</html>