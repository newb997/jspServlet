<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, vote.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="script.js" charset="utf-8"></script>

</head>
<body>
	<!-- 231222 -->
	<h2>투표 프로그램</h2>
	<hr>
	
	<b>설문폼</b>
	<jsp:include page="voteForm.jsp" />
	<hr>
	
	<b>설문리스트</b>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>시작일 ~ 종료일</th>
		</tr>
		<%
			ArrayList<VoteList> alist = vDao.getList();
		
			for(int i=0; i<alist.size(); i++) {
				VoteList vlist = alist.get(i);
				int num = vlist.getNum();
				String question = vlist.getQuestion();
				String sdate = vlist.getSdate().substring(0,10);
				String edate = vlist.getEdate().substring(0,10);
				
				out.print("<tr><td>" + (alist.size()-i) + "</td>");
				out.print("    <td><a href='voteList.jsp?num="+ num +"'>" + question + "</a></td>");
				out.print("	   <td>" + sdate + " ~ " + edate + "</td></tr>");
			}
		%>
		<tr>
			<td colspan="3"><a href="voteInsert.jsp">설문 작성하기</a></td>
		</tr>
	</table>
</body>
</html>