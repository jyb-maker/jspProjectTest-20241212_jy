/**
 * 
 */

function joinCheck() {
	if(document.joinForm.userID.value.length == 0 ) {  // ==0 : 공란을 막음
		alert("아이디는 필수 입력 사항입니다.");
		document.joinForm.userID.focus() //해당 폼 위치로 커서를 이동
		return false;
	}
	if(document.joinForm.userPW.value.length == 0 ) {
		alert("비밀번호는 필수 입력 사항입니다.");
		document.joinForm.userPW.focus() //해당 폼 위치로 커서를 이동
		return false;
	}
	if(document.joinForm.userEmail.value.length == 0 ) {
		alert("이메일은 필수 입력 사항입니다.");
		document.joinForm.userEmail.focus() //해당 폼 위치로 커서를 이동
		return false;
	}
	return true;
	
}