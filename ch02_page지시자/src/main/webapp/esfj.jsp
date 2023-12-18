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
		ESFJ는 동정심이 많고 다른 사람에게 관심을 쏟으며 나눔과 베풂을 중시한다. 
		타고난 협력자로서 동료애가 많고 친절하며 능동적인 구성원이다. 이야기 하기를 즐기며 정리정돈을 잘하고, 
		참을성이 많고 다른 사람들을 잘 도와준다. 사람을 다루고 행동을 요구하는 분야, 
		예를 들면 교직, 성직, 판매 특히 동정심을 필요로 하는 간호나 의료 분야에 적합하다. 
		일이나 사람 관련 문제에 대하여 냉철한 입장을 취하기 어려워한다. 반대 의견에 부딪혔을 때나, 
		자신의 요구가 거절당했을 때 마음의 상처를 받는다.
	</pre>
</body>
</html>