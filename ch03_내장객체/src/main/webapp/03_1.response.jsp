<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(request.getProtocol().equals("HTTP/1.1")) {
			response.setHeader("Cache-control", "no-cache");	// HTTP/1.1 버전일때
		}else {
			response.setHeader("pragma", "no-cache");	// HTTP/1.0 버전일때
		}
	%>
	<h1>Response 다음페이지</h1>
	03_1.response.jsp에서 03_1.response.jsp파일로 바로 클라이언트에 보여줌 
</body>
</html>