<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int ref = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	body{
		text-align: center;
	}
	img{
		width: 800px;
	}
	table{
		border: 2px solid black; width: 800px; border-collapse: collapse;
	}
	td{
		border: 2px solid black;
	}
</style>

</head>
<body>
<!-- 240103 -->
	<img src="../resources/img/cat4.jpg">
	<table id="reply" align="center">
		<thead>
			<tr>
				<td width="25%">댓글 작성</td>
				<!-- 
				<td>
					<textarea rows="3" cols="50" id="replyContent"></textarea>
				</td>
				<td width="20%"><button onclick="insertReply()">댓글등록</button></td>
				 -->
				
			<!-- 로그인한 사람만 댓글등록을 가능하게 하려면 -->
			<%if(true) { %>
				<td>
					<textarea rows="3" cols="50" id="replyContent"></textarea>
				</td>
				<td width="20%"><button onclick="insertReply()">댓글등록</button></td>
			<%} else{ %>
				<td>
					<textarea rows="3" cols="50" readonly>로그인 후 이용 가능한 서비스 입니다.</textarea>
				</td>
				<td width="20%"><button disabled>댓글등록</button></td>
			<%} %>	
				
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	
	</table>
	
	<script>
		$(() => {
			selectReplyList();
			
			// setInterval(selectReplyList, 1000); 		// 1초마다 selectReplyList함수를 호출
			// setInterval(selectReplyList, 60*1000); 		// 1분마다 selectReplyList함수를 호출
		})
		
		function selectReplyList() {
			$.ajax({
				url : "rlist.bo",			// 매핑값 /ajaxReply/rlist.bo 
				data : {bnum:<%=ref %>},
				success : function(list){
					console.log(list);
					let result = "";
					
					for(let i=0;i<list.length; i++) {
						result += "<tr>"
								+ "<td>" + list[i].name + "</td>"
								+ "<td>" + list[i].content + "</td>"
								+ "<td>" + list[i].redate.substring(0,10) + "</td>" // .substring(0,10) 시,분,초 제외
							    + "</tr>"
					}
					$("#reply tbody").html(result);
				},
				error : function(){
					console.log("댓글 목록 조회 ajax통신 실패");
				}
			})
		}

		function insertReply() {
			$.ajax({
				url : "rinsert.bo",			// 매핑값 /ajaxReply/rinsert.bo
				data : {
					bnum:<%=ref %>,
					name:"졸리다",
					content:$("#replyContent").val()
				},
				type : "post",
				success : function(result) {
					console.log(result);
					if(result > 0) {
						selectReplyList();
						$("#replyContent").val("");
					}
				},
				error : function(){
					console.log("댓글등록 ajax통신 실패");
				}
			})
		}
	</script>
	
</body>
</html>














