function submitForm(mode) {
	const form = document.getElementById("A_01_Form");
	if (A_01_Form) {
		if(mode == "delete") {
			form.action = "A_02.jsp";
			form.submit();
		} else if (mode == "update") {
			form.action = "A_03.jsp";
			form.submit();
		}
	}
}

function checkName(txt, event) {
    let reg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/;
    if (txt.value == "") {
        txt.focus();
        alert('값을 입력해주세요!');
        event.preventDefault(); 
    } else if (!txt.value.match(reg)){
        txt.focus();
        alert('한글 또는 영어를 입력해주세요!');
        event.preventDefault(); 
    } 
    if (txt.value.length > 20) {
        txt.focus();
        alert('20자 이하만 입력 가능합니다!');
        event.preventDefault(); 
    };
}; 

function checkNameAndUpdate(txt, event) {
    let str = txt.value;
    const regex = new RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/);
    
    checkName(txt, event);
	if (regex.test(str) && str.length < 20) {
        submitForm('update');
    }
};
