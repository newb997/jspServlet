<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 231220 -->
<%
	session.setAttribute("idKey", "user01");
	session.setAttribute("pwKey", "1234");
%>
세션의 속성을 넣어줌<p/>
세션 정보 확인은 <a href="03_2.session.jsp">클릭하세요</a>
</body>
</html>