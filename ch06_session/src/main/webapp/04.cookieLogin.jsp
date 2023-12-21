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
	String id = "";
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("idKey")) {
			id = cookies[i].getValue();
		}
	}
	if(id.equals("")) {
		
	
%>
	<h1>Cookie 로그인</h1>
	<form method="post" action="04_2.cookieLoginProc.jsp">
		<table border="1" align="center" width="300px" style="border-collapse: collapse;">
			<tr>
				<th colspan="2">Login</th>
			</tr>
			<tr>
				<td width="30%" align="center">ID</td>
				<td><input name="id" placeholder="아이디 10글자 이내" onfocus="this.placeholder=''" onblur="this.placeholder='아이디 10글자 이내'" required></td>
			</tr>
			<tr>
				<td align="center">PW</td>
				<td><input type="password" name="pw" placeholder="영문, 숫자, 특수문자 포함8자이상"  onfocus="this.placeholder=''" onblur="this.placeholder='영문, 숫자, 특수문자 포함8자이상'" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="login">&emsp;
					<input type="reset" value="reset">
				</td>
			</tr>
		</table>
	</form>
<%} else { %>
		<%=id %>님이 로그인 되어있습니다 &emsp;
		<a href="04_4.cookieLogout.jsp">로그아웃</a>
<%} %>
	
</body>
</html>













