<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="jsp 현재페이지 정보" %>
<%@ page import="java.util.*" 
		 session="true" 
		 autoFlush="true" 
		 buffer="16kb" %>
<%@ page trimDirectiveWhitespaces = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page info</title>
</head>
<body>
	<!-- 231218 -->
	<%=this.getServletInfo() %>
	<% Date date = new Date(); %>
	<p>현재 날짜와 시간은?</p>
	<%=date.toLocaleString() %>
</body>
</html>