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
		request.setCharacterEncoding("utf-8");
		String siteName = request.getParameter("siteName");
		String siteTel = request.getParameter("siteTel");
	%>
	<jsp:include page="05_2.actionTag_include.jsp">
		<jsp:param value="jsp수업" name="siteName"/>
		<jsp:param value="<%=siteTel %>" name="siteTel"/>
	</jsp:include>
	<!-- 중간에 주석이 있으면 오류뜸. -->
	
	<p/>
	include ActionTag의 Body입니다<p/>
	<%=siteName %><p/>
	<%=siteTel %><p/>
</body>
</html>