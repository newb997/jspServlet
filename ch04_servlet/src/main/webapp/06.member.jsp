<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- <script src="script.js" charset="utf-8"></script> -->
<style>
	* {margin:0 auto;}
</style>

</head>
<body>
	<table class="table table-striped table-hover" border="1" width="1200px" >
		<form method="post" name="regForm" action="06_1.member.jsp">
			<tr>
				<th colspan="3" style="text-align: center">회원가입</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="id"></td>
				<td>영문과 숫자로만 5글자 이상</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pwd"></td>
				<td>영문과 숫자,특수기호를 반드시 1개이상씩 포함하여 9글자 이상</td>
			</tr>
			<tr>
				<td>패스워드 확인</td>
				<td><input type="password" name="repwd"></td>
				<td>영문과 숫자,특수기호를 반드시 1개이상씩 포함하여 9글자 이상</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name"></td>
				<td>한글이름</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input name="birthday"></td>
				<td>예) 23-12-19</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
				<td>예) email@naver.com</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
				<!-- <input type="submit" value="회원가입">&emsp; -->
				<input type="button" value="회원가입" onclick="inputCheck()">&emsp;
				<input type="reset" value="다시쓰기">
			</tr>
		</form>
	</table>
	
	<script>
	function inputCheck() {
		if(regForm.id.value==""){
			alert("아이디를 넣어주세요");
			regForm.id.focus();
			return;
		}
		if(regForm.pwd.value==""){
			alert("비밀번호를 넣어주세요");
			regForm.pwd.focus();
			return;
		}
		if(regForm.repwd.value==""){
			alert("비밀번호를 확인해주세요");
			regForm.repwd.focus();
			return;
		}
		if(regForm.pwd.value!=regForm.repwd.value){
			alert("비밀번호가 일치하지 않습니다");
			regForm.repwd.focus();
			return;
		}
		if(regForm.name.value==""){
			alert("이름을 입력하세요");
			regForm.name.focus();
			return;
		}
		regForm.submit();	//버튼타입이라 해줘야함
	}
	</script>
</body>
</html>