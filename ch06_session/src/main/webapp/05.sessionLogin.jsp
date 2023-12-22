<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 231221 -->
	
<%
	String id = (String)session.getAttribute("idKey");	// idKey에 해당하는 값 가져오고 String으로 형변환
	if(id != null) { 
	%>
		<h2>session 로그인</h2>
		<h3><%=id %>님이 로그인 하였습니다</h3>
		<a href="05_4.sessionLogout.jsp">로그아웃</a>
	<%
	} else {
	%>
		


	<h1>Session 로그인</h1>
	<form method="post" action="05_2.sessionLoginProc.jsp">
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
<%
	}	// else end
%>
	
</body>
</html>













