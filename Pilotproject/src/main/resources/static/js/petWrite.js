function check(){
    let p_name = pet.p_name;
    let p_type = pet.p_type;
    let p_breed = pet.p_breed;
    let p_gender = pet.p_gender;
    let p_neutered = pet.p_neutered;
    let p_weight = pet.p_weight;
    
    let expP_name = /^[A-Za-z가-힣]+$/;
    let expP_type = /^[A-Za-z가-힣]+$/;
    let expP_breed = /^[A-Za-z가-힣]+$/;
    let expP_weight = /^[0-9]+(\.[0-9]{1,2})?$/;

    if(!p_name.value){
        alert("이름을 입력해주세요!");
        p_name.focus();
        return false;
    }
    
    if(!expP_name.test(p_name.value)){
        alert("이름을 한글, 영문자로만 입력해주세요!");
        p_name.focus();
        p_name.value="";
        return false;
    }

    if(!p_type.value){
        alert("동물종을 입력해주세요!");
        p_type.focus();
        return false;
    }
    if(!expP_type.test(p_type.value)){
        alert("동물종을 한글, 영문자로만 입력해주세요!");
        p_type.focus();
        p_type.value="";
        return false;
    }
    
    if(!p_breed.value){
        alert("품종을 입력해주세요!");
        p_breed.focus();
        return false;
    }
    if(!expP_breed.test(p_breed.value)){
        alert("품종을 한글, 영문자로만 입력해주세요!");
        p_breed.focus();
        p_breed.value="";
        return false;
    }
    
    if(!p_gender.value){
        alert("성별을 선택해주세요!");
        return false;
    }

    if(!p_neutered.value){
        alert("중성화 여부를 선택해주세요!");
        return false;
    }
    
    if(!p_weight.value){
        alert("몸무게를 입력해주세요!");
        p_weight.focus();
        return false;
    }
    if(!expP_weight.test(p_weight.value)){
        alert("몸무게는 숫자, 소수점 2자리까지 입력 가능합니다!");
        p_weight.focus();
        p_weight.value="";
        return false;
    }
}