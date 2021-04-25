function login_check() {

	const uEmail = document.getElementById("uEmail").value;
	const uPwd = document.getElementById("uPwd").value;
	
	if (uEmail.length == 0) {
		alert("이메일과 비밀번호를 모두 입력해주세요");
		return false;
	}
	if (uPwd.length == 0) {
		alert("비밀번호를 입력해주세요");
		return false;
	}
	return true;
}