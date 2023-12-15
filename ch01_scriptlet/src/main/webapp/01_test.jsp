<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
</head>
<body>
	<% 
		// 메소드 정의 불가
		String name = "홍길동"; 
		int age = 26;
	%>

	나의 이름은 <%= name %> 입니다<br>
	나이는 <%= age %> 입니다<br>
	내가 쓴 글씨는 <%= str %>
	
	<%!
		// !가 들어가면 먼저 실행됨
		String str = "글씨";
		int me(int a, int b) {
			return a+b;
		}
	%>
	
	메소드 : <%=me(3,5) %>
	
	<!-- 주석 -->
	<%--
		jsp 주석
		한 줄에 html과 프로그램이 섞여있을 경우 사용 
	 --%>
</body>
</html>