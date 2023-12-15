<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for 문</title>
</head>
<body>
	<!-- 1~10 합계 -->
	
	<%
		int sum = 0;
		for(int i=1;i<=10; i++) {
			if(i<10) {
	%>
		<%= i %>+   <%-- 이렇게 하거나 --%>
		<%--  <%=(i + "+") %>   이렇게 하면됨 둘다 같음 --%> 
	<%
			} else {
	%>
				<%=i %>=		<%--  <%=(i + "=") %> --%> 
	<%
			}
			sum += i;
		}
	%>
	
	<%=sum %>
	
	<br>
	
	<%
		sum = 0;
		for(int i=1;i<=10; i++) {
			if(i<10){
				out.print(i + " + ");
				out.print("<tr><td>어떤글씨</td><td>어떤글씨2</td><td>어떤글씨3</td></tr>");
			} else {
				out.print(i + " = ");
			}
			sum+=i;
		}
	%>
	<%=sum %>
</body>
</html>















