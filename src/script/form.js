function checkId(txt, event) {
    let numbers = /^[0-9]+$/;
    if (txt.value == "") {
        txt.focus();
        alert('값을 입력해주세요!');
        event.preventDefault(); 
    } else if (!txt.value.match(numbers)){
        txt.focus();
        alert('숫자를 입력해주세요!');
        event.preventDefault(); 
    } 
};

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

function submitForm(mode) {
	const myform = document.getElementById("myform");
	if (myform) {
		if(mode == "update") {
			myform.action = "updateDB.jsp";
			myform.submit();
		} else if (mode == "delete") {
			myform.action = "deleteDB.jsp";
			myform.submit();
		}
	}
}
