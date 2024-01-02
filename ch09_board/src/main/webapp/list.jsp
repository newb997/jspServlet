<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
    
<%
	// 페이징 처리 변수들
	int totalRecord = 0;	// 전체 레코드 수(DB 행의 수)
	int numPerPage = 10;	// 1페이지당 보여줄 레코드 수
	int pagePerBlock = 5;		// 블록당 페이지수  [1][2][3][4][5]
	
	int totalPage = 0;			// 전체 페이지 수  ceil(53/10) = 6개 [1][2][3][4][5][6]
	int totalBlock = 0;			// 전체 블록수     2개
	
	int nowPage = 1;			// 현재 해당하는 페이지
	int nowBlock = 1;			// 현재 해당하는 블록
	
	int start = 0;				// DB테이블의 select시작번호(한페이지에 필요한 만큼 게시물만 가져오려고 함)
	int end = 0;				// 가져온 레코드중에서 10개씩 가져오기
	int listSize = 0;			// 현재 읽어온 게시물의 수
	
	
	String keyField = "", keyWord = "";
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	
	// [처음으로]를 누르면 keyField, keyWord를 지워줌
	if(request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
		keyField = "";
		keyWord = "";
	}
	
	// 다른페이지로 이동했다 다시 돌아왔을때와 [처음으로]를 눌렀을때
	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	totalRecord = bDao.getTotalCount(keyField, keyWord);
	start = (nowPage*numPerPage)-numPerPage+1;		// 각 페이지당 시작 번호
	end = nowPage*numPerPage;
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);	// 전체 페이지수 =  6
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);		// 현재 블럭 계산
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);	// 전체 블럭 계산 = 2
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 231228 -->
<style type="text/css">
	h2 {margin-top: 50px;}
	table{width:900px; margin-top: 30px;}
	a {text-decoration:none; color:black; cursor:pointer;}
</style>

<!-- 231228 -->
<script type="text/javascript">
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	
	function read(num){
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value) {			// value = 이전블럭 또는 다음블럭 블럭 2에서 prev, next
		document.readFrm.nowPage.value = <%=pagePerBlock %> * (value-1) + 1;
														// 5 * (1-1) + 1 = 1부터시작  (1-1) 부분을 0으로 맞추고 시작
														// 5 * (3-1) + 1 = 11부터시작
		document.readFrm.submit();
	}
</script>

</head>
<body>
<!-- 231226 -->
<!-- <a href="post.jsp">글쓰기</a>

<a href="read.jsp">글읽기</a> -->

<!-- 231228 -->
	<h2 align="center">게 시 판</h2>
	<table align="center">
		<tr>
			<td colspan="5">Total : <%=totalRecord %> Articles(<%=nowPage %> / <%=totalPage %> Pages )</td>
		</tr>
		<tr>
			<th>번 호</th>
			<th>제 목</th>
			<th>이 름</th>
			<th>날 짜</th>
			<th>조회수</th>
		</tr>
		
		<%
			// DB에서 조회한 결과 보여주기 
			ArrayList<Board> alist = bDao.getBoardList(keyField, keyWord, start, end);
			listSize = alist.size();
			for(int i=0; i<end; i++) {
				if(i == listSize) {
					break;
				}
				Board board = alist.get(i);
				int num = board.getNum();
				String name = board.getName();
				String subject = board.getSubject();
				String regdate = board.getRegdate();
				int count = board.getCount();
				int depth = board.getDepth();
			%>
		<tr>
			<td><%=totalRecord-((nowPage-1)*numPerPage) -i %></td>
			<td>
				<%
				if(depth > 0) {
					for(int j=0; j<depth; j++) {
						out.print("&emsp;");
					}
					out.print(" ↳ ");
				}
				%>
				<a href="javascript:read('<%=num %>');"><%=subject %></a> <!-- 글 상세보기 -->
			</td>
			<td align="center"><%=name %></td>
			<td align="center"><%=regdate %></td>
			<td align="center"><%=count %></td>
		</tr>
			<%	
			
			}
		%>		
		
		
		<tr>
			<td colspan="5"><br><br></td>
		</tr>
		<tr>
			<!-- 페이지 처리 시작 -->
			<td colspan="3">
			<%
			int pageStart = (nowBlock-1) * pagePerBlock + 1;	// 어느 블록에 속하는지 그 블록에 따른 첫 번째 페이지
			int pageEnd = (pageStart + pagePerBlock <= totalPage) ? pageStart + pagePerBlock-1 : totalPage;
			if(totalPage != 0) {
				if(nowBlock > 1) { %>
					<a href="javascript:block('<%=nowBlock-1 %>')">prev...</a>&nbsp;
				<%}
				
				for( ; pageStart <= pageEnd; pageStart++) { %>
					<a href="javascript:pageing('<%=pageStart %>')">[<%=pageStart %>]</a>
				<%}
				out.print("&nbsp;");
				if(totalBlock > nowBlock) { %>
					<a href="javascript:block('<%=nowBlock+1 %>')">...next</a>&nbsp;
				<%}
			}
			%>
			</td>
			<!-- 페이지 처리 끝-->
			<td colspan="2" align="right">
				<a href="post.jsp">[글쓰기]</a>&emsp;
				<a href="javascript:list();">[처음으로]</a>
			</td>
		</tr>
		<tr>
			<td colspan="5"><hr></td>
		<tr>
	</table>
	<!-- 키워드 검색 -->
	<form method="get" action="list.jsp">
		<table align="center">
			<tr>
				<td align="center">
					<select name="keyField">
						<option value="name">이름</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>
					<input name="keyWord" required>
					<input type="submit" value="찾기">
					<!-- <input type="hidden" name="nowPage" value="1"> 이거 지워야 검색했을때 페이징처리됨 -->
				</td>
			</tr>
		</table>
	</form>
	
	<!-- [처음으로] 누르면 화면 reload -->
	<form method="post" name="listFrm">
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
	</form>
	
	<form method="get" name="readFrm">	<!-- get으로 해줘야 nowpage뜸 -->
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type="hidden" name="keyField" value="<%=keyField %>">
		<input type="hidden" name="keyWord" value="<%=keyWord %>">
	</form>
</body>
</html>








