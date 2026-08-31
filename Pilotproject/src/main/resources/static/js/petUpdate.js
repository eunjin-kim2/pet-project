function check(){
    let p_neutered = pet.p_neutered;
    let p_weight = pet.p_weight;
    
    let expP_weight = /^[0-9]+(\.[0-9]{1,2})?$/;

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