/**
 * 
 */

function loginCheck() {
	
	if(document.loginForm.adminID.value.length ==0) {
		alert("관리자 아이디는 필수 입력 사항입니다.");
		document.loginForm.adminID.focus();
		return false;
	}
	if(document.loginForm.adminPW.value.length ==0) {
		alert("관리자 PW는 필수 입력 사항입니다.");
		document.loginForm.adminPW.focus();
		return false;
	}	
	return true;
}





