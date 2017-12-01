function sendEditSignup() {
	// 비밀번호 입력 여부 체크
    if (document.f.passwd.value == "") {
        alert("비밀번호를 입력하지 않았습니다.")
        document.f.passwd.focus()
        return false;
    }
    // 비밀번호 유효성 체크
    if(!document.f.passwd.value) {
    	
	} else {
		// 영문자 포함해서 숫자나 특수 문자를 조합해서 사용 
		var reg_passwd = /^.*(?=.{8,14})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

		if(!reg_passwd.test(document.f.passwd.value)) {
			alert("영문자와 숫자(또는 특수 문자)를 조합해서 8~14자 사이로 등록해주시기 바랍니다.");
			document.f.passwd.focus();
			return false;
		} else if(/(\w)\1\1/.test(document.f.passwd.value)) {
			alert("비밀번호에 같은 문자를 3번 이상 사용 하실 수 없습니다."); 
			document.f.passwd.focus();
			return false;
		}
	}
    // 비밀번호 일치 여부 체크
    if (document.f.passwd.value != document.f.repasswd.value) {
        alert("비밀번호가 일치하지 않습니다")
        document.f.repasswd.value = ""
        document.f.repasswd.focus()
        return false;
    }

    document.f.submit();
}


