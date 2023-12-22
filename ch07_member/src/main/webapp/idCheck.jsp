<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="mem.MemberDao" />
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	boolean result = mDao.checkId(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 231221 -->
<%
	if(result) {
		out.print(id + "는 이미 존재하는 ID입니다<p/>");
	} else {
		out.print(id + "는 사용 가능한 ID입니다<p/>");
	}
%>
	<a href="#" onclick="self.close()">닫기</a>
</body>
</html>