<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%
	//세션에서 num, 이름 얻어오기
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage"); 		// 수정후 리스트 눌렀을때 해당 페이지로 갈 수 있게 
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
	<form action="boardUpdate" method="post">
		<table align="center" width="700">
			<tr>
				<th colspan="2" bgcolor="pink" height="30">수 정 하 기</th>
			</tr>
			<tr>
				<td width="15%">성명</td>
				<td><%=board.getName() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass">수정시에는 비밀번호가 필요합니다</td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정완료">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="뒤로가기" onclick="history.go(-1)">&emsp;	<!-- history.back()랑 history.go(-1) 같음 -->
				</td>
			</tr>
		</table>
		
		<input type="hidden" name="num" value="<%=num %>">
		
		<!-- 상세읽기에서 넘어온 정보 -->
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>
</body>
</html>