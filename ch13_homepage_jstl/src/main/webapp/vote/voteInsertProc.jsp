<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vDao" class="vote.VoteDao" />

<jsp:useBean id="vlist" class="vote.VoteList" />
<jsp:setProperty property="*" name="vlist" />

<jsp:useBean id="vitem" class="vote.VoteItem" />
<jsp:setProperty property="*" name="vitem" />

<%
	String sdate = request.getParameter("sdateY") + "-"
				 + request.getParameter("sdateM") + "-"
				 + request.getParameter("sdateD");
	String edate = request.getParameter("edateY") + "-"
				 + request.getParameter("edateM") + "-"
				 + request.getParameter("edateD");
	vlist.setSdate(sdate);	// 이름 다른거는 따로 만들어줌
	vlist.setEdate(edate);
	
	boolean result = vDao.voteInsert(vlist, vitem);
	
	String msg = "설문 추가에 실패하였습니다";
	String url = "voteInsert.jsp";
	if(result) {
		msg = "설문이 추가 되었습니다";
		url = "voteList.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>

<!-- 231222 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>