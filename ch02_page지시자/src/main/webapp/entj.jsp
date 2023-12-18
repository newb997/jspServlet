<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String mbti = request.getParameter("mbti");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b><%=name %></b>님의 MBTI는 <b><%=mbti %>입니다</b> <br>
	성격은 외향적이며 직관적이고, <br>
	이성적이고 논리적, 분석적이며, 객관적으로 사실을 판단한다 <br>
</body>
</html>