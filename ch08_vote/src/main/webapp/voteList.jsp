<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, vote.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP VOTE</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="script.js" charset="utf-8"></script>

<style>
	* {margin: 0 auto;}
	div {width:800px;}
	h2, h5, .cen {text-align:center; }
	.m50 {margin-top:50px;}
	.m30 {margin-top:30px;}
	table {margin-top: 30px; width:800px;}
	table th {text-align:center;}
	a {text-decoration:none; color:black; cursor:pointer;}
</style>

</head>
<body>
	<!-- 231222 -->
	<div>
		<h2 class="m50">투표 프로그램</h2>
		<hr>
		
		<h5 class="m30">설문폼</h5>
		<jsp:include page="voteForm.jsp" />
		<hr>
		
		<h5 class="m30">설문리스트</h5>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일~종료일</th>
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
				out.print("    <td><a href='voteList.jsp?num="+ num +"'>"+question+"</a></td>");
				out.print("    <td class='cen'>" + sdate + " ~ " + edate + "</td></tr>");
			}
			%>
			<tr>
				<td colspan="3" align="right"><a href="voteInsert.jsp">설문 작성하기</a><td>
			</tr>
		</table>
	</div>
</body>
</html>