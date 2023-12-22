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
<script src="script.js" charset="utf-8"></script>

<style type="text/css">
	#td1 {
		text-align: center;
	}
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 231221 -->
<script>
	function findAddr() {
	    new daum.Postcode({
	        oncomplete: function(data) {
				let roadAddr = data.roadAddress;	// 도로명주소
	        	let jibunAddr = data.roadAddress	// 지번주소
	        	let extraAddr = '';
	        	
	        	document.getElementById('postcode').value = data.zonecode;	// 우편번호
	        	
	        	if(data.userSelectedType == 'R') {
					if(roadAddr != '') {
						if(data.bname != ''){
							extraAddr += data.bname;			// 동이름
						}
						if(data.buildingName != '' ) {
							extraAddr += ', ' + data.buildingName;		// 빌딩명
						}
					}
					roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';	// 동이름이나 빌딩명이 있으면 (동이름, 빌딩명) 뒤에 붙이기
	        		document.getElementById('addr').value = roadAddr;		// 도로명(동이름, 빌딩명)을 input에 넣는다.
	        	} else {
					if(jibunAddr != '') {
						if(data.buildingName != '' ) {
							extraAddr += data.buildingName;
						}
					}
					jibunAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
	        		document.getElementById('addr').value = jibunAddr;
	        	}
	        	
	        	document.getElementById('detailAddr').focus();
	        }
	    }).open();
	}
</script>

</head>
<body>
	<h1 align="center">회원가입</h1>
	<form method="post" action="memberProc.jsp" name="frm">
		<table class="table table-hover">
			<tr align="center">
				<th colspan="3" >회원가입
			</tr>
			<tr>
				<td id="td1" width="13%">아이디</td>
				<td width="50%">
					<input name="id" id="id" onkeydown="inputIdChk();" size="40">&nbsp;
					<input type="button" value="중복확인" onclick="idCheck(this.form.id.value);">
					<input type="hidden" name="idBtnCheck" value="idUncheck">
				</td>
				<td width="35%">영문과 숫자로만 입력</td>
			</tr>
			<tr>
				<td id="td1">비밀번호</td>
				<td><input type="password" name="pw" id="pw" size="40"></td>
				<td>특수기호, 영문, 숫자가 각 1개 이상씩 포함하여 8글자 이상</td>
			</tr>
			<tr>
				<td id="td1">비밀번호 확인</td>
				<td><input type="password" name="rePw" id="rePw" size="40"></td>
				<td>비밀번호를 확인하세요</td>
			</tr>
			<tr>
				<td id="td1">이름</td>
				<td><input name="name" id="name" size="40"></td>
				<td>한글로 입력</td>
			</tr>
			<tr>
				<td id="td1">성별</td>
				<td>
					<input type="radio" name="gender" value="1" checked="checked">남 &emsp; 
					<input type="radio" name="gender" value="2">여
				</td>
				<td>성별을 선택해 주세요</td>
			</tr>
			<tr>
				<td id="td1">생년월일</td>
				<td><input type="number" name="birth" id="birth" size="40"></td>
				<td>6글자로 입력. ex)190315</td>
			</tr>
			<tr>
				<td id="td1">E-mail</td>
				<td><input type="email" name="email" size="55"></td>
				<td>ex) email@naver.com</td>
			</tr>
			<tr>
				<td id="td1">우편번호</td>
				<td>
					<input type="zipcode" name="zipcode" id="postcode" readonly="readonly" size="40">
					<input type="button" value="우편번호 찾기" onclick="findAddr()">
				</td>
				<td>우편번호를 검색하세요</td>
			</tr>
			<tr>
				<td id="td1">주소</td>
				<td>
					<input type="text" name="addr" id="addr" size="70"><br>
					<input type="text" name="detailAddr" id="detailAddr" size="40" 
					placeholder="상세주소를 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='상세주소를 입력하세요'">
				</td>
				<td style="vertical-align: middle">상세주소가 있으면 입력해주세요</td>
			</tr>
			<tr>
				<td id="td1">취미</td>
				<td>
					<input type="checkbox" name="hobby" value="인터넷" checked="checked">인터넷&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="여행">여행&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="게임">게임&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="영화">영화&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="운동">운동
				</td>
				<td>취미를 선택하세요</td>
			</tr>
			<tr>
				<td id="td1">직업</td>
				<td>
					<select name="job">
						<option value="0">선택하세요</option>
						<option value="백수">백수
						<option value="사장">사장
						<option value="말단">말단
						<option value="의사">의사
						<option value="법조인">법조인
						<option value="학생">학생
						<option value="교수">교수
						<option value="기타">기타
					</select>
				</td>
				<td>직업을 선택하세요</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" value="회원가입" onclick="inputCheck()">&emsp;
					<input type="reset" value="초기화">&emsp;
					<input type="button" value="로그인" onclick="location.href='login.jsp'">&emsp;
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>