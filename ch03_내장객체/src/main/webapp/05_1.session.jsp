<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");	//아이디를 얻어와서 String id에 넣어줌
	String pwd = request.getParameter("pwd");
	
	session.setAttribute("idKey", id); 	// 세션에 속성 추가, 대소문자 가림
	session.setMaxInactiveInterval(60*5);	// 세션을 유지할 시간을 초단위로 설정  60초 * 5  5분
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Session 2페이지</h1>
	<form action="05_2.session.jsp" method="post">
		1. 가장 좋아하는 계절은?<p/>
		<input type="radio" name="season" value="봄">봄&emsp;
		<input type="radio" name="season" value="여름">여름&emsp;
		<input type="radio" name="season" value="가을">가을&emsp;
		<input type="radio" name="season" value="겨울">겨울<p/>
		
		2. 가장 좋아하는 과일은?<p/>
		<input type="radio" name="fruit" value="사과">사과&emsp;
		<input type="radio" name="fruit" value="배">배&emsp;
		<input type="radio" name="fruit" value="딸기">딸기&emsp;
		<input type="radio" name="fruit" value="멜론">멜론<p/><p/>
		
		<input type="submit" value="전송">
	</form>
</body>
</html>








