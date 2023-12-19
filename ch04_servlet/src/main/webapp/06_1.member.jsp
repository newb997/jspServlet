<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="ch04.MemberBean"/>
<jsp:setProperty name="member" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="memberInsert" method="post">
		<jsp:getProperty property="name" name="member"/>회원님이 작성한 내용입니다. 확인해주세요.<p/>
		아이디 : <jsp:getProperty property="id" name="member"/><p/>
		패스워드 : <jsp:getProperty property="pwd" name="member"/><p/>
		생년월일 : <jsp:getProperty property="birthday" name="member"/><p/>
		이메일 : <jsp:getProperty property="email" name="member"/><p/>
		<input type="submit" value="확인"><p/>
		<input type="button" value="다시쓰기" onclick="history.back()"><p/>
	</form>
	
	<!-- 231219 end -->
</body>
</html>
