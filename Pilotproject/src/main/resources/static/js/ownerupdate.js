function goPopup(){
	var pop = window.open("/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}
function jusoCallBack(o_addr,o_addr2,o_zipno){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.owner.o_addr.value = o_addr;
		document.owner.o_addr2.value = o_addr2;
		document.owner.o_zipno.value = o_zipno;
}
function check(){
	let form = document.owner;
    let o_passwd = owner.o_passwd;
    let o_tel = owner.o_tel;
    let o_tel2 = owner.o_tel2;
    let o_tel3 = owner.o_tel3;
    let o_email = owner.o_email;
    let o_email2 = owner.o_email2;
    
    let expO_passwd = /^[a-zA-Z0-9_@!?#$*]{4,}$/;
    let expO_tel = /^[0-9]{3}$/;
    let expO_tel2 = /^[0-9]{4}$/;
    let expO_tel3 = /^[0-9]{4}$/;
    let expO_email = /^[a-zA-Z0-9._-]{4,}$/;

    if(!o_passwd.value){
        alert("비밀번호를 입력해주세요!");
        o_passwd.focus();
        return false;
    }
    if(!expO_passwd.test(o_passwd.value)){
        alert("비밀번호는 영문자, 숫자 및 특수문자(_,@,!,?,#,$,*) 4글자 이상 입력해주세요!");
        o_passwd.value="";
        o_passwd.focus();
        return false;
    }
    
    if(!o_tel.value){
        alert("휴대폰 번호 앞자리를 입력해주세요!");
        o_tel.focus();
        return false;
    }
	if(!expO_tel.test(o_tel.value)){
	    alert("휴대폰 번호 앞자리는 숫자 3자리로 입력해주세요!");
	    o_tel.focus();
		o_tel.value="";
	    return false;
	}
    if(!o_tel2.value){
        alert("휴대폰 번호 가운데 자리를 입력해주세요!");
        o_tel2.focus();
        return false;
    }
	if(!expO_tel2.test(o_tel2.value)){
	    alert("휴대폰 번호 가운데 자리는 숫자 4자리로 입력해주세요!");
	    o_tel2.focus();
		o_tel2.value="";
	    return false;
	}

    if(!o_tel3.value){
        alert("휴대폰 번호 뒷자리를 입력해주세요!");
        o_tel3.focus();
        return false;
    }
    if(!expO_tel3.test(o_tel3.value)){
        alert("휴대폰 번호 뒷자리는 숫자 4자리로 입력해주세요!");
        o_tel3.focus();
		o_tel3.value="";
        return false;
    }
    
    if(!o_email.value){
        alert("이메일을 아이디를 입력해주세요!");
        o_email.focus();
        return false;
    }
    
    if(!expO_email.test(o_email.value)){
        alert("이메일 아이디는 영문자, 숫자 및 특수문자(. ,_ ,-) 4글자 이상 입력해주세요!");
        o_email.focus();
		o_email.value="";
        return false;
    }
    
    if(!o_email2.value){
        alert("도메인을 선택해주세요!");
        return false;
    }
}