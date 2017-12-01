function sendSignup() {
	var email = document.f.email.value;
	var reg_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    
	// 이메일 입력 여부 체크
	if (document.f.email.value == "") {
        alert("이메일을 입력하지 않았습니다.")
        document.f.email.focus()
        return false;
    }
    // 이메일 형식 체크
    if (reg_email.test(email) === false) {
        alert("잘못된 이메일 형식입니다.");
        document.f.email.value=""
        document.f.email.focus()
        return false;
    }
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

/*
$(document).ready(function(){
    $('#checkbtn').on('click', function(){
        $.ajax({
            type: 'POST',
            url: contextPath+'/member/checkSignup',
            data: {
                "email" : $('#email').val()
            },
            success: function(data){
                if($.trim(data) == 0){
                    $('#checkMsg').html('<p style="color:blue">사용가능</p>');
                }
                else{
                    $('#checkMsg').html('<p style="color:red">사용불가능</p>');
                }
            }
        });    //end ajax    
    });    //end on    
});

*/


// 아이디를 체크하여 가입 버튼 비활성화
function checkId() {
    var inputed = $('.user').val();
    $.ajax({
        data : {
        	email : inputed
        },
        url : contextPath+'/member/checkSignup/',
        success : function(data) {
            if(inputed=="" && data=='0') {
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#8A0808");
                $("#checkEmail").css("background-color", "#B0F6AC");
                idCheck = 0;
            } else if (data == '0') {
            	$(".signupbtn").prop("disabled", false);
            	$(".signupbtn").css("background-color", "#8A0808");
                $("#checkEmail").css("background-color", "#B0F6AC");
            } else if (data == '1') {
                $(".signupbtn").prop("disabled", true);
                $(".signupbtn").css("background-color", "#aaaaaa");
                $("#checkEmail").css("background-color", "#FFCECE");
            } 
        }
    });
}

