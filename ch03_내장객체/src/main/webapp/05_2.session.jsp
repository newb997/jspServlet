<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	String id = (String)session.getAttribute("idKey");
	String sessionId = session.getId();		// 서버에서 접속한 클라이언트에게 자동으로 부여
	int intervalTime = session.getMaxInactiveInterval();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		if(id != null) {
		%>
			<h1>Session 3번째 페이지</h1>
			<%=id %>님이 좋아하는 계절과 과일은 <b><%=season %></b>과 <b><%=fruit %></b>입니다<p/>
			세션 ID : <%=sessionId %><p/>
			세션 유지시간 : <%=intervalTime %>초<p/>
		<%
			//session.invalidate();
		}else {
			out.print("세션에 시간이 경과하였거나 다른 이유로 연결할 수 없습니다.");
		}
	%>
</body>
</html>








