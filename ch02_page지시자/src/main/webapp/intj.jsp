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
		전략가형 사람은 거의 모든 일에 의문을 던지고, 더 좋은 방법을 찾는 과정에서 거절당하거나 규칙을 깨는 일을 두려워하지 않는다. 
		또 단지 창의적인 데에서 그치지 않고 성취해내기를 원해, 새로운 아이디어에 통찰력과 뛰어난 논리력, 강한 의지를 더해 일을 추진한다.
		이런 유형은 매우 독립적인 성향을 지녀 혼자 일하거나 결정내리는 것을 선호한다. 
		그렇기에 타인에게 무심하다는 편견을 받기도 하지만, 
		이들은 자신이 틀렸거나 타인을 다치게 했다고 생각하면 큰 영향을 받고 그 일을 분석하는 데에 몰두한다. 
		이들은 단지 의사결정에 있어 감정에 치우치지 않을 뿐 인간적이다.
	</pre>
</body>
</html>