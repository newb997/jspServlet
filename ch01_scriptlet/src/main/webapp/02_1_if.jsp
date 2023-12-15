<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버로 전송하기</title>
</head>
<body>
	<h1>if-else EX</h1>
	<form action="02_2_if.jsp" method="get">
		이름 : <input name="name"><br>
		좋아하는 색상 : 
		<select name="color">
			<option value = "blue">파랑</option>
			<option value = "red">빨강</option>
			<option value = "orange">오렌지</option>
			<option value = "etc">기타</option>
		</select>
		<br><br>
		<input type="submit" value="서버로 전송">
	</form>
		
	
</body>
</html>