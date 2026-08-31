function check(){

	let o_id = document.loginForm.o_id;
	let o_passwd = document.loginForm.o_passwd;
	
	let expO_id = /^[A-Za-z0-9]{3,}$/;
	let expO_passwd = /^[A-Za-z0-9_@!?#$&^]{4,}$/;
	
	if(!o_id.value){
		alert("아이디를 입력해주세요!");
		o_id.focus();
		return false;
	}
	
	if(!expO_id.test(o_id.value)){
		alert("아이디를 영문자, 숫자로 3글자 이상 입력해주세요!");
		o_id.value="";
		o_id.focus();
		return false;
	}
	
	if(!o_passwd.value){
		alert("비밀번호를 입력해주세요!");
		o_passwd.focus();
		return false;
	}
	
	if(!expO_passwd.test(o_passwd.value)){
        alert("비밀번호는 영문자,숫자,_,@,!,?,#,$,&,^만 입력 가능 4자리 이상");
        o_passwd.value="";
        o_passwd.focus();
        return false;
	}
}