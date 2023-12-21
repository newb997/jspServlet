<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<%
	Connection con = null;
	Statement st = null;
	ResultSet el = null;
	
	String emp_id, emp_name, emp_email, emp_phone;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "aie", "aie");
	
		st = con.createStatement();
		el = st.executeQuery("select emp_id, emp_name, email, phone from employee");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 231220 -->
	<h1>Employee 테이블 조회</h1>
	<table border="1">
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>이메일</th>
			<th>전화번호</th>
		</tr>
	<%
		if(el != null) {
			while(el.next()){
				emp_id = el.getString(1);
				emp_name = el.getString(2);
				emp_email = el.getString(3);
				emp_phone = el.getString(4);
		%>
			<tr>
				<td><%=emp_id %></td>
				<td><%=emp_name %></td>
				<td><%=emp_email %></td>
				<td><%=emp_phone %></td>
			</tr>
		<% 
			}
		}
	%>
	</table>

<%
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>