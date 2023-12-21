<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 231220 -->
<%
	String id = (String)session.getAttribute("idKey");	//session이라 String으로 형변환
	Enumeration en = session.getAttributeNames();	//이름 싹 받아옴
	while(en.hasMoreElements())	{
		String name = (String)en.nextElement();	//enumer타입이라 형변환
		String value = (String)session.getAttribute(name);
		out.print("session name : " + name + "<p/>");
		out.print("session value : " + value + "<hr>");
	}
%>
</body>
</html>