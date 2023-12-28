<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%
	//int num = Integer.parseInt(request.getParameter("num")); 이거 read.jsp에서 num값 안넘겨줘서 이거 삭제안하면 오류남
	Board board = (Board)session.getAttribute("bean");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width: 550px;
		margin-top: 50px;
	}
</style>
</head>
<body>
	<!-- 231226 -->
	<form action="boardReply" method="post">
		<table align="center" width="700">
			<tr>
				<th colspan="2" bgcolor="skyblue" height="30">댓 글 등 록</th>
			</tr>
			<tr>
				<td width="15%">성명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" value="답변 : <%=board.getSubject() %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" rows="10" cols="50">
<%=board.getContent() %>
======== 댓글을 작성하세요 ======== 	
					</textarea>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="답변등록">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="뒤로가기" onclick="history.back()"> <!-- history.back()랑 history.go(-1) 같음 -->
				</td>
			</tr>
		</table>
		<!-- 나의 정보 -->
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		
		<!-- 부모글의 정보 -->
		<input type="hidden" name="ref" value="<%=board.getRef() %>">
		<input type="hidden" name="pos" value="<%=board.getPos() %>">
		<input type="hidden" name="depth" value="<%=board.getDepth() %>">
		
	</form>
</body>
</html>













