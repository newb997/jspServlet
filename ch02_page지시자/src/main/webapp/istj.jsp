<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String mbti = request.getParameter("mbti");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b><%=name %></b>님의 MBTI는 <b><%=mbti %>입니다</b> <br>
	<pre>
		ISTJ는 실제 사실에 대하여 정확하고 체계적으로 기억하며 일 처리에 있어서도 신중하고 책임감이 있다. 
		집중력이 강한 현실 감각을 지녔으며 조직적이고 침착하다. 보수적인 경향이 있으며, 
		문제를 해결하는데 과거의 경험을 잘 적용하며, 반복되는 일상적인 일에 대한 인내력이 강하다. 
		3차기능인 Fi(내향 감정)로 인해 자신과 타인의 감정과 기분을 이해하는 능력이 부족하며, 
		4차기능이 Ne(외향 직관)로 나무보다 숲을 보는 직관 능력이 매우 부족하여 전체적이고 타협적 방안을 고려하는 노력이 필요하다. 
		정확성과 조직력을 발휘하는 분야의 일을 선호한다.[A]
	</pre>
	
</body>
</html>