// id를 수정후 다시 고쳤는지 확인
function inputIdChk() {
	frm.idBtnCheck.value="idUncheck";
}

function idCheck(id) {
	frm.idBtnCheck.value="idCheck";
	if(id == "") {
		alert("아이디를 입력하세요");
		frm.id.focus();
		return;
	}
	url = "idCheck.jsp?id="+id;
	window.open(url, "IDCheck", "width=300, height=150");
}

function inputCheck() {
	if(frm.id.value == "") {
		alert("아이디를 입력해 주세요");
		frm.id.focus();
		return;
	}
	if(frm.idBtnCheck.value != "idCheck") {	// 아이디 중복검사 
		alert("아이디 중복검사를 하세요");
		return;
	}
	if(frm.pw.value == "") {
		alert("비밀번호를 입력해 주세요");
		frm.pw.focus();
		return;
	}
	if(frm.rePw.value == "") {
		alert("비밀번호를 확인해 주세요");
		frm.rePw.focus();
		return;
	}
	if(frm.pw.value != frm.rePw.value) {
		alert("비밀번호가 일치하지 않습니다")
		frm.rePw.focus();
		return;
	}
	if(frm.name.value == "") {
		alert("이름을 입력해 주세요");
		frm.name.focus();
		return;
	}
	frm.submit();
}





















