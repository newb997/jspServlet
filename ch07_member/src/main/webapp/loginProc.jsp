<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="mem.MemberDao" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	boolean result = mDao.loginMember(id, pw);
	
	String msg = "로그인에 실패하였습니다.";
	if(result) {
		session.setAttribute("idKey", id);
		msg = "로그인 성공";
	}
%>
<!-- 231221 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	alert("<%=msg %>");
	location.href="login.jsp";
</script>

</head>
<body>

</body>
</html>