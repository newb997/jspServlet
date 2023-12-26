<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
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
	<form action="boardPost" method="post">
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
					<input type="submit" value="답변등록">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="뒤로가기" onclick="history.back()">&emsp; <!-- history.back()랑 history.go(-1) 같음 -->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>