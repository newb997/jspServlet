<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if문 처리</title>
<%
		// request에 담아서 받음
		request.setCharacterEncoding("utf-8");
		
		//가져올땐 get
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String msg = "";
		
		/* switch(color) {
		case "blue":
			msg = "파랑";
			break;
		case "red":
			msg = "빨강";
			break;
		case "orange":
			msg = "오렌지";
			break;
		case "etc":
			msg = "기타";
			color = "green";
			break;
		} */
		
		if(color.equals("blue")) {
			msg = "파랑";
		} else if(color.equals("red")){
			msg = "빨강";
		} else if(color.equals("orange")){
			msg = "오렌지";
		} else{
			msg = "기타";
			color = "pink";
		}
	%>
</head>
<body bgcolor = "<%=color%>">
	
	
	<%=name %>님 반갑습니다<br>
	당신이 좋아하는 색상은 <%=msg %> 색이군

</body>
</html>