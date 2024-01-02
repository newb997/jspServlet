<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	
	if(request.getParameter("pass") != null) {
		String inputPass = request.getParameter("pass");
		Board board = (Board)session.getAttribute("bean");
		String dbPass = board.getPass();
		
		if(inputPass.equals(dbPass)) {
			boolean result = bDao.deleteBoard(num);
			if(result) {
				response.sendRedirect("list.jsp?nowPage="+nowPage);
			} else {
%>
				<script>
					alert("댓글이 있어 삭제할 수 없습니다");
					history.go(-2);
				</script>
<%
			}
		} else {
%>
		<script>
			alert("비밀번호가 맞지않습니다");
			history.back();
		</script>
<%	
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{width:550px; margin-top: 50px;}
</style>
</head>
<body>
	<!-- 231227 -->
	<form action="delete.jsp" method="post">
		<table align="center" >
			<tr>
				<th height="30" bgcolor="#66793C">사용자의 비밀번호를 입력해 주세요</th>
			</tr>
			<tr>
				<td><input type="password" name="pass" required></td>
			</tr>
			<tr>
				<td><hr></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="삭제완료">
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로" onclick="history.back();">
				</td>
			</tr>
		</table>
		
		<input type="hidden" name="num" value="<%=num %>">
		
		<!-- 상세읽기에서 넘어온 정보 -->
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		
	</form>
</body>
</html>